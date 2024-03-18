#!/bin/bash

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
        directorio_origen="$(get_home_directory)/Documentos/richard/ayuda-memoria/6archivos/querys/scripts_dbeaver"
        directorio_destino="$(get_home_directory)/.local/share/DBeaverData/workspace6/General/Scripts/"
        ;;
    "nombre-del-equipo-casa")
        echo "Detectado entorno de trabajo: Casa"
        directorio_origen="/home/xixay/Documentos/Richard/ayuda-memoria/6archivos/querys/scripts_dbeaver"
        directorio_destino="/home/xixay/snap/dbeaver-ce/288/.local/share/DBeaverData/workspace6/General/Scripts/"
        ;;
    *)
        echo "Error: No se puede determinar el entorno de trabajo."
        exit 1
        ;;
esac

# Mostrar los directorios de origen y destino
echo "Directorio de origen: $directorio_origen"
echo "Directorio de destino: $directorio_destino"

# Borrar contenido del directorio de destino si existe
echo "Borrando contenido del directorio de destino..."
rm -rf "$directorio_destino"/*

# Copiar los archivos de scripts desde el directorio de origen al directorio de destino
echo "Copiando archivos desde el directorio de origen al directorio de destino..."
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

