#!/bin/bash

# ==============================================================================
# Generador Rápido de Proyectos (Boilerplate Creator)
# ==============================================================================

if ! command -v zenity >/dev/null 2>&1; then
    echo "Se requiere Zenity."
    exit 1
fi

# 1. Seleccionar la tecnología
TECNOLOGIA=$(zenity --list \
    --title="Creador de Proyectos" \
    --text="¿Qué tecnología deseas utilizar para el nuevo proyecto?" \
    --width=450 --height=350 \
    --column="Framework" \
    "Angular" \
    "React (Vite)" \
    "Next.js" \
    "Vue (Vite)" \
    "NestJS")

if [ -z "$TECNOLOGIA" ]; then
    exit 0
fi

# 2. Seleccionar el nombre del proyecto
NOMBRE_PROYECTO=$(zenity --entry \
    --title="Nombre del Proyecto" \
    --text="Ingresa el nombre de tu nuevo proyecto (sin espacios, usa guiones):" \
    --entry-text="mi-nuevo-proyecto" \
    --width=400)

if [ -z "$NOMBRE_PROYECTO" ]; then
    exit 0
fi

# 3. Seleccionar el directorio de destino
DIRECTORIO_BASE=$(zenity --file-selection --directory \
    --title="¿Dónde deseas guardar el proyecto?" \
    --filename="$HOME/Documentos/Richard/")

if [ -z "$DIRECTORIO_BASE" ]; then
    exit 0
fi

# 4. Determinar el comando a ejecutar
COMANDO=""
case "$TECNOLOGIA" in
    "Angular")
        COMANDO="ng new $NOMBRE_PROYECTO"
        ;;
    "React (Vite)")
        COMANDO="npm create vite@latest $NOMBRE_PROYECTO -- --template react-ts"
        ;;
    "Next.js")
        COMANDO="npx create-next-app@latest $NOMBRE_PROYECTO"
        ;;
    "Vue (Vite)")
        COMANDO="npm create vue@latest $NOMBRE_PROYECTO"
        ;;
    "NestJS")
        COMANDO="nest new $NOMBRE_PROYECTO"
        ;;
esac

# 5. Ejecutar en una nueva terminal visible para que el usuario pueda interactuar (ej. prompts de NextJS o Vue)
# Intenta usar gnome-terminal, terminator o x-terminal-emulator
TERMINAL=""
if command -v gnome-terminal >/dev/null 2>&1; then
    TERMINAL="gnome-terminal --"
elif command -v x-terminal-emulator >/dev/null 2>&1; then
    TERMINAL="x-terminal-emulator -e"
fi

if [ -z "$TERMINAL" ]; then
    zenity --error --text="No se encontró un emulador de terminal compatible para lanzar el instalador interactivo."
    exit 1
fi

# Comando completo: entra al directorio, crea el proyecto y abre VS Code
SCRIPT_EJECUCION="cd '$DIRECTORIO_BASE' && echo '🚀 Iniciando creación de $NOMBRE_PROYECTO usando $TECNOLOGIA...' && $COMANDO && echo '✅ Proyecto creado.' && cd '$NOMBRE_PROYECTO' && code . && exec bash"

# Lanzar terminal
eval "$TERMINAL bash -c \"$SCRIPT_EJECUCION\""

zenity --info --title="Iniciando" --text="Se ha abierto una terminal para generar tu proyecto de <b>$TECNOLOGIA</b>.\nSigue las instrucciones allí."
