# vuetify-repositorio
 Comience con Vuetify, el marco Vue.js más popular del mundo para crear aplicaciones ricas en funciones y ultrarrápidas
## instalando Vue
1. Crear proy
```console
vue create my-app
❯ Manually select features 
```
2. Seleccionar las rutas
```console
>Router(space)
❯2.x
Use history mode for router? (Requires proper server setup for index fallback in production) (Y/n) y
❯ ESLint with error prevention only
❯Lint on save
❯ In dedicated config files
 Save this as a preset for future projects? (y/N) Y
  Save preset as: xx
```
3. Correr el servidor
```console
cd my-app
npm run serve
```
## instalando Vuetify
1. Ahora colocar en el archivo slintrc.js
```JSON
// <projectRoot>/.eslintrc.js
module.exports = {
  ⋮
  rules: {
    'vue/multi-word-component-names': 0,
  },
}
```
2. Ahora que tiene un proyecto instanciado, puede agregar Vue CLI package utilizando el CLI.
```console
vue add vuetify
> Still proceed? (y/N) Y
❯ Default (recommended)
```
3. Corriendo
```console
npm run serve
```
4. Si muestra un error en el primer carácter de cualquier lectura de archivo colocar
```JSON
"parser": '@babel/eslint-parser',
"parserOptions": {
    "requireConfigFile": false,
}
```
 ## Referencias
 1. https://cli.vuejs.org/#getting-started
 2. https://vuetifyjs.com/en/getting-started/installation/
 3. https://stackoverflow.com/questions/70346829/eslint-vue-multiword-components
 4. https://stackoverflow.com/questions/71271760/parsing-error-no-babel-config-file-detected-when-ide-not-open-at-vue-projects