#!/bin/bash

# Directorio donde guardar los scripts de DBeaver
directorio_destino="/home/xixay/Documentos/Richard/ayuda-memoria/6archivos/querys/scripts_dbeaver"

# Borrar contenido del directorio de destino si existe
rm -rf "$directorio_destino"/*

# Crear el directorio de destino si no existe
mkdir -p "$directorio_destino"

# Copiar los archivos de scripts desde la carpeta de DBeaver a la carpeta de destino
cp -r /home/xixay/snap/dbeaver-ce/288/.local/share/DBeaverData/workspace6/General/Scripts/* "$directorio_destino"

# Verificar si se copiaron los archivos exitosamente
if [ $? -eq 0 ]; then
    echo "Scripts de DBeaver copiados correctamente a: $directorio_destino"
    
    # Notificar que los scripts fueron copiados exitosamente
    notify-send "Copiado exitoso" "Los scripts de DBeaver fueron copiados correctamente a: $directorio_destino"
    
    # Entrar al directorio de destino
    cd "$directorio_destino" || exit
    
    # Realizar el commit
    git add .
    git commit -m "Actualizar scripts de DBeaver"
    
    # Realizar el push a la rama "main"
    git push origin main
    
    # Verificar si el push se realizó correctamente
    if [ $? -eq 0 ]; then
        echo "Commit y push realizados correctamente."
        
        # Notificar que el push fue exitoso
        notify-send "Push exitoso" "Se realizó el commit y push correctamente."
    else
        echo "Error al realizar el push."
        
        # Notificar que ocurrió un error al hacer push
        notify-send "Error en push" "Ocurrió un error al realizar el push."
    fi
else
    echo "Error al copiar los scripts de DBeaver."
    
    # Notificar que ocurrió un error al copiar los scripts
    notify-send "Error en copia" "Ocurrió un error al copiar los scripts de DBeaver."
fi

