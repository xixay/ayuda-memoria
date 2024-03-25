# Instalar Debugger
- Instalar la extension
```url
https://marketplace.visualstudio.com/items?itemName=ms-vscode.js-debug-nightly
```
- Crear el archivo launch.json
```JSON
{
    "version": "0.2.0",
    "configurations": [
      {
        "type": "node",
        "request": "launch",
        "name": "Launch Program",
        "skipFiles": ["<node_internals>/**"],
        "program": "${file}",
        "preLaunchTask": "tsc: build - tsconfig.json",
        "outFiles": ["${workspaceFolder}/dist/**/*.js"]
      }
    ]
  }
```
**![Debugger](/5imagenes/debugger/archivo%20configuracion.png)**
- Iniciar desde el vscode el backend
**![Debugger](/5imagenes/debugger/vscode.png)**
