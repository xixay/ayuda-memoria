#!/bin/bash

# Directorio de origen
directorio_origen="/home/xixay/Documentos/Richard/ayuda-memoria/6archivos/querys/scripts_dbeaver"

# Directorio de destino
directorio_destino="/home/xixay/snap/dbeaver-ce/288/.local/share/DBeaverData/workspace6/General/Scripts/"

# Borrar contenido del directorio de destino si existe
rm -rf "$directorio_destino"/*

# Copiar los archivos de scripts desde el directorio de origen al directorio de destino
cp -r "$directorio_origen"/* "$directorio_destino"

# Verificar si se copiaron los archivos exitosamente
if [ $? -eq 0 ]; then
    echo "Scripts de DBeaver copiados correctamente desde: $directorio_origen a: $directorio_destino"
    
    # Notificar que los scripts fueron copiados exitosamente
    notify-send "Copiado exitoso" "Los scripts de DBeaver fueron copiados correctamente desde: $directorio_origen a: $directorio_destino"
else
    echo "Error al copiar los scripts de DBeaver desde: $directorio_origen a: $directorio_destino."
    
    # Notificar que ocurrió un error al copiar los scripts
    notify-send "Error en copia" "Ocurrió un error al copiar los scripts de DBeaver desde: $directorio_origen a: $directorio_destino."
fi

