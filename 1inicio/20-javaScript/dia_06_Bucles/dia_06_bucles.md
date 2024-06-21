[<< INDICE](../../../README.md)

[<< Día 5](../dia_05_Arreglos/dia_05_arreglos.md) | [ Día 7 >>](../dia_07_Funciones/dia_07_funciones.md)

- [📔 Día 6](#-día-6)
  - [Bucles](#bucles)
    - [Bucle for](#bucle-for)
    - [Bucle while](#bucle-while)
    - [Bucle do while](#bucle-do-while)
    - [Bucle for of](#bucle-for-of)
    - [break](#break)
    - [continue](#continue)
  - [💻 Ejercicios:Día 6](#-ejerciciosdía-6)
    - [Ejercicios: Nivel 1](#ejercicios-nivel-1)
    - [Ejercicios: Nivel 2](#ejercicios-nivel-2)
    - [Ejercicios: Nivel 3](#ejercicios-nivel-3)

# 📔 Día 6

## Bucles

La mayoría de las actividades que hacemos en la vida están llenas de repeticiones. Imagina que tienes que imprimir de 0 a 100 usando console.log(). Para implementar esta simple tarea, puede tomar de 2 a 5 minutos, este tipo de tarea tediosa y repetitiva se puede llevar a cabo usando un bucle. Si prefieres ver los videos, puedes revisar el [video tutorials](https://www.youtube.com/channel/UCM4xOopkYiPwJqyKsSqL9mw)

En los lenguajes de programación para realizar tareas repetitivas utilizamos diferentes tipos de bucles. Los siguientes ejemplos son los bucles de uso común en JavaScript y otros lenguajes de programación.

### Bucle for

```js
// Estructura del bucle for
for(inicialización, condición, incremento/decremento){
  // el código va aquí
}
```

```js
for (let i = 0; i <= 5; i++) {
  console.log(i);
}

// 0 1 2 3 4 5
```

```js
for (let i = 5; i >= 0; i--) {
  console.log(i);
}

// 5 4 3 2 1 0
```

```js
for (let i = 0; i <= 5; i++) {
  console.log(`${i} * ${i} = ${i * i}`);
}
```

```sh
0 * 0 = 0
1 * 1 = 1
2 * 2 = 4
3 * 3 = 9
4 * 4 = 16
5 * 5 = 25
```

```js
const countries = ["Finland", "Sweden", "Denmark", "Norway", "Iceland"];
const newArr = [];
for (let i = 0; i < countries.length; i++) {
  newArr.push(countries[i].toUpperCase());
}

// ["FINLAND", "SWEDEN", "DENMARK", "NORWAY", "ICELAND"]
```

Agregar todos los elementos en un array

```js
const numbers = [1, 2, 3, 4, 5];
let sum = 0;
for (let i = 0; i < numbers.length; i++) {
  sum = sum + numbers[i]; // can be shorten, sum += numbers[i]
}

console.log(sum); // 15
```

Crea un nuevo array basado en el array existente

```js
const numbers = [1, 2, 3, 4, 5];
const newArr = [];
let sum = 0;
for (let i = 0; i < numbers.length; i++) {
  newArr.push(numbers[i] ** 2);
}

console.log(newArr); // [1, 4, 9, 16, 25]
```

```js
const countries = ["Finland", "Sweden", "Norway", "Denmark", "Iceland"];
const newArr = [];
for (let i = 0; i < countries.length; i++) {
  newArr.push(countries[i].toUpperCase());
}

console.log(newArr); // ["FINLAND", "SWEDEN", "NORWAY", "DENMARK", "ICELAND"]
```

### Bucle while

```js
let i = 0;
while (i <= 5) {
  console.log(i);
  i++;
}

// 0 1 2 3 4 5
```

### Bucle do while

```js
let i = 0;
do {
  console.log(i);
  i++;
} while (i <= 5);

// 0 1 2 3 4 5
```

### Bucle for of

Usamos el bucle for of para arrays. Es una forma muy práctica de iterar a través de un array, si no estamos interesados en el index de cada elemento del array.

```js
for (const element of arr) {
  // el código va aquí
}
```

```js
const numbers = [1, 2, 3, 4, 5];

for (const num of numbers) {
  console.log(num);
}

// 1 2 3 4 5

for (const num of numbers) {
  console.log(num * num);
}

// 1 4 9 16 25

// sumando todos los números del array
let sum = 0;
for (const num of numbers) {
  sum = sum + num;
  // también se puede acortar así, sum += num
  // después de esto usaremos la sintaxis más corta (+=, -=, *=, /= etc)
}
console.log(sum); // 15

const webTechs = [
  "HTML",
  "CSS",
  "JavaScript",
  "React",
  "Redux",
  "Node",
  "MongoDB",
];

for (const tech of webTechs) {
  console.log(tech.toUpperCase());
}

// HTML CSS JAVASCRIPT REACT NODE MONGODB

for (const tech of webTechs) {
  console.log(tech[0]); // obtiene solo la primera letra de cada elemento,  H C J R N M
}
```

```js
const countries = ["Finland", "Sweden", "Norway", "Denmark", "Iceland"];
const newArr = [];
for (const country of countries) {
  newArr.push(country.toUpperCase());
}

console.log(newArr); // ["FINLAND", "SWEDEN", "NORWAY", "DENMARK", "ICELAND"]
```

### break

Break se utiliza para interrumpir un bucle.

```js
for (let i = 0; i <= 5; i++) {
  if (i == 3) {
    break;
  }
  console.log(i);
}

// 0 1 2
```

El código anterior se detiene si se encuentran 3 en el proceso de iteración.

### continue

Usamos la palabra clave _continue_ para omitir ciertas iteraciones.

```js
for (let i = 0; i <= 5; i++) {
  if (i == 3) {
    continue;
  }
  console.log(i);
}

// 0 1 2 4 5
```

🌕 Tienes una energía ilimitada. Acabas de completar los desafíos del día 6 y llevas seis pasos de tu camino hacia la grandeza. Ahora haz algunos ejercicios para tu cerebro y tus músculos.

## 💻 Ejercicios:Día 6

### Ejercicios: Nivel 1

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

const webTechs = [
  "HTML",
  "CSS",
  "JavaScript",
  "React",
  "Redux",
  "Node",
  "MongoDB",
];

const mernStack = ["MongoDB", "Express", "React", "Node"];
```

1. Itera de 0 a 10 usando el bucle for, haga lo mismo usando los bucles while y do while
2. Itera 10 to 0 usando el bucle for, haga lo mismo usando los bucles while y do while
3. Itera de 0 a n usando el bucle for
4. Escribe un bucle que haga el siguiente patrón usando console.log():

   ```js
       #
       ##
       ###
       ####
       #####
       ######
       #######
   ```

5. Usa un bucle para imprimir el siguiente patrón:

   ```sh
   0 x 0 = 0
   1 x 1 = 1
   2 x 2 = 4
   3 x 3 = 9
   4 x 4 = 16
   5 x 5 = 25
   6 x 6 = 36
   7 x 7 = 49
   8 x 8 = 64
   9 x 9 = 81
   10 x 10 = 100
   ```

6. Usando un bucle imprime el siguiente patrón:

   ```sh
    i    i^2   i^3
    0    0     0
    1    1     1
    2    4     8
    3    9     27
    4    16    64
    5    25    125
    6    36    216
    7    49    343
    8    64    512
    9    81    729
    10   100   1000
   ```

7. Usa el bucle for para iterar de 0 a 100 e imprima solo números pares
8. Usa el bucle for para iterar de 0 a 100 e imprima solo números impares
9. Usa el bucle for para iterar de 0 a 100 e imprima los solo números primos
10. Usa el bucle for para iterar de 0 a 100 e imprima la suma de todos los números.

    ```sh
    La suma de todos los números de 0 a 100 es 5050.
    ```

11. Usa el bucle para iterar de 0 a 100 e imprimir la suma de todos los pares y la suma de todos los impares.

    ```sh
    La suma de todos los pares de 0 a 100 es 2550. Y la suma de todos los impares de 0 a 100 es 2500.
    ```

12. Usa el bucle para iterar de 0 a 100 e imprimir la suma de todos los pares y la suma de todos los impares. Imprimir suma de pares y suma de impares como un array

    ```sh
      [2550, 2500]
    ```

13. Desarrolla un pequeño script que genera una matriz de 5 números aleatorios
14. Desarrolla un pequeño script que genera una matriz de 5 números aleatorios. Los números debe ser únicos
15. Desarrolla un pequeño script que genera un id aleatorio de seis caracteres:

    ```sh
    5j2khz
    ```

### Ejercicios: Nivel 2

1. Desarrolla un pequeño script que genera un id con cualquier número de caracteres aleatorios:

   ```sh
     fe3jo1gl124g
   ```

   ```sh
     xkqci4utda1lmbelpkm03rba
   ```

1. Escribe un script que genere un número hexadecimal aleatorio.

   ```sh
   '#ee33df'
   ```

1. Escribe un script que genere un número de color rgb aleatorio.

   ```sh
   rgb(240,180,80)
   ```

1. Usando el array countries anterior, crea un array como el siguiente.

   ```sh
   ["ALBANIA", "BOLIVIA", "CANADA", "DENMARK", "ETHIOPIA", "FINLAND", "GERMANY", "HUNGARY", "IRELAND", "JAPAN", "KENYA"]
   ```

1. Usando el array countries anterior, crea un array para saber la longitud de cada país.

   ```sh
   [7, 7, 6, 7, 8, 7, 7, 7, 7, 5, 5]
   ```

1. Utiliza el array countries para crear la siguiente array de arrays

   ```sh
     [
     ['Albania', 'ALB', 7],
     ['Bolivia', 'BOL', 7],
     ['Canada', 'CAN', 6],
     ['Denmark', 'DEN', 7],
     ['Ethiopia', 'ETH', 8],
     ['Finland', 'FIN', 7],
     ['Germany', 'GER', 7],
     ['Hungary', 'HUN', 7],
     ['Ireland', 'IRE', 7],
     ['Iceland', 'ICE', 7],
     ['Japan', 'JAP', 5],
     ['Kenya', 'KEN', 5]
   ]
   ```

1. En el array countries anterior, verifica si hay un país que contenga la palabra 'land'. Si hay países que contienen 'land', imprimelo cono array. Si no hay ningún país que contenga la palabra'land', imprima 'Todos estos países no tienen la palabra land'.

   ```sh
   ['Finland','Ireland', 'Iceland']
   ```

1. En el array countries anterior, verifica si hay un país que termina con una subcadena (substring) 'ia'. Si hay países que terminan con 'ia', imprimelo como un array. Si no hay ningún país que contenga la palabra 'ia', imprime 'Estos países no terminan con ia'.

   ```sh
   ['Albania', 'Bolivia','Ethiopia']
   ```

1. Usando el array countries anterior, encuentre el país que contiene la mayor cantidad de caracteres.

   ```sh
   Ethiopia
   ```

1. Usando el array countries anterior, encuentre el país que contiene sólo 5 caracteres.

   ```sh
   ['Japan', 'Kenya']
   ```

1. Encuentra la palabra más larga en el array webTechs
1. Utiliza el array de webTechs para crear la el siguiente array de arrays:

   ```sh
   [["HTML", 4], ["CSS", 3],["JavaScript", 10],["React", 5],["Redux", 5],["Node", 4],["MongoDB", 7]]
   ```

1. Una aplicación creada con MongoDB, Express, React y Node se denomina MERN stack app. Crea el acrónimo MERN usando el array mernStack
1. Iterar a través del array, ["HTML", "CSS", "JS", "React", "Redux", "Node", "Express", "MongoDB"] usando el bucle for o el bucle for of e imprime los elementos.
1. Este es un array de frutas, ['banana', 'orange', 'mango', 'lemon'] invierte el orden usando un bucle sin usar el método reverse().
1. Imprime todos los elementos del array como se muestra a continuación:

   ```js
   const fullStack = [
     ["HTML", "CSS", "JS", "React"],
     ["Node", "Express", "MongoDB"],
   ];
   ```

   ```sh
     HTML
     CSS
     JS
     REACT
     NODE
     EXPRESS
     MONGODB
   ```

### Ejercicios: Nivel 3

1. Copia el array countries (Evita mutaciones)
1. Los arrays son mutables. Crea una copia del array que no modifique el original. Ordena la copia del array y guárdala en una variable sortedCountries
1. Ordena el array webTechs y el array mernStack
1. Extrae todos los países que contengan la palabra 'land' del [array countries](../data/countries.js) e imprimela como un array
1. Encuentra el país que contiene la mayor cantidad de caracteres en el [array countries](../data/countries.js)
1. Extrae todos los países que contienen la palabra 'land' del [array countries](../data/countries.js) e imprimela como un array
1. Extrae todos los países que contengan solo cuatro caracters del [array countries](../data/countries.js) e impremela como un array
1. Extrae todos los paíse que contengan dos o más palabras del [array countries](../data/countries.js) e imprimela como un array
1. Invertir el [array countries](../data/countries.js) y poner en mayúscula cada país y almacenalo en un array

🎉 ¡FELICITACIONES! 🎉

[<< Día 5](../dia_05_Arreglos/dia_05_arreglos.md) | [Día 7 >>](../dia_07_Funciones/dia_07_funciones.md)

[<< INDICE](../../../README.md)