#!/bin/bash

# ==============================================================================
# Menú General de Herramientas - Ayuda Memoria
# ==============================================================================

# Directorio donde se encuentran todos los scripts
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Verificar si zenity está instalado, si no, instalarlo automáticamente
if ! command -v zenity >/dev/null 2>&1; then
    echo "⚠️ 'zenity' no está instalado. Instalando automáticamente para que funcionen los menús..."
    sudo apt update && sudo apt install -y zenity
fi

# Función para mostrar errores
show_error() {
    zenity --error --width=300 --title="Error" --text="$1"
}

# Ejecutar un script si existe
run_script() {
    local script_name="$1"
    local script_path="$SCRIPT_DIR/$script_name"
    
    if [ -f "$script_path" ]; then
        # Asegurar permisos de ejecución
        chmod +x "$script_path"
        # Ejecutar el script
        bash "$script_path"
    else
        show_error "No se encontró el script:\n$script_name\n\nAsegúrate de que no haya sido eliminado."
    fi
}

# Bucle del menú principal
while true; do
    # El orden en este menú va desde lo más inicial (Setup) hasta mantenimiento
    choice=$(zenity --list \
        --width=700 --height=650 \
        --title="Menú General de Herramientas" \
        --text="<b>Bienvenido al panel de control de scripts.</b>\nSelecciona la herramienta que deseas ejecutar:" \
        --column="Categoría" --column="Acción" --column="Script (Oculto)" \
        --hide-column=3 \
        "🚀 Setup Inicial" "Instalar Nuevo Entorno de Desarrollo (Ubuntu)" "setup_entorno_nuevo.sh" \
        "⚡ Desarrollo Diario" "Generador Rápido de Proyectos" "creador_proyectos.sh" \
        "⚡ Desarrollo Diario" "Liberador de Puertos (Kill Port)" "liberador_puertos.sh" \
        "⚡ Desarrollo Diario" "Limpiador Profundo (Espacio/Docker)" "limpiador_sistema.sh" \
        "💻 Entorno / Config" "Setup de Perfiles Específicos (VS Code)" "vscode_setup_perfiles.sh" \
        "💻 Entorno / Config" "Respaldar Configuración (Tmux)" "backup-tmux.sh" \
        "💻 Entorno / Config" "Restaurar Configuración (Tmux)" "restore-tmux.sh" \
        "📦 Repositorios / Git" "Sincronizador Principal (Menú Completo)" "subir_repositorio.sh" \
        "📦 Repositorios / Git" "Ayuda Memoria - Flujo Rápido" "procesar_ayuda_memoria.sh" \
        "📦 Repositorios / Git" "Respaldar Queries (DBeaver)" "guardar_queries.sh" \
        "💾 Bases de Datos" "Backup Rápido (Local)" "backup_base_local.sh" \
        "💾 Bases de Datos" "Clonar BD (Local a Local)" "backup_base_local_a_otra_base_local.sh" \
        "💾 Bases de Datos" "Descargar y Restaurar (Remota a Local)" "backup_base_remota.sh" \
        "💾 Bases de Datos" "Restauración Segura (Local v2)" "restauracion_base_local_v2.sh" \
        "❌ Salir" "Cerrar Panel" "")

    # Si se pulsa Cancelar, Esc o se cierra la ventana
    if [ -z "$choice" ] || [ "$choice" = "Cerrar Panel" ]; then
        exit 0
    fi

    # Manejar la selección y ejecutar el script correspondiente
    case "$choice" in
        "Instalar Nuevo Entorno de Desarrollo (Ubuntu)")
            run_script "setup_entorno_nuevo.sh" ;;
        "Generador Rápido de Proyectos")
            run_script "creador_proyectos.sh" ;;
        "Liberador de Puertos (Kill Port)")
            run_script "liberador_puertos.sh" ;;
        "Limpiador Profundo (Espacio/Docker)")
            run_script "limpiador_sistema.sh" ;;
        "Setup de Perfiles Específicos (VS Code)")
            run_script "vscode_setup_perfiles.sh" ;;
        "Respaldar Configuración (Tmux)")
            run_script "backup-tmux.sh" ;;
        "Restaurar Configuración (Tmux)")
            run_script "restore-tmux.sh" ;;
        "Sincronizador Principal (Menú Completo)")
            run_script "subir_repositorio.sh" ;;
        "Ayuda Memoria - Flujo Rápido")
            run_script "procesar_ayuda_memoria.sh" ;;
        "Respaldar Queries (DBeaver)")
            run_script "guardar_queries.sh" ;;
        "Backup Rápido (Local)")
            run_script "backup_base_local.sh" ;;
        "Clonar BD (Local a Local)")
            run_script "backup_base_local_a_otra_base_local.sh" ;;
        "Descargar y Restaurar (Remota a Local)")
            run_script "backup_base_remota.sh" ;;
        "Restauración Segura (Local v2)")
            run_script "restauracion_base_local_v2.sh" ;;
        *)
            ;;
    esac
done
