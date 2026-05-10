#!/usr/bin/env bash
set -e

echo "🔍 Buscando repositorio 'ayuda-memoria'..."

# Detectar repo desde ubicación actual o buscar en $HOME
BASE="$(pwd)"
REPO_ROOT=""

while [ "$BASE" != "/" ]; do
  if [ "$(basename "$BASE")" = "ayuda-memoria" ]; then
    REPO_ROOT="$BASE"
    break
  fi
  BASE="$(dirname "$BASE")"
done

if [ -z "$REPO_ROOT" ]; then
  REPO_ROOT=$(find "$HOME" -type d -name "ayuda-memoria" 2>/dev/null | head -n 1)
fi

if [ -z "$REPO_ROOT" ]; then
  echo "❌ No se encontró 'ayuda-memoria'."
  exit 1
fi

echo "✅ Repo encontrado: $REPO_ROOT"

# Directorio de backups
BACKUP_DIR="$REPO_ROOT/7archivos/tmux/backups"
mkdir -p "$BACKUP_DIR"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/tmux-backup-$DATE.tar.gz"

# Detectar resurrect-dir dinámicamente
RESURRECT_DIR=$(tmux show-options -gqv @resurrect-dir 2>/dev/null || true)

# Valores por defecto conocidos
[ -z "$RESURRECT_DIR" ] && RESURRECT_DIR="$HOME/.tmux/resurrect"
[ ! -d "$RESURRECT_DIR" ] && RESURRECT_DIR="$HOME/.local/share/tmux/resurrect"
[ ! -d "$RESURRECT_DIR" ] && RESURRECT_DIR="$HOME/.config/tmux/resurrect"

echo "✅ Carpeta resurrect detectada: $RESURRECT_DIR"

# Detectar configuration tmux real
TMUX_DIR="$HOME/.tmux"
[ -d "$HOME/.config/tmux" ] && TMUX_DIR="$HOME/.config/tmux"

echo "✅ Config tmux: $TMUX_DIR"

echo "📦 Creando backup completo..."

tar -czvf "$BACKUP_FILE" \
  "$HOME/.tmux.conf" \
  "$TMUX_DIR" \
  "$RESURRECT_DIR" 2>/dev/null || true

echo "✅ Backup creado: $BACKUP_FILE"

# Mantener solo 5 últimos backups
cd "$BACKUP_DIR"
ls -1t tmux-backup-*.tar.gz | tail -n +6 | xargs -r rm --
echo "🧹 Historial limpiado (5 backups)"

# Subir a git si existe
if [ -d "$REPO_ROOT/.git" ]; then
  cd "$REPO_ROOT"
  git add 7archivos/tmux/backups
  git commit -m "Backup tmux COMPLETO ($DATE)" || true
  git push || echo "⚠️ No se pudo subir a remoto"
  echo "🚀 Backup subido al repo"
fi
