const fs = require('fs');
const puppeteer = require('puppeteer');
const md = require('markdown-it')({ html: true });

async function convert() {
    console.log("Leyendo markdown unificado...");
    const markdown = fs.readFileSync('ayuda-memoria-unificado.md', 'utf8');
    
    console.log("Convirtiendo a HTML...");
    let html = md.render(markdown);
    
    // Agregamos estilos básicos y el charset
    html = `
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8"/>
        <style>
            body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; padding: 2em; line-height: 1.6; color: #333; }
            img { max-width: 100%; border-radius: 8px; margin: 1em 0; }
            pre { background: #f6f8fa; padding: 1em; overflow-x: auto; border-radius: 6px; }
            code { background: #f6f8fa; padding: 0.2em 0.4em; border-radius: 3px; font-family: monospace; }
            hr { margin: 3em 0; border: 0; border-top: 1px solid #eee; }
            h1, h2, h3 { color: #24292e; border-bottom: 1px solid #eaecef; padding-bottom: 0.3em; margin-top: 24px; margin-bottom: 16px; }
            table { border-collapse: collapse; width: 100%; margin-bottom: 1em; }
            th, td { border: 1px solid #dfe2e5; padding: 6px 13px; }
            th { background-color: #f6f8fa; }
        </style>
    </head>
    <body>
        ${html}
    </body>
    </html>`;
    
    fs.writeFileSync('ayuda-memoria.html', html, 'utf8');
    
    console.log("Iniciando Puppeteer...");
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    console.log("Cargando HTML en navegador virtual...");
    // Aumentamos los timeouts porque el documento es gigante
    await page.goto('file://' + __dirname + '/ayuda-memoria.html', { waitUntil: 'load', timeout: 120000 });
    
    console.log("Generando PDF (esto tomará unos momentos)...");
    await page.pdf({ 
        path: '/home/xixay/Documentos/Proyectos Antigravity/Ayuda_Memoria_Completo.pdf', 
        format: 'A4', 
        printBackground: true,
        displayHeaderFooter: true,
        margin: { top: '20px', bottom: '40px', left: '20px', right: '20px' },
        footerTemplate: '<div style="font-size:10px; text-align:center; width:100%; padding-bottom:5px;">Página <span class="pageNumber"></span> de <span class="totalPages"></span></div>',
        headerTemplate: '<div></div>',
        timeout: 300000 
    });
    
    await browser.close();
    console.log("¡Terminado!");
}

convert().catch(err => {
    console.error("Error en el proceso:", err);
    process.exit(1);
});
