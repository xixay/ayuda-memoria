#!/bin/bash

BASE_DIR="$HOME/Documentos/Richard"
REPO_NAME="ayuda-memoria"
REPO_PATH="$BASE_DIR/$REPO_NAME"
LOG_FILE="$HOME/richard_git_log.txt"

show_info() {
    zenity --info --width=400 --title="Info" --text="$1"
}

show_error() {
    zenity --error --width=400 --title="Error" --text="$1"
}

if [ ! -d "$REPO_PATH/.git" ]; then
    show_error "No se encontró repositorio git válido en $REPO_PATH"
    exit 1
fi

cd "$REPO_PATH" || { show_error "No se pudo entrar a $REPO_PATH"; exit 1; }

show_info "Procesando repositorio: $REPO_NAME"

current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -z "$current_branch" ]; then
    show_error "No se detectó rama activa en $REPO_NAME."
    exit 1
fi

# Botón para flujo rápido: stash + pull + pop + commit automático + push automático
if zenity --question --title="Flujo rápido" --width=550 \
    --text="¿Quieres hacer stash, pull, aplicar stash, commit automático y push automático con mensaje fijo?"; then

    # Hacer stash
    if ! git stash push -m "Auto stash antes de pull $(date)"; then
        show_error "Error al hacer git stash"
        exit 1
    fi

    # Hacer pull con rebase
    if ! git pull --rebase; then
        show_error "Error al hacer git pull --rebase"
        # Intentar recuperar el stash
        git stash pop >/dev/null 2>&1
        exit 1
    fi

    # Aplicar stash guardado
    if ! git stash pop; then
        show_error "Error al aplicar git stash pop"
        exit 1
    fi

    # Commit automático con mensaje fijo (por si hay cambios después del stash pop)
    if [ -n "$(git status --porcelain)" ]; then
        git add -A
        if ! git commit -m "Actualización automática con pull, stash y push $(date)"; then
            show_error "Error al hacer commit automático"
            exit 1
        fi
    else
        show_info "No hay cambios para confirmar después de pull y stash."
    fi

    # Hacer push automático
    if git push; then
        show_info "Push automático completado correctamente."
        echo "$(date): $REPO_NAME - Push automático exitoso con mensaje: Actualización automática con pull, stash y push" >> "$LOG_FILE"
    else
        show_error "Error al hacer push automático"
        echo "$(date): $REPO_NAME - Error en push automático" >> "$LOG_FILE"
        exit 1
    fi

    show_info "Flujo rápido completado con éxito."
    exit 0
fi

# --- Continúa tu script normal (commit manual, pull, push, etc) ---

changes=$(git status --porcelain)

if [ -n "$changes" ]; then
    show_info "Cambios detectados en $REPO_NAME:\n$(git status --short)"

    if zenity --question --title="Stash" --width=400 --text="¿Quieres guardar cambios no confirmados con git stash antes de continuar?"; then
        git stash push -m "Auto stash desde script $(date)" >/dev/null 2>&1
        stashed=true
    else
        stashed=false
    fi

    commit_msg=$(zenity --entry --title="Mensaje de commit para $REPO_NAME" --text="Escribe el mensaje para el commit:" --width=500)
    if [ -z "$commit_msg" ]; then
        show_info "No escribiste mensaje de commit. Se cancelará el commit en $REPO_NAME."
        if $stashed; then
            if zenity --question --title="Stash pop" --width=400 --text="¿Quieres recuperar los cambios guardados en el stash?"; then
                git stash pop >/dev/null 2>&1
            fi
        fi
        exit 0
    fi

    git add -A
    if ! git commit -m "$commit_msg"; then
        show_error "Error al hacer commit en $REPO_NAME"
        if $stashed; then
            if zenity --question --title="Stash pop" --width=400 --text="¿Quieres recuperar los cambios guardados en el stash?"; then
                git stash pop >/dev/null 2>&1
            fi
        fi
        exit 1
    fi

    if $stashed; then
        if zenity --question --title="Stash pop" --width=400 --text="¿Quieres recuperar los cambios guardados en el stash?"; then
            git stash pop >/dev/null 2>&1
        fi
    fi
else
    show_info "No hay cambios para confirmar en $REPO_NAME"
fi

if zenity --question --title="Pull" --width=400 --text="¿Quieres hacer git pull para actualizar $REPO_NAME antes de subir cambios?"; then
    if ! git pull --rebase; then
        show_error "Error en git pull en $REPO_NAME. Revisa el repositorio."
        exit 1
    fi
fi

if zenity --question --title="Push" --width=400 --text="¿Quieres subir los cambios (git push) en $REPO_NAME?"; then
    if git push; then
        show_info "Cambios subidos correctamente en $REPO_NAME"
        echo "$(date): $REPO_NAME - Push exitoso con mensaje: $commit_msg" >> "$LOG_FILE"
    else
        show_error "Error al hacer push en $REPO_NAME"
        echo "$(date): $REPO_NAME - Error en push" >> "$LOG_FILE"
    fi
else
    show_info "Push cancelado para $REPO_NAME"
    echo "$(date): $REPO_NAME - Push cancelado por usuario" >> "$LOG_FILE"
fi

exit 0
