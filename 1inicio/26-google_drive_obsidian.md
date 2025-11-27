[<< INDICE](../README.md)
- [1. Configurar google drive en ubuntu](#1-configurar-google-drive-en-ubuntu)
  - [1.1. Inicia la configuración de rclone: Abre una terminal y escribe:](#11-inicia-la-configuración-de-rclone-abre-una-terminal-y-escribe)
  - [1.2. Nombra tu remoto:](#12-nombra-tu-remoto)
  - [1.3. Selecciona Google Drive como el tipo de almacenamiento:](#13-selecciona-google-drive-como-el-tipo-de-almacenamiento)
  - [1.4. Cliente y secreto de Google:](#14-cliente-y-secreto-de-google)
  - [1.5. Selecciona el alcance del acceso (scope):](#15-selecciona-el-alcance-del-acceso-scope)
  - [1.6. Complete para acceder a las carpetas "Computadoras"](#16-complete-para-acceder-a-las-carpetas-computadoras)
  - [1.7. Cuenta de servicio (opcional):](#17-cuenta-de-servicio-opcional)
  - [1.8. Cuando te pregunte si quieres editar la configuración avanzada](#18-cuando-te-pregunte-si-quieres-editar-la-configuración-avanzada)
  - [1.9. Autenticación interactiva:](#19-autenticación-interactiva)
  - [1.10. Team Drive (opcional):](#110-team-drive-opcional)
  - [1.11. Mensaje de creacion](#111-mensaje-de-creacion)
  - [1.12. Confirmar configuración:](#112-confirmar-configuración)
  - [1.13. Salir de la configuración:](#113-salir-de-la-configuración)
  - [1.14. Montar Google Drive](#114-montar-google-drive)

# 1. Configurar google drive en ubuntu
- Aquí están los pasos detallados basados en lo que has mencionado:
## 1.1. Inicia la configuración de rclone: Abre una terminal y escribe:
```shell
 rclone config
```
- Luego selecciona New remote escribiendo n y presiona Enter.
```shell
2024/09/28 20:19:51 NOTICE: Config file "/home/xixay/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n
```
## 1.2. Nombra tu remoto:
- Cuando te pregunte por el nombre del remote, escribe un nombre, por ejemplo remote, y presiona Enter:
```shell
name> remote
```
## 1.3. Selecciona Google Drive como el tipo de almacenamiento:
- Cuando te pida el tipo de almacenamiento, escribe el número correspondiente a Google Drive o directamente drive y presiona Enter:
```shell
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / 1Fichier
   \ "fichier"
 2 / Alias for an existing remote
   \ "alias"
 3 / Amazon Drive
   \ "amazon cloud drive"
 4 / Amazon S3 Compliant Storage Provider (AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, Tencent COS, etc)
   \ "s3"
 5 / Backblaze B2
   \ "b2"
 6 / Box
   \ "box"
 7 / Cache a remote
   \ "cache"
 8 / Citrix Sharefile
   \ "sharefile"
 9 / Dropbox
   \ "dropbox"
10 / Encrypt/Decrypt a remote
   \ "crypt"
11 / FTP Connection
   \ "ftp"
12 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
13 / Google Drive
   \ "drive"
14 / Google Photos
   \ "google photos"
15 / Hubic
   \ "hubic"
16 / In memory object storage system.
   \ "memory"
17 / Jottacloud
   \ "jottacloud"
18 / Koofr
   \ "koofr"
19 / Local Disk
   \ "local"
20 / Mail.ru Cloud
   \ "mailru"
21 / Microsoft Azure Blob Storage
   \ "azureblob"
22 / Microsoft OneDrive
   \ "onedrive"
23 / OpenDrive
   \ "opendrive"
24 / OpenStack Swift (Rackspace Cloud Files, Memset Memstore, OVH)
   \ "swift"
25 / Pcloud
   \ "pcloud"
26 / Put.io
   \ "putio"
27 / SSH/SFTP Connection
   \ "sftp"
28 / Sugarsync
   \ "sugarsync"
29 / Transparently chunk/split large files
   \ "chunker"
30 / Union merges the contents of several upstream fs
   \ "union"
31 / Webdav
   \ "webdav"
32 / Yandex Disk
   \ "yandex"
33 / http Connection
   \ "http"
34 / premiumize.me
   \ "premiumizeme"
35 / seafile
   \ "seafile"
Storage> drive
** See help for drive backend at: https://rclone.org/drive/ **
```
## 1.4. Cliente y secreto de Google:
- Luego te preguntará por el Google Application Client Id donde en client_id y el Client Secret. Si no tienes uno configurado, simplemente presiona Enter para dejarlos en blanco (esto utiliza los valores predeterminados de rclone).
```shell
Google Application Client Id
Setting your own is recommended.
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.
If you leave this blank, it will use an internal key which is low performance.
Enter a string value. Press Enter for the default ("").
client_id>[Enter]
OAuth Client Secret
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_secret>[Enter]
Scope that rclone should use when requesting access from drive.
Enter a string value. Press Enter for the default ("").
```
## 1.5. Selecciona el alcance del acceso (scope):
- A continuación, te pedirá que elijas el nivel de acceso que rclone tendrá a tu Google Drive. Para el acceso completo, elige 1 (recomendado si quieres poder leer/escribir y borrar archivos).
```shell
Choose a number from below, or type in your own value
 1 / Full access all files, excluding Application Data Folder.
   \ "drive"
 2 / Read-only access to file metadata and file contents.
   \ "drive.readonly"
   / Access to files created by rclone only.
 3 | These are visible in the drive website.
   | File authorization is revoked when the user deauthorizes the app.
   \ "drive.file"
   / Allows read and write access to the Application Data folder.
 4 | This is not visible in the drive website.
   \ "drive.appfolder"
   / Allows read-only access to file metadata but
 5 | does not allow any access to read or download file content.
   \ "drive.metadata.readonly"
scope> 1
```
## 1.6. Complete para acceder a las carpetas "Computadoras"
- (consulte los documentos) o para que rclone use una carpeta que no sea la raíz como punto de inicio.
- Ingrese un valor de cadena. Presione Enter para el valor predeterminado ("").
```shell
ID of the root folder
Leave blank normally.

Fill in to access "Computers" folders (see docs), or for rclone to use
a non root folder as its starting point.

Enter a string value. Press Enter for the default ("").
root_folder_id>[Enter]
```
## 1.7. Cuenta de servicio (opcional):
- Si no estás usando una cuenta de servicio de Google (lo más probable es que no la necesites), simplemente presiona Enter cuando te pregunte sobre el archivo JSON de la cuenta de servicio:
```shell
Service Account Credentials JSON file path
Leave blank normally.
Needed only if you want use SA instead of interactive login.

Leading `~` will be expanded in the file name as will environment variables such as `${RCLONE_CONFIG_DIR}`.

Enter a string value. Press Enter for the default ("").
service_account_file>[Enter]
```
## 1.8. Cuando te pregunte si quieres editar la configuración avanzada
- simplemente selecciona No escribiendo n y presiona Enter. La mayoría de los usuarios no necesitan tocar la configuración avanzada.
```shell
Edit advanced config? (y/n)
y) Yes
n) No (default)
y/n> n
```
## 1.9. Autenticación interactiva:
- Cuando te pregunte si deseas usar un navegador web para autenticarte, elige Yes (y):
```shell
Remote config
Use auto config?
 * Say Y if not sure
 * Say N if you are working on a remote or headless machine
y) Yes (default)
n) No
y/n> y
Got code
```
- Esto abrirá tu navegador y te pedirá que inicies sesión en tu cuenta de Google. Una vez hecho esto, te pedirá que autorices a rclone para acceder a tu Google Drive. Acepta los permisos.
- Autenticación completada: Después de iniciar sesión en Google, rclone recibirá un código de autenticación y completará la configuración.
```shell
If your browser doesn't open automatically go to the following link: http://127.0.0.1:53682/auth?state=T5dK-A8riPj4TNBtRahQAg
Log in and authorize rclone for access
Waiting for code...
```
## 1.10. Team Drive (opcional):
- Si no estás utilizando una "Team Drive" (un drive compartido de Google), selecciona No (n).
```shell
Configure this as a team drive?
y) Yes
n) No (default)
y/n> n
```
## 1.11. Mensaje de creacion
```shell
--------------------
[remote]
scope = drive
token = {"access_token":"ya29.a0AcM612xpbQ1U6jK_nran0ZkpV3Yuzwl3c0kWhay5xmRZyMr2KtAUreRE2zG7lae8wz1sKrsxXIp72PmizwOtsamg2TPYuNqPyHhMACDFOX9EO3M6k0ZvmTBcx_EZmy9n_zqAL5q8UpcWp48c6oG3xW-XOIBTsoKHkoWv7wNlaCgYKAQYSARISFQHGX2MiTjUDtyP3Vvg8CjPpEfbFIg0175","token_type":"Bearer","refresh_token":"1//0hyWaAJvbA4MhCgYIARAAGBESNwF-L9IrL5jWgBrPXJVAfCdS-Xv8rF9DGo0dVgYAHVVEyaUVh4XzLxuCtDdYLt7Ss-l6HPDddik","expiry":"2024-09-28T21:21:11.733809241-04:00"}
--------------------
```
## 1.12. Confirmar configuración:
- Finalmente, rclone te pedirá confirmar si todo está bien. Elige Yes (y):
```shell
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d> y
```
## 1.13. Salir de la configuración:
- Escoger la opción q:
```shell
Current remotes:

Name                 Type
====                 ====
remote               drive

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q
```
## 1.14. Montar Google Drive
- Para montar tu Google Drive en Ubuntu como una carpeta, usa el siguiente comando:
```shell
mkdir ~/GoogleDrive
rclone mount remote: ~/GoogleDrive --vfs-cache-mode writes &
```
- Esto montará tu Google Drive en la carpeta ~/GoogleDrive.
```shell
[1] 2945937
```

