

# Diagrama entidad relacion (Diagrama lógico DER)
- Los diagramas ER se componen de entidades, relaciones y atributos. También representan la cardinalidad, que define las relaciones en términos de números.
## Entidad
| **CONCRETA(tangible)** | **ABSTRACTO(intangible)** |
|------------------------|---------------------------|
| EMPLEADO               | CUENTA                    |
| CASA                   | CURSO                     |
| AUTO                   | MEMBRESIA                 |
### Entidad Fuerte
- Son independientes de otras entidades, tienen una clave primaria, que distinga a cada suceso de la entidad.

**![Entidad Fuerte](/5imagenes/entidad-relacion/entidadFuerte.jpg)**
### Entidad Debil
- Dependen de algun otro tipo de entidad, No tienen claves primarias.

**![Entidad Debil](/5imagenes/entidad-relacion/entidadDebil.jpg)**
## Atributos
**![Atributo](/5imagenes/entidad-relacion/atributo.jpg)**

### Normal o Simple
- Son las caracteristicas de una entidad, una relacion de muchos a muchos, o una relacion de uno a uno

**![Atributo Normal](/5imagenes/entidad-relacion/atributoNormal.jpg)**

### Clave Primaria
- serán los identificadores, tienen un valor único en cada entidad (ejemplo: matrícula de la entidad vehículo)

**![Atributo Principal](/5imagenes/entidad-relacion/atributoPrincipal.jpg)**

### Clave Debil

**![Atributo Debil](/5imagenes/entidad-relacion/atributoDebil.jpg)**

### Derivado
- se calculan o derivan de otro atributo, por ejemplo, la edad se calcula a partir de la fecha de nacimiento

**![Atributo Derivado](/5imagenes/entidad-relacion/atributoDerivado.jpg)**

### Multivalor
- se denota más de un valor del atributo, como varios números de teléfono para una persona.

**![Atributo Multivalor](/5imagenes/entidad-relacion/atributoMultivalor.jpg)**
### Especialización y genealización
- Herencia, la persona hereda sus atributos a : director, estudiante,etc.

**![Atributo Generalizacion](/5imagenes/entidad-relacion/atributoGeneralizacion.jpg)**
## Relaciones
- Las relaciones son asociaciones entre entidades, son vervos o acciones

**![relacion](/5imagenes/entidad-relacion/ralacion.jpg)**
### Normal
- son asociaciones entre dos o más entidades

**![Normal](/5imagenes/entidad-relacion/relacionNormal.jpg)**
### Debil
- son conexiones entre una entidad débil y su propietario

**![Debil](/5imagenes/entidad-relacion/relacionDebil.jpg)**
#### Tipos Entidad Debil
- Las entidades débiles, tienen relaciones débiles, no llevan atributo identificador principal, en su lugar tiene un "atributo discriminador" y su cardinalidad siempre será (1:N)

**![Tipos Debil](/5imagenes/entidad-relacion/tiposEntidadDebil.jpg)**
## Cardinalidad
### Cardinalidad uno a uno (1:1)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona unicamente  con un solo registro de una entidad B y viceversa

**![unoAuno](/5imagenes/entidad-relacion/cardinalidad1a1.jpg)**
### Cardinalidad uno a varios (1:N)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona únicamente con un registro de la entidad A.

**![unoAN](/5imagenes/entidad-relacion/cardinalidad1aN.jpg)**
### Cardinalidad varios a varios (N:N)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona únicamente con cero o varios registros de la entidad A.

**![nAN](/5imagenes/entidad-relacion/cardinalidadNaN.jpg)**
## Modelo de entidad relacion extendida
- Es un modelo de entidades de nivel más alto  y bajo que heredan  atributos  y se dividen en generalizacion y especificacion 
- Las entidades hijas heredan los atributos de la entidad padre como tambien la llave primaria 
- Las entidades hijas no pueden tener el mismo atributo 

**![gen](/5imagenes/entidad-relacion/gen.jpg)**
### Parcial exclusiva   
- Es parcial porque puede haber más empleados como: mesero, cajero, etc.
- Y es exclusiva porque el camarero no puede ser cocinero ni el camarero lava platos.

