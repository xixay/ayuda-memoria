[<< INDICE](../README.md)
- [1. Archivo `.gitignore`](#1-archivo-gitignore)
- [2. Consulta https://help.github.com/articles/ignoring-files/ para obtener más información sobre cómo ignorar archivos.](#2-consulta-httpshelpgithubcomarticlesignoring-files-para-obtener-más-información-sobre-cómo-ignorar-archivos)
- [3. Vercel](#3-vercel)
- [4. Archivos específicos](#4-archivos-específicos)
- [5. Registros y depuración](#5-registros-y-depuración)
- [6. Informes de diagnóstico](#6-informes-de-diagnóstico)
- [7. Datos de tiempo de ejecución](#7-datos-de-tiempo-de-ejecución)
- [8. Directorios de dependencias](#8-directorios-de-dependencias)
- [9. Caché y archivos temporales](#9-caché-y-archivos-temporales)
- [10. Salida de compilación](#10-salida-de-compilación)
- [11. Caché de herramientas específicas](#11-caché-de-herramientas-específicas)
- [12. Directorios específicos de herramientas](#12-directorios-específicos-de-herramientas)
- [13. Archivos a Ignorar:](#13-archivos-a-ignorar)

## 1. Archivo `.gitignore`
- Ignora los siguientes archivos y directorios para evitar que se incluyan en el control de versiones:

## 2. Consulta https://help.github.com/articles/ignoring-files/ para obtener más información sobre cómo ignorar archivos.
## 3. Vercel
- Ignora el directorio .vercel, utilizado por la plataforma Vercel para configuraciones y despliegues.
## 4. Archivos específicos
- Evita archivos como .DS_Store y cualquier archivo con la extensión .pem.
## 5. Registros y depuración
- Excluye directorios y archivos relacionados con registros y depuración de npm, yarn, lerna, etc.
## 6. Informes de diagnóstico
- Descarta archivos JSON generados por Node.js para informes de diagnóstico.
## 7. Datos de tiempo de ejecución
- Ignora archivos y directorios relacionados con el tiempo de ejecución y procesos.
## 8. Directorios de dependencias
- Evita incluir directorios de dependencias como node_modules, jspm_packages, etc.
## 9. Caché y archivos temporales
- Excluye varios directorios y archivos temporales utilizados por herramientas de desarrollo como TypeScript, eslint, stylelint, etc.
## 10. Salida de compilación
- Descarta directorios de salida de compilación generados por frameworks como Next.js, Nuxt.js, VuePress, etc.
## 11. Caché de herramientas específicas
- Evita archivos y directorios de caché utilizados por herramientas como Parcel, Gatsby, VuePress, etc.
## 12. Directorios específicos de herramientas
- Ignora directorios relacionados con herramientas específicas como Docusaurus, serverless, etc.
Archivos de configuración de IDE: Descarta archivos relacionados con la configuración de entornos de desarrollo como VSCode.
## 13. Archivos a Ignorar:
- Vercel
```console
.vercel
```
- Archivos específicos
```console
.DS_Store         # Archivo de sistema macOS
*.pem             # Archivos con extensión .pem
```
- Registros y depuración
```console
logs              # Directorio de registros
*.log             # Archivos de registro generales
npm-debug.log*    # Archivos de registro de npm
yarn-debug.log*   # Archivos de depuración de yarn
yarn-error.log*   # Archivos de errores de yarn
lerna-debug.log*  # Archivos de depuración de lerna
.pnpm-debug.log*  # Archivos de depuración de pnpm
```
- Informes de diagnóstico de Node.js
```console
report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json
```
- Datos de tiempo de ejecución
```console
pids              # Directorio de identificadores de proceso
*.pid             # Archivos de identificación de proceso
*.seed            # Archivos de semillas
*.pid.lock        # Archivos de bloqueo de identificación de proceso
```
- Directorio para bibliotecas instrumentadas generadas por jscoverage/JSCover
```console
lib-cov
```
- Directorio de cobertura utilizado por herramientas como Estambul
```console
coverage
/coverage
*.lcov
```
- nyc test coverage
```console
.nyc_output
```
- Almacenamiento intermedio Grunt
```console
.grunt
```
- Directorio de dependencias de Bower
```console
bower_components
```
- Configuración de node-waf 
```console
.lock-wscript
```
- Complementos binarios compilados de Node.js
```console
build/Release
```
- Directorios de dependencia de Node.js
```console
node_modules/
jspm_packages/
/.pnp
.pnp.js
```
- Directorio de dependencias de Snowpack
```console
web_modules/
```
- TypeScript cache
```console
*.tsbuildinfo
next-env.d.ts
```
- Directorio de caché npm opcional
```console
.npm
```
- Caché eslint opcional
```console
.eslintcache
```
- Caché de estilo opcional
```console
.stylelintcache
```
- Caché de micropaquetes
```console
.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/
```
- Historial REPL opcional
```console
.node_repl_history
```
- Salida de 'paquete npm'
```console
*.tgz
```
- Archivo de integridad del hilo de Yarn
```console
.yarn-integrity
```
- Archivos de variables de entorno dotenv
```console
.env
.env.development.local
.env.test.local
.env.production.local
.env.local
```
- Caché del paquete de paquetes (Parcel)
```console
.cache
.parcel-cache
```
- Salida de compilación de Next.js
```console
.next
out
```
- Salida de compilación/generación de Nuxt.js
```console
.nuxt
dist
```
- Archivos de caché de Gatsby
```console
.cache/
```
- Salida de compilación de VuePress
```console
.vuepress/dist
```
- Directorio temporal y caché de VuePress v2.x
```console
.temp
.cache
```
- Caché de Docusaurus y archivos generados
```console
.docusaurus
```
- Directorios sin servidor
```console
.serverless/
```
- Caché FuseBox
```console
.fusebox/
```
- Archivos locales de DynamoDB
```console
.dynamodb/
```
- Archivo de puerto TernJS
```console
.tern-port
```
- Almacena versiones de VSCode utilizadas para probar extensiones
```console
.vscode-test
```
- Yarn v2
```console
.yarn/cache
.yarn/unplugged
.yarn/build-state.yml
.yarn/install-state.gz
.pnp.*
```

[<< INDICE](../README.md)