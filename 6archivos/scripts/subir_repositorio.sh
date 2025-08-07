#!/bin/bash

BASE_DIR="$HOME/Documentos/Richard"
LOG_FILE="$HOME/richard_git_log.txt"
FAV_FILE="$HOME/.richard_favorites.txt"

# Mostrar info con zenity
show_info() {
    zenity --info --width=400 --title="Info" --text="$1"
}

# Mostrar error con zenity
show_error() {
    zenity --error --width=400 --title="Error" --text="$1"
}

# Mostrar ventana de ayuda inicial
show_help() {
    zenity --text-info --width=500 --height=400 --title="Ayuda y pasos para usar este script" --filename=<(cat <<EOF
Este script te ayuda a administrar tus repositorios git ubicados en:
$BASE_DIR

Pasos de uso:

1) Selecciona "Administrar favoritos" para agregar o quitar repositorios de favoritos.
2) Selecciona "Revisar repositorios" para ver los repositorios, confirmar cambios y hacer push.
3) En "Revisar repositorios" puedes elegir repositorios normales o tus favoritos para facilitar el acceso.
4) El script te preguntará antes de hacer cada acción importante para evitar errores.
5) Revisa el archivo de logs: $LOG_FILE para historial de operaciones.

Presiona OK para continuar...
EOF
)
}

# Leer favoritos en array
read_favorites() {
    if [ -f "$FAV_FILE" ]; then
        mapfile -t favorites < "$FAV_FILE"
    else
        favorites=()
    fi
}

# Guardar favoritos desde array
save_favorites() {
    printf "%s\n" "${favorites[@]}" > "$FAV_FILE"
}

# Función para verificar si un repo está en favoritos
is_favorite() {
    local name="$1"
    for fav in "${favorites[@]}"; do
        if [ "$fav" = "$name" ]; then
            return 0
        fi
    done
    return 1
}

# Función para procesar repositorio: revisar cambios, commit, pull y push
process_repo() {
    local repo_path="$1"
    local repo_name
    repo_name=$(basename "$repo_path")

    cd "$repo_path" || { show_error "No se pudo entrar a $repo_path"; return; }

    show_info "Procesando repositorio: $repo_name"

    current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -z "$current_branch" ]; then
        show_error "No se detectó rama activa en $repo_name. ¿Es un repositorio git válido?"
        return
    fi

    changes=$(git status --porcelain)

    if [ -n "$changes" ]; then
        show_info "Cambios detectados en $repo_name:\n$(git status --short)"

        if zenity --question --title="Stash" --width=400 --text="¿Quieres guardar cambios no confirmados con git stash antes de continuar?"; then
            git stash push -m "Auto stash desde script $(date)" >/dev/null 2>&1
            stashed=true
        else
            stashed=false
        fi

        commit_msg=$(zenity --entry --title="Mensaje de commit para $repo_name" --text="Escribe el mensaje para el commit:" --width=500)
        if [ -z "$commit_msg" ]; then
            show_info "No escribiste mensaje de commit. Se cancelará el commit en $repo_name."
            if $stashed; then
                if zenity --question --title="Stash pop" --width=400 --text="¿Quieres recuperar los cambios guardados en el stash?"; then
                    git stash pop >/dev/null 2>&1
                fi
            fi
            return
        fi

        git add -A
        if ! git commit -m "$commit_msg"; then
            show_error "Error al hacer commit en $repo_name"
            if $stashed; then
                if zenity --question --title="Stash pop" --width=400 --text="¿Quieres recuperar los cambios guardados en el stash?"; then
                    git stash pop >/dev/null 2>&1
                fi
            fi
            return
        fi

        if $stashed; then
            if zenity --question --title="Stash pop" --width=400 --text="¿Quieres recuperar los cambios guardados en el stash?"; then
                git stash pop >/dev/null 2>&1
            fi
        fi

    else
        show_info "No hay cambios para confirmar en $repo_name"
    fi

    if zenity --question --title="Pull" --width=400 --text="¿Quieres hacer git pull para actualizar $repo_name antes de subir cambios?"; then
        if ! git pull --rebase; then
            show_error "Error en git pull en $repo_name. Revisa el repositorio."
            return
        fi
    fi

    if zenity --question --title="Push" --width=400 --text="¿Quieres subir los cambios (git push) en $repo_name?"; then
        if git push; then
            show_info "Cambios subidos correctamente en $repo_name"
            echo "$(date): $repo_name - Push exitoso con mensaje: $commit_msg" >> "$LOG_FILE"
        else
            show_error "Error al hacer push en $repo_name"
            echo "$(date): $repo_name - Error en push" >> "$LOG_FILE"
        fi
    else
        show_info "Push cancelado para $repo_name"
        echo "$(date): $repo_name - Push cancelado por usuario" >> "$LOG_FILE"
    fi
}

# Función para seleccionar repositorios y revisar cambios con buscador
select_repos() {
    local filter="$1"
    repos=()
    while IFS= read -r -d '' dir; do
        if [ -d "$dir/.git" ]; then
            repos+=("$dir")
        fi
    done < <(find "$BASE_DIR" -maxdepth 1 -type d -print0)

    if [ ${#repos[@]} -eq 0 ]; then
        show_info "No se encontraron repositorios git en $BASE_DIR"
        return 1
    fi

    # Leer favoritos para filtro si es necesario
    read_favorites

    filtro_texto=$(zenity --entry --title="Buscar repositorios" --text="Escribe texto para filtrar repositorios (deja vacío para mostrar todos):" --width=400)
    filtro_texto_lower=$(echo "$filtro_texto" | tr '[:upper:]' '[:lower:]')

    list_items=()
    for repo_path in "${repos[@]}"; do
        repo_name=$(basename "$repo_path")
        repo_name_lower=$(echo "$repo_name" | tr '[:upper:]' '[:lower:]')
        if [ "$filter" == "favoritos" ]; then
            if is_favorite "$repo_name"; then
                if [[ -z "$filtro_texto" || "$repo_name_lower" == *"$filtro_texto_lower"* ]]; then
                    list_items+=("FALSE" "$repo_name" "$repo_path")
                fi
            fi
        else
            if [[ -z "$filtro_texto" || "$repo_name_lower" == *"$filtro_texto_lower"* ]]; then
                list_items+=("FALSE" "$repo_name" "$repo_path")
            fi
        fi
    done

    if [ ${#list_items[@]} -eq 0 ]; then
        show_info "No hay repositorios para mostrar con el filtro '$filtro_texto'."
        return 1
    fi

    selected=$(zenity --list --checklist --width=600 --height=400 --title="Selecciona repositorios" \
        --text="Selecciona uno o varios repositorios para revisar y subir cambios.\nPresiona Cancelar para salir." \
        --column="Seleccionar" --column="Nombre" --column="Ruta" \
        "${list_items[@]}")

    if [ -z "$selected" ]; then
        show_info "No seleccionaste repositorios."
        return 1
    fi

    IFS="|" read -r -a selected_array <<< "$selected"
    for sel in "${selected_array[@]}"; do
        for repo_path in "${repos[@]}"; do
            if [ "$(basename "$repo_path")" = "$sel" ]; then
                process_repo "$repo_path"
                break
            fi
        done
    done
}

# Función para administrar favoritos con buscador
manage_favorites() {
    read_favorites

    repos=()
    while IFS= read -r -d '' dir; do
        if [ -d "$dir/.git" ]; then
            repos+=("$dir")
        fi
    done < <(find "$BASE_DIR" -maxdepth 1 -type d -print0)

    if [ ${#repos[@]} -eq 0 ]; then
        show_info "No se encontraron repositorios git en $BASE_DIR"
        return
    fi

    filtro_texto=$(zenity --entry --title="Buscar repositorios para favoritos" --text="Escribe texto para filtrar repositorios (deja vacío para mostrar todos):" --width=400)
    filtro_texto_lower=$(echo "$filtro_texto" | tr '[:upper:]' '[:lower:]')

    list_items=()
    for repo_path in "${repos[@]}"; do
        repo_name=$(basename "$repo_path")
        repo_name_lower=$(echo "$repo_name" | tr '[:upper:]' '[:lower:]')
        if [[ -z "$filtro_texto" || "$repo_name_lower" == *"$filtro_texto_lower"* ]]; then
            if is_favorite "$repo_name"; then
                list_items+=("TRUE" "$repo_name" "$repo_path")
            else
                list_items+=("FALSE" "$repo_name" "$repo_path")
            fi
        fi
    done

    if [ ${#list_items[@]} -eq 0 ]; then
        show_info "No hay repositorios para mostrar con el filtro '$filtro_texto'."
        return
    fi

    selected=$(zenity --list --checklist --width=600 --height=400 --title="Administrar Favoritos" \
        --text="Selecciona repositorios para marcar como favoritos.\nPresiona Cancelar para salir." \
        --column="Favorito" --column="Nombre" --column="Ruta" \
        "${list_items[@]}")

    if [ -z "$selected" ]; then
        show_info "No seleccionaste favoritos."
        return
    fi

    IFS="|" read -r -a new_favs <<< "$selected"
    favorites=("${new_favs[@]}")

    save_favorites
    show_info "Favoritos guardados correctamente."
}

# Menú principal
main_menu() {
    while true; do
        choice=$(zenity --list --width=400 --height=300 --title="Menú Principal" --text="Selecciona una opción:" --column="Opciones" \
            "Administrar favoritos" "Revisar repositorios" "Salir")
        case "$choice" in
            "Administrar favoritos")
                manage_favorites
                ;;
            "Revisar repositorios")
                read_favorites
                filter_choice=$(zenity --list --width=400 --height=200 --title="Revisar repositorios" --text="¿Qué repositorios quieres revisar?" --column="Opciones" "Todos" "Favoritos" "Cancelar")
                case "$filter_choice" in
                    "Todos")
                        select_repos "todos"
                        ;;
                    "Favoritos")
                        select_repos "favoritos"
                        ;;
                    "Cancelar"|"")
                        ;;
                    *)
                        show_error "Opción inválida"
                        ;;
                esac
                ;;
            "Salir"|"")
                exit 0
                ;;
            *)
                show_error "Opción inválida"
                ;;
        esac
    done
}

# --- Inicio script ---

# Validar git instalado
if ! command -v git >/dev/null 2>&1; then
    show_error "Git no está instalado. Instálalo e intenta de nuevo."
    exit 1
fi

# Validar carpeta base
if [ ! -d "$BASE_DIR" ]; then
    show_error "No se encontró la carpeta $BASE_DIR"
    exit 1
fi

show_help
main_menu

exit 0
