#!/usr/bin/env bash
set -e

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="$HOME/restore-tmux-$TIMESTAMP.log"

log() {
  echo "$1" | tee -a "$LOGFILE"
}

log "============================================"
log "  Restauración portable de TMUX"
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
# Detectar dónde está la config de tmux
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
# Detectar ruta de resurrect real (si existe)
# ----------------------------------------------------------
RESURRECT_DIR=$(tmux show-options -gqv @resurrect-dir || true)

if [ -z "$RESURRECT_DIR" ]; then
  RESURRECT_DIR="$TMUX_DIR/resurrect"
fi

log "✅ Directorio resurrect: $RESURRECT_DIR"

# ----------------------------------------------------------
# Buscar el repo en todo el HOME (seguro y rápido)
# ----------------------------------------------------------
log "🔍 Detectando repo desde la ubicación actual..."

BASE_DIR="$(pwd)"

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
# Detectar backups
# ----------------------------------------------------------
BACKUP_DIR="$REPO_ROOT/7archivos/tmux/backups"

if [ ! -d "$BACKUP_DIR" ]; then
  log "❌ Carpeta de backups no existe:"
  log "   $BACKUP_DIR"
  exit 1
fi

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
# Restauración inteligente
# ----------------------------------------------------------
log "♻ Restaurando..."

tar -xzf "$LATEST_BACKUP" -C "$HOME" --no-same-owner | tee -a "$LOGFILE"

log "✅ Restauración completada."

# ----------------------------------------------------------
# Mensaje final real
# ----------------------------------------------------------
echo
log "============================================"
log " USO FINAL:"
log "  Entra a tmux y ejecuta:"
log "    Ctrl + b luego R"
log "============================================"
