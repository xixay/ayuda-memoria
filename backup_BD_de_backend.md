# Usando docker para crear un backup y restaurarlo
- Al tener una imagen sms, con docker se puede hacer un backup de la base de datos, y restaurarlo
# Hacer backup de la base de datos
- Se debe estar en la carpeta backups del backend, una ves adentro, realizar el backup
```console
sudo bash create-backup.sh sms database_db database_db.gz
```
# Restaurar los datos de la base de datos
- Copiar el archivo database_db.gz, dentro de la carpeta backups del backend, e ir a la ubicacion del archivo, y realizar el restore
```console
sudo bash restore-backup.sh sms database_db database_db.gz
```

