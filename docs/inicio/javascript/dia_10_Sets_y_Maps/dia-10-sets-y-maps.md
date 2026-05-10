[<< INDICE](../../../index.md)

[<< Día 9](../javascript/dia-09-funciones-de-orden-superior.md) | [Día 11>>](../javascript/dia-11-desestructuracion-y-spreading.md)

- [Día 10](#día-10)
  - [Set](#set)
    - [Creación de set vacío](#creación-de-set-vacío)
    - [Creación de set a partir de array](#creación-de-set-a-partir-de-array)
    - [Añadir un elemento a set](#añadir-un-elemento-a-set)
    - [Borrar un elemento a set](#borrar-un-elemento-a-set)
    - [Comprobación de un elemento en set](#comprobación-de-un-elemento-en-set)
    - [Limpiar set](#limpiar-set)
    - [Unión de sets](#unión-de-sets)
    - [Intersección de sets](#intersección-de-sets)
    - [Diferencia de sets](#diferencia-de-sets)
  - [Map](#map)
    - [Creación de un Map vacío](#creación-de-un-map-vacío)
    - [Creación de un Map a partir de un array](#creación-de-un-map-a-partir-de-un-array)
    - [Añadir valores a Map](#añadir-valores-a-map)
    - [Obtención de un valor de Map](#obtención-de-un-valor-de-map)
    - [Comprobar key en Map](#comprobar-key-en-map)
  - [Ejercicios](#ejercicios)
    - [Ejercicios:Nivel 1](#ejerciciosnivel-1)
    - [Ejercicios:Nivel 2](#ejerciciosnivel-2)
    - [Ejercicios:Nivel 3](#ejerciciosnivel-3)

# Día 10

## Set

Set (conjunto) es una colección de elementos. Set sólo puede contener elementos únicos.
Veamos cómo crear set en la sección siguiente.

### Creación de set vacío

```js
const companies = new Set();
console.log(companies);
```

```sh
Set(0) {}
```

### Creación de set a partir de array

```js
const languages = [
  "English",
  "Finnish",
  "English",
  "French",
  "Spanish",
  "English",
  "French",
];

const setOfLanguages = new Set(languages);
console.log(setOfLanguages);
```

```sh
Set(4) {"English", "Finnish", "French", "Spanish"}
```

Set es un objeto iterable y podemos iterar a través de cada elemento.

```js
const languages = [
  "English",
  "Finnish",
  "English",
  "French",
  "Spanish",
  "English",
  "French",
];

const setOfLanguages = new Set(languages);

for (const language of setOfLanguages) {
  console.log(language);
}
```

```sh
  English
  Finnish
  French
  Spanish
```

### Añadir un elemento a set

```js
const companies = new Set(); // crear set vacío
console.log(companies.size); // 0

companies.add("Google"); // añadir un elemento a set
companies.add("Facebook");
companies.add("Amazon");
companies.add("Oracle");
companies.add("Microsoft");
console.log(companies.size); // 5 elements in set
console.log(companies);
```

```sh
Set(5) {"Google", "Facebook", "Amazon", "Oracle", "Microsoft"}
```

También podemos utilizar el bucle para añadir elementos a set.

```js
const companies = ["Google", "Facebook", "Amazon", "Oracle", "Microsoft"];
setOfCompanies = new Set();
for (const company of companies) {
  setOfCompanies.add(company);
}
```

```sh
Set(5) {"Google", "Facebook", "Amazon", "Oracle", "Microsoft"}

```

### Borrar un elemento a set

Podemos eliminar un elemento de set utilizando un método de eliminación.

```js
console.log(companies.delete("Google"));
console.log(companies.size); // 4 elementos en set
```

### Comprobación de un elemento en set

El método has puede ayudar a saber si un determinado elemento existe en set.

```js
console.log(companies.has("Apple")); // false
console.log(companies.has("Facebook")); // true
```

### Limpiar set

Elimina todos los elementos de set.

```js
companies.clear();
console.log(companies);
```

```sh
Set(0) {}
```

Vea el ejemplo siguiente para aprender a utilizar set.

```js
const languages = [
  "English",
  "Finnish",
  "English",
  "French",
  "Spanish",
  "English",
  "French",
];
const langSet = new Set(languages);
console.log(langSet); // Set(4) {"English", "Finnish", "French", "Spanish"}
console.log(langSet.size); // 4

const counts = [];
const count = {};

for (const l of langSet) {
  const filteredLang = languages.filter((lng) => lng === l);
  console.log(filteredLang); // ["English", "English", "English"]
  counts.push({ lang: l, count: filteredLang.length });
}
console.log(counts);
```

```js
[
  { lang: "English", count: 3 },
  { lang: "Finnish", count: 1 },
  { lang: "French", count: 2 },
  { lang: "Spanish", count: 1 },
];
```

Otros casos de uso de set. Por ejemplo, para contar elementos únicos en un array.

```js
const numbers = [5, 3, 2, 5, 5, 9, 4, 5];
const setOfNumbers = new Set(numbers);

console.log(setOfNumbers);
```

```sh
Set(5) {5, 3, 2, 9, 4}
```

### Unión de sets

Para encontrar la unión de dos sets se puede utilizar el operador de dispersión. Busquemos la unión del set A y el set B (A U B)

```js
let a = [1, 2, 3, 4, 5];
let b = [3, 4, 5, 6];
let c = [...a, ...b];

let A = new Set(a);
let B = new Set(b);
let C = new Set(c);

console.log(C);
```

```sh
Set(6) {1, 2, 3, 4, 5,6}
```

### Intersección de sets

Para encontrar la intersección de dos sets se puede utilizar un filtro. Vamos a encontrar la intersección del set A y el set B (A ∩ B)

```js
let a = [1, 2, 3, 4, 5];
let b = [3, 4, 5, 6];

let A = new Set(a);
let B = new Set(b);

let c = a.filter((num) => B.has(num));
let C = new Set(c);

console.log(C);
```

```sh
Set(3) {3, 4, 5}
```

### Diferencia de sets

Para encontrar la diferencia entre dos sets se puede utilizar un filtro. Vamos a encontrar la diferencia del set A y el set B (A \ B)

```js
let a = [1, 2, 3, 4, 5];
let b = [3, 4, 5, 6];

let A = new Set(a);
let B = new Set(b);

let c = a.filter((num) => !B.has(num));
let C = new Set(c);

console.log(C);
```

```sh
Set(2) {1, 2}
```

## Map

### Creación de un Map vacío

```js
const map = new Map();
console.log(map);
```

```sh
Map(0) {}
```

### Creación de un Map a partir de un array

```js
countries = [
  ["Finland", "Helsinki"],
  ["Sweden", "Stockholm"],
  ["Norway", "Oslo"],
];
const map = new Map(countries);
console.log(map);
console.log(map.size);
```

```sh
Map(3) {"Finland" => "Helsinki", "Sweden" => "Stockholm", "Norway" => "Oslo"}
3
```

### Añadir valores a Map

```js
const countriesMap = new Map();
console.log(countriesMap.size); // 0
countriesMap.set("Finland", "Helsinki");
countriesMap.set("Sweden", "Stockholm");
countriesMap.set("Norway", "Oslo");
console.log(countriesMap);
console.log(countriesMap.size);
```

```sh
Map(3) {"Finland" => "Helsinki", "Sweden" => "Stockholm", "Norway" => "Oslo"}
3
```

### Obtención de un valor de Map

```js
console.log(countriesMap.get("Finland"));
```

```sh
Helsinki
```

### Comprobar key en Map

Comprueba si una key existe en un map usando el método _has_. Retorna _true_ o _false_.

```js
console.log(countriesMap.has("Finland"));
```

```sh
true
```

Obtención de todos los valores de map usando un bucle

```js
for (const country of countriesMap) {
  console.log(country);
}
```

```sh
(2) ["Finland", "Helsinki"]
(2) ["Sweden", "Stockholm"]
(2) ["Norway", "Oslo"]
```

```js
for (const [country, city] of countriesMap) {
  console.log(country, city);
}
```

```sh
Finland Helsinki
Sweden Stockholm
Norway Oslo
```

🌕 Has conseguido un gran logro, eres imparable. ¡Sigue adelante! Acabas de completar los desafíos del día 10 y llevas 10 pasos de tu camino hacia la grandeza. Ahora haz algunos ejercicios para tu cerebro y para tus músculos.

## Ejercicios

### Ejercicios:Nivel 1

```js
const a = [4, 5, 8, 9];
const b = [3, 4, 5, 7];
const countries = ["Finland", "Sweden", "Norway"];
```

1. crear un set vacío
2. Crear un set que contenga de 0 a 10 utilizando el bucle
3. Eliminar un elemento de set
4. Limpia set
5. Crear un set de 5 elementos string a partir de un array
6. Crear un map de países y el número de caracteres de un país

### Ejercicios:Nivel 2

1. Encontrar a unión b
2. Encontrar a intersección b
3. Encontrar a con b

### Ejercicios:Nivel 3

1. Cuántos idiomas hay en el archivo de objetos de países.

1. \*\*\* Utiliza los datos de los países para encontrar las 10 lenguas más habladas:

```js
// El resultado debería ser el siguiente
console.log(mostSpokenLanguages(countries, 10))[
  ({ English: 91 },
  { French: 45 },
  { Arabic: 25 },
  { Spanish: 24 },
  { Russian: 9 },
  { Portuguese: 9 },
  { Dutch: 8 },
  { German: 7 },
  { Chinese: 5 },
  { Swahili: 4 },
  { Serbian: 4 })
];

// El resultado debería ser el siguiente
console.log(mostSpokenLanguages(countries, 3))[
  ({ English: 91 }, { French: 45 }, { Arabic: 25 })
];
```

🎉 ¡Felicitaciones! 🎉

[<< Día 9](../javascript/dia-09-funciones-de-orden-superior.md) | [Día 11 >>](../javascript/dia-11-desestructuracion-y-spreading.md)

[<< INDICE](../../../index.md)