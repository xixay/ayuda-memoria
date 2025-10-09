#!/bin/bash

# Directorio del repositorio
REPO_DIR="$HOME/Documentos/Richard/ayuda-memoria"
BRANCH="main" # Cambia si usas otra rama
COMMIT_MSG="Auto commit desde script"

# Entrar al repositorio
cd "$REPO_DIR" || { echo "❌ Error: No se puede acceder al repositorio"; exit 1; }

# Mostrar cambios detectados
echo "📂 Revisando cambios en: $REPO_DIR"
git status

# Verificar si hay cambios, incluyendo archivos nuevos
if [ -z "$(git status --porcelain)" ]; then
    echo "ℹ️ No hay cambios para subir."
    exit 0
fi

# Agregar todos los cambios (incluye nuevos archivos, eliminaciones y modificaciones)
git add -A
echo "✅ Archivos agregados al staging."

# Commit
if git commit -m "$COMMIT_MSG"; then
    echo "✅ Commit creado con éxito."
else
    echo "⚠️ No se pudo crear el commit."
    exit 1
fi

# Push
if git push origin "$BRANCH"; then
    echo "🚀 Cambios subidos a $BRANCH correctamente."
else
    echo "❌ Error al hacer push."
    exit 1
fi

echo "✅ Proceso finalizado."
