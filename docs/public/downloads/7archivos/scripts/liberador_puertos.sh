#!/bin/bash

# ==============================================================================
# Liberador de Puertos (Kill Port)
# ==============================================================================

if ! command -v zenity >/dev/null 2>&1; then
    echo "Se requiere Zenity."
    exit 1
fi

# Solicitar el número de puerto al usuario
PUERTO=$(zenity --entry \
    --title="Liberador de Puertos" \
    --text="Ingresa el puerto que está bloqueado (ej. 3000, 4200, 8080):" \
    --entry-text="3000" \
    --width=350)

if [ -z "$PUERTO" ]; then
    exit 0
fi

# Validar que sea un número
if ! [[ "$PUERTO" =~ ^[0-9]+$ ]]; then
    zenity --error --text="El puerto debe ser un número válido."
    exit 1
fi

# Encontrar el proceso que usa el puerto usando lsof
PID=$(lsof -t -i:"$PUERTO" 2>/dev/null)

if [ -z "$PID" ]; then
    # Intentar con fuser si lsof falla o no encuentra nada
    PID=$(fuser "$PUERTO"/tcp 2>/dev/null | awk '{print $1}')
fi

if [ -z "$PID" ]; then
    zenity --info --title="Resultado" --text="✅ El puerto <b>$PUERTO</b> está libre. Ningún proceso lo está usando."
    exit 0
fi

# Obtener nombre del proceso para mostrar al usuario
PROCESO_NOMBRE=$(ps -p "$PID" -o comm= 2>/dev/null)

if zenity --question --title="Proceso Encontrado" --text="El puerto <b>$PUERTO</b> está siendo usado por el proceso:\n\n<b>$PROCESO_NOMBRE</b> (PID: $PID)\n\n¿Deseas detenerlo a la fuerza (kill)?"; then
    kill -9 "$PID"
    
    # Verificar si se cerró
    sleep 1
    if lsof -t -i:"$PUERTO" >/dev/null 2>&1; then
        zenity --error --text="❌ No se pudo detener el proceso. Podrías necesitar permisos de administrador (sudo)."
    else
        zenity --info --text="✅ Proceso $PID detenido con éxito. El puerto <b>$PUERTO</b> está libre."
    fi
else
    zenity --info --text="Operación cancelada."
fi
