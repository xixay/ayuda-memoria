- [1. Crypto](#1-crypto)
- [2. Referencia](#2-referencia)

# 1. Crypto
- Instalar
```console
npm install crypto-js
```
- Llamar a las librerias en un archivo.ts
```ts
import CryptoJS from 'crypto-js'
const key = 'agetic' // La llabe puede ser cualquier valor
```
- Encriptar contrasena
```ts
const codificado = CryptoJS.AES.encrypt(contrasena, key).toString()
```
- Decriptar contraseña
```ts
const bytes = CryptoJS.AES.decrypt(contrasenaCodificada, key)
const decodificado = bytes.toString(CryptoJS.enc.Utf8)
```
# 2. Referencia
- Para mas detalles visitar [crypto-js](https://www.npmjs.com/package/crypto-js)
