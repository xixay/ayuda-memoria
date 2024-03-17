#!/bin/bash

# Directorio donde guardar los scripts de DBeaver
directorio_destino="/home/xixay/Documentos/Richard/ayuda-memoria/6archivos/querys/scripts_dbeaver"

# Crear el directorio de destino si no existe
mkdir -p "$directorio_destino"

# Copiar los archivos de scripts desde la carpeta de DBeaver a la carpeta de destino
cp -r /home/xixay/snap/dbeaver-ce/288/.local/share/DBeaverData/workspace6/General/Scripts/* "$directorio_destino"

# Verificar si se copiaron los archivos exitosamente
if [ $? -eq 0 ]; then
    echo "Scripts de DBeaver copiados correctamente a: $directorio_destino"
else
    echo "Error al copiar los scripts de DBeaver."
fi





