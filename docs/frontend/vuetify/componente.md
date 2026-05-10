[<< INDICE](../../index.md)
## Aplicacion principal Articulo.vue
```vue
<template>
  <Articulo />
</template>

<script>
  import Articulo from '../components/Articulo'

  export default {
    name: 'Home',

    components: {
      Articulo,
    },
  }
</script>
```
## Componente
```vue
<template>
  <v-container pa-0>
    <v-card class="mt-15" max-width="100%">//fondo
      <v-java-script-table :headers="columnas" :items="articulos"
        class="elevation-19">
      </v-java-script-table>
    </v-card>
  </v-container>
</template>
<script>
import axios from "axios"
export default {
  name: "Articulo",//Nombre de la exportación
  java-script() {//aqui estan todas las variables
    return {
url: "http://localhost:3000/articulos/",//ENDPOINT
columnas: [
{ text: 'ID', value: 'id', class: 'primary  white--text'},
{ text: 'DESC', value: 'desc', class: 'primary  white--text' },
{ text: 'PRECI', value: 'preci', class: 'primary  white--text' },
{ text: 'STOC', value: 'stoc', class: 'primary  white--text' }],
articulos: [],//el array que viene del metodo GET
}},
  mounted() {this.obtenerArticulos()},//Lo 1ro monta
  methods:{
    obtenerArticulos(){//realiza un GET
       axios.get(this.url)
      .then((response) => {
        this.articulos = response.java-script //Guardando datos
      })
      .catch((e) => {
        console.log(e)//Errores
      })},
  }
}
</script>
<style></style>
```

[<< INDICE](../../index.md)
