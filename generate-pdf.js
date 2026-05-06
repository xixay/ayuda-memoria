const fs = require('fs');
const path = require('path');

const MAIN_README = path.join(__dirname, 'README.md');
const BASE_RICHARD_DIR = path.resolve(__dirname, '..'); // /home/xixay/Documentos/Richard

const unifiedLines = [];
unifiedLines.push('# 📘 Ayuda Memoria Completo');
unifiedLines.push('\n---\n');

// We will keep track of already processed paths to avoid duplicates
const processedPaths = new Set();

const content = fs.readFileSync(MAIN_README, 'utf-8');
const lines = content.split('\n');

const resolveLocalContent = (mdPath, basePath) => {
    try {
        let text = fs.readFileSync(mdPath, 'utf8');
        // Resolve images: ![alt](url)
        text = text.replace(/!\[(.*?)\]\(((?![a-zA-Z]+:\/\/).*?)\)/g, (match, alt, imgPath) => {
            let absPath = path.resolve(basePath, decodeURIComponent(imgPath));
            return `![${alt}](file://${absPath})`;
        });
        return text;
    } catch (e) {
        console.error(`Error al leer archivo: ${mdPath}`);
        return null;
    }
};

for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    if (line.startsWith('## ')) {
        unifiedLines.push('\n<div style="page-break-before: always;"></div>\n\n' + line + '\n');
    } else if (line.startsWith('### ')) {
        unifiedLines.push('\n' + line + '\n');
    }

    // Match links: [Text](URL)
    const linkRegex = /\[(.*?)\]\((.*?)\)/g;
    let match;
    while ((match = linkRegex.exec(line)) !== null) {
        const titleText = match[1];
        let url = match[2];
        
        let targetFilePath = null;
        let targetBaseDir = null;

        if (url.startsWith('https://github.com/xixay/')) {
            try {
                const urlObj = new URL(url);
                const parts = urlObj.pathname.split('/').filter(Boolean);
                if (parts.length >= 2) {
                    const repoName = parts[1];
                    const possibleReadme1 = path.join(BASE_RICHARD_DIR, repoName, 'README.md');
                    const possibleReadme2 = path.join(BASE_RICHARD_DIR, repoName, 'readme.md');
                    const possibleReadme3 = path.join(BASE_RICHARD_DIR, repoName, 'Readme.md');
                    
                    if (fs.existsSync(possibleReadme1)) targetFilePath = possibleReadme1;
                    else if (fs.existsSync(possibleReadme2)) targetFilePath = possibleReadme2;
                    else if (fs.existsSync(possibleReadme3)) targetFilePath = possibleReadme3;
                    
                    if (targetFilePath) targetBaseDir = path.dirname(targetFilePath);
                }
            } catch(e) {
                console.error("Url parser error: ", url)
            }
            
        } else if (url.endsWith('.md')) {
            const cleanUrl = url.startsWith('/') ? url.substring(1) : url;
            targetFilePath = path.join(__dirname, decodeURIComponent(cleanUrl));
            if (fs.existsSync(targetFilePath)) {
                targetBaseDir = path.dirname(targetFilePath);
            } else {
                console.warn(`No se encontró el archivo local: ${targetFilePath}`);
                targetFilePath = null;
            }
        }
        
        if (targetFilePath && !processedPaths.has(targetFilePath)) {
            processedPaths.add(targetFilePath);
            const fileContent = resolveLocalContent(targetFilePath, targetBaseDir);
            if (fileContent) {
                let heading = titleText;
                
                if (titleText === 'Ver') {
                     const linkIndex = match.index;
                     const closestBoldMatch = [...line.matchAll(/\*\*(.*?)\*\*/g)].reverse().find(m => m.index < linkIndex);
                     if (closestBoldMatch) heading = closestBoldMatch[1];
                }
                
                if (!heading || heading === 'Ver') {
                    heading = path.basename(targetFilePath);
                }

                console.log(`Añadiendo: ${heading} -> ${targetFilePath}`);
                
                unifiedLines.push(`\n<div style="page-break-before: always;"></div>\n`);
                unifiedLines.push(`\n# 📄 ${heading}\n`);
                unifiedLines.push(fileContent);
                unifiedLines.push('\n---\n');
            }
        }
    }
}

const outputPath = path.join(__dirname, 'ayuda-memoria-unificado.md');
fs.writeFileSync(outputPath, unifiedLines.join('\n'), 'utf8');
console.log(`\n¡Generado exitosamente en ${outputPath}!\n`);
