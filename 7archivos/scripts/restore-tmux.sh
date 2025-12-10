#!/usr/bin/env bash
set -e

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="$HOME/restore-tmux-$TIMESTAMP.log"

log() {
    echo "$1" | tee -a "$LOGFILE"
}

log "============================================"
log "  Restauración inteligente de TMUX"
log "  Usuario: $USER"
log "  Fecha:   $TIMESTAMP"
log "  Log:     $LOGFILE"
log "============================================"

# ----------------------------------------------------------
# Validación: no root
# ----------------------------------------------------------
if [ "$EUID" -eq 0 ]; then
    log "❌ No ejecutes como root."
    exit 1
fi

# ----------------------------------------------------------
# Detectar configuración tmux
# ----------------------------------------------------------
if [ -d "$HOME/.tmux" ]; then
    TMUX_DIR="$HOME/.tmux"
elif [ -d "$HOME/.config/tmux" ]; then
    TMUX_DIR="$HOME/.config/tmux"
else
    log "⚠ No se detectó tmux. Se creará ~/.tmux"
    TMUX_DIR="$HOME/.tmux"
    mkdir -p "$TMUX_DIR"
fi
log "✅ Directorio tmux detectado: $TMUX_DIR"

# ----------------------------------------------------------
# Carpeta correcta de resurrect
# ----------------------------------------------------------
RESURRECT_DIR=$(tmux show-options -gqv @resurrect-dir 2>/dev/null || true)

if [ -z "$RESURRECT_DIR" ]; then
    if [ -d "$HOME/.local/share/tmux/resurrect" ]; then
        RESURRECT_DIR="$HOME/.local/share/tmux/resurrect"
    elif [ -d "$HOME/.tmux/resurrect" ]; then
        RESURRECT_DIR="$HOME/.tmux/resurrect"
    elif [ -d "$HOME/.config/tmux/resurrect" ]; then
        RESURRECT_DIR="$HOME/.config/tmux/resurrect"
    else
        mkdir -p "$HOME/.local/share/tmux/resurrect"
        RESURRECT_DIR="$HOME/.local/share/tmux/resurrect"
    fi
fi
mkdir -p "$RESURRECT_DIR"
log "✅ Carpeta resurrect final: $RESURRECT_DIR"

# ----------------------------------------------------------
# Buscar repo
# ----------------------------------------------------------
BASE_DIR="$(pwd)"
REPO_ROOT=""
while [ "$BASE_DIR" != "/" ]; do
    if [ "$(basename "$BASE_DIR")" = "ayuda-memoria" ]; then
        REPO_ROOT="$BASE_DIR"
        break
    fi
    BASE_DIR="$(dirname "$BASE_DIR")"
done
if [ -z "$REPO_ROOT" ]; then
    log "❌ Repo 'ayuda-memoria' NO encontrado."
    exit 1
fi
log "✅ Repo encontrado en: $REPO_ROOT"

# ----------------------------------------------------------
# Detectar último backup
# ----------------------------------------------------------
BACKUP_DIR="$REPO_ROOT/7archivos/tmux/backups"
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/tmux-backup-*.tar.gz 2>/dev/null | head -n 1)
if [ -z "$LATEST_BACKUP" ]; then
    log "❌ No hay backups válidos."
    exit 1
fi
log "✅ Último backup: $LATEST_BACKUP"

# ----------------------------------------------------------
# Backup previo
# ----------------------------------------------------------
PRE_BACKUP="$HOME/tmux-pre-restore-$TIMESTAMP.tar.gz"
log "📦 Backup actual antes de restaurar..."
tar -czf "$PRE_BACKUP" -C "$HOME" "$(basename "$TMUX_DIR")" 2>/dev/null || true
log "✅ Respaldo creado: $PRE_BACKUP"

# ----------------------------------------------------------
# Restauración inteligente: extraer solo config y resurrect
# ----------------------------------------------------------
log "♻ Restaurando archivos desde backup..."

# Extraer la lista de archivos del tar
FILES=$(tar -tzf "$LATEST_BACKUP")

# Extraer archivos de .tmux.conf
echo "$FILES" | grep -E '\.tmux\.conf$' | while read -r f; do
    log "🔹 Restaurando $f → $HOME/.tmux.conf"
    tar -xzf "$LATEST_BACKUP" -C "$HOME" "$f" --strip-components=$(echo "$f" | tr -cd '/' | wc -c)
done

# Extraer directorio tmux
echo "$FILES" | grep -E '(/\.tmux|/\.config/tmux)$' | while read -r f; do
    DEST="$HOME/$(basename "$f")"
    log "🔹 Restaurando $f → $DEST"
    tar -xzf "$LATEST_BACKUP" -C "$HOME" "$f" --strip-components=$(echo "$f" | tr -cd '/' | wc -c)
done

# Extraer todos los archivos resurrect al folder correcto
echo "$FILES" | grep -E 'resurrect/.*\.txt$' | while read -r f; do
    log "🔹 Restaurando $f → $RESURRECT_DIR"
    tar -xzf "$LATEST_BACKUP" -C "$RESURRECT_DIR" "$f" --strip-components=$(echo "$f" | sed 's/[^\/]*\///' | tr -cd '/' | wc -c)
done

log "✅ Restauración completada."

# ----------------------------------------------------------
# Mensaje final
# ----------------------------------------------------------
echo
log "============================================"
log " USO FINAL:"
log "  Entra a tmux y ejecuta:"
log "    Ctrl + b luego R"
log "============================================"
