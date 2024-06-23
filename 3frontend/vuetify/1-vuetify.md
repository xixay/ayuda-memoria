[<< INDICE](../../README.md)
- [1. vue-vuetify-axios-repositorio](#1-vue-vuetify-axios-repositorio)
  - [1.1. instalando Vue](#11-instalando-vue)
    - [1.1.1. Crear proyecto](#111-crear-proyecto)
    - [1.1.2. Seleccionar las rutas](#112-seleccionar-las-rutas)
    - [1.1.3. Correr el servidor](#113-correr-el-servidor)
  - [1.2. instalando Vuetify](#12-instalando-vuetify)
    - [1.2.1. Instalar por terminal](#121-instalar-por-terminal)
    - [1.2.2. Agregar vuetify](#122-agregar-vuetify)
    - [1.2.3. Corriendo](#123-corriendo)
    - [1.2.4. Error 1er caracter](#124-error-1er-caracter)
  - [1.3. Instalar Axios](#13-instalar-axios)
  - [1.4. Preparacion inicial](#14-preparacion-inicial)
    - [1.4.1. Preparar la vista de portada](#141-preparar-la-vista-de-portada)
    - [1.4.2. Creando el componente Articulo](#142-creando-el-componente-articulo)
    - [1.4.3. Creando la vista Articulo](#143-creando-la-vista-articulo)
    - [1.4.4. Añadir la vista Articulo a las rutas](#144-añadir-la-vista-articulo-a-las-rutas)
  - [1.5. Rutas apis CRUD](#15-rutas-apis-crud)
    - [1.5.1. Creando la data-tables](#151-creando-la-data-tables)
    - [1.5.2. Agregando el metodo obtener articulos](#152-agregando-el-metodo-obtener-articulos)
    - [1.5.3. Creando el toolbar](#153-creando-el-toolbar)
    - [1.5.4. Creando el modal para agregar nuevo articulo](#154-creando-el-modal-para-agregar-nuevo-articulo)
    - [1.5.5. Agregando el metodo para crear articulo](#155-agregando-el-metodo-para-crear-articulo)
    - [1.5.6. Mejorando el servicio de creacion, agregando el registro](#156-mejorando-el-servicio-de-creacion-agregando-el-registro)
    - [1.5.7. Agregar el metodo de reseteo de datos del modal](#157-agregar-el-metodo-de-reseteo-de-datos-del-modal)
    - [1.5.8. Agregar el metodo para usar el mismo modal, tanto para editar y crear](#158-agregar-el-metodo-para-usar-el-mismo-modal-tanto-para-editar-y-crear)
    - [1.5.9. Agregando el metodo editar articulo](#159-agregando-el-metodo-editar-articulo)
    - [1.5.10. Agregando el metodo eliminar articulo](#1510-agregando-el-metodo-eliminar-articulo)
    - [1.5.11. Agregando el metodo para ver un articulo](#1511-agregando-el-metodo-para-ver-un-articulo)
    - [1.5.12. Agregar menu lateral](#1512-agregar-menu-lateral)
  - [1.6. Referencias](#16-referencias)

# 1. vue-vuetify-axios-repositorio
 Combinar la librería Axios, que facilita la realización de peticiones Ajax junto con Vuetify, una popular librería para VueJs para realizar Apps con estética Material Design
 ***
## 1.1. instalando Vue
```console
npm install -g @vue/cli 
```
### 1.1.1. Crear proyecto
```console
vue create my-app
❯ Manually select features 
```
### 1.1.2. Seleccionar las rutas
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
### 1.1.3. Correr el servidor
```console
cd my-app
npm run serve
```
## 1.2. instalando Vuetify
### 1.2.1. Instalar por terminal
```console
vue add vuetify-cli
```
### 1.2.2. Agregar vuetify
- Ahora que tiene un proyecto instanciado, puede agregar Vue CLI package utilizando el CLI.
```console
vue add vuetify
> Still proceed? (y/N) Y
❯ Default (recommended)
```
### 1.2.3. Corriendo
```console
npm run serve
```
### 1.2.4. Error 1er caracter
- Si muestra un error en el primer carácter de cualquier lectura de archivo colocar
```JSON
"parser": '@babel/eslint-parser',
"parserOptions": {
    "requireConfigFile": false,
}
```
## 1.3. Instalar Axios
- Dentro de la carpeta my-app, instalar la dependencia
```console
npm install -D axios
```
## 1.4. Preparacion inicial
### 1.4.1. Preparar la vista de portada
- La vista HomeView.vue llama a el componente HelloWorld.vue, ir a ese componente y cambiar de nombre a Portada.vue
- Ir a HomeView.vue y importar el componente Portada.vue en lugar de HelloWorld.vue
```vue
<template>
  <!-- Llama al componente -->
  <portada/>
</template>

<script>
//Llama al componente
  import Portada from '../components/Portada'

  export default {
    name: 'Home',
    //Instancia el componente
    components: {
      Portada,
    },
  }
</script>
```
- Cambiar el bar, para ello ir a la aplicacion principal App.vue
```vue
<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <v-spacer></v-spacer>
      <v-btn
        href="https://github.com/vuetifyjs/vuetify/releases/latest"
        target="_blank"
        text
      >
        <span class="mr-2">Ir a Articulos</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn>
    </v-app-bar>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    //
  }),
};
</script>

```
### 1.4.2. Creando el componente Articulo
- Ir a la carpeta my-app/src/components, y crear el componente Articulo.vue que se visualizara al inicio de la app
```vue
<template>
    <v-container>
      Articulos
    </v-container>
  </template>
  
  <script>
  
  </script>
  
  <style>
  
  </style>       
```
### 1.4.3. Creando la vista Articulo
- En la carpeta views, crear el archivo ArticuloView.vue, y añadir el componente articulo
```vue
<template>
  <!-- Llama al componente -->
  <articulo/>
</template>

<script>
//Llama al componente
  import Articulo from '../components/Articulo.vue'

  export default {
    name: 'ArticuloView',// ****La vista y el componente no deben tener el mismo name
    //Instancia el componente
    components: {
      Articulo,
    },
  }
</script>
```
### 1.4.4. Añadir la vista Articulo a las rutas
-Ir a la carpeta my-app/src/router/index.js, y añadir la vista Articulo.vue, y agregar su ruta
```js
import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',//http://localhost:8080/
    name: 'home',
    component: HomeView
  },
  {
    path: '/articulos',//http://localhost:8080/articulos
    name: 'articulos',
    component: function () {
      return import(/* webpackChunkName: "about" */ '../views/ArticuloView.vue')
    }
  },
  {
    path: '/about',//http://localhost:8080/fdfdffdfdfd
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: function () {
      return import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
    }
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
```
## 1.5. Rutas apis CRUD
### 1.5.1. Creando la data-tables
1. En el componente Articulo.vue, originalmente se tiene asi:
```vue
<template>
  <v-container>
    Articulos
  </v-container>
</template>

<script>

</script>

<style>

</style>
```
2. Agregando el v-card, el cual sera el lienzo de la tabla, dentro de container:

```vue
<template>
  <v-container pa-0>
    <v-card class="mt-15" max-width="100%">
    </v-card>
  </v-container>
</template>
```
3. Agregar la tabla dentro del v-card
```vue
<template>
  <v-container pa-0>
    <v-card class="mt-15" max-width="100%">
      <v-data-table
        :headers="columnas"//Aqui es el titulo de las columnas
        :items="articulos"//los datos de las columnas
        class="elevation-19"//elevacion de la tabla, hoja de estilo
      >
      </v-data-table>
    </v-card>
  </v-container>
</template>
```
4. En el script importar la dependencia Axios
```js
<script>
import axios from "axios"
</script>
```
5. Agregar el export default que enviara la informacion al home
```js
<script>
export default {
  name: "Articulo",//Nombre de la exportación
}
</script>
```
6. Agregar el data, donde estaran todas las variables
```js
<script>
export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
    }
  },
}
</script>
```
7. Agregar las variables o datos que necesita el data-tables
```js
<script>
export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
    }
  },
}
</script>
```
8. se debe agregar el mounted el cual se iniciar antes que todo
```js
<script>
import axios from "axios"

export default {

  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
  },
}
</script>
```
### 1.5.2. Agregando el metodo obtener articulos
1. En los methods, crearemos el metodo obtener articulos, que llamara al metodo GET, que pedira que el backend le de informacion de la base de datos
```js
methods: {
    obtenerArticulos(){
      axios.get(this.url).then((response) => {//relaiza un GET para obtener la información
        console.log(response.data)//muestra por consola la información
        this.articulos = response.data//Guardando los datos que llegaron del backend
      })
      .catch(e => {
      // Capturamos los errores
      console.log(e)
      })
    }
}
```
2. En el mountend llamaremos a el metodo obtenerArticulos
```js
<script>
import axios from "axios"

export default {
  mounted() {//Lo 1ro que se monta al iniciar el componente
     this.obtenerArticulos()
  },
}
</script>
```
3. Articulo final queda:
```vue
<template>
    <v-container>
        <v-card class="mt-15" max-width="100%">
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
            </v-data-table>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
      obtenerArticulos(){
        axios.get(this.url).then((response) => {//relaiza un GET para obtener la información
          console.log(response.data)//muestra por consola la información
          this.articulos = response.data//Guardando los datos que llegaron del backend
        })
        .catch(e => {
        // Capturamos los errores
        console.log(e)
        })
      }
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.3. Creando el toolbar
1. Agregar un v-card arriba del v-card que tiene la tabla, quitar al container el padding, poner como margen de arriba 1
```vue
<template>
  <v-container pa-0>
    <!-- card del fondo -->
    <v-card class="mt-1" max-width="100%">
      <!-- card con toolbar -->
      <v-card flat height="50px" tile>
        <!--Aqui vendra el toolbar-->
      </v-card>
      <!-- tabla -->
      <v-data-table>
      </v-data-table>
    </v-card>
  </v-container>
  </template>
```
2. Agregar el toolbar con la propiedad dense(ocupara el espacio del v-card)
```js
  <!-- card con toolbar -->
  <v-card flat height="50px" tile>
    <v-toolbar dense>
      <!-- elementos del toolbar -->
    </v-toolbar>
  </v-card>
```
3. agregando icono navegador al toolbar 
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <v-app-bar-nav-icon></v-app-bar-nav-icon>
  </v-toolbar>
```
4. agregando titulo al toolbar
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <!-- titulo del toolbar -->
    <v-toolbar-title>Mis Articulos</v-toolbar-title>
  </v-toolbar>
```
5.  espacio entre titulo y boton que se agregara
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <!-- titulo del toolbar -->
    <!-- espacio sobrante -->
      <v-spacer></v-spacer>
  </v-toolbar>
``` 
6.  agregar boton que adiciona articulos
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <!-- titulo del toolbar -->
    <!-- espacio sobrante -->
     <!-- boton que adiciona articulos -->
      <v-btn icon>
        <v-icon>mdi-plus</v-icon>
      </v-btn>
  </v-toolbar>
```
### 1.5.4. Creando el modal para agregar nuevo articulo
1. Agregar el v-dialog, debajo de la tabla, pero se mostrara encima
```js
    <!-- Modal de nuevo articulo -->
    <v-dialog v-model="modalFormArticulo"
      width="500">
      <!-- Card que mostrara el modal -->
      <v-card>
        <!-- titulo card -->
        <!-- contenido del card -->
        <!-- Crea una linea divisora -->
        <!-- Los botones de accion -->
      </v-card>
    </v-dialog>
```
2. Titulo del modal
```js
  <v-card>
    <!-- h5=tamaño texto, color de relleno=primary, color texto=blanco -->
    <v-card-title class="text-h5 primary white--text">
      Nuevo Articulo
    </v-card-title>
  </v-card>
```
3. Agregando un formulario al contenido
```js
  <v-card-text>
    <v-container>
      <v-row>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            label="Descripción"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            label="Precio"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            label="Stock"
          ></v-text-field>
        </v-col>
      </v-row>
    </v-container>
  </v-card-text>

```
4. Agregando linea divisora 
```vue
<v-divider></v-divider>
```
5. Botones de accion del modal
```js
  <v-card-actions>
    <!-- Espacio -->
    <v-spacer></v-spacer>
    <!-- boton de cerrar -->
    <v-btn color="primary" text @click="modalFormArticulo = false">
      Cerrar
    </v-btn>
    <!-- boton de agregar -->
    <v-btn color="primary" text @click="modalFormArticulo = false">
      Agregar
    </v-btn>
  </v-card-actions>
```
6. Agregar la variable que representa a el modal en data
- Eso depende del nombre que se dio con v-model
- Debe estar en falso para ocultarse
```js
 data() {
    //aqui estaran instanciadas todas las variables
    return {
      // otras variables
      modalFormArticulo: false,//ocultar el modal
    }
  },
```
### 1.5.5. Agregando el metodo para crear articulo
1. En el toolbar agregar el @click que pondra en true el modal para mostrarlo
```js
  <v-toolbar dense>
    <!-- otros -->
    <!-- boton que adiciona articulos -->
    <v-btn icon @click="modalFormArticulo = true">
      <v-icon>mdi-plus</v-icon>
    </v-btn>
  </v-toolbar>
```
2. Inicializar en el data las variables que se utilizaran
```js
  data() {
    //aqui estaran instanciadas todas las variables
    return {
      // otras variables
      edtDescripcion: "",
      edtPrecio:0,
      edtStock:0,
    }
  },
```
3. Colocar las variables en el formulario
```js
    <v-container>
      <v-row>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            v-model="edtDescripcion"
            label="Descripción"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            v-model="edtPrecio"
            label="Precio"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            v-model="edtStock"
            label="Stock"
          ></v-text-field>
        </v-col>
      </v-row>
    </v-container>
```
4. Agregar la accion que adiciona el articulo en el modal
   - Agregar el metodo en el boton
```js
    <!-- acciones del card -->
    <v-card-actions>
      <!-- Espacio -->
      <v-spacer></v-spacer>
      <!-- boton de cerrar -->
      <v-btn color="primary" text @click="modalFormArticulo = false">
        Cerrar
      </v-btn>
      <!-- boton de agregar -->
      <v-btn color="primary" text @click="crearArticulo">
        Agregar
      </v-btn>
    </v-card-actions>
```
5. Agregar el metodo crearArticulo() en el script, debajo del metodo obtenerArticulos
```js
  methods:{
    crearArticulo(){
      <!-- Aqui las instrucciones -->
    }
  }
```
6. Agregar el metodo post para agregar articulo
```js
  crearArticulo(){
  //realiza un POST que envia información y obtiene información
  axios.post(this.url, {
      "descripcion": this.edtDescripcion,
      "precio": this.edtPrecio,
      "stock": this.edtStock
    })
    .then((response) => {
      console.log(response)
      this.modalFormArticulo = false//ocultar al enviar
      this.obtenerArticulos()
    })
    .catch((e) => {
      console.log(e)
    })
  }
```
7. El metodo para agregar articulo al final queda
```vue
<template>
    <v-container pa-0>
        <v-card class="mt-1" max-width="100%">
            <!-- card con toolbar -->
            <v-card flat height="50px" tile>
              <!--Aqui vendra el toolbar-->
              <v-toolbar dense>
                <!-- elementos del toolbar -->
                    <!-- app-bar -->
                <v-app-bar-nav-icon></v-app-bar-nav-icon>
                    <!-- titulo del toolbar -->
                <v-toolbar-title>Mis Articulos</v-toolbar-title>
                    <!-- espacio sobrante -->
                    <v-spacer></v-spacer>
                    <!-- boton que adiciona articulos -->
                    <v-btn icon @click="modalFormArticulo = true">
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
              </v-toolbar>
            </v-card>
            <!-- tabla -->
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
            </v-data-table>
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  Nuevo Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="edtDescripcion"
                          label="Descripción"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="edtPrecio"
                          label="Precio"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="edtStock"
                          label="Stock"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="modalFormArticulo = false">
                    Cerrar
                  </v-btn>
                  <!-- boton de agregar -->
                  <v-btn color="primary" text @click="crearArticulo">
                    Agregar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
      modalFormArticulo: false,//ocultar el modal
      edtDescripcion: "",
      edtPrecio:0,
      edtStock:0,
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
    obtenerArticulos(){
      ...
    },
    crearArticulo(){
       //realiza un POST que envia información y obtiene información
      axios.post(this.url, {
        "descripcion": this.edtDescripcion,
        "precio": this.edtPrecio,
        "stock": this.edtStock
      })
      .then((response) => {
        console.log(response)
        this.modalFormArticulo = false//ocultar al enviar
        this.obtenerArticulos()
      })
      .catch((e) => {
        console.log(e)
      })
    },
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.6. Mejorando el servicio de creacion, agregando el registro
1. Agregar la variable registro en data
```js
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
      ....
      //eliminar las variables innnecesarias edtDescripcion,edtPrecio y edtStock
      registro:{},//variable que usara en el modal
    }
  },
```
2. Modificar el modal para que guarde en el objeto registro, para ello cambiar el v-model, por value y change
```js
             <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  Nuevo Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.descripcion" 
                          @change="(v) => (registro.descripcion = v)"
                          label="Descripción"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.precio" 
                          @change="(v) => (registro.precio = v)"
                          label="Precio"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.stock" 
                          @change="(v) => (registro.stock = v)"
                          label="Stock"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="modalFormArticulo = false">
                    Cerrar
                  </v-btn>
                  <!-- boton de agregar -->
                  <v-btn color="primary" text @click="crearArticulo">
                    Agregar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
```
3. Cambiar el metodo de creación
```js
    crearArticulo(){
      //realiza un POST que envia información y obtiene información
      // el modal devuelve de tipo string, por ello convertir a lo que es
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      axios.post(this.url, this.registro)
      .then((response) => {
        console.log(response)
        this.modalFormArticulo = false//ocultar al enviar
        this.obtenerArticulos()
      })
      .catch((e) => {
        console.log(e)
      })
    },
```
### 1.5.7. Agregar el metodo de reseteo de datos del modal
1. Cambiar el container por un form, y agregar la referencia del formulario
```js
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  Nuevo Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-form :v-model="true" ref="formDialog" lazy-validation>
                    <v-row>
                      ...
                    </v-row>
                  </v-form>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  ...
                </v-card-actions>
              </v-card>
            </v-dialog>
```
2. Agregar en methods
```js
cancelDialog(){
  this.registro={ }
  this.$refs.formDialog.reset()
  this.modalFormArticulo = false//ocultar al enviar
  this.obtenerArticulos()
}
```
3. Agregar al metodo crearArticulo, para que resete los datos, y colocar la referencia del formulario, y quitar el obtener articulos, ya que esta en el cancelDialog
```js
    crearArticulo(){
      //realiza un POST que envia información y obtiene información
      // el modal devuelve de tipo string, por ello convertir a lo que es
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      if (this.$refs.formDialog.validate()) {
        axios.post(this.url, this.registro)
        .then((response) => {
          console.log(response)
          this.cancelDialog()
        })
        .catch((e) => {
          console.log(e)
        })
      } else{
        this.$toast.error(this.$t('sispoa.requeridos')) 
      }
    },
```
4. Agregar el metodo de reseteo al cerrar el modal
```js
<!-- Los botones de accion -->
<v-card-actions>
  <!-- Espacio -->
  <v-spacer></v-spacer>
  <!-- boton de agregar -->

  <!-- boton de modificar -->

  <!-- boton de cerrar -->
  <v-btn color="primary" text @click="cancelDialog">
    Cerrar
  </v-btn>
</v-card-actions>
```
### 1.5.8. Agregar el metodo para usar el mismo modal, tanto para editar y crear
1. Agregar la bandera que mostrara el boton de crear cuando tenga que crear y editar cuando tenga que editar
```js
data() {
    //aqui estaran instanciadas todas las variables
    return {
      
      banderaDatos:0, //bandera de boton crear o editar

    }
  },
```
2. Crear el metodo para abrir el modal
```js
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      }
    },
```
3. Modificar el titulo del modal
```js
<v-card-title class="text-h5 primary white--text">
  <span v-if="banderaDatos==1">Nuevo Articulo</span>
  <span v-if="banderaDatos==2">Modificar Articulo</span>
</v-card-title>
```
4. Cambiar la accion del boton que abre el modal para crear el articulo, que se encuentra en el toolbar
```js
<!--Aqui vendra el toolbar-->
<v-toolbar dense>
    ...
    <!-- boton que adiciona articulos -->
    <v-btn icon @click="openModal(1)">
    <v-icon>mdi-plus</v-icon>
  </v-btn>
</v-toolbar>
```
5. Si la bandera es 1 mostrar el boton de crear
```js
<v-card-actions>
  <!-- Espacio -->
  <v-spacer></v-spacer>
  <!-- boton de agregar -->
  <v-btn v-if="banderaDatos==1" color="primary" text @click="crearArticulo">
    Agregar
  </v-btn>
    <!-- boton de modificar -->
  <v-btn v-if="banderaDatos==2" color="primary" text @click="modificarArticulo">
    Modificar
  </v-btn>
...
</v-card-actions>
```
### 1.5.9. Agregando el metodo editar articulo
1. Agregar la columna de accion para editar por fila, en el headers, que se encuentra en el script en data
```js
data() {
    //aqui estaran instanciadas todas las variables
    return {
      
      columnas: [
        
        { text: 'Actions', value: 'actions', class: "primary  white--text", sortable: false },
      ], //titulos de las columnas

    }
  },
```
2. Agregar el boton para editar dentro del data-table, en un template
```js
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template>
      <!-- Boton de editar -->
      <v-icon
        small
        class="mr-2"
      >
        mdi-pencil
      </v-icon>
    </template>
  </v-data-table>
```
3. Darle una accion a el boton editar, para ello con el v-slot:[`item.actions`]="{ item }" mandarle tona la información de la fila, y enviar toda esa informacion al metodo openModal(2,item)
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template v-slot:[`item.actions`]="{ item }">
      <!-- Boton de editar -->
      <v-icon
        small
        class="mr-2"
        @click="openModal(2,item)"
      >
        mdi-pencil
      </v-icon>
    </template>
  </v-data-table>
```
4. Crear el metodo para modificar el articulo
```js
    modificarArticulo(){
      //realiza un PUT que envia información y obtiene información
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      if (this.$refs.formDialog.validate()) {
        axios.put(`${this.url}/${this.registro.id}`, this.registro)
        .then((response) => {
          console.log(response)
          this.cancelDialog()
        })
        .catch((e) => {
          console.log(e)
        })
      } else{
        this.$toast.error(this.$t('sispoa.requeridos')) 
      }
    },
```
5. La aplicación final queda
```vue
<template>
    <v-container pa-0>
        <v-card class="mt-1" max-width="100%">
            <!-- card con toolbar -->
            <v-card flat height="50px" tile>
              <!--Aqui vendra el toolbar-->
              <v-toolbar dense>
                ...
              </v-toolbar>
            </v-card>
            <!-- tabla -->
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
              <template v-slot:[`item.actions`]="{ item }">
                <!-- Boton de editar -->
                <v-icon
                  small
                  class="mr-2"
                  @click="openModal(2,item)"
                >
                  mdi-pencil
                </v-icon>
              </template>
            </v-data-table>
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  <span v-if="banderaDatos==1">Nuevo Articulo</span>
                  <span v-if="banderaDatos==2">Modificar Articulo</span>
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-form :v-model="true" ref="formDialog" lazy-validation>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.descripcion" 
                          @change="(v) => (registro.descripcion = v)"
                          label="Descripción"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.precio" 
                          @change="(v) => (registro.precio = v)"
                          label="Precio"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.stock" 
                          @change="(v) => (registro.stock = v)"
                          label="Stock"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-form>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de agregar -->
                  <v-btn v-if="banderaDatos==1" color="primary" text @click="crearArticulo">
                    Agregar
                  </v-btn>
                  <!-- boton de modificar -->
                  <v-btn v-if="banderaDatos==2" color="primary" text @click="modificarArticulo">
                    Modificar
                  </v-btn>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="modalFormArticulo = false">
                    Cerrar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
      { text: 'Actions', value: 'actions', class: "primary  white--text", sortable: false },
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
      modalFormArticulo: false,//ocultar el modal
      registro:{},//variable que usara en el modal
      banderaDatos:0, //bandera de boton crear o editar
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
    obtenerArticulos(){
      ...
    },
    crearArticulo(){
      ...
    },
    modificarArticulo(){
      //realiza un PUT que envia información y obtiene información
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      if (this.$refs.formDialog.validate()) {
        axios.put(`${this.url}/${this.registro.id}`, this.registro)
        .then((response) => {
          console.log(response)
          this.cancelDialog()
        })
        .catch((e) => {
          console.log(e)
        })
      } else{
        this.$toast.error(this.$t('sispoa.requeridos')) 
      }
    },
    cancelDialog(){
      ...
    },
    openModal(bandera,item){
      this.modalFormArticulo=true
      if (bandera==1) {//para crear articulos
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.banderaDatos=2
        this.registro=item
      }
    },
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.10. Agregando el metodo eliminar articulo
1. Agregar los boton de borrar dentro del data-table, en el template
```js
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template>
      <!-- Boton de borrar -->
      <v-icon
        small
        class="mr-2"
      >
        mdi-delete
      </v-icon>
    </template>
  </v-data-table>
```
2. Darle una accion a el boton borrar, para ello con el v-slot:[item.actions]="{ item }" mandarle el id de la fila, y enviar toda esa informacion al metodo verModalBorrar(item)
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template v-slot:[`item.actions`]="{ item }">
      <!-- Boton de borrar -->
      <v-icon
        small
        class="mr-2"
        @click="openModal(3,item)"
      >
        mdi-delete
      </v-icon>
    </template>
  </v-data-table>
```
3. Crear la variable para mostrar o ocultar el modal
```js
  data() {//aqui estaran instanciadas todas las variables
    return {
      ...
      modalFormArticuloBorrar:false,
    }
  },
```
4. Crear el modal para borrar, para confirmar el borrado del articulo, despues del otro modal
```js
 <!-- Modal para borrar articulo -->
<v-dialog v-model="modalFormArticuloBorrar" width="500">
  <!-- Card que mostrara el modal -->
  <v-card>
    <!-- titulo card -->
    <!-- h5=tamaño texto, color de relleno=primary, color texto=blanco -->
    <v-card-title class="text-h5 primary white--text">
      Borrar Articulo
    </v-card-title>
    <!-- contenido del card -->
    <v-card-text>
      <v-alert>
        <span style="color: red;">Esta seguro que quiere borrar el articulo?</span>
      </v-alert>
    </v-card-text>
    <!-- Crea una linea divisora -->
    <v-divider></v-divider>
    <!-- acciones del card -->
    <v-card-actions>
      <!-- Espacio -->
      <v-spacer></v-spacer>
      <!-- boton de aceptar -->
      <v-btn color="primary" text @click="borrarArticulo">
        Aceptar
      </v-btn>
      <!-- boton de cerrar -->
      <v-btn color="primary" text @click="cancelDialog">
        Cerrar
      </v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
```
5. Agregar al metodo de reseteo, que oculte el modal de eliminar
```js
    cancelDialog(){
      ...
      if (this.$refs.formDialog) this.$refs.formDialog.reset()//para que no de error, pq quiere resetear un modal q no esta abierto
      this.modalFormArticuloBorrar = false
    },
```
6. En el metodo openModal(3,item), mostrar el modal para borrar, ademas recuperar el id de la fila
```js
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      } else if(bandera ==3){//para borrar articulos
        this.modalFormArticuloBorrar=true
        this.registro=item
      }
    },
```
7. Crear el metodo borrarArticulo(), que llamara a un metodo DELETE
```js
    borrarArticulo(){
      //realiza un DELETE que envia información y obtiene información
      //url=localhost:3000/articulos/:id
      axios.delete(`${this.url}/${this.registro.id}`)
      .then((response) => {
        console.log(response)
        this.cancelDialog()
      })
      .catch((e) => {
        console.log(e)
      })
    },
```
8. La aplicación final queda
```vue
<template>
    <v-container pa-0>
        <v-card class="mt-1" max-width="100%">
            <!-- card con toolbar -->
            <v-card flat height="50px" tile>
              ...
            </v-card>
            <!-- tabla -->
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
              <template v-slot:[`item.actions`]="{ item }">
                <!-- Boton de editar -->
                  ...
                <!-- Boton de borrar -->
                <v-icon
                  small
                  class="mr-2"
                  @click="openModal(3,item)"
                >
                  mdi-delete
                </v-icon>
              </template>
            </v-data-table>
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              ...
            </v-dialog>
            <!-- Modal para borrar articulo -->
            <v-dialog v-model="modalFormArticuloBorrar" width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <!-- h5=tamaño texto, color de relleno=primary, color texto=blanco -->
                <v-card-title class="text-h5 primary white--text">
                  Borrar Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-alert>
                    <span style="color: red;">Esta seguro que quiere borrar el articulo?</span>
                  </v-alert>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- acciones del card -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de aceptar -->
                  <v-btn color="primary" text @click="borrarArticulo">
                    Aceptar
                  </v-btn>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="cancelDialog">
                    Cerrar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
      ...
      modalFormArticuloBorrar:false,
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
    obtenerArticulos(){
      ...
    },
    crearArticulo(){
      ...
    },
    modificarArticulo(){
      ...
    },
    borrarArticulo(){
      //realiza un DELETE que envia información y obtiene información
      //url=localhost:3000/articulos/:id
      axios.delete(`${this.url}/${this.registro.id}`)
      .then((response) => {
        console.log(response)
        this.cancelDialog()
      })
      .catch((e) => {
        console.log(e)
      })
    },
    cancelDialog(){
      this.registro={ }
      if (this.$refs.formDialog) this.$refs.formDialog.reset()//para que no de error, pq quiere resetear un modal q no esta abierto
      this.modalFormArticulo = false//ocultar al enviar
      this.modalFormArticuloBorrar = false
      this.obtenerArticulos()
    },
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      } else if(bandera ==3){//para borrar articulos
        this.modalFormArticuloBorrar=true
        this.registro=item
      }
    },
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.11. Agregando el metodo para ver un articulo
1. Agregar los botones de accion dentro del data-table, en un template
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template>
      <!-- Boton de ver -->
      <v-icon
        small
        class="mr-2"
      >
        mdi-eye
      </v-icon>
    </template>
  </v-data-table>
```
2. Darle una accion a el boton ver, para ello con el v-slot:[`item.actions`]="{ item }" mandarle tona la información de la fila, y enviar toda esa informacion al metodo openModal(4,item)
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template v-slot:[`item.actions`]="{ item }">
      <!-- Boton de ver -->
      <v-icon
        small
        class="mr-2"
        @click="openModal(4,item)"
      >
        mdi-eye
      </v-icon>
    </template>
  </v-data-table>
```
3. Crear la variable  para que sea de solo lectura
```js
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
      ...
      banderaLectura:false,//variable para el modal de solo lectura
    }
  },
```
4. Antes de crear la funcion openModal(4,item), modificar el modal para mostrar solo datos de lectura, similar a el modal editar articulo
```js
    <!-- Modal de nuevo articulo -->
<v-dialog v-model="modalFormArticulo"
  width="500">
  <!-- Card que mostrara el modal -->
  <v-card>
    <!-- titulo card -->
    <v-card-title class="text-h5 primary white--text">
      ...
      <span v-if="banderaDatos==3">Mostrar Articulo</span>
    </v-card-title>
    <!-- contenido del card -->
    <v-card-text>
      <v-form :v-model="true" ref="formDialog" lazy-validation :readonly="banderaLectura">
        <v-row>
          ...
        </v-row>
      </v-form>
    </v-card-text>
    <!-- Crea una linea divisora -->
    <v-divider></v-divider>
    <!-- Los botones de accion -->
    <v-card-actions>
      ...
    </v-card-actions>
  </v-card>
</v-dialog>
```
5. Crear la función openModal(4,item), y mostrar el modal de solo lectura
```js
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      } else if(bandera ==3){//para borrar articulos
        this.modalFormArticuloBorrar=true
        this.registro=item
      } else if(bandera ==4){//para mostrar articulo
        this.modalFormArticulo=true
        this.banderaDatos=3
        this.registro=item
        this.banderaLectura=true
      }
    },
```
6. Modificar el metodo de reseteo
```js
   cancelDialog(){
      ...
      this.banderaLectura=false
    },
```
### 1.5.12. Agregar menu lateral
1. Ir a Articulo.vue y cambiar la posicion y el padding del container
```js
<template>
    <v-container style="position:absolute; padding: 0%;">
    </v-container>
</template>
```
2. Ir a Articulo.vue y quitar el boton del toolbar <v-app-bar-nav-icon></v-app-bar-nav-icon>
```js
  <v-toolbar dense>
    <!-- elementos del toolbar -->
    // quito el boton
  </v-toolbar>
```
3. Ir a App.vue y modificar el toolbar principal, para que el  boton abra y cierre un menu lateral, y el titulo del toolbar
```js
<v-app-bar
  app
  color="primary"
  dark
>
  <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
  <v-toolbar-title>Sistema de Inventario</v-toolbar-title>
    ...
</v-app-bar>
```
4. Agregar la variable que sera el switch del menu lateral
```js
  data: () => ({
    drawer: null,  
  }),
```
5. En App.vue agregar el menu lateral
```js
<v-app>
  <v-navigation-drawer> Menu Lateral</v-navigation-drawer>
</v-app>
```
6. Crear el array de objetos, que tendra el menu lateral
```js
  data: () => ({
    drawer: null,
    menus: [
      { title: 'Articulos', icon: 'mdi-clipboard-list-outline' },
    ],  
  }),
```
7. Construir el menu lateral
```js
    <v-navigation-drawer
      v-model="drawer"
      app
    >
      <!-- titulos -->
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            Inventario
          </v-list-item-title>
          <v-list-item-subtitle>
            Tienda
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
      <!-- linea divisora -->
      <v-divider></v-divider>
      <!-- lista de iconos -->
      <v-list
        dense
        nav
      >
        <v-list-item
          v-for="item in menus"
          :key="item.title"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
```
8. Agregar la accion colocando la referencia de la ruta en la lista
```js
  <v-list-item
    v-for="item in menus"
    :key="item.title"
    :href=item.ruta
  >
    <v-list-item-icon>
      <v-icon>{{ item.icon }}</v-icon>
    </v-list-item-icon>

    <v-list-item-content>
      <v-list-item-title>
        {{ item.title }}
      </v-list-item-title>
    </v-list-item-content>
  </v-list-item>
```
9. Agregar la ruta en el array de objetos
```js
  data: () => ({
    drawer: null,
    menus: [
      { title: 'Articulos', icon: 'mdi-clipboard-list-outline',ruta:"http://localhost:8080/articulos"},
    ],  
  }),
```
 ## 1.6. Referencias
 1. [Vue CLI](https://cli.vuejs.org/#getting-started)
 2. [Vuetify](https://vuetifyjs.com/en/getting-started/installation/)
 3. [ESLint Vue multiword components](https://stackoverflow.com/questions/70346829/eslint-vue-multiword-components)
  
[<< INDICE](../../README.md)
