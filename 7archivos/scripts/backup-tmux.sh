#!/bin/bash
# ==============================================
# Script: backup-tmux.sh
# Autor: Xixay Yumiko
# Descripción:
#   Crea un respaldo completo de la configuración
#   de tmux, tmux-resurrect y plugins relacionados.
#   Detecta automáticamente el repositorio donde
#   guardar el backup, incluso en otros discos.
# ==============================================

set -e

echo "🔍 Buscando repositorio 'ayuda-memoria'..."

# Buscar la raíz del repositorio 'ayuda-memoria'
REPO_ROOT=$(find "$HOME" /media /mnt -type d -name "ayuda-memoria" 2>/dev/null | head -n 1)

if [ -z "$REPO_ROOT" ]; then
  echo "❌ No se encontró la carpeta 'ayuda-memoria' en tu sistema."
  exit 1
fi

# Carpeta de backups dentro del repo
BACKUP_DIR="$REPO_ROOT/7archivos/tmux/backups"
mkdir -p "$BACKUP_DIR"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/tmux-backup-$DATE.tar.gz"

echo "📦 Creando respaldo en: $BACKUP_FILE"

# Archivos y carpetas a incluir
tar -czvf "$BACKUP_FILE" \
  "$HOME/.tmux.conf" \
  "$HOME/.tmux/" \
  "$HOME/.config/tmux/" 2>/dev/null || true

echo "✅ Backup creado correctamente."

# Subir automáticamente si es un repositorio Git
if [ -d "$REPO_ROOT/.git" ]; then
  cd "$REPO_ROOT"
  git add 7archivos/tmux/backups/
  git commit -m "Backup automático de tmux ($DATE)" || true
  git push || echo "⚠️ No se pudo hacer push automático (revisa conexión o permisos)."
  echo "🚀 Backup subido al repositorio remoto."
else
  echo "ℹ️ No es un repositorio Git, backup guardado localmente."
fi
