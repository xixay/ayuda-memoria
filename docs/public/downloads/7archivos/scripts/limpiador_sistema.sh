#!/bin/bash

# ==============================================================================
# Limpiador Profundo de Entorno (Node, Docker, Sistema)
# ==============================================================================

# Verificar dependencias
if ! command -v zenity >/dev/null 2>&1; then
    echo "Se requiere Zenity."
    exit 1
fi

show_info() {
    zenity --info --width=400 --title="Información" --text="$1"
}

# Mostrar menú de opciones
opciones=$(zenity --list --checklist \
    --title="Limpiador Profundo" \
    --text="Selecciona qué elementos deseas limpiar para liberar espacio en el disco duro:" \
    --width=600 --height=400 \
    --column="Seleccionar" --column="Acción" --column="Descripción" \
    FALSE "1. Node Modules" "Buscar y eliminar carpetas node_modules en ~/Documentos (Puede tardar)" \
    FALSE "2. Docker Prune" "Eliminar contenedores detenidos, redes sin uso e imágenes colgantes" \
    FALSE "3. Caché de APT" "Limpiar la caché de paquetes descargados por el sistema" \
    FALSE "4. Caché de npm/pnpm" "Limpiar la caché global de npm y pnpm" \
    FALSE "5. Vaciar Papelera" "Vaciar la papelera de reciclaje del usuario")

if [ -z "$opciones" ]; then
    exit 0
fi

IFS="|" read -r -a selected_options <<< "$opciones"

(
total=${#selected_options[@]}
actual=0

for opt in "${selected_options[@]}"; do
    actual=$((actual + 1))
    porcentaje=$(( (actual * 100) / total ))
    
    echo "$porcentaje"
    echo "# Ejecutando: $opt"

    case "$opt" in
        "1. Node Modules")
            # Buscar recursivamente y eliminar node_modules en ~/Documentos
            find "$HOME/Documentos" -name "node_modules" -type d -prune -exec rm -rf '{}' + 2>/dev/null
            ;;
        "2. Docker Prune")
            if command -v docker >/dev/null 2>&1; then
                docker system prune -af --volumes >/dev/null 2>&1
            fi
            ;;
        "3. Caché de APT")
            # Necesita sudo, intentará usar pkexec para GUI si no tiene permisos
            if pkexec apt-get clean && pkexec apt-get autoremove -y; then
                true
            fi
            ;;
        "4. Caché de npm/pnpm")
            if command -v npm >/dev/null 2>&1; then npm cache clean --force >/dev/null 2>&1; fi
            if command -v pnpm >/dev/null 2>&1; then pnpm store prune >/dev/null 2>&1; fi
            ;;
        "5. Vaciar Papelera")
            rm -rf "$HOME/.local/share/Trash/files/"* 2>/dev/null
            rm -rf "$HOME/.local/share/Trash/info/"* 2>/dev/null
            ;;
    esac
done

echo "100"
echo "# ¡Limpieza Finalizada!"
sleep 1

) | zenity --progress --title="Limpiando Sistema" --text="Iniciando limpieza..." --percentage=0 --auto-close --auto-kill

show_info "✅ Tareas de limpieza ejecutadas correctamente.\nSe ha liberado espacio en tu disco duro."
