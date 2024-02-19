
[<< Día 18](../dia_18_Promesas/dia_18_Promesas.md) | [Día 20 >>](../dia_20_Escribiendo_Codigos_Limpios/dia_20_escribiendo_codigos_limpios.md)

![Thirty Days Of JavaScript](../images/banners/day_1_19.png)

- [Día 19](#día-19)
  - [Closure](#closure)
  - [Ejercicios](#ejercicios)
    - [Ejercicios: Nivel 1](#ejercicios-nivel-1)
    - [Ejercicios: Nivel 2](#ejercicios-nivel-2)
    - [Ejercicios: Nivel 3](#ejercicios-nivel-3)

# Día 19

## Closure

JavaScript permite escribir una función dentro de una función externa. Podemos escribir tantas funciones internas como queramos. Si la función interna accede a las variables de la función externa entonces se llama closure (clausura).

```js
function outerFunction() {
  let count = 0;
  function innerFunction() {
    count++;
    return count;
  }

  return innerFunction;
}
const innerFunc = outerFunction();

console.log(innerFunc());
console.log(innerFunc());
console.log(innerFunc());
```

```sh
1
2
3
```

Veamos más ejemplos de funciones internas

```js
function outerFunction() {
  let count = 0;
  function plusOne() {
    count++;
    return count;
  }
  function minusOne() {
    count--;
    return count;
  }

  return {
    plusOne: plusOne(),
    minusOne: minusOne(),
  };
}
const innerFuncs = outerFunction();

console.log(innerFuncs.plusOne);
console.log(innerFuncs.minusOne);
```

```sh
1
0
```

🌕 Estás haciendo progresos. Mantén tu ritmo, sigue con el buen trabajo. Ahora haz algunos ejercicios para tu cerebro y para tus músculos.

## Ejercicios

### Ejercicios: Nivel 1

1. Crear una closure que tenga una función interna

### Ejercicios: Nivel 2

1. Crear una closure que tenga tres funciones internas

### Ejercicios: Nivel 3

1. Crear una función de salida de personAccount. Tiene variables internas de nombre, apellido, ingresos y gastos. Tiene las funciones internas totalIncome, totalExpense, accountInfo,addIncome, addExpense y accountBalance. Los ingresos son un conjunto de ingresos y su descripción y los gastos son también un conjunto de gastos con su descripción.

🎉 ¡FELICITACIONES! 🎉

[<< Día 18](../dia_18_Promesas/dia_18_Promesas.md) | [Día 20 >>](../dia_20_Escribiendo_Codigos_Limpios/dia_20_escribiendo_codigos_limpios.md)