**![excl](/5imagenes/entidad-relacion/gen1.jpg)**
### Total exclusiva
- Es total porque no existe mas fichas y es exclusiva porque una ficha de autor no puede ser ficha de tema.

**![texcl](/5imagenes/entidad-relacion/gen2.jpg)**

### Parcial solapada
- Es parcial porque púede haber mas participantes como: actores, suplentes, etc.
- Y es solapada porque un director puede ser actor.

**![psol](/5imagenes/entidad-relacion/gen3.jpg)**
### Total solapada
- Es total porque solo puede haber esos jugadores en el equipo y es solapada porque una defensa puede ser un portero, un portero puede ser un centro campista, etc

**![psol](/5imagenes/entidad-relacion/gencuatro.jpg)**
## Modelo de entidad relacion y cardinalidad
### ER uno a uno (1:1)

**![ERunoAuno](/5imagenes/entidad-relacion/er1a1.jpg)**
### ER uno a varios (1:N)

**![ERunoAN](/5imagenes/entidad-relacion/er1aN.jpg)**
### ER varios a varios (N:N)

**![nAN](/5imagenes/entidad-relacion/erNaN.jpg)**
### ER varios a varios Debil(1:N)

**![nAND](/5imagenes/entidad-relacion/er1aNDebil.jpg)**
### ER varios a varios (N:N) con ER varios a varios DEbil(1:N)

**![com](/5imagenes/entidad-relacion/combinacion.jpg)**
## Cardinalidad y ordinalidad

**![cYO](/5imagenes/entidad-relacion/cardYord.jpg)**
### Cardinalidad
- es el numero maximo de veces que una instancia en una entidad se puede relacionar con instancias de otra entidad.

### Ordinalidad
- es el numero minimo de veces que una instancia en una entidad se puede asociar con una instancia en la entidad relacionada.
# Diagrama Entidad Relación (Diagrama Físico ER)
## Tipos de datos
- Los tipos de datos dependiendo al manejador pueden cambiar un poco, los mas básicos son los siguientes:

**![tiposD](/5imagenes/entidad-relacion/tiposDatos.jpg)**
- La finalidad al elegir el tipo de dato correcto es optimizar el uso de memoria.
## Constraints (Restricciones)
- El valor por defecto en una DB en Null
- Cuando no se meten datos el tipo es DEFAULT

| NOT NULL    | Se asegura que la columna no tenga valores nulos              |
|-------------|---------------------------------------------------------------|
| UNIQUE      | Se asegura que cada valor en la columna no se repita          |
| PRIMARY KEY | Es una combinación de NOT NULL y UNIQUE                       |
| FOREIGN KEY | Identifica de manera unica una tupla en otra tabla            |
| DEFAULT     | Coloca un valor por defecto cuando no hay un valor especifico |
| INDEX       | Se crea por columna para permitir búsquedas más rápidas       |

## Normalización
- La normalización es un proceso que se aplica a las bases de datos para organizar las tablas y evitar la redundancia o complejidad en los datos.
- La normalización de una base de datos es la aplicación de una serie de reglas para evitar a futuro realizar quierys o consultas innecesariamente complejas. En otras palabras están enfocadas en eliminar redundancias e inconsistencias de dependencia en el diseño de las tablas que creamos para organizar las bases de datos.
- Los datos redundantes desperdician el espacio de disco de tu pc, además de crear problemas de mantenimiento.
- Las bases de datos se normalizan para:

| Evitar la redundancia de datos                               |
|--------------------------------------------------------------|
| Proteger la integridad de los datos                          |
| Evitar problemas de actualización de los datos en las tablas |
| FOREIGN KEY                                                  |

### Primera forma normal (1FN)
- Todos los atribuots son atómicos.Un atributo es atómico si los elementos del dominio son simples e indivisibles.
- No debe existir variación en el número de columnas.
- Los campos no clave debe identificarse por la clave (dependencia funcional).
- Debe existir una independencia del orden tanto de las filas como de las columnas ; es decir, si los datos cambian de orden no deben cambiar sus signifados.

**![1FN](/5imagenes/entidad-relacion/1FN.jpg)**

#### Ejemplo

**![1FNE](/5imagenes/entidad-relacion/1FNE.jpg)**