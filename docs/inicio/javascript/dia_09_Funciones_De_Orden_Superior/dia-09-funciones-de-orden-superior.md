[<< INDICE](../../../index.md)

[<< Día 8](../javascript/dia-08-objetos.md) | [Día 10 >>](../javascript/dia-10-sets-y-maps.md)

- [Día 9](#día-9)
  - [Función De Orden Superior](#función-de-orden-superior)
    - [Callback](#callback)
    - [Retornar una función](#retornar-una-función)
    - [Configuración de tiempo](#configuración-de-tiempo)
      - [Configuración del intervalo mediante la función setInterval](#configuración-del-intervalo-mediante-la-función-setinterval)
      - [Configurar tiempo mediante un setTimeout](#configurar-tiempo-mediante-un-settimeout)
  - [Programación funcional](#programación-funcional)
    - [forEach](#foreach)
    - [map](#map)
    - [filter](#filter)
    - [reduce](#reduce)
    - [every](#every)
    - [find](#find)
    - [findIndex](#findindex)
    - [some](#some)
    - [sort](#sort)
      - [Ordenar los valores strings](#ordenar-los-valores-strings)
      - [Ordenar valores numéricos](#ordenar-valores-numéricos)
      - [Ordenar arrays de objetos](#ordenar-arrays-de-objetos)
  - [💻 Ejercicios](#-ejercicios)
    - [Ejercicios: Nivel 1](#ejercicios-nivel-1)
    - [Ejercicios: Nivel 2](#ejercicios-nivel-2)
    - [Ejercicios: Nivel 3](#ejercicios-nivel-3)

# Día 9

## Función De Orden Superior

Las funciones de orden superior son funciones que toman otra función como parámetro o retorna una función como valor. La función que se pasa como parámetro se llama callback.

### Callback

Un callback es una función que puede ser pasada como parámetro a otra función. Véase el ejemplo siguiente.

```js
// una función callback, el nombre de la función puede ser cualquier nombre
const callback = (n) => {
  return n ** 2
}
​
// función que toma otra función como callback
function cube(callback, n) {
  return callback(n) * n
}
​
console.log(cube(callback, 3))
```

### Retornar una función

Las funciones de orden superior retorna la función como valor
​

```js
// Función de orden superior que devuelve otra función
const higherOrder = (n) => {
  const doSomething = (m) => {
    const doWhatEver = (t) => {
      return 2 * n + 3 * m + t;
    };
    return doWhatEver;
  };
  return doSomething;
};
console.log(higherOrder(2)(3)(10));
```

Veamos dónde utilizamos las funciones de callback. Por ejemplo, el método _forEach_ utiliza callback.

```js
const numbers = [1, 2, 3, 4, 5];
const sumArray = (arr) => {
  let sum = 0;
  const callback = function (element) {
    sum += element;
  };
  arr.forEach(callback);
  return sum;
};
console.log(sumArray(numbers));
```

```sh
15
```

El ejemplo anterior puede simplificarse como el siguiente:

```js
const numbers = [1, 2, 3, 4]
​
const sumArray = arr => {
  let sum = 0
  arr.forEach(function(element) {
    sum += element
  })
  return sum

}
console.log(sumArray(numbers))
```

```sh
15
```

### Configuración de tiempo

En JavaScript podemos ejecutar algunas actividades en un determinado intervalo de tiempo o podemos programar (esperar) algún tiempo para ejecutar algunas actividades.

- setInterval
- setTimeout

#### Configuración del intervalo mediante la función setInterval

In JavaScript, we use setInterval higher order function to do some activity continuously with in some interval of time. El método global setInterval toma una función callback y una duración como parámetro. La duración está en milisegundos y la llamada de retorno siempre será llamada en ese intervalo de tiempo.

```js
// sintaxis
function callback() {
  // el código va aquí
}
setInterval(callback, duration);
```

```js
function sayHello() {
  console.log("Hello");
}
setInterval(sayHello, 1000); // imprime hola cada segundo, 1000ms es 1s
```

#### Configurar tiempo mediante un setTimeout

En JavaScript, utilizamos la función de orden superior setTimeout para ejecutar alguna acción en algún momento en el futuro. El método global setTimeout toma una función callback y una duración como parámetro. La duración está en milisegundos y el callback espera esa cantidad de tiempo.

```js
// sintaxis
function callback() {
  // el código va aquí
}
setTimeout(callback, duration); // duración en milliseconds
```

```js
function sayHello() {
  console.log("Hello");
}
setTimeout(sayHello, 2000); // imprime hola después de esperar 2 segundos.
```

## Programación funcional

En lugar de escribir un bucle regular, la última versión de JavaScript introdujo un montón de métodos incorporados que pueden ayudarnos a resolver problemas complicados.

Instead of writing regular loop, latest version of JavaScript introduced lots of built in methods which can help us to solve complicated problems. Todos los métodos incorporados toman la función callback. En esta sección, veremos _forEach_, _map_, _filter_, _reduce_, _find_, _every_, _some_, y _sort_.

### forEach

_forEach_: Iterar los elementos de un array. Utilizamos _forEach_ sólo con arrays. Toma una función callback con elementos, parámetro de índice y el propio array. El índice y el array son opcionales.

```js
arr.forEach(function (element, index, arr) {
  console.log(index, element, arr);
});
// El código anterior puede escribirse utilizando la función de flecha
arr.forEach((element, index, arr) => {
  console.log(index, element, arr);
});
// El código anterior puede escribirse utilizando la función de flecha y return explícito
arr.forEach((element, index, arr) => console.log(index, element, arr));
```

```js
let sum = 0;
const numbers = [1, 2, 3, 4, 5];
numbers.forEach((num) => console.log(num));
console.log(sum);
```

```sh
1
2
3
4
5
```

```js
let sum = 0;
const numbers = [1, 2, 3, 4, 5];
numbers.forEach((num) => (sum += num));

console.log(sum);
```

```sh
15
```

```js
const countries = ["Finland", "Denmark", "Sweden", "Norway", "Iceland"];
countries.forEach((element) => console.log(element.toUpperCase()));
```

```sh
FINLAND
DENMARK
SWEDEN
NORWAY
ICELAND
```

### map

_map_: Iterar los elementos de un array y modificar los elementos del mismo. Toma una función callback con elementos, índice , parámetro del array y devuelve un nuevo array.

```js
const modifiedArray = arr.map(function (element, index, arr) {
  return element;
});
```

```js
/*Función flecha y return explícito
const modifiedArray = arr.map((element,index) => element);
*/
//Ejemplo
const numbers = [1, 2, 3, 4, 5];
const numbersSquare = numbers.map((num) => num * num);

console.log(numbersSquare);
```

```sh
[1, 4, 9, 16, 25]
```

```js
const names = ["Asabeneh", "Mathias", "Elias", "Brook"];
const namesToUpperCase = names.map((name) => name.toUpperCase());
console.log(namesToUpperCase);
```

```sh
['ASABENEH', 'MATHIAS', 'ELIAS', 'BROOK']
```

```js
const countries = [
  "Albania",
  "Bolivia",
  "Canada",
  "Denmark",
  "Ethiopia",
  "Finland",
  "Germany",
  "Hungary",
  "Ireland",
  "Japan",
  "Kenya",
];
const countriesToUpperCase = countries.map((country) => country.toUpperCase());
console.log(countriesToUpperCase);

/*
// Función flecha
const countriesToUpperCase = countries.map((country) => {
  return country.toUpperCase();
})
//Función flecha de return explícita
const countriesToUpperCase = countries.map(country => country.toUpperCase());
*/
```

```sh
['ALBANIA', 'BOLIVIA', 'CANADA', 'DENMARK', 'ETHIOPIA', 'FINLAND', 'GERMANY', 'HUNGARY', 'IRELAND', 'JAPAN', 'KENYA']
```

```js
const countriesFirstThreeLetters = countries.map((country) =>
  country.toUpperCase().slice(0, 3)
);
```

```sh
 ["ALB", "BOL", "CAN", "DEN", "ETH", "FIN", "GER", "HUN", "IRE", "JAP", "KEN"]
```

### filter

_Filter_: Filtra los elementos que cumplen las condiciones de filtrado y devuelve un nuevo array.

```js
//Filtrar los países que contienen land
const countriesContainingLand = countries.filter((country) =>
  country.includes("land")
);
console.log(countriesContainingLand);
```

```sh
['Finland', 'Ireland']
```

```js
const countriesEndsByia = countries.filter((country) => country.endsWith("ia"));
console.log(countriesEndsByia);
```

```sh
['Albania', 'Bolivia','Ethiopia']
```

```js
const countriesHaveFiveLetters = countries.filter(
  (country) => country.length === 5
);
console.log(countriesHaveFiveLetters);
```

```sh
['Japan', 'Kenya']
```

```js
const scores = [
  { name: "Asabeneh", score: 95 },
  { name: "Lidiya", score: 98 },
  { name: "Mathias", score: 80 },
  { name: "Elias", score: 50 },
  { name: "Martha", score: 85 },
  { name: "John", score: 100 },
];

const scoresGreaterEighty = scores.filter((score) => score.score > 80);
console.log(scoresGreaterEighty);
```

```sh
[{name: 'Asabeneh', score: 95}, { name: 'Lidiya', score: 98 },{name: 'Martha', score: 85},{name: 'John', score: 100}]
```

### reduce

_reduce_: Reduce toma una función callback. La función callback toma como parámetro el acumulador, el valor actual y opcional el valor inicial y retorna un único valor. Es una buena práctica definir un valor inicial para el valor del acumulador. Si no especificamos este parámetro, por defecto el acumulador obtendrá el `primer valor` del array. Si nuestro array es un _array vacío_, entonces `Javascript` lanzará un error.

```js
arr.reduce((acc, cur) => {
  // algunas operaciones van aquí antes de devolver un valor
  return;
}, initialValue);
```

```js
const numbers = [1, 2, 3, 4, 5];
const sum = numbers.reduce((acc, cur) => acc + cur, 0);

console.log(sum);
```

```js
15;
```

### every

_every_: Comprueba si todos los elementos son similares en un aspecto. Devuelve un booleano

```js
const names = ["Asabeneh", "Mathias", "Elias", "Brook"];
const areAllStr = names.every((name) => typeof name === "string"); // ¿Son todas strings?

console.log(areAllStr);
```

```sh
true
```

```js
const bools = [true, true, true, true];
const areAllTrue = bools.every((b) => b === true); // ¿Son todas true?

console.log(areAllTrue); // true
```

```sh
true

```

### find

_find_: Retorna el primer elemento que cumple la condición

```js
const ages = [24, 22, 25, 32, 35, 18];
const age = ages.find((age) => age < 20);

console.log(age);
```

```js
18;
```

```js
const names = ["Asabeneh", "Mathias", "Elias", "Brook"];
const result = names.find((name) => name.length > 7);
console.log(result);
```

```sh
Asabeneh
```

```js
const scores = [
  { name: "Asabeneh", score: 95 },
  { name: "Mathias", score: 80 },
  { name: "Elias", score: 50 },
  { name: "Martha", score: 85 },
  { name: "John", score: 100 },
];

const score = scores.find((user) => user.score > 80);
console.log(score);
```

```sh
{ name: "Asabeneh", score: 95 }
```

### findIndex

_findIndex_: Retorna la posición del primer elemento que cumple la condición

```js
const names = ["Asabeneh", "Mathias", "Elias", "Brook"];
const ages = [24, 22, 25, 32, 35, 18];

const result = names.findIndex((name) => name.length > 7);
console.log(result); // 0

const age = ages.findIndex((age) => age < 20);
console.log(age); // 5
```

### some

_some_: Comprueba si algunos de los elementos son similares en un aspecto. Retorna un booleano

```js
const names = ["Asabeneh", "Mathias", "Elias", "Brook"];
const bools = [true, true, true, true];

const areSomeTrue = bools.some((b) => b === true);

console.log(areSomeTrue); //true
```

```js
const areAllStr = names.some((name) => typeof name === "number"); // ¿Son todas strings ?
console.log(areAllStr); // false
```

### sort

_sort_: El método "sort" ordena los elementos del array de forma ascendente o descendente. Por defecto, el método **_sort()_** ordena los valores como strings. Esto funciona bien para los elementos del array de strings pero no para los números. Si los valores numéricos se ordenan como strings y nos da un resultado erróneo. El método de Sort modifica el array original. Se recomienda copiar los datos originales antes de empezar a utilizar el método _sort_.

#### Ordenar los valores strings

```js
const products = ["Milk", "Coffee", "Sugar", "Honey", "Apple", "Carrot"];
console.log(products.sort()); // ['Apple', 'Carrot', 'Coffee', 'Honey', 'Milk', 'Sugar']
//Ahora la matriz original de productos también está ordenada
```

#### Ordenar valores numéricos

Como puede ver en el ejemplo de abajo, el 100 fue el primero después de ser clasificado en orden ascendente. Ordenar convierte los elementos en string , ya que '100' y otros números comparados, 1 que el principio del string '100' se convirtió en el más pequeño. Para evitar esto, utilizamos una función de callback de comparación dentro del método sort, que devuelve un negativo, un cero o un positivo.

```js
const numbers = [9.81, 3.14, 100, 37];
// El uso del método sort para ordenar los elementos numéricos proporciona un resultado erróneo.
console.log(numbers.sort()); //[100, 3.14, 37, 9.81]
numbers.sort(function (a, b) {
  return a - b;
});

console.log(numbers); // [3.14, 9.81, 37, 100]

numbers.sort(function (a, b) {
  return b - a;
});
console.log(numbers); //[100, 37, 9.81, 3.14]
```

#### Ordenar arrays de objetos

Siempre que ordenamos objetos en un array, utilizamos la clave del objeto para comparar. Veamos el siguiente ejemplo.

```js
objArr.sort(function (a, b) {
  if (a.key < b.key) return -1;
  if (a.key > b.key) return 1;
  return 0;
});

// o

objArr.sort(function (a, b) {
  if (a["key"] < b["key"]) return -1;
  if (a["key"] > b["key"]) return 1;
  return 0;
});

const users = [
  { name: "Asabeneh", age: 150 },
  { name: "Brook", age: 50 },
  { name: "Eyob", age: 100 },
  { name: "Elias", age: 22 },
];
users.sort((a, b) => {
  if (a.age < b.age) return -1;
  if (a.age > b.age) return 1;
  return 0;
});
console.log(users); // ordenados de forma ascendente
// [{…}, {…}, {…}, {…}]
```

🌕 Lo estás haciendo muy bien. Nunca te rindas porque las grandes cosas llevan su tiempo. Acabas de completar el día 9 de desafíos y llevas nueve pasos de tu camino hacia la grandeza. Ahora haz algunos ejercicios para tu cerebro y para tus músculos.

## 💻 Ejercicios

### Ejercicios: Nivel 1

```js
const countries = ["Finland", "Sweden", "Denmark", "Norway", "IceLand"];
const names = ["Asabeneh", "Mathias", "Elias", "Brook"];
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const products = [
  { product: "banana", price: 3 },
  { product: "mango", price: 6 },
  { product: "potato", price: " " },
  { product: "avocado", price: 8 },
  { product: "coffee", price: 10 },
  { product: "tea", price: "" },
];
```

1. Explique la diferencia entre **_forEach, map, filter, and reduce_**.
2. Defina una función callback antes de utilizarla en forEach, map, filter o reduce.
3. Utiliza **_forEach_** para mostrar con console.log cada país del array de países.
4. Utiliza **_forEach_** para mostrar con console.log cada nombre del array de nombres.
5. Utiliza **_forEach_** para mostrar con console.log cada número del array de números.
6. Utiliza **_map_** para crear un nuevo array cambiando cada país a mayúsculas en el array de países.
7. Utilice **_map_** para crear un array de longitudes de países a partir del array de países.
8. Usa **_map_** para crear un nuevo array cambiando cada número al cuadrado en el array de números.
9. Utilice **_map_** para cambiar cada nombre a mayúsculas en el array de nombres.
10. Utilice **_map_** para asignar el array de productos a sus correspondientes precios.
11. Utilice **_filter_** para filtrar los países que contienen **_land_**.
12. Utilice **_filter_** para filtrar los países que tienen seis caracteres.
13. Utilice **_filter_** para filtrar los países que contengan seis letras o más en el array de países.
14. Utilice **_filter_** para filtrar los países que empiezan por "E";
15. Utilice **_filter_** para filtrar sólo los precios con valores.
16. Declara una función llamada getStringLists que toma un array como parámetro y devuelve un array sólo con elementos string.
17. Usa **_reduce_** para sumar todos los números del array de números.
18. Utiliza **_reduce_** para concatenar todos los países y producir esta frase: **_Estonia, Finland, Sweden, Denmark, Norway, y IceLand son países del norte de Europa_**
19. Explique la diferencia entre **_some_** y **_every_**
20. Utilice **_some_** para comprobar si la longitud de algunos nombres es superior a siete en el array de nombres.
21. Utilice **_every_** para comprobar si todos los países contienen la palabra land.
22. Explique la diferencia entre **_find_** y **_findIndex_**.
23. Utilice **_find_** para encontrar el primer país que contenga sólo seis letras en el array de países.
24. Utilice **_findIndex_** para encontrar la posición del primer país que contenga sólo seis letras en el array de países.
25. Utilice **_findIndex_** para encontrar la posición de **_Norway_** si no existe en el array obtendrá -1.
26. Utilice **_findIndex_** para encontrar la posición de **_Russia_** si no existe en el array obtendrá -1.

### Ejercicios: Nivel 2

1. Encuentre el precio total de los productos encadenando dos o más iteradores de matrices (por ejemplo, arr.map(callback).filter(callback).reduce(callback)).
1. Encuentre la suma del precio de los productos usando sólo reduce(callback)).
1. Declara una función llamada **_categorizeCountries_** que retorna un array de países que tienen algún patrón común (encuentras el array de países en este repositorio como countries.js(ej 'land', 'ia', 'island','stan')).
1. Cree una función que retorne un array de objetos, que es la letra y el número de veces que la letra usa para empezar el nombre de un país.
1. Declara una función **_getFirstTenCountries_** y retorna un array de diez países. Utiliza diferente programación funcional para trabajar en el array countries.js.
1. Declara una función **_getLastTenCountries_** que devuelve los últimos diez países del array de países.
1. Encuentre qué _letra_ se utiliza muchas _veces_ como inicial de un nombre de país del array de países (ej. Finland, Fiji, France etc)

### Ejercicios: Nivel 3

1. Utiliza la información de los países, en la carpeta de datos. Ordena los países por nombre, por capital, por población
1. \*\*\* Encuentre las 10 lenguas más habladas:

   ````js
   // El resultado debería ser el siguiente
   console.log(mostSpokenLanguages(countries, 10))
   [
   {country: 'English',count:91},
   {country: 'French',count:45},
   {country: 'Arabic',count:25},
   {country: 'Spanish',count:24},
   {country:'Russian',count:9},
   {country:'Portuguese', count:9},
   {country:'Dutch',count:8},
   {country:'German',count:7},
   {country:'Chinese',count:5},
   {country:'Swahili',count:4}
   ]

   // El resultado debería ser el siguiente
   console.log(mostSpokenLanguages(countries, 3))
   [
   {country: 'English',count: 91},
   {country: 'French',count: 45},
   {country: 'Arabic',count: 25},
   ]```

   ````

1. \*\*\* Utilice el archivo countries_javascript.js para crear una función que cree los diez países más poblados.

   ````js
   console.log(mostPopulatedCountries(countries, 10))

   [
   {country: 'China', population: 1377422166},
   {country: 'India', population: 1295210000},
   {country: 'United States of America', population: 323947000},
   {country: 'Indonesia', population: 258705000},
   {country: 'Brazil', population: 206135893},
   {country: 'Pakistan', population: 194125062},
   {country: 'Nigeria', population: 186988000},
   {country: 'Bangladesh', population: 161006790},
   {country: 'Russian Federation', population: 146599183},
   {country: 'Japan', population: 126960000}
   ]

   console.log(mostPopulatedCountries(countries, 3))
   [
   {country: 'China', population: 1377422166},
   {country: 'India', population: 1295210000},
   {country: 'United States of America', population: 323947000}
   ]
   ```

   ````

1. \*\*\* Intenta desarrollar un programa que calcule la medida de tendencia central de una muestra(mean, median, mode) y medida de la variabilidad(range, variance, standard deviation). Además de esas medidas, encuentre el mínimo, el máximo, el recuento, el porcentaje y la distribución de frecuencias de la muestra. Puede crear un objeto llamado estadísticas y crear todas las funciones que hacen cálculos estadísticos como método para el objeto estadísticas. Comprueba el resultado que aparece a continuación.

   ```js
   const ages = [31, 26, 34, 37, 27, 26, 32, 32, 26, 27, 27, 24, 32, 33, 27, 25, 26, 38, 37, 31, 34, 24, 33, 29, 26]

   console.log('Count:', statistics.count()) // 25
   console.log('Sum: ', statistics.sum()) // 744
   console.log('Min: ', statistics.min()) // 24
   console.log('Max: ', statistics.max()) // 38
   console.log('Range: ', statistics.range() // 14
   console.log('Mean: ', statistics.mean()) // 30
   console.log('Median: ',statistics.median()) // 29
   console.log('Mode: ', statistics.mode()) // {'mode': 26, 'count': 5}
   console.log('Variance: ',statistics.var()) // 17.5
   console.log('Standard Deviation: ', statistics.std()) // 4.2
   console.log('Variance: ',statistics.var()) // 17.5
   console.log('Frequency Distribution: ',statistics.freqDist()) # [(20.0, 26), (16.0, 27), (12.0, 32), (8.0, 37), (8.0, 34), (8.0, 33), (8.0, 31), (8.0, 24), (4.0, 38), (4.0, 29), (4.0, 25)]
   ```

   ```sh
   console.log(statistics.describe())
   Count: 25
   Sum:  744
   Min:  24
   Max:  38
   Range:  14
   Mean:  30
   Median:  29
   Mode:  (26, 5)
   Variance:  17.5
   Standard Deviation:  4.2
   Frequency Distribution: [(20.0, 26), (16.0, 27), (12.0, 32), (8.0, 37), (8.0, 34), (8.0, 33), (8.0, 31), (8.0, 24), (4.0, 38), (4.0, 29), (4.0, 25)]
   ```

🎉 ¡FELICITACIONES! 🎉

[<< Día 8](../javascript/dia-08-objetos.md) | [Día 10 >>](../javascript/dia-10-sets-y-maps.md)

[<< INDICE](../../../index.md)