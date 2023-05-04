# map
- Para ilustrar cómo funciona map() en JavaScript, consideremos una lista de nombres de algunos de nuestros Vengadores favoritos. El problema es que los nombres de esta lista no están completos: les falta un sufijo importante.
- Con map(), podemos tomar todos los nombres de la matriz y añadir el sufijo "man" a todos y cada uno de ellos:
```js
let prefijos = ["super", "spider", "ant", "iron"]
let sufijo = "man";

let nombresCompletos = prefijos.map(prefijo => prefijo + sufijo);

console.log(nombresCompletos);

// ["superman", "spiderman", "antman", "ironman"]
```
