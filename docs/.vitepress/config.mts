import { defineConfig } from 'vitepress'
import fs from 'fs'
import path from 'path'

// Función para generar items de sidebar dinámicamente
function getSidebarItems(dir) {
  const fullPath = path.resolve('docs', dir);
  if (!fs.existsSync(fullPath)) return [];
  
  const items = [];
  const files = fs.readdirSync(fullPath);

  for (const file of files) {
    if (file === 'index.md' || file.startsWith('.')) continue;

    const filePath = path.join(fullPath, file);
    const stat = fs.statSync(filePath);

    if (stat.isDirectory()) {
      // Ignorar carpetas de imágenes o temporales
      if (file === 'images' || file === 'data') continue;

      items.push({
        text: formatText(file),
        collapsed: true,
        items: getSidebarItems(path.join(dir, file))
      });
    } else if (file.endsWith('.md')) {
      const name = file.replace('.md', '');
      items.push({
        text: formatText(name),
        link: `/${dir}/${name}`
      });
    }
  }

  // Ordenar: primero carpetas (tienen items), luego archivos
  return items.sort((a, b) => {
    if (a.items && !b.items) return -1;
    if (!a.items && b.items) return 1;
    return a.text.localeCompare(b.text);
  });
}

// Helper para poner mayúscula la primera letra y reemplazar guiones
function formatText(text) {
  return text
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

export default defineConfig({
  title: "Ayuda Memoria",
  description: "Base de conocimiento técnico personal",
  lang: 'es-ES',
  lastUpdated: true,
  cleanUrls: true,
  base: '/ayuda-memoria/',
  
  themeConfig: {
    siteTitle: 'Docs Antigravity',
    
    search: {
      provider: 'local'
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/xixay' }
    ],

    nav: [
      { text: 'Inicio', link: '/' },
      { text: 'Sistema', link: '/inicio/' },
      { text: 'Backend', link: '/backend/' },
      { text: 'Frontend', link: '/frontend/' },
      { 
        text: 'Recursos', 
        items: [
          { text: 'Utilitarios', link: '/utilitarios/' },
          { text: 'Cursos', link: '/cursos/' },
          { text: 'Proyectos Antigravity', link: '/proyectos/' },
          { text: 'Estado Stack 2025', link: '/estado-stack/' }
        ]
      }
    ],

    sidebar: {
      '/inicio/': [
        {
          text: 'Sistema y Herramientas',
          items: [
            { text: 'Índice Principal', link: '/inicio/' },
            ...getSidebarItems('inicio')
          ]
        }
      ],
      '/backend/': [
        {
          text: 'Backend',
          items: [
            { text: 'Índice Principal', link: '/backend/' },
            ...getSidebarItems('backend')
          ]
        }
      ],
      '/frontend/': [
        {
          text: 'Frontend',
          items: [
            { text: 'Índice Principal', link: '/frontend/' },
            ...getSidebarItems('frontend')
          ]
        }
      ],
      '/utilitarios/': [
        {
          text: 'Utilitarios',
          items: [
            { text: 'Índice Principal', link: '/utilitarios/' },
            ...getSidebarItems('utilitarios')
          ]
        }
      ]
    }
  }
})
