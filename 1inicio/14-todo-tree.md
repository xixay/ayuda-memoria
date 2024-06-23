[<< INDICE](../README.md)
- [1. Crear el archivo de configuracion](#1-crear-el-archivo-de-configuracion)
- [2. Explicación de las configuraciones](#2-explicación-de-las-configuraciones)

## 1. Crear el archivo de configuracion
- En la carpeta .vscode crear el archivo settings.json, donde estaran los tipos de notas
```json
{
    // otras configuraciones.....,
    "todo-tree.tree.showCountsInTree": true,
    "todo-tree.tree.disableCompactFolders": true,
    "todo-tree.highlights.defaultHighlight": {
        "icon": "alert",
        "type": "text-and-comment",
        "foreground": "black",
        "background": "white",
        "opacity": 50,
        "iconColour": "blue",
        "gutterIcon": true,
    },
    "todo-tree.highlights.customHighlight": {
        "TODO": {
            "icon": "check",
            "foreground": "black",
            "background": "white",
            "iconColour": "white",
        },
        "NOTE": {
            "icon": "note",
            "foreground": "white",
            "background": "gray",
            "iconColour": "gray",
        },
        "COMMENT": {
            "icon": "note",
            "foreground": "white",
            "background": "gray",
            "iconColour": "gray",
        },
        "FIXME": {
            "foreground": "black",
            "background": "yellow",
            "iconColour": "yellow",
        },
        "BUG": {
            "foreground": "black",
            "background": "red",
            "iconColour": "red",
        },
        "[ ]": {
            "icon": "check",
            "foreground": "black",
            "background": "white",
            "iconColour": "yellow",
        },
        "[x]": {
            "icon": "check",
            "foreground": "white",
            "background": "green",
            "iconColour": "green",
        }
    },
    "todo-tree.general.tags": [
        "BUG",
        "HACK",
        "FIXME",
        "TODO",
        "NOTE",
        "COMMENT",
        "[ ]",
        "[x]"
    ],
    "todo-tree.regex.regex": "(//|#|<!--|;|/\\*|^|^\\s*(-|\\d+.))\\s*($TAGS).*(\\n\\s*//\\s{2,}.*)*",
 
}
```
## 2. Explicación de las configuraciones
- todo-tree.tree.showCountsInTree: Muestra el recuento de notas en el árbol.
- todo-tree.tree.disableCompactFolders: Desactiva el plegado compacto de carpetas en el árbol.
- todo-tree.highlights.defaultHighlight: Configuración predeterminada para resaltar notas.
  - icon: Ícono para resaltar.
  - type: Tipo de resaltado.
  - foreground: Color del texto.
  - background: Color de fondo.
  - opacity: Opacidad del resaltado.
  - iconColour: Color del ícono.
  - gutterIcon: Habilita el ícono en el margen.
- todo-tree.highlights.customHighlight: Resaltado personalizado por tipo de nota.
  - Configuraciones detalladas para TODO, NOTE, COMMENT, FIXME, BUG, [ ], [x].
- todo-tree.general.tags: Lista de etiquetas reconocidas por todo-tree.
- todo-tree.regex.regex: Expresión regular para identificar comentarios y etiquetas.

[<< INDICE](../README.md)