const fs = require('fs');
const path = require('path');
const md = require('markdown-it')({ html: true });

const MAIN_README = path.join(__dirname, 'README.md');
const BASE_RICHARD_DIR = path.resolve(__dirname, '..');

const unifiedLines = [];
unifiedLines.push('# 📘 Ayuda Memoria Completo - Cascada Profunda');
unifiedLines.push('\n---\n');

const processedPaths = new Set();
// Keywords that indicate a link is just returning to index or similar redundance
const ignoreKeywords = ['volver', 'indice', 'índice', 'atras', 'atrás', 'back', '<<', '>>'];

const getBase64Image = (imagePath) => {
    try {
        if (!fs.existsSync(imagePath)) return null;
        let ext = path.extname(imagePath).replace('.', '').toLowerCase();
        if (ext === 'jpg') ext = 'jpeg';
        else if (ext === 'svg') ext = 'svg+xml';
        
        let bitmap = fs.readFileSync(imagePath);
        let base64 = Buffer.from(bitmap).toString('base64');
        return `data:image/${ext};base64,${base64}`;
    } catch {
        return null;
    }
}

const parseDocument = (filePath, repoRoot, headingTitle = '', depth = 0) => {
    if (!filePath || processedPaths.has(filePath)) return;
    processedPaths.add(filePath);

    let text;
    try {
        text = fs.readFileSync(filePath, 'utf8');
    } catch (e) {
        console.warn(`No se pudo leer: ${filePath}`);
        return;
    }

    // Insert heading if not the main root
    if (headingTitle && headingTitle.toLowerCase() !== 'ver') {
        const hLevel = '#'.repeat(Math.min(depth, 3));
        unifiedLines.push(`\n<div style="page-break-before: always;"></div>\n`);
        unifiedLines.push(`\n${hLevel} 📄 ${headingTitle}\n`);
    }

    let basePath = path.dirname(filePath);

    // Resolve and embed Base64 Images
    text = text.replace(/!\[(.*?)\]\(((?![a-zA-Z]+:\/\/).*?)\)/g, (match, alt, imgPath) => {
        let cleanImgPath = decodeURIComponent(imgPath);
        let absPath = '';
        if (cleanImgPath.startsWith('/')) {
            absPath = path.join(repoRoot, cleanImgPath);
        } else {
            absPath = path.resolve(basePath, cleanImgPath);
        }
        const base64Data = getBase64Image(absPath);
        return base64Data ? `![${alt}](${base64Data})` : match;
    });

    unifiedLines.push(text);
    unifiedLines.push('\n---\n');

    // Recursively parse markdown links inside this file
    const lines = text.split('\n');
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        const linkRegex = /\[(.*?)\]\((.*?)\)/g;
        let match;
        while ((match = linkRegex.exec(line)) !== null) {
            const linkText = match[1];
            let url = match[2];

            // Ignore redundant links
            const isIgnored = ignoreKeywords.some(kw => linkText.toLowerCase().includes(kw));
            if (isIgnored) continue;

            let childFilePath = null;
            let childRepoRoot = repoRoot;

            if (url.startsWith('https://github.com/xixay/')) {
                try {
                    const urlObj = new URL(url);
                    const parts = urlObj.pathname.split('/').filter(Boolean);
                    if (parts.length >= 2) {
                        const repoName = parts[1];
                        childRepoRoot = path.join(BASE_RICHARD_DIR, repoName);
                        const p1 = path.join(childRepoRoot, 'README.md');
                        const p2 = path.join(childRepoRoot, 'readme.md');
                        const p3 = path.join(childRepoRoot, 'Readme.md');
                        if (fs.existsSync(p1)) childFilePath = p1;
                        else if (fs.existsSync(p2)) childFilePath = p2;
                        else if (fs.existsSync(p3)) childFilePath = p3;
                    }
                } catch(e) {}
            } else if (url.endsWith('.md')) { // Only follow markdown files
                const cleanUrl = url.startsWith('/') ? url.substring(1) : url;
                if (url.startsWith('/')) {
                    childFilePath = path.join(repoRoot, decodeURIComponent(cleanUrl));
                } else {
                    childFilePath = path.resolve(basePath, decodeURIComponent(cleanUrl));
                }
            }

            if (childFilePath && fs.existsSync(childFilePath) && !processedPaths.has(childFilePath)) {
                let heading = linkText;
                if (linkText.toLowerCase() === 'ver') {
                     const closestBold = [...line.matchAll(/\*\*(.*?)\*\*/g)].reverse().find(m => m.index < match.index);
                     if (closestBold) heading = closestBold[1];
                     else heading = path.basename(childFilePath);
                }
                
                console.log(`${'  '.repeat(depth)}-> Integrando cascada: ${heading}`);
                parseDocument(childFilePath, childRepoRoot, heading, depth + 1);
            }
        }
    }
}

console.log("Iniciando escaneo en cascada profunda...");
parseDocument(MAIN_README, __dirname, 'Inicio', 1);

const finalMarkdown = unifiedLines.join('\n');
console.log(`\nCompilados ${processedPaths.size} archivos Markdown en total!`);
console.log("Convirtiendo Markdown masivo a HTML...");

let html = md.render(finalMarkdown);
html = `
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Ayuda Memoria</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; padding: 2em; line-height: 1.6; color: #333; max-width: 900px; margin: 0 auto; }
        img { max-width: 100%; border-radius: 8px; margin: 1em 0; }
        pre { background: #f6f8fa; padding: 1em; overflow-x: auto; border-radius: 6px; }
        code { background: #f6f8fa; padding: 0.2em 0.4em; border-radius: 3px; font-family: monospace; }
        hr { margin: 3em 0; border: 0; border-top: 1px solid #eee; }
        h1, h2, h3 { color: #24292e; border-bottom: 1px solid #eaecef; padding-bottom: 0.3em; margin-top: 24px; margin-bottom: 16px; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 1em; }
        th, td { border: 1px solid #dfe2e5; padding: 6px 13px; }
        th { background-color: #f6f8fa; }
        @media print {
            body { max-width: 100%; padding: 0; }
            div.page-break { page-break-before: always; }
            pre { background: #f4f4f4; border: 1px solid #ddd; padding: 10px; font-size: 12px; white-space: pre-wrap; word-wrap: break-word; }
            img { max-width: 100%; height: auto; }
        }
    </style>
</head>
<body>
    ${html}
</body>
</html>`;

fs.writeFileSync('/home/xixay/Documentos/Proyectos Antigravity/Ayuda_Memoria_Completo.html', html, 'utf8');
console.log("¡Terminado y copiado exitosamente en formato cascada completa!");
