#!/bin/bash

set -x  # Activar modo verbose para depuración

# Función para obtener el directorio de inicio del usuario
get_home_directory() {
    if [ -n "$HOME" ]; then
        echo "$HOME"
    elif [ -n "$USER" ]; then
        echo "/home/$USER"
    else
        echo "Error: No se puede determinar el directorio de inicio del usuario."
        exit 1
    fi
}

# Función para obtener el nombre del hostname
get_hostname() {
    hostname=$(hostname)
    echo "$hostname"
}

# Mostrar el nombre del hostname
echo "Nombre del hostname: $(get_hostname)"

# Detectar el entorno basado en el nombre de host
case "$(get_hostname)" in
    "OC-SGSIR-PC20L")
        echo "Detectado entorno de trabajo: Trabajo"
        directorio_origen="$(get_home_directory)/.local/share/DBeaverData/workspace6/General/Scripts/"
        directorio_destino="$(get_home_directory)/Documentos/richard/ayuda-memoria/6archivos/querys"
        directorio_dest="$(get_home_directory)/Documentos/richard/ayuda-memoria"
        ;;
    "xixay2023")
        echo "Detectado entorno de trabajo: Casa"
        # Buscar el directorio actual de DBeaverData más reciente
        directorio_dbeaver=$(find "$(get_home_directory)/snap/dbeaver-ce" -type d -name "DBeaverData" -exec stat -c "%Y %n" {} + | sort -nr | head -n 1 | cut -d' ' -f2)
        if [ -z "$directorio_dbeaver" ]; then
            echo "Error: No se pudo encontrar el directorio DBeaverData."
            exit 1
        fi
        directorio_origen="$directorio_dbeaver/workspace6/General/Scripts/"
        directorio_destino="$(get_home_directory)/Documentos/Richard/ayuda-memoria/6archivos/querys"
        directorio_dest="$(get_home_directory)/Documentos/Richard/ayuda-memoria"
        ;;
    *)
        echo "Error: No se puede determinar el entorno de trabajo."
        exit 1
        ;;
esac

# Crear el directorio de destino si no existe
mkdir -p "$directorio_destino"

# Mostrar los archivos en el directorio de origen (para depurar)
ls -l "$directorio_origen"

# Copiar los archivos de scripts desde la carpeta de DBeaver a la carpeta de destino
echo "Copiando archivos desde el directorio de origen al directorio de destino..."
cp -rf "$directorio_origen"/* "$directorio_destino"

# Mostrar los archivos en el directorio de destino (para depurar)
ls -l "$directorio_destino"

# Verificar si se copiaron los archivos exitosamente
if [ $? -eq 0 ]; then
    echo "Scripts de DBeaver copiados correctamente a: $directorio_destino"
    
    # Notificar que los scripts fueron copiados exitosamente
    notify-send "Copiado exitoso" "Los scripts de DBeaver fueron copiados correctamente a: $directorio_destino"
    
    # Entrar al directorio de destino
    cd "$directorio_dest" || exit
    
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

# Desactivar el modo verbose al final del script
set +x
