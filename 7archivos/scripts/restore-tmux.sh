#!/bin/bash
# ==============================================
# Script: restore-tmux.sh
# Autor: Xixay Yumiko
# Descripción:
#   Restaura la configuración de tmux, tmux-resurrect
#   y plugins desde el último backup encontrado.
#   Compatible con repositorios en cualquier ubicación.
# ==============================================

set -e

echo "🔍 Buscando repositorio 'ayuda-memoria'..."

# Buscar la raíz del repositorio 'ayuda-memoria'
REPO_ROOT=$(find "$HOME" /media /mnt -type d -name "ayuda-memoria" 2>/dev/null | head -n 1)

if [ -z "$REPO_ROOT" ]; then
  echo "❌ No se encontró la carpeta 'ayuda-memoria' en tu sistema."
  exit 1
fi

BACKUP_DIR="$REPO_ROOT/7archivos/tmux/backups"
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/tmux-backup-*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
  echo "❌ No se encontró ningún backup en $BACKUP_DIR"
  exit 1
fi

echo "♻️ Restaurando configuración desde: $LATEST_BACKUP"
tar -xzvf "$LATEST_BACKUP" -C "$HOME"

echo "✅ Configuración restaurada correctamente."
echo "🧠 Si usas tmux-resurrect, ejecuta dentro de tmux:"
echo "   Ctrl-b + r  (para restaurar la sesión guardada)"
