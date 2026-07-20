#!/bin/bash

# ==============================================================================
# Script de Instalación Rápida para Entorno de Desarrollo Nuevo (Ubuntu/Debian)
# ==============================================================================

# Asegurar que Zenity esté instalado
if ! command -v zenity >/dev/null 2>&1; then
    echo "Instalando Zenity primero..."
    sudo apt update && sudo apt install -y zenity
fi

show_error() {
    zenity --error --width=300 --title="Error" --text="$1"
}

show_info() {
    zenity --info --width=400 --title="Información" --text="$1"
}

# 1. Menú de selección interactivo ordenado por prioridad de instalación
opciones_seleccionadas=$(zenity --list --checklist \
    --title="Instalador de Entorno de Desarrollo" \
    --text="Selecciona las herramientas que deseas instalar.\n\nEl orden de la lista refleja la prioridad de instalación recomendada." \
    --width=800 --height=750 \
    --column="Instalar" --column="Herramienta" --column="Descripción" \
    FALSE "1. Herramientas Core" "Git, Curl, Wget, Build-Essentials, Htop" \
    FALSE "2. Zsh + Oh My Zsh" "Terminal avanzada con plugins y temas" \
    FALSE "3. Tmux" "Multiplexor de terminal (Requerido para tus backups)" \
    FALSE "4. Vim" "Editor de texto avanzado en terminal" \
    FALSE "5. Docker + Compose" "Motor de contenedores (Docker.io) y Compose" \
    FALSE "6. NVM + Node.js LTS" "Gestor de versiones (NVM) e instala Node.js LTS" \
    FALSE "7. Fuentes Fira Code" "Tipografía ideal para programación (Ligaduras en VS Code)" \
    FALSE "8. PostgreSQL" "Base de datos PostgreSQL y utilidades" \
    FALSE "9. DBeaver CE" "Cliente gráfico universal para BDs (Snap)" \
    FALSE "10. VS Code" "Visual Studio Code (Snap)" \
    FALSE "11. Postman" "Cliente para pruebas de APIs REST/GraphQL (Snap)" \
    FALSE "12. Flameshot" "Excelente herramienta para tomar y editar capturas de pantalla" \
    FALSE "13. pnpm" "Gestor de paquetes rápido para Node.js" \
    FALSE "14. Nodemon" "Reiniciador automático de Node.js (Global)" \
    FALSE "15. Angular CLI" "Herramienta global de Angular (@angular/cli)" \
    FALSE "16. NestJS CLI" "Herramienta global de NestJS (@nestjs/cli)" \
    FALSE "17. Vue CLI" "Herramienta global de Vue (@vue/cli)" \
    FALSE "18. Flutter" "Framework de Google para Apps Móviles (Snap)")

if [ -z "$opciones_seleccionadas" ]; then
    echo "Instalación cancelada."
    exit 0
fi

# Convertir la selección a un array
IFS="|" read -r -a opciones <<< "$opciones_seleccionadas"

# Pedir contraseña de sudo una sola vez al inicio
zenity --info --title="Atención" --text="A continuación el sistema te pedirá tu contraseña en la terminal para obtener permisos de administrador (sudo)."
sudo -v

# Función para cargar NVM dinámicamente si se instaló en el mismo script
load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

# Procesar la instalación con barra de progreso
(
total=${#opciones[@]}
actual=0

for opcion in "${opciones[@]}"; do
    actual=$((actual + 1))
    porcentaje=$(( (actual * 100) / total ))
    
    echo "$porcentaje"
    echo "# Instalando: $opcion"

    case "$opcion" in
        "1. Herramientas Core")
            sudo apt update
            sudo apt install -y git curl wget build-essential software-properties-common htop
            ;;
        "2. Zsh + Oh My Zsh")
            sudo apt install -y zsh
            # Instalar Oh My Zsh de forma desatendida
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
            ;;
        "3. Tmux")
            sudo apt install -y tmux
            ;;
        "4. Vim")
            sudo apt install -y vim
            ;;
        "5. Docker + Compose")
            sudo apt install -y docker.io docker-compose
            sudo usermod -aG docker "$USER"
            ;;
        "6. NVM + Node.js LTS")
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
            load_nvm
            nvm install --lts
            nvm use --lts
            ;;
        "7. Fuentes Fira Code")
            sudo apt install -y fonts-firacode
            ;;
        "8. PostgreSQL")
            sudo apt install -y postgresql postgresql-contrib
            ;;
        "9. DBeaver CE")
            sudo snap install dbeaver-ce
            ;;
        "10. VS Code")
            sudo snap install code --classic
            ;;
        "11. Postman")
            sudo snap install postman
            ;;
        "12. Flameshot")
            sudo apt install -y flameshot
            ;;
        "13. pnpm")
            load_nvm
            npm install -g pnpm
            ;;
        "14. Nodemon")
            load_nvm
            npm install -g nodemon
            ;;
        "15. Angular CLI")
            load_nvm
            npm install -g @angular/cli
            ;;
        "16. NestJS CLI")
            load_nvm
            npm install -g @nestjs/cli
            ;;
        "17. Vue CLI")
            load_nvm
            npm install -g @vue/cli
            ;;
        "18. Flutter")
            sudo snap install flutter --classic
            ;;
    esac

done

echo "100"
echo "# ¡Instalación Completa!"
sleep 1

) | zenity --progress --title="Instalando Entorno" --text="Iniciando instalaciones..." --percentage=0 --auto-close --auto-kill

# Mensaje Final con instrucciones post-instalación
show_info "✅ El proceso de instalación ha finalizado.\n\n⚠️ NOTAS IMPORTANTES:\n- Si instalaste Docker, debes <b>reiniciar tu sesión</b> (cerrar sesión y volver a entrar) para poder usarlo sin sudo.\n- Si instalaste Zsh, ejecuta 'chsh -s $(which zsh)' en tu terminal para hacerlo tu shell por defecto y luego reinicia.\n- Si instalaste NVM, reinicia la terminal para tener los comandos de Node disponibles.\n- Si instalaste la Fuente Fira Code, recuerda seleccionarla en los ajustes de tu VS Code ('editor.fontFamily')."

exit 0
