[<< INDICE](../../../index.md)

[<< Día 14](../java-script/dia-14-manejo-de-errores.md) | [Día 16>>](../java-script/dia-16-json.md)

![Thirty Days Of JavaScript](../java-script/banners/day_1_15.png)

- [Día 15](#día-15)
  - [Clases](#clases)
    - [Definir una clase](#definir-una-clase)
    - [Instanciar Clases](#instanciar-clases)
    - [Constructor](#constructor)
    - [Valores por defecto con el constructor](#valores-por-defecto-con-el-constructor)
    - [Métodos de clase](#métodos-de-clase)
    - [Propiedades con valor inicial](#propiedades-con-valor-inicial)
    - [getter](#getter)
    - [setter](#setter)
    - [Método Static](#método-static)
  - [Herencia](#herencia)
    - [Anulación de métodos](#anulación-de-métodos)
  - [Ejercicios](#ejercicios)
    - [Ejercicios Nivel 1](#ejercicios-nivel-1)
    - [Ejercicios Nivel 2](#ejercicios-nivel-2)
    - [Ejercicios Nivel 3](#ejercicios-nivel-3)

# Día 15

## Clases

JavaScript es un lenguaje de programación orientado a objetos. Todo en JavScript es un objeto, con sus propiedades y métodos. Creamos una clase para crear un objeto. Una clase es como un constructor de objetos, o un "plano" para crear objetos. Instanciamos una clase para crear un objeto. La clase define los atributos y el comportamiento del objeto, mientras que el objeto, por su parte, representa la clase.

Una vez que creamos una clase podemos crear un objeto a partir de ella cuando queramos. La creación de un objeto a partir de una clase se denomina instanciación de la clase.

En la sección de objetos, vimos cómo crear un objeto literal. El objeto literal es un singleton (instancia única). Si queremos obtener un objeto similar, tenemos que escribirlo. Sin embargo, la clase permite crear muchos objetos. Esto ayuda a reducir la cantidad de código y la repetición del mismo.

### Definir una clase

Para definir una clase en JavaScript necesitamos la palabra clave _class_ , el nombre de una clase en **CamelCase** y bloque de código (dentro de dos corchetes). Vamos a crear una clase llamada Persona.

```sh
// sintaxis
class ClassName {
    //  el código va aquí
}

```

**Ejemplo:**

```js
class Person {
  // el código va aquí
}
```

Hemos creado una clase Persona pero no tiene nada dentro.

### Instanciar Clases

Instanciar una clase significa crear un objeto a partir de una clase. Necesitamos la palabra clave _new_ y llamamos al nombre de la clase después de la palabra _new_.

Vamos a crear un objeto persona a partir de nuestra clase Persona.

```js
class Person {
  // el código va aquí
}
const person = new Person();
console.log(person);
```

```sh
Person {}
```

Como puedes ver, hemos creado un objeto persona. Como la clase aún no tiene propiedades, el objeto también está vacío.

Usemos el constructor de la clase para pasar diferentes propiedades a la clase.

### Constructor

El constructor es una función incorporada que permite crear un blueprint para nuestro objeto. La función constructora comienza con la palabra clave _constructor_ seguida de un paréntesis. Dentro del paréntesis pasamos las propiedades del objeto como parámetro. Utilizamos la palabra clave _this_ para adjuntar los parámetros del constructor con la clase.

El siguiente constructor de la clase Persona tiene las propiedades firstName y lastName. Estas propiedades se adjuntan a la clase Persona utilizando la palabra clave _this_. _this_ se refiere a la propia clase.

```js
class Person {
  constructor(firstName, lastName) {
    console.log(this); // Compruebe el resultado desde aquí
    this.firstName = firstName;
    this.lastName = lastName;
  }
}

const person = new Person();

console.log(person);
```

```sh
Person {firstName: undefined, lastName:undefined}
```

Todas las claves del objeto son undefined. Siempre que instanciemos debemos pasar el valor de las propiedades. Pasemos el valor en este momento cuando instanciamos la clase.

```js
class Person {
  constructor(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh");

console.log(person1);
```

```sh
Person {firstName: "Asabeneh", lastName: "Yetayeh"}
```

Como hemos dicho al principio, una vez que creamos una clase podemos crear muchos objetos utilizando la clase. Ahora, vamos a crear muchos objetos persona utilizando la clase Persona.

```js
class Person {
  constructor(firstName, lastName) {
    console.log(this); // Compruebe el resultado desde aquí
    this.firstName = firstName;
    this.lastName = lastName;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh");
const person2 = new Person("Lidiya", "Tekle");
const person3 = new Person("Abraham", "Yetayeh");

console.log(person1);
console.log(person2);
console.log(person3);
```

```sh
Person {firstName: "Asabeneh", lastName: "Yetayeh"}
Person {firstName: "Lidiya", lastName: "Tekle"}
Person {firstName: "Abraham", lastName: "Yetayeh"}
```

Usando la clase Persona creamos tres objetos persona. Como puedes ver nuestra clase no tenía muchas propiedades vamos a añadir más propiedades a la clase.

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    console.log(this); // Compruebe el resultado desde aquí
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh", 250, "Finland", "Helsinki");

console.log(person1);
```

```sh
Person {firstName: "Asabeneh", lastName: "Yetayeh", age: 250, country: "Finland", city: "Helsinki"}
```

### Valores por defecto con el constructor

Las propiedades de la función constructora pueden tener un valor por defecto como otras funciones regulares.

```js
class Person {
  constructor(
    firstName = "Asabeneh",
    lastName = "Yetayeh",
    age = 250,
    country = "Finland",
    city = "Helsinki"
  ) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
  }
}

const person1 = new Person(); // tomará el valor por defecto values
const person2 = new Person("Lidiya", "Tekle", 28, "Finland", "Espoo");

console.log(person1);
console.log(person2);
```

```sh
Person {firstName: "Asabeneh", lastName: "Yetayeh", age: 250, country: "Finland", city: "Helsinki"}
Person {firstName: "Lidiya", lastName: "Tekle", age: 28, country: "Finland", city: "Espoo"}
```

### Métodos de clase

El constructor dentro de una clase es una función incorporada que nos permite crear un blueprint para el objeto. En una clase podemos crear métodos de clase. Los métodos son funciones de JavaScript dentro de la clase. Vamos a crear algunos métodos de clase.

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
  }
  getFullName() {
    const fullName = this.firstName + " " + this.lastName;
    return fullName;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh", 250, "Finland", "Helsinki");
const person2 = new Person("Lidiya", "Tekle", 28, "Finland", "Espoo");

console.log(person1.getFullName());
console.log(person2.getFullName());
```

```sh
Asabeneh Yetayeh
test.js:19 Lidiya Tekle
```

### Propiedades con valor inicial

Cuando creamos una clase para algunas propiedades podemos tener un valor inicial. Por ejemplo, si estás jugando una partida, tu puntuación inicial será cero. Así, podemos tener una puntuación inicial o una puntuación que sea cero. De otra manera, podemos tener una habilidad inicial y adquiriremos alguna habilidad después de algún tiempo.

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
    this.score = 0;
    this.skills = [];
  }
  getFullName() {
    const fullName = this.firstName + " " + this.lastName;
    return fullName;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh", 250, "Finland", "Helsinki");
const person2 = new Person("Lidiya", "Tekle", 28, "Finland", "Espoo");

console.log(person1.score);
console.log(person2.score);

console.log(person1.skills);
console.log(person2.skills);
```

```sh
0
0
[]
[]
```

Un método puede ser un método regular o un getter o un setter. Veamos, getter y setter.

### getter

El método get nos permite acceder al valor del objeto. Escribimos un método get utilizando la palabra clave _get_ seguida de una función. En lugar de acceder a las propiedades directamente desde el objeto utilizamos getter para obtener el valor. Vea el ejemplo siguiente

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
    this.score = 0;
    this.skills = [];
  }
  getFullName() {
    const fullName = this.firstName + " " + this.lastName;
    return fullName;
  }
  get getScore() {
    return this.score;
  }
  get getSkills() {
    return this.skills;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh", 250, "Finland", "Helsinki");
const person2 = new Person("Lidiya", "Tekle", 28, "Finland", "Espoo");

console.log(person1.getScore); // No necesitamos paréntesis para llamar a un método getter
console.log(person2.getScore);

console.log(person1.getSkills);
console.log(person2.getSkills);
```

```sh
0
0
[]
[]
```

### setter

El método setter nos permite modificar el valor de ciertas propiedades. Escribimos un método setter utilizando la palabra clave _set_ seguida de una función. Vea el ejemplo de abajo.

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
    this.score = 0;
    this.skills = [];
  }
  getFullName() {
    const fullName = this.firstName + " " + this.lastName;
    return fullName;
  }
  get getScore() {
    return this.score;
  }
  get getSkills() {
    return this.skills;
  }
  set setScore(score) {
    this.score += score;
  }
  set setSkill(skill) {
    this.skills.push(skill);
  }
}

const person1 = new Person("Asabeneh", "Yetayeh", 250, "Finland", "Helsinki");
const person2 = new Person("Lidiya", "Tekle", 28, "Finland", "Espoo");

person1.setScore = 1;
person1.setSkill = "HTML";
person1.setSkill = "CSS";
person1.setSkill = "JavaScript";

person2.setScore = 1;
person2.setSkill = "Planning";
person2.setSkill = "Managing";
person2.setSkill = "Organizing";

console.log(person1.score);
console.log(person2.score);

console.log(person1.skills);
console.log(person2.skills);
```

```sh
1
1
["HTML", "CSS", "JavaScript"]
["Planning", "Managing", "Organizing"]
```

No te confundas con la diferencia entre un método regular y un getter. If you know how to make a regular method you are good. Let us add regular method called getPersonInfo in the Person class.

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
    this.score = 0;
    this.skills = [];
  }
  getFullName() {
    const fullName = this.firstName + " " + this.lastName;
    return fullName;
  }
  get getScore() {
    return this.score;
  }
  get getSkills() {
    return this.skills;
  }
  set setScore(score) {
    this.score += score;
  }
  set setSkill(skill) {
    this.skills.push(skill);
  }
  getPersonInfo() {
    let fullName = this.getFullName();
    let skills =
      this.skills.length > 0 &&
      this.skills.slice(0, this.skills.length - 1).join(", ") +
        ` and ${this.skills[this.skills.length - 1]}`;
    let formattedSkills = skills ? `He knows ${skills}` : "";

    let info = `${fullName} is ${this.age}. He lives ${this.city}, ${this.country}. ${formattedSkills}`;
    return info;
  }
}

const person1 = new Person("Asabeneh", "Yetayeh", 250, "Finland", "Helsinki");
const person2 = new Person("Lidiya", "Tekle", 28, "Finland", "Espoo");
const person3 = new Person("John", "Doe", 50, "Mars", "Mars city");

person1.setScore = 1;
person1.setSkill = "HTML";
person1.setSkill = "CSS";
person1.setSkill = "JavaScript";

person2.setScore = 1;
person2.setSkill = "Planning";
person2.setSkill = "Managing";
person2.setSkill = "Organizing";

console.log(person1.getScore);
console.log(person2.getScore);

console.log(person1.getSkills);
console.log(person2.getSkills);
console.log(person3.getSkills);

console.log(person1.getPersonInfo());
console.log(person2.getPersonInfo());
console.log(person3.getPersonInfo());
```

```sh
1
1
["HTML", "CSS", "JavaScript"]
["Planning", "Managing", "Organizing"]
[]
Asabeneh Yetayeh is 250. He lives Helsinki, Finland. He knows HTML, CSS and JavaScript
Lidiya Tekle is 28. He lives Espoo, Finland. He knows Planning, Managing and Organizing
John Doe is 50. He lives Mars city, Mars.
```

### Método Static

La palabra clave static define un método estático para una clase. Los métodos estáticos no se llaman en las instancias de la clase. En cambio, se llaman en la propia clase. A menudo se trata de funciones de utilidad, como las funciones para crear o clonar objetos. Un ejemplo de método estático es _Date.now()_. El método _now_ se llama directamente desde la clase.

```js
class Person {
  constructor(firstName, lastName, age, country, city) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.country = country;
    this.city = city;
    this.score = 0;
    this.skills = [];
  }
  getFullName() {
    const fullName = this.firstName + " " + this.lastName;
    return fullName;
  }
  get getScore() {
    return this.score;
  }
  get getSkills() {
    return this.skills;
  }
  set setScore(score) {
    this.score += score;
  }
  set setSkill(skill) {
    this.skills.push(skill);
  }
  getPersonInfo() {
    let fullName = this.getFullName();
    let skills =
      this.skills.length > 0 &&
      this.skills.slice(0, this.skills.length - 1).join(", ") +
        ` and ${this.skills[this.skills.length - 1]}`;

    let formattedSkills = skills ? `He knows ${skills}` : "";

    let info = `${fullName} is ${this.age}. He lives ${this.city}, ${this.country}. ${formattedSkills}`;
    return info;
  }
  static favoriteSkill() {
    const skills = ["HTML", "CSS", "JS", "React", "Python", "Node"];
    const index = Math.floor(Math.random() * skills.length);
    return skills[index];
  }
  static showDateTime() {
    let now = new Date();
    let year = now.getFullYear();
    let month = now.getMonth() + 1;
    let date = now.getDate();
    let hours = now.getHours();
    let minutes = now.getMinutes();
    if (hours < 10) {
      hours = "0" + hours;
    }
    if (minutes < 10) {
      minutes = "0" + minutes;
    }

    let dateMonthYear = date + "." + month + "." + year;
    let time = hours + ":" + minutes;
    let fullTime = dateMonthYear + " " + time;
    return fullTime;
  }
}

console.log(Person.favoriteSkill());
console.log(Person.showDateTime());
```

```sh
Node
15.1.2020 23:56
```

Los métodos estáticos son métodos que pueden ser utilizados como funciones de utilidad.

## Herencia

Utilizando la herencia podemos acceder a todas las propiedades y métodos de la clase padre. Esto reduce la repetición de código. Si recuerdas, tenemos una clase padre Persona y crearemos hijos a partir de ella. Nuestra clase de niños podría ser estudiante, enseñar, etc.

```js
// sintaxis
class ChildClassName extends {
 // el código va aquí
}
```

Vamos a crear una clase hija Student a partir de la clase padre Person.

```js
class Student extends Person {
  saySomething() {
    console.log("I am a child of the person class");
  }
}

const s1 = new Student("Asabeneh", "Yetayeh", "Finland", 250, "Helsinki");
console.log(s1);
console.log(s1.saySomething());
console.log(s1.getFullName());
console.log(s1.getPersonInfo());
```

```sh
Student {firstName: "Asabeneh", lastName: "Yetayeh", age: "Finland", country: 250, city: "Helsinki", …}
I am a child of the person class
Asabeneh Yetayeh
Student {firstName: "Asabeneh", lastName: "Yetayeh", age: "Finland", country: 250, city: "Helsinki", …}
Asabeneh Yetayeh is Finland. He lives Helsinki, 250.
```

### Anulación de métodos

Como puedes ver, conseguimos acceder a todos los métodos de la clase Persona y lo utilizamos en la clase hija Student. Podemos personalizar los métodos padre, podemos añadir propiedades adicionales a una clase hija. Si queremos personalizar, los métodos y si queremos añadir propiedades extra, necesitamos usar la función del constructor la clase hija también. Dentro de la función constructora llamamos a la función super() para acceder a todas las propiedades de la clase padre. La clase Persona no tenía género pero ahora vamos a dar la propiedad género para la clase hija, Student. Si se utiliza el mismo nombre de método en la clase hija, se anulará el método padre.

```js
class Student extends Person {
  constructor(firstName, lastName, age, country, city, gender) {
    super(firstName, lastName, age, country, city);
    this.gender = gender;
  }

  saySomething() {
    console.log("I am a child of the person class");
  }
  getPersonInfo() {
    let fullName = this.getFullName();
    let skills =
      this.skills.length > 0 &&
      this.skills.slice(0, this.skills.length - 1).join(", ") +
        ` and ${this.skills[this.skills.length - 1]}`;

    let formattedSkills = skills ? `He knows ${skills}` : "";
    let pronoun = this.gender == "Male" ? "He" : "She";

    let info = `${fullName} is ${this.age}. ${pronoun} lives in ${this.city}, ${this.country}. ${formattedSkills}`;
    return info;
  }
}

const s1 = new Student(
  "Asabeneh",
  "Yetayeh",
  250,
  "Finland",
  "Helsinki",
  "Male"
);
const s2 = new Student("Lidiya", "Tekle", 28, "Finland", "Helsinki", "Female");
s1.setScore = 1;
s1.setSkill = "HTML";
s1.setSkill = "CSS";
s1.setSkill = "JavaScript";

s2.setScore = 1;
s2.setSkill = "Planning";
s2.setSkill = "Managing";
s2.setSkill = "Organizing";

console.log(s1);

console.log(s1.saySomething());
console.log(s1.getFullName());
console.log(s1.getPersonInfo());

console.log(s2.saySomething());
console.log(s2.getFullName());
console.log(s2.getPersonInfo());
```

```sh
Student {firstName: "Asabeneh", lastName: "Yetayeh", age: 250, country: "Finland", city: "Helsinki", …}
Student {firstName: "Lidiya", lastName: "Tekle", age: 28, country: "Finland", city: "Helsinki", …}
I am a child of the person class
Asabeneh Yetayeh
Student {firstName: "Asabeneh", lastName: "Yetayeh", age: 250, country: "Finland", city: "Helsinki", …}
Asabeneh Yetayeh is 250. He lives in Helsinki, Finland. He knows HTML, CSS and JavaScript
I am a child of the person class
Lidiya Tekle
Student {firstName: "Lidiya", lastName: "Tekle", age: 28, country: "Finland", city: "Helsinki", …}
Lidiya Tekle is 28. She lives in Helsinki, Finland. He knows Planning, Managing and Organizing
```

Ahora, el método getPersonInfo ha sido anulado e identifica si la persona es hombre o mujer.

🌕 Eres excelente. Ahora, usted conoce las clases y tiene el poder de convertir todo en un objeto. Has llegado a la mitad de tu camino hacia la grandeza. Ahora haz algunos ejercicios para tu cerebro y para tu músculo.

## Ejercicios

### Ejercicios Nivel 1

1. Crea una clase de Animal. La clase tendrá propiedades de nombre, edad, color, piernas y creará diferentes métodos.
2. Cree una clase hijo de Perro y Gato a partir de la Clase Animal.

### Ejercicios Nivel 2

1. Sobrescribir el método que se crea en la clase Animal.

### Ejercicios Nivel 3

1. Intentemos desarrollar un programa que calcule la medida de tendencia central de una muestra (media, mediana, moda) y la medida de variabilidad (rango, variación, desviación estándar). Además de esas medidas, encuentre el mínimo, el máximo, el recuento, el porcentaje y la distribución de frecuencias de la muestra. Puedes crear una clase llamada Statistics y crear todas las funciones que hacen cálculos estadísticos como método para la clase Statistics. Comprueba el resultado que aparece a continuación.

```JS
ages = [31, 26, 34, 37, 27, 26, 32, 32, 26, 27, 27, 24, 32, 33, 27, 25, 26, 38, 37, 31, 34, 24, 33, 29, 26]

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
console.log('Frequency Distribution: ',statistics.freqDist()) // [(20.0, 26), (16.0, 27), (12.0, 32), (8.0, 37), (8.0, 34), (8.0, 33), (8.0, 31), (8.0, 24), (4.0, 38), (4.0, 29), (4.0, 25)]
```

```sh
// el resultado debería ser el siguiente
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

1. Crea una clase llamada PersonAccount. Tiene propiedades de nombre, apellido, ingresos, gastos y tiene métodos totalIncome, totalExpense, accountInfo,addIncome, addExpense y accountBalance. Los ingresos son un conjunto de ingresos y su descripción y los gastos son también un conjunto de gastos y su descripción.

🎉 ¡FELICITACIONES! 🎉

[<< Día 14](../java-script/dia-14-manejo-de-errores.md) | [Día 16>>](../java-script/dia-16-json.md)

[<< INDICE](../../../index.md)