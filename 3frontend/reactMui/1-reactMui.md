[<< INDICE](../../README.md)

- [1. React(Js)](#1-reactjs)
  - [1.1. Inicio](#11-inicio)
  - [1.2. Preparativos](#12-preparativos)
    - [1.2.1. Aplicacion principal App.js](#121-aplicacion-principal-appjs)
    - [1.2.2. Componente](#122-componente)
- [2. React(Ts)](#2-reactts)
  - [2.1. Inicio](#21-inicio)
  - [2.2. Preparativos](#22-preparativos)
    - [2.2.1. Ir a index.html y modificar](#221-ir-a-indexhtml-y-modificar)
    - [2.2.2. Ir a index.tsx y modificar](#222-ir-a-indextsx-y-modificar)
    - [2.2.3. Crear rutas](#223-crear-rutas)
    - [2.2.4. Aplicacion principal App.tsx](#224-aplicacion-principal-apptsx)
- [3. React(Mui)](#3-reactmui)
  - [3.1. Inicio](#31-inicio)
  - [3.2. Agregar el tipo de fuente](#32-agregar-el-tipo-de-fuente)
  - [3.3. BOTON](#33-boton)
  - [3.4. Crear componente en proyecto base react mui IMANOL](#34-crear-componente-en-proyecto-base-react-mui-imanol)
# 1. React(Js)
## 1.1. Inicio
- Instalar
```console
npm install -g create-react-app
```
- crear un proyecto
```console
create-react-app aprendiendoreact
```
- Ingresar en la carpeta
```console
cd aprendiendoreact
```
- Iniciar
```console
npm start
```
## 1.2. Preparativos
### 1.2.1. Aplicacion principal App.js 
```js
// Llama a el componente de otro lado
import MiComponente from './components/MiComponente';
// Función
function imprimirApodo(apodo,edad){ 
  var mostrar =(
            <div> <h1>Mi apodo es {apodo}</h1>
              <h2>De edad {edad} anos</h2>
            </div>
  )
  return mostrar;
}
// Funcion principal
function App() {
  var nombre = "Richard Teran"// variable nombre
  var presentacion = <h2>{nombre}</h2>// variable etiqueta
  var apodo = "Xixay"// variable apodo
  var edad = 36// variable edad
  return (
    <div className="App">
      <header className="App-header">
        <p>Hola bienvenido</p>
        {/* Imprime la variable etiqueta */}
        {presentacion}
        {/* Imprime lo que hay dentro de la funcion */}
        {imprimirApodo(apodo,edad)}
      </header>
      <section className='componentes'>
        {/* Imprime todo lo que hay dentro de componente */}
        <MiComponente/>
      </section>
    </div>
  );
}
export default App;

```
### 1.2.2. Componente
```js
import React from 'react'
// Definir una clase
class MiComponente extends React.Component{
  // Crear el metodo Render, la vista que se mostrara
  // Aqui dentro estara el jsx
    render(){
        return (
            // Esto es lo que mostrara el componente
            <h1>Hola, soy el componente llamado: MiComponente</h1>
        )
    }
}
// Exportarlo para poder usarlo en otro lado
export default MiComponente
```
# 2. React(Ts)
## 2.1. Inicio
- Instalar
```console
npm install -g create-react-app
```
- crear un proyecto
```console
npx create-react-app my-app --template typescript
```
- Ingresar en la carpeta
```console
cd my-app
```
- Inicializar el remoto git
```console
git init
```
- Agregar al repositorio
```console
https://github.com/xixay/react-frontend-repositorio
```
- Agregar el cambio a subir
```console
git add .
```
- Comitear para subir
```console
git commit -m "Inicializando React"
```
- Subir los cambios a la rama master
```console
git push -u origin master
```
- Borrar la relacion remota
  - ver archivos ocultos
  ```console
  ls -a
  ```
  - borrar el git
  ```console
  rm -rf .git
  ```
  - subir un nivel
  ```console
  cd ..
  ```
  - borrar el proyecto para evitar choque al cambiar de rama
  ```console
  rm -rf my-app
  ```
  - ver si hay actualizaciones o cambios
  ```console
  git fetch
  ```
  - cambiar a la rama master porque ahi esta el proyecto subido
  ```console
  git checkout master
  ```
  - instalar los paquetes faltantes (node_modules)
  ```console
  npm install
  ```
- Iniciar
```console
npm start
```
## 2.2. Preparativos
### 2.2.1. Ir a index.html y modificar
- Borrar
```html
<!--manifest.json pro …https://developers.google.com/...-->
    <link rel="manifest" href="%PUBLIC_... />
    <!--Notice the use …`npm run build`.-->
    <!--This HTML file …`npm run build` or `yarn build`.-->

```
- Cambiar el titulo para la pestaña
```html
<head><title>Registro de farmacia</title></head>
```
- Borrar archivos innecesarios
  - package-lock.json
  - App.cssindex.css
  - App.test.tsx
  - logo.svg
  - react-app-env.d.ts
  - reportWebVitals.ts
  - setupTest.ts
### 2.2.2. Ir a index.tsx y modificar
- Borrar biblotecas y otros
```tsx
import './index.css';
import reportWebVitals from './reportWebVitals';
// If you …more: https://bit.ly/CRA-vitals
reportWebVitals();
```
- Modificar
```tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import {App} from './App';
const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

```
### 2.2.3. Crear rutas
- Instalar
```console
npm install react-router-dom
```
- Estructura de carpetas
  - src
    - pages (solamente debe contener index.tsx)
    - routes (solamente debe contener index.tsx)
    - shared (Las Carpetas vacias deben tener index.ts  con lo siguiente: export {};)
      - components (.......................................... index.ts : export {};)
      - contexts (.......................................... index.ts : export {};)
      - environment (.......................................... index.ts : export {};)
      - hooks (.......................................... index.ts : export {};)
      - layouts (.......................................... index.ts : export {};)
      - services (.......................................... index.ts : export {};)
        - api (.......................................... index.ts : export {};)
      - themes (.......................................... index.ts : export {};)
- Ir a routes y crear el archivo index.tsx
```tsx
import {Routes, Route, Navigate} from 'react-router-dom'
export const AppRoutes = () => {
return (
 <Routes>
   {/* Ruta por defecto */}
   <Route path='/' element={<p>Paǵina inicial</p>}/>
   {/* Ruta hacia la pagina inicial */}
   <Route path='/pagina-inicial' element={<p>Paǵina inicial</p>}/>
   {/* Si se coloca cualquier ruta incorrecta, redirecciona a la pagina inicial */}
   <Route path='*' element={<Navigate to="/pagina-inicial"/>}/>
        </Routes>
 );
}

``` 
### 2.2.4. Aplicacion principal App.tsx
- Borrar biblioteca innecesaria en App.tsx
```tsx
import './index.css'; importación del logo y css, y React// ya no existen
```
- Modificar
```tsx
export const App = () =>{
  return (
    <div className="App"> 
    </div>
  );
}
export default App;

```
- Agregar bibliotecas y rutas
```tsx
import { BrowserRouter } from "react-router-dom";
import { AppRoutes } from "./routes";// llama a index.tsx
export const App = () =>{
  return (
    <BrowserRouter>// Cambia div por BrowserRouter
      <AppRoutes/>
    </BrowserRouter>
  );
}
export default App;
```
# 3. React(Mui)
## 3.1. Inicio
- Instalar en un proyecto react inicial
```console
npm install @mui/material @emotion/react @emotion/styled
```
- instalar iconos
```console
npm install @mui/icons-material
```
## 3.2. Agregar el tipo de fuente
- Ir a index.html
```html
<title>React App</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>
```
## 3.3. BOTON
- Por ejemplo en routes/index.tsx
```tsx
import {Routes, Route, Navigate} from 'react-router-dom'
import Button from '@mui/material/Button'
export const AppRoutes = () => {
return (
 <Routes>
   {/* Agregar el boton */}
   <Route path='/' element={<Button variant="contained" color="warning">Página Inicial</Button>}/>//defe
   <Route path='/pagina-inicial' element={<Button variant="contained" color="success">Página Inicial              
</Button>}/>//pagin inicial
   <Route path='*' element={<Navigate to="/pagina-inicial"/>}/>//cualquier ruta
        </Routes>
 );
}

```
## 3.4. Crear componente en proyecto base react mui IMANOL
- Usar el codigo base de abajo, llamarlo ejm(FormCheckbox.tsx), ubicado common/components/ui/form
```tsx
import TextField from '@mui/material/TextField'
import { Controller } from 'react-hook-form'
import Typography from '@mui/material/Typography'
import { RegisterOptions } from 'react-hook-form/dist/types/validator'
import { InputProps as StandardInputProps } from '@mui/material/Input/Input'
import { FormHelperText, IconButton, InputAdornment } from '@mui/material'
import ClearOutlined from '@mui/icons-material/ClearOutlined'
import { Variant } from '@mui/material/styles/createTypography'
import { InputHTMLAttributes, useState } from 'react'
import Visibility from '@mui/icons-material/Visibility'
import VisibilityOff from '@mui/icons-material/VisibilityOff'

export interface FormInputTextProps {
  id: string
  name: string
  control: any // TODO: Cambiar a tipo TFieldValues con tipo genérico
  label: string
  size?: 'small' | 'medium'
  type?: InputHTMLAttributes<unknown>['type']
  rules?: RegisterOptions
  disabled?: boolean
  onChange?: StandardInputProps['onChange']
  onEnter?: () => void
  onClear?: () => void
  variant?: 'standard' | 'outlined' | 'filled'
  rows?: number
  multiline?: boolean
  bgcolor?: string
  labelVariant?: Variant
  placeholder?: string
}

export const FormCheckbox = ({
  id,
  name,
  control,
  label,
  size = 'small',
  type,
  rules,
  disabled,
  onChange,
  onEnter,
  onClear,
  variant,
  rows = 1,
  multiline = false,
  bgcolor,
  labelVariant = 'subtitle2',
  placeholder = '',
}: FormInputTextProps) => {
  // Add these variables to your component to track the state
  const [showPassword, setShowPassword] = useState(false)
  const handleClickShowPassword = () => setShowPassword(!showPassword)
  const handleMouseDownPassword = () => setShowPassword(!showPassword)

  return (
    <div>
      <Typography
        variant={labelVariant}
        sx={{ fontWeight: 'fontWeightMedium' }}
      >
        {label}
      </Typography>
      <Controller
        name={name}
        control={control}
        render={({ field, fieldState: { error } }) => (
          <>
          //******Aqui pegar un componente de mui***************
            <Checkbox
              checked={!!field.value}
              onChange={field.onChange}
            />
          //****************************************************
            {!!error && <FormHelperText error>{error?.message}</FormHelperText>}
          </>
        )}
        defaultValue={''}
        rules={rules}
      />
    </div>
  )
}

```
- importar desde module/admin/openvox/ui
```tsx
import { FormCheckbox } from '../../../../common/components/ui/form/FormCheckbox'
```
- Agregarlo en el return
```tsx
<FormCheckbox id ='https' control={control} name='https' label='https'></FormCheckbox>
```

[<< INDICE](../../README.md)