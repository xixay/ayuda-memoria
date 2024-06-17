- [1. Diagrama entidad relacion (Diagrama lógico DER)](#1-diagrama-entidad-relacion-diagrama-lógico-der)
  - [1.1. Entidad](#11-entidad)
    - [1.1.1. Entidad Fuerte](#111-entidad-fuerte)
    - [1.1.2. Entidad Debil](#112-entidad-debil)
  - [1.2. Atributos](#12-atributos)
    - [1.2.1. Normal o Simple](#121-normal-o-simple)
    - [1.2.2. Clave Primaria](#122-clave-primaria)
    - [1.2.3. Clave Debil](#123-clave-debil)
    - [1.2.4. Derivado](#124-derivado)
    - [1.2.5. Multivalor](#125-multivalor)
    - [1.2.6. Especialización y genealización](#126-especialización-y-genealización)
  - [1.3. Relaciones](#13-relaciones)
    - [1.3.1. Normal](#131-normal)
    - [1.3.2. Debil](#132-debil)
      - [1.3.2.1. Tipos Entidad Debil](#1321-tipos-entidad-debil)
  - [1.4. Cardinalidad](#14-cardinalidad)
    - [1.4.1. Cardinalidad uno a uno (1:1)](#141-cardinalidad-uno-a-uno-11)
    - [1.4.2. Cardinalidad uno a varios (1:N)](#142-cardinalidad-uno-a-varios-1n)
    - [1.4.3. Cardinalidad varios a varios (N:N)](#143-cardinalidad-varios-a-varios-nn)
      - [1.4.3.1. Ejm 1](#1431-ejm-1)
      - [1.4.3.2. Ejm 2](#1432-ejm-2)
      - [1.4.3.3. Ejm 3](#1433-ejm-3)
      - [1.4.3.4. Ejm 4](#1434-ejm-4)
  - [1.5. Modelo de entidad relacion extendida](#15-modelo-de-entidad-relacion-extendida)
    - [1.5.1. Parcial exclusiva](#151-parcial-exclusiva)
    - [1.5.2. Total exclusiva](#152-total-exclusiva)
    - [1.5.3. Parcial solapada](#153-parcial-solapada)
    - [1.5.4. Total solapada](#154-total-solapada)
      - [1.5.4.1. Ejm 1](#1541-ejm-1)
      - [1.5.4.2. Ejm 2](#1542-ejm-2)
  - [1.6. Modelo de entidad relacion y cardinalidad](#16-modelo-de-entidad-relacion-y-cardinalidad)
    - [1.6.1. ER uno a uno (1:1)](#161-er-uno-a-uno-11)
    - [1.6.2. ER uno a varios (1:N)](#162-er-uno-a-varios-1n)
    - [1.6.3. ER varios a varios (N:N)](#163-er-varios-a-varios-nn)
    - [1.6.4. ER varios a varios Debil(1:N)](#164-er-varios-a-varios-debil1n)
    - [1.6.5. ER varios a varios (N:N) con ER varios a varios Debil(1:N)](#165-er-varios-a-varios-nn-con-er-varios-a-varios-debil1n)
  - [1.7. Cardinalidad y ordinalidad](#17-cardinalidad-y-ordinalidad)
    - [1.7.1. Cardinalidad](#171-cardinalidad)
    - [1.7.2. Ordinalidad](#172-ordinalidad)
- [2. Diagrama Entidad Relación (Diagrama Físico ER)](#2-diagrama-entidad-relación-diagrama-físico-er)
  - [2.1. Tipos de datos](#21-tipos-de-datos)
  - [2.2. Constraints (Restricciones)](#22-constraints-restricciones)
  - [2.3. Normalización](#23-normalización)
    - [2.3.1. Primera forma normal (1FN)](#231-primera-forma-normal-1fn)
      - [2.3.1.1. Ejemplo](#2311-ejemplo)
    - [2.3.2. Segunda forma normal (2FN)](#232-segunda-forma-normal-2fn)
    - [2.3.3. Tercera forma normal (3FN)](#233-tercera-forma-normal-3fn)
      - [2.3.3.1. Ejemplo mas simplificado](#2331-ejemplo-mas-simplificado)
      - [2.3.3.2. Segundo Ejemplo](#2332-segundo-ejemplo)
- [3. Base de datos PostgreSQL](#3-base-de-datos-postgresql)
  - [3.1. Definición Base de Datos](#31-definición-base-de-datos)
    - [3.1.1. Componentes Clave de una Base de Datos](#311-componentes-clave-de-una-base-de-datos)
  - [3.2. Tipos de Bases de Datos](#32-tipos-de-bases-de-datos)
  - [3.3. Operaciones Comunes en una Base de Datos](#33-operaciones-comunes-en-una-base-de-datos)
    - [3.3.1. CRUD](#331-crud)
    - [3.3.2. Consultas (Queries)](#332-consultas-queries)
  - [3.4. Conceptos Fundamentales](#34-conceptos-fundamentales)
    - [3.4.1. Llave Primaria (Primary Key)](#341-llave-primaria-primary-key)
    - [3.4.2. Llave Foránea (Foreign Key)](#342-llave-foránea-foreign-key)
    - [3.4.3. Índices (Indexes)](#343-índices-indexes)
    - [3.4.4. Llave Única (Unique Key)](#344-llave-única-unique-key)
    - [3.4.5. Constraint (Restricción)](#345-constraint-restricción)
  - [3.5. POSTGRESQL](#35-postgresql)
  - [3.6. Ventajas](#36-ventajas)
  - [3.7. Interacción con comandos](#37-interacción-con-comandos)
  - [3.8. Jerarquia de base de datos](#38-jerarquia-de-base-de-datos)
  - [3.9. Instalar PostgreSql Ubuntu](#39-instalar-postgresql-ubuntu)
  - [3.10. Instalar PgAdmin](#310-instalar-pgadmin)
    - [3.10.1. Instalar la clave pública para el repositorio (si no lo hizo anteriormente):](#3101-instalar-la-clave-pública-para-el-repositorio-si-no-lo-hizo-anteriormente)
    - [3.10.2. Crea el archivo de configuración del repositorio:](#3102-crea-el-archivo-de-configuración-del-repositorio)
    - [3.10.3. Instalar tanto para el modo de escritorio como para el web:](#3103-instalar-tanto-para-el-modo-de-escritorio-como-para-el-web)
    - [3.10.4. Instalar solo para modo de escritorio:](#3104-instalar-solo-para-modo-de-escritorio)
    - [3.10.5. Instalar solo para modo web:](#3105-instalar-solo-para-modo-web)
    - [3.10.6. Configure el servidor web, si instaló pgadmin4-web:](#3106-configure-el-servidor-web-si-instaló-pgadmin4-web)
  - [3.11. Utilizar roles y bases de datos de PostgreSQL](#311-utilizar-roles-y-bases-de-datos-de-postgresql)
    - [3.11.1. Cambiar cuenta de postgres](#3111-cambiar-cuenta-de-postgres)
    - [3.11.2. Acceder a la linea de comandos sin cambiar de cuenta](#3112-acceder-a-la-linea-de-comandos-sin-cambiar-de-cuenta)
  - [3.12. Crear un nuevo rol](#312-crear-un-nuevo-rol)
    - [3.12.1. Crear un nuevo usuario](#3121-crear-un-nuevo-usuario)
  - [3.13. Comandos más utilizados](#313-comandos-más-utilizados)
  - [3.14. Ejemplo modelo de base de datos](#314-ejemplo-modelo-de-base-de-datos)
  - [3.15. Crear Base datos](#315-crear-base-datos)
  - [3.16. Abrir la linea de comandos de Postgres con el nuevo rol](#316-abrir-la-linea-de-comandos-de-postgres-con-el-nuevo-rol)
    - [3.16.1. De forma directa](#3161-de-forma-directa)
    - [3.16.2. Conectarse a una base de datos diferente](#3162-conectarse-a-una-base-de-datos-diferente)
    - [3.16.3. Asignar privilegios a un usuario sobre una base de datos](#3163-asignar-privilegios-a-un-usuario-sobre-una-base-de-datos)
    - [3.16.4. Cambiar la contraseña de un usuario](#3164-cambiar-la-contraseña-de-un-usuario)
  - [3.17. Diagrama Entidad Relación BD](#317-diagrama-entidad-relación-bd)
  - [3.18. Diagrama Entidad BD](#318-diagrama-entidad-bd)
  - [3.19. Crear esquemas](#319-crear-esquemas)
    - [3.19.1. Cambiar al esquema creado](#3191-cambiar-al-esquema-creado)
  - [3.20. Crear tablas](#320-crear-tablas)
  - [3.21. Mostrar información sobre una tabla específica](#321-mostrar-información-sobre-una-tabla-específica)
  - [3.22. Agregar datos en una tabla](#322-agregar-datos-en-una-tabla)
  - [3.23. Ver datos en una tabla](#323-ver-datos-en-una-tabla)
  - [3.24. Eliminar datos en una tabla](#324-eliminar-datos-en-una-tabla)
  - [3.25. Agregar columnas en una tabla](#325-agregar-columnas-en-una-tabla)
  - [3.26. Eliminar columnas en una tabla](#326-eliminar-columnas-en-una-tabla)
  - [3.27. Actualizar datos de una tabla](#327-actualizar-datos-de-una-tabla)
  - [3.28. Relacion 1 a 1](#328-relacion-1-a-1)
  - [3.29. Relacion 1 a N](#329-relacion-1-a-n)
  - [3.30. Relacion N a N](#330-relacion-n-a-n)
  - [3.31. SQL JOINS](#331-sql-joins)
  - [3.32. INNER JOIN](#332-inner-join)
  - [3.33. LEFT JOIN (LEFT OUTER JOIN)](#333-left-join-left-outer-join)
  - [3.34. LEFT JOIN (A - B)](#334-left-join-a---b)
  - [3.35. RIGHT JOIN (RIGHT OUTER JOIN)](#335-right-join-right-outer-join)
  - [3.36. RIGHT JOIN (B-A)](#336-right-join-b-a)
  - [3.37. VIEW](#337-view)
    - [3.37.1. Caracteristicas](#3371-caracteristicas)
  - [3.38. TEMPORAL](#338-temporal)
  - [3.39. FUNCION](#339-funcion)
  - [3.40. TRIGGER](#340-trigger)
  - [3.41. PARTITION](#341-partition)
    - [3.41.1. Funciones de Ventana](#3411-funciones-de-ventana)
  - [3.42. PROCEDURE](#342-procedure)
  - [3.43. SUMA](#343-suma)
  - [3.44. COUNT](#344-count)
  - [3.45. SUB CLAUSULAS (WITH)](#345-sub-clausulas-with)


# 1. Diagrama entidad relacion (Diagrama lógico DER)
- Los diagramas ER se componen de entidades, relaciones y atributos. También representan la cardinalidad, que define las relaciones en términos de números.
## 1.1. Entidad
| **CONCRETA(tangible)** | **ABSTRACTO(intangible)** |
|------------------------|---------------------------|
| EMPLEADO               | CUENTA                    |
| CASA                   | CURSO                     |
| AUTO                   | MEMBRESIA                 |
### 1.1.1. Entidad Fuerte
- Son independientes de otras entidades, tienen una clave primaria, que distinga a cada suceso de la entidad.

**![Entidad Fuerte](/5imagenes/entidad-relacion/entidadFuerte.jpg)**
### 1.1.2. Entidad Debil
- Dependen de algun otro tipo de entidad, No tienen claves primarias.

**![Entidad Debil](/5imagenes/entidad-relacion/entidadDebil.jpg)**
## 1.2. Atributos
**![Atributo](/5imagenes/entidad-relacion/atributo.jpg)**

### 1.2.1. Normal o Simple
- Son las caracteristicas de una entidad, una relacion de muchos a muchos, o una relacion de uno a uno

**![Atributo Normal](/5imagenes/entidad-relacion/atributoNormal.jpg)**

### 1.2.2. Clave Primaria
- serán los identificadores, tienen un valor único en cada entidad (ejemplo: matrícula de la entidad vehículo)

**![Atributo Principal](/5imagenes/entidad-relacion/atributoPrincipal.jpg)**

### 1.2.3. Clave Debil

**![Atributo Debil](/5imagenes/entidad-relacion/atributoDebil.jpg)**

### 1.2.4. Derivado
- se calculan o derivan de otro atributo, por ejemplo, la edad se calcula a partir de la fecha de nacimiento

**![Atributo Derivado](/5imagenes/entidad-relacion/atributoDerivado.jpg)**

### 1.2.5. Multivalor
- se denota más de un valor del atributo, como varios números de teléfono para una persona.

**![Atributo Multivalor](/5imagenes/entidad-relacion/atributoMultivalor.jpg)**
### 1.2.6. Especialización y genealización
- Herencia, la persona hereda sus atributos a : director, estudiante,etc.

**![Atributo Generalizacion](/5imagenes/entidad-relacion/atributoGeneralizacion.jpg)**
## 1.3. Relaciones
- Las relaciones son asociaciones entre entidades, son vervos o acciones

**![relacion](/5imagenes/entidad-relacion/ralacion.jpg)**
### 1.3.1. Normal
- son asociaciones entre dos o más entidades

**![Normal](/5imagenes/entidad-relacion/relacionNormal.jpg)**
### 1.3.2. Debil
- son conexiones entre una entidad débil y su propietario

**![Debil](/5imagenes/entidad-relacion/relacionDebil.jpg)**
#### 1.3.2.1. Tipos Entidad Debil
- Las entidades débiles, tienen relaciones débiles, no llevan atributo identificador principal, en su lugar tiene un "atributo discriminador" y su cardinalidad siempre será (1:N)

**![Tipos Debil](/5imagenes/entidad-relacion/tiposEntidadDebil.jpg)**
## 1.4. Cardinalidad
### 1.4.1. Cardinalidad uno a uno (1:1)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona unicamente  con un solo registro de una entidad B y viceversa

**![unoAuno](/5imagenes/entidad-relacion/cardinalidad1a1.jpg)**
### 1.4.2. Cardinalidad uno a varios (1:N)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona únicamente con un registro de la entidad A.

**![unoAN](/5imagenes/entidad-relacion/cardinalidad1aN.jpg)**
### 1.4.3. Cardinalidad varios a varios (N:N)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona únicamente con cero o varios registros de la entidad A.

**![nAN](/5imagenes/entidad-relacion/cardinalidadNaN.jpg)**

#### 1.4.3.1. Ejm 1
- Obtener el diagrama entidad relación con las tres entidades siguientes:
  - ESTUDIANTE(num_matricula, nombre_e, fecha_nacimiento, telefono)
  - ASIGANTURA(codigo_asignatura, nombre_a)
  - DOCENTE(id_docente, nombre_d,ci,especialidad, telefono)
- Teniendo en cuenta
  - Un estudiante puede estar matriculado en una o varias asignaturas.
  - En una asignatura habrá como mínimo 10 y como máximo 25 estudiantes.
  - Un docente podrá impartir varias asignaturas.
  - Una signatura es impartida por un único docente.
  - Se quiere saber el curso escolar en el que cada estudiante está matriculado de cada asignatura
  
**![est](/5imagenes/entidad-relacion/estudiante.jpg)**
#### 1.4.3.2. Ejm 2
- Dada las 4 entidades realizar el diagrama E/R:
  - EMPLEADO(id_empleado, nombre_e, salario, telefono)
  - LOCALIDAD(id_localidad, nombre)
  - PROVINCIA(id_provincia, nombre_pro)
  - REGION(id_region, nombre_re)
- Se quiere guardar información de la localidad donde ha nacido cada uno de los empleados teniendo en cuenta que:
  - Un empleado ha nacido en una sola localidad
  - Cada localidad pertenence a una única provincia
  - Cada provincia pertenece a una única región del país.
  
**![prov](/5imagenes/entidad-relacion/provincia.jpg)**
#### 1.4.3.3. Ejm 3
- Una empresa dedicada a la instalación de dormitorios juveniles a medida quiere relizar una base de datos donde se reflejen las ventas y montajes, para lo cual se tiene en cuenta:
  - Cada modelo de dormitorio lo debe montar al menos dos empleados
  - El mismo empleado puede montar varios modelos de dormitorios.
  - De cada modelo dormitorio nos interesa conocer su código de modelo
  - El mismo empleado puede montar el mismo modelo en diferentes fechas. Nos interesa conocer la fecha en la que realiza cada montaje
  - De un empleado nos interesa su id_empleado, nombre dirección, telefono de contacto y el número de dormitorios que ha montado de cada modelo.
  - Cada modelo de dormitorio puede ser comprado por uno o varios clientes y el mismo cliente podrá comprar uno o varios dormitorios. De un cliente nos interesa su id_cliente, nombre_cli, direccion_cli, telefono_cli y fecha de compra de cada modelo.
  
**![dorm](/5imagenes/entidad-relacion/dormitorio.jpg)**
#### 1.4.3.4. Ejm 4
- El hospital tiene varias plantas, cada una de las cuales tiene un nombre y una cantidad de camas.
- Las camas que están en los niveles tienen un código que las identifican.
- Los pacientes cuentan con un número de seguro, ci y nombre, cada vez que el paciente llega al hospital se anota en su historia una fecha de entrada y una salida.
- A su vez cuando llega al hospital y es internadose le aigna una cama.
- Existen médicos que atienden a las pacientes, estas atenciones las denominan visitas medicas.
  
**![hosp](/5imagenes/entidad-relacion/hospitalDer.jpg)**
## 1.5. Modelo de entidad relacion extendida
- Es un modelo de entidades de nivel más alto  y bajo que heredan  atributos  y se dividen en generalizacion y especificacion 
- Las entidades hijas heredan los atributos de la entidad padre como tambien la llave primaria 
- Las entidades hijas no pueden tener el mismo atributo 

**![gen](/5imagenes/entidad-relacion/gen.jpg)**
### 1.5.1. Parcial exclusiva   
- Es parcial porque puede haber más empleados como: mesero, cajero, etc.
- Y es exclusiva porque el camarero no puede ser cocinero ni el camarero lava platos.

**![excl](/5imagenes/entidad-relacion/gen1.jpg)**
### 1.5.2. Total exclusiva
- Es total porque no existe mas fichas y es exclusiva porque una ficha de autor no puede ser ficha de tema.

**![texcl](/5imagenes/entidad-relacion/gen2.jpg)**

### 1.5.3. Parcial solapada
- Es parcial porque púede haber mas participantes como: actores, suplentes, etc.
- Y es solapada porque un director puede ser actor.

**![psol](/5imagenes/entidad-relacion/gen3.jpg)**
### 1.5.4. Total solapada
- Es total porque solo puede haber esos jugadores en el equipo y es solapada porque una defensa puede ser un portero, un portero puede ser un centro campista, etc

**![psol](/5imagenes/entidad-relacion/gencuatro.jpg)**

#### 1.5.4.1. Ejm 1
- En una empresa existen varios empleados conatributos como nombre, codigo del empleado, dirección, telefono, fecha de Nacimiento, salario; los empleados se dividen en arquitecto, indicando el numero de matricula y numero de proyecto, tambien existen administrativos que tiene cargo y nivel, tambien existen los ingenieros que tienen una especialidad y años de experiencia.

**![emp](/5imagenes/entidad-relacion/empresa.jpg)**

#### 1.5.4.2. Ejm 2
- Le contratan para hacer una BD que permita apoyar la gestión de un sistema de ventas. La empresa necesita llevar un control de proveedores, clientes, productos y ventas. Un proveedor tiene un RUT, nombre, dirección, telefono y página web.
- Un cliente tambien tiene RUT, nombre, dirección, pero puede tener varios teléfonos de contacto. 
- La dirección se entiende por calle, numero, comuna y ciudad.
- Un producto tiene un id único, nombre, precio actual stock y nombre del proveedor. Ademas se organizan en categorías y cada producto va sólo en una categoría.
- Una categoría tiene id, nombre y descripción.
- Por razones de contabilidad, se debe registrar la información de cada venta con un id, fecha, cliente, descuento y monto final.
- Ademas se debe guardar el precio al momento de la venta, la cantidad vendida y el monto total por el producto.

**![ven](/5imagenes/entidad-relacion/ventas.jpg)**
## 1.6. Modelo de entidad relacion y cardinalidad
### 1.6.1. ER uno a uno (1:1)

**![ERunoAuno](/5imagenes/entidad-relacion/er1a1.jpg)**
### 1.6.2. ER uno a varios (1:N)

**![ERunoAN](/5imagenes/entidad-relacion/er1aN.jpg)**
### 1.6.3. ER varios a varios (N:N)

**![nAN](/5imagenes/entidad-relacion/erNaN.jpg)**
### 1.6.4. ER varios a varios Debil(1:N)

**![nAND](/5imagenes/entidad-relacion/er1aNDebil.jpg)**
### 1.6.5. ER varios a varios (N:N) con ER varios a varios Debil(1:N)

**![com](/5imagenes/entidad-relacion/combinacion.jpg)**
## 1.7. Cardinalidad y ordinalidad

**![cYO](/5imagenes/entidad-relacion/cardYord.jpg)**
### 1.7.1. Cardinalidad
- es el numero maximo de veces que una instancia en una entidad se puede relacionar con instancias de otra entidad.

### 1.7.2. Ordinalidad
- es el numero minimo de veces que una instancia en una entidad se puede asociar con una instancia en la entidad relacionada.
# 2. Diagrama Entidad Relación (Diagrama Físico ER)
## 2.1. Tipos de datos
- Los tipos de datos dependiendo al manejador pueden cambiar un poco, los mas básicos son los siguientes:

**![tiposD](/5imagenes/entidad-relacion/tiposDatos.jpg)**
- La finalidad al elegir el tipo de dato correcto es optimizar el uso de memoria.
## 2.2. Constraints (Restricciones)
- El valor por defecto en una DB en Null
- Cuando no se meten datos el tipo es DEFAULT

| NOT NULL    | Se asegura que la columna no tenga valores nulos              |
|-------------|---------------------------------------------------------------|
| UNIQUE      | Se asegura que cada valor en la columna no se repita          |
| PRIMARY KEY | Es una combinación de NOT NULL y UNIQUE                       |
| FOREIGN KEY | Identifica de manera unica una tupla en otra tabla            |
| DEFAULT     | Coloca un valor por defecto cuando no hay un valor especifico |
| INDEX       | Se crea por columna para permitir búsquedas más rápidas       |

## 2.3. Normalización
- La normalización es un proceso que se aplica a las bases de datos para organizar las tablas y evitar la redundancia o complejidad en los datos.
- La normalización de una base de datos es la aplicación de una serie de reglas para evitar a futuro realizar quierys o consultas innecesariamente complejas. En otras palabras están enfocadas en eliminar redundancias e inconsistencias de dependencia en el diseño de las tablas que creamos para organizar las bases de datos.
- Los datos redundantes desperdician el espacio de disco de tu pc, además de crear problemas de mantenimiento.
- Las bases de datos se normalizan para:

| Evitar la redundancia de datos                               |
|--------------------------------------------------------------|
| Proteger la integridad de los datos                          |
| Evitar problemas de actualización de los datos en las tablas |
| FOREIGN KEY                                                  |

### 2.3.1. Primera forma normal (1FN)
- Todos los atribuots son atómicos.Un atributo es atómico si los elementos del dominio son simples e indivisibles.
- No debe existir variación en el número de columnas.
- Los campos no clave debe identificarse por la clave (dependencia funcional).
- Debe existir una independencia del orden tanto de las filas como de las columnas ; es decir, si los datos cambian de orden no deben cambiar sus signifados.

**![1FN](/5imagenes/entidad-relacion/1FN.jpg)**

#### 2.3.1.1. Ejemplo

**![1FNE](/5imagenes/entidad-relacion/1FNE.jpg)**
### 2.3.2. Segunda forma normal (2FN)
- Debe cumplir la 1FN.
- No tiene dependencia parcial.Es decir, todos los atributos no claves son totalmente dependientes de la la clave primaria  

**![2FN](/5imagenes/entidad-relacion/2FN.jpg)**

### 2.3.3. Tercera forma normal (3FN)
- Se encuentra en 2FN.
- No existe ninguna dependencia funcional transitiva en los atributos que no son clave.
- Esta FN se traduce en que aquellos datos que no pertenecen a la entidad deben tener una independencia de las demás y debe tener un campo clave propio.
- Aplicando 3FN separamos la tabla alumnos ya que contiene datos de los cursos en ella quedando de la siguiente manera.

**![3FN](/5imagenes/entidad-relacion/3FN.jpg)**

#### 2.3.3.1. Ejemplo mas simplificado

**![3FNS](/5imagenes/entidad-relacion/3FNS.jpg)**
#### 2.3.3.2. Segundo Ejemplo
- Se llevara a la 3ra forma normal la siguiente tabla
**![3FNS2](/5imagenes/entidad-relacion/3FNS2.jpg)**

- Se separa los nombres
**![3FNS2](/5imagenes/entidad-relacion/3FNS2-1.jpg)**

- Se simplifica la matería
**![3FNS2](/5imagenes/entidad-relacion/3FNS2-2.jpg)**

- Se simplifica lo demas
**![3FNS2](/5imagenes/entidad-relacion/3FNS2-3.jpg)**
# 3. Base de datos PostgreSQL
## 3.1. Definición Base de Datos
- Una base de datos es una colección de datos estructurados y organizados que permite el almacenamiento y recuperación eficiente de información. Está diseñada para manejar grandes volúmenes de datos y soportar múltiples tipos de operaciones de datos, tales como inserciones, actualizaciones, eliminaciones y consultas.
### 3.1.1. Componentes Clave de una Base de Datos
- Tablas (Tables): Las tablas son la estructura principal dentro de una base de datos relacional y están formadas por filas (registros) y columnas (campos). Cada tabla almacena datos relacionados en un formato tabular.
- Filas (Rows): Cada fila en una tabla representa un único registro de datos.
- Columnas (Columns): Cada columna en una tabla representa un campo de datos específico y define el tipo de datos que se puede almacenar en esa columna.
- Esquema (Schema): Un esquema es la estructura que define la organización de la base de datos, incluyendo las tablas, vistas, índices, procedimientos almacenados, etc. En PostgreSQL, un esquema es también un contenedor lógico dentro de una base de datos.
## 3.2. Tipos de Bases de Datos
- Bases de Datos Relacionales (RDBMS): Utilizan tablas para almacenar datos y usan SQL (Structured Query Language) para gestionar y manipular datos. Ejemplos incluyen PostgreSQL, MySQL, Oracle, y SQL Server.
- Bases de Datos NoSQL: Diseñadas para manejar grandes volúmenes de datos no estructurados y distribuidos. Ejemplos incluyen MongoDB, Cassandra, y Redis.
## 3.3. Operaciones Comunes en una Base de Datos
### 3.3.1. CRUD
- Acrónimo que representa las cuatro operaciones básicas de manipulación de datos:
  - Create (Crear): Insertar nuevos registros en una tabla.
  - Read (Leer): Consultar y recuperar datos de la base de datos.
  - Update (Actualizar): Modificar datos existentes.
  - Delete (Eliminar): Eliminar registros de una tabla.
### 3.3.2. Consultas (Queries)
- Utilización de SQL para buscar y recuperar datos específicos según criterios determinados.
## 3.4. Conceptos Fundamentales
- En PostgreSQL (y en sistemas de bases de datos relacionales en general), las llaves primarias y foráneas son conceptos fundamentales para asegurar la integridad y la relación de los datos. 
### 3.4.1. Llave Primaria (Primary Key)
- Una llave primaria es una columna o un conjunto de columnas que identifica de manera única a cada fila en una tabla. Las características principales de una llave primaria son:
  - Unicidad: Cada valor en la columna de la llave primaria debe ser único.
  - No Nulo: Los valores en la columna de la llave primaria no pueden ser nulos.
  - Indice Implícito: PostgreSQL crea automáticamente un índice único en la columna de la llave primaria para optimizar las búsquedas y las operaciones de consulta.
```sql
CREATE TABLE empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100)
);
--En este ejemplo, empleado_id es la llave primaria de la tabla empleados.
```
### 3.4.2. Llave Foránea (Foreign Key)
- Una llave foránea es una columna o un conjunto de columnas en una tabla que se refiere a la llave primaria de otra tabla. La llave foránea asegura que los valores en la columna de referencia existan en la tabla relacionada, manteniendo la integridad referencial.
```sql
CREATE TABLE departamentos (
    departamento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);
--En este ejemplo, departamento_id en la tabla empleados es una llave foránea que se refiere a departamento_id en la tabla departamentos.
```
### 3.4.3. Índices (Indexes)
- Los índices son estructuras que mejoran la velocidad de las operaciones de consulta en una tabla. Aunque los índices mejoran el rendimiento de las consultas, también pueden ralentizar las operaciones de inserción, actualización y eliminación.
```sql
CREATE INDEX idx_nombre ON empleados(nombre);
--Este comando crea un índice en la columna nombre de la tabla empleados.
```
### 3.4.4. Llave Única (Unique Key)
- Una llave única es una columna o un conjunto de columnas en una tabla que garantiza que los valores almacenados sean únicos en todas las filas de la tabla. A diferencia de la llave primaria, una tabla puede tener múltiples llaves únicas y las columnas de llaves únicas pueden aceptar valores nulos.
```sql
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    nombre VARCHAR(100)
);
--En este ejemplo, email debe ser único en toda la tabla usuarios.
```
### 3.4.5. Constraint (Restricción)
- Las restricciones son reglas aplicadas a las columnas de una tabla para garantizar la exactitud y la fiabilidad de los datos en la base de datos. Algunos tipos comunes de restricciones incluyen:
  - NOT NULL: Asegura que una columna no puede tener valores nulos.
  - CHECK: Asegura que los valores en una columna cumplen una condición específica.
  - DEFAULT: Define un valor por defecto para una columna cuando no se proporciona ningún valor.
```sql
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC CHECK (precio > 0),
    stock INT DEFAULT 0
);
--En este ejemplo, email debe ser único en toda la tabla usuarios.
```
## 3.5. POSTGRESQL
- PostgreSQL es un potente sistema de base de datos relacional de objetos de código abierto con más de 35 años de desarrollo activo que le ha ganado una sólida reputación por su confiabilidad, solidez de funciones y rendimiento.
## 3.6. Ventajas
- Instalación ilimitada y gratuita
- Gran escalabilidad
- Estabilidad y confiabilidad
- Estandar SQL
- Potencia y robustez
- Extensibilidad
- pgAdmin
## 3.7. Interacción con comandos
- La consola en PostgreSQL es una herramienta muy potente para crear, administrar y depurar nuestra base de datos, podemos acceder a ella después de instalar PostgreSQL
## 3.8. Jerarquia de base de datos
- Servidor de base de datos: Computador que tiene un motor de base de datos instalado y en ejecución.
- Motor de base de datos: Software que provee un conjunto de servicios encargados de administrar una base de datos
- Base de datos: Grupo de datos que pertenencen a un mismo contexto.
- Esquemas de base de datos en PostgreSQL: Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias)
- Tablas de base de datos: Estructura de datos: Estructura que organiza los datos en filas y columnas formando una matriz.
## 3.9. Instalar PostgreSql Ubuntu
- Actualizar primero:
```console
sudo apt update
```
- Instale el paquete de Postgres junto con un paquete -contrib
```console
sudo apt install postgresql postgresql-contrib
```
## 3.10. Instalar PgAdmin
### 3.10.1. Instalar la clave pública para el repositorio (si no lo hizo anteriormente):
```console
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
```
### 3.10.2. Crea el archivo de configuración del repositorio:
```console
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
```
### 3.10.3. Instalar tanto para el modo de escritorio como para el web:
```console
sudo apt install pgadmin4
```
### 3.10.4. Instalar solo para modo de escritorio:
```console
sudo apt install pgadmin4-desktop
```
### 3.10.5. Instalar solo para modo web: 
```console
sudo apt install pgadmin4-web 
```
### 3.10.6. Configure el servidor web, si instaló pgadmin4-web:
```console
sudo /usr/pgadmin4/bin/setup-web.sh
```
## 3.11. Utilizar roles y bases de datos de PostgreSQL
### 3.11.1. Cambiar cuenta de postgres
- Cambie a la cuenta de postgres en su servidor, para ello ingrese con su usuario:
```console
sudo -i -u postgres
```
- Acceder de inmediato a una línea de comandos de PostgresSQL
```console
sudo -i -u postgres psql
```
- Salir
```console
\q
```
### 3.11.2. Acceder a la linea de comandos sin cambiar de cuenta
- Con lo siguiente
```console
sudo -u postgres psql
```
## 3.12. Crear un nuevo rol
### 3.12.1. Crear un nuevo usuario
- Normalmente
```console
CREATE USER nombre_de_tu_usuario WITH PASSWORD 'tu_contraseña';
```
- Crear un nuevo usuario con sudo:
```console
sudo -u postgres createuser --interactive
```
- Otorgar privilegios al usuario (opcional):
- Puedes asignar privilegios específicos al nuevo usuario. Por ejemplo, para otorgarle todos los privilegios en todas las bases de datos, puedes hacer lo siguiente:
```console
ALTER USER nombre_de_tu_usuario WITH SUPERUSER;
```
- Salir de la consola de PostgreSQL:
```console
\q
```
## 3.13. Comandos más utilizados

**`\?` listar todos los comandos** 

***Comandos de navegación y consulta de información***

- **`\c`** Saltar entre bases de datos
- **`\l`** Listar base de datos disponibles
- **`\dt`** Listar las tablas de la base de datos
- **`\d <nombre_tabla>`** Describir una tabla
- **`\dn`** Listar los esquemas de la base de datos actual
- **`\df`** Listar las funciones disponibles de la base de datos actual
- **`\dv`** Listar las vistas de la base de datos actual
- **`\du`** Listar los usuarios y sus roles de la base de datos actual

***Comandos de inspección y ejecución***

- **`\g`** Volver a ejecutar el comando ejecutando justo antes
- **`\s`** Ver el historial de comandos ejecutados
- **`\s <nombre_archivo>`** Si se quiere guardar la lista de comandos ejecutados en un archivo de texto plano
- **`\i <nombre_archivo>`** Ejecutar los comandos desde un archivo
- **`\e`** Permite abrir un editor de texto plano, escribir comandos y ejecutar en lote. **\e** abre el editor de texto, escribir allí todos los comandos, luego guardar los cambios y cerrar, al cerrar se ejecutarán todos los comandos guardados.
- **`\ef`** Equivalente al comando anterior pero permite editar también funciones en PostgreSQL
## 3.14. Ejemplo modelo de base de datos
- Este modelo de base de datos representa información de usuarios y sus actividades. La entidad "Usuarios" contiene datos personales como nombre, teléfono, email, y detalles como ocupación y fecha de nacimiento. Además, se almacena la fecha de registro y una foto. Las entidades relacionadas incluyen "Experiencias" (con nombre y descripción), "Redes Sociales" (con nombre y foto), "Habilidades" (con icono, nombre y descripción), "Tecnologías" (con nombre y foto), y "Proyectos" (con nombre, foto, descripción y enlace). Estas entidades se conectan a la entidad "Usuarios" a través de claves foráneas, permitiendo organizar y acceder a información detallada sobre las experiencias, habilidades y proyectos asociados a cada usuario.

## 3.15. Crear Base datos
- Iniciar sesion con la cuenta postgres y crear la base de datos
```console
CREATE DATABASE nombre_de_tu_base_de_datos;
```
## 3.16. Abrir la linea de comandos de Postgres con el nuevo rol
### 3.16.1. De forma directa
- También podrá hacerlo de forma directa:
```console
sudo -u nombre_de_tu_usuario psql
```
### 3.16.2. Conectarse a una base de datos diferente
- Si desea que su usuario se conecte a una base de datos diferente, puede lograrlo especificando la base de datos de esta manera:
```console
psql -d otra_base_de_datos -U tu_nuevo_usuario
```
- Ya que inició sesión, puede verificar la información de su conexión actual escribiendo lo siguiente:
```console
\conninfo
```
```text
Output
You are connected to database "otra_base_de_datos" as user "tu_nuevo_usuario" via socket in "/var/run/postgresql" at port "5432".
```
### 3.16.3. Asignar privilegios a un usuario sobre una base de datos
```console
GRANT ALL PRIVILEGES ON DATABASE nombre_de_tu_base_de_datos TO nombre_de_usuario;
```
### 3.16.4. Cambiar la contraseña de un usuario
```console
ALTER USER nombre_de_usuario WITH PASSWORD 'nueva_contraseña';
```

## 3.17. Diagrama Entidad Relación BD
**![eder](/5imagenes/entidad-relacion/ejmDER.jpg)**
## 3.18. Diagrama Entidad BD
**![ede](/5imagenes/entidad-relacion/ejmDE.jpg)**
## 3.19. Crear esquemas
- La sintaxis básica para la creación de esquemas es la siguiente
```sql  
CREATE SCHEMA IF NOT EXISTS core;
CREATE SCHEMA IF NOT EXISTS portafolio;
```
### 3.19.1. Cambiar al esquema creado
- La sintaxis básica para cambiar al esquema creado es la siguiente
```sql  
SET search_path TO core;
```
## 3.20. Crear tablas
- La sintaxis básica para la creación de tablas es la siguiente
```sql
-- Creación de la tabla de usuarios
CREATE TABLE IF NOT EXISTS core.usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000),
    fecha_reg TIMESTAMP DEFAULT NOW()
);

-- Creación de la tabla de habilidades
CREATE TABLE IF NOT EXISTS portafolio.habilidades (
    id_habilidad SERIAL PRIMARY KEY,
    icono VARCHAR(2000),
    nombre VARCHAR(2000),
    descripcion TEXT
);
-- Creación de la tabla intermedia para la relación n:n entre usuarios y habilidades
CREATE TABLE IF NOT EXISTS core.usuarios_habilidades (
    id_usuario_habilidad SERIAL PRIMARY KEY,
    id_usuario INTEGER,
    id_habilidad INTEGER,
    CONSTRAINT fk_usuario_habilidad_usuario FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario),
    CONSTRAINT fk_usuario_habilidad_habilidad FOREIGN KEY (id_habilidad) REFERENCES portafolio.habilidades(id_habilidad)
);
-- Creación de la tabla de proyectos
CREATE TABLE IF NOT EXISTS core.proyectos (
    id_proyecto SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    descripcion TEXT,
    link VARCHAR(2000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_proyecto FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Creación de la tabla de redes sociales
CREATE TABLE IF NOT EXISTS core.redes_sociales (
    id_red_social SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_red_social FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);


-- Creación de la tabla de tecnologías
CREATE TABLE IF NOT EXISTS portafolio.tecnologias (
    id_tecnologia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_tecnologia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Creación de la tabla de experiencias
CREATE TABLE IF NOT EXISTS portafolio.experiencias (
    id_experiencia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    descripcion text,
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_experiencia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

```
## 3.21. Mostrar información sobre una tabla específica
- Linea de comandos de Postgres
```console
\d core.usuarios;
```

| Columna      | Tipo                        | Ordenamiento | Nulable  | Por omisión                                   |
|-------------- |-----------------------------|--------------|----------|-----------------------------------------------|
| id_usuario    | integer                     |              | not null | nextval('core.usuarios_id_usuario_seq'::regclass) |
| nombre        | character varying(2000)     |              |          |                                               |
| telefono      | integer                     |              |          |                                               |
| email         | character varying(100)      |              |          |                                               |
| descripcion   | text                        |              |          |                                               |
| ocupacion     | character varying(2000)     |              |          |                                               |
| fecha_nac     | date                        |              |          |                                               |
| foto          | character varying(5000)     |              |          |                                               |
| fecha_reg     | timestamp without time zone |              |          | now()                                         |

Índices:
- "usuarios_pkey" PRIMARY KEY, btree (id_usuario)

Referenciada por:
- TABLE "core.usuarios_habilidades" CONSTRAINT "fk_usuario_habilidad_usuario" FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
- TABLE "core.proyectos" CONSTRAINT "fk_usuario_proyecto" FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
- TABLE "core.redes_sociales" CONSTRAINT "fk_usuario_red_social" FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)


## 3.22. Agregar datos en una tabla
- Como ejemplo, añada datos en cada una de las tablas en la que desea agregar, nombrar las columnas y, luego, proporcionar datos para cada una de ellas:
```sql
-- Inserción de datos en la tabla core.usuarios
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto, fecha_reg) 
VALUES 
('Sakura Haruno', 123456789, 'sakura@example.com', 'Ninja médica de Konoha', 'Ninja', '1995-03-28', 'sakura.jpg', NOW()),
('Asuka Langley Soryu', 987654321, 'asuka@example.com', 'Piloto del Evangelion Unidad-02', 'Piloto de Eva', '2001-12-04', 'asuka.jpg', NOW());

-- Inserción de datos en la tabla core.proyectos
INSERT INTO core.proyectos (nombre, foto, descripcion, link, id_usuario) 
VALUES 
('Proyecto de Sakura', 'proyecto_sakura.jpg', 'Desarrollo de técnicas médicas ninja', 'https://github.com/sakura/proyecto', 1),
('Proyecto de Asuka', 'proyecto_asuka.jpg', 'Defensa contra los Ángeles', 'https://github.com/asuka/proyecto', 2);

-- Inserción de datos en la tabla core.redes_sociales
INSERT INTO core.redes_sociales (nombre, foto, id_usuario) 
VALUES 
('Twitter', 'twitter_icon.jpg', 1),
('Webex', 'webex_icon.jpg', 1),
('Instagram', 'instagram_icon.jpg', 2);

-- Inserción de datos en la tabla portafolio.habilidades
INSERT INTO portafolio.habilidades (icono, nombre, descripcion) 
VALUES 
('habilidad_icon_1.jpg', 'Jutsu Médico', 'Máxima habilidad en técnicas médicas ninja, especializada en jutsu de curación.'),
('habilidad_icon_2.jpg', 'Piloto de Evangelion', 'Habilidad excepcional como piloto de la Unidad-02 en la lucha contra los Ángeles.');

-- Inserción de datos en la tabla portafolio.tecnologias
INSERT INTO portafolio.tecnologias (nombre, foto, id_usuario) 
VALUES 
('Jutsu Médico', 'tecnologia_jutsu_medico.jpg', 1),
('Piloto de Evangelion', 'tecnologia_piloto_evangelion.jpg', 2);

-- Inserción de datos en la tabla portafolio.experiencias
INSERT INTO portafolio.experiencias (nombre, descripcion, id_usuario) 
VALUES 
('Misión de Protección en Konoha', 'Participación en misiones como ninja médica para proteger la aldea de Konoha.', 1),
('Defensa contra los Ángeles', 'Piloto de la Unidad-02 en la lucha contra los Ángeles para proteger la humanidad.', 2);

-- Inserción de datos en la tabla core.usuarios_habilidades (relación n:n)
INSERT INTO core.usuarios_habilidades (id_usuario, id_habilidad)
VALUES (1, 1),(1, 2),(2, 1),(2, 2);

```
## 3.23. Ver datos en una tabla
- Ver la tabla usuarios
```sql
SELECT * FROM core.usuarios;
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|
|----------|------|--------|-----|-----------|---------|---------|----|---------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 00:22:27.218|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 00:22:27.218|

## 3.24. Eliminar datos en una tabla
- Eliminar los datos de una fila que contiene tabla
```sql
-- Eliminar el jutsu medico de Sakura de la tabla tecnologias
DELETE FROM portafolio.tecnologias WHERE nombre = 'Jutsu Médico';
```
- Consultar la tabla de nuevo
```sql
SELECT * FROM portafolio.tecnologias;
```

|id_tecnologia|nombre|foto|id_usuario|
|-------------|------|----|----------|
|2|Piloto de Evangelion|tecnologia_piloto_evangelion.jpg|2|


## 3.25. Agregar columnas en una tabla
- Agregue una columna para mostrar la herramienta que usa por cada chica escribiendo lo siguiente
```sql
ALTER TABLE portafolio.tecnologias ADD COLUMN herramienta VARCHAR(50);
```
- Si vuelve a ver la información de su tabla, observará que se agregó la columna nueva, pero no se ingresaron datos
```sql
SELECT * FROM portafolio.tecnologias;
```

|id_tecnologia|nombre|foto|id_usuario|herramienta|
|-------------|------|----|----------|-----------|
|2|Piloto de Evangelion|tecnologia_piloto_evangelion.jpg|2||

## 3.26. Eliminar columnas en una tabla
- Eliminar la columna
```sql
--eliminar herramienta
ALTER TABLE portafolio.tecnologias DROP herramienta;
```
## 3.27. Actualizar datos de una tabla
- Puede actualizar los valores de una entrada existente buscando el registro que desee y fijando el valor que prefiera utilizar para la columna:
```sql
--actualizar foto
UPDATE portafolio.tecnologias SET foto = 'tecnologia_eva01.jpg' WHERE nombre = 'Piloto de Evangelion';
```
- Puede verificar la eficacia de la operación consultando los datos de nuevo:
```sql
SELECT * FROM portafolio.tecnologias;
```

|id_tecnologia|nombre|foto|id_usuario|
|-------------|------|----|----------|
|2|Piloto de Evangelion|tecnologia_eva01.jpg|2|


## 3.28. Relacion 1 a 1
**![a11](/5imagenes/entidad-relacion/anime_1_1.png)**
- Asumiremos que usuarios tiene una relacion de 1:1 con la tabla tecnologias, un usuario posee 1 tecnología
```sql
--relacion 1:1
SELECT  u.id_usuario, u.nombre as nombre_usuario,u.telefono,u.email,u.descripcion,u.ocupacion,u.fecha_nac,u.foto as foto_usuario,u.fecha_reg,
        t.id_tecnologia,t.nombre as nombre_tecnologia,t.foto as foto_tecnologia 
FROM    core.usuarios u, portafolio.tecnologias t
WHERE   u.id_usuario=t.id_usuario AND u.id_usuario =1;
```
|id_usuario|nombre_usuario|telefono|email|descripcion|ocupacion|fecha_nac|foto_usuario|fecha_reg|id_tecnologia|nombre_tecnologia|foto_tecnologia|
|----------|--------------|--------|-----|-----------|---------|---------|------------|---------|-------------|-----------------|---------------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|1|Jutsu Médico|tecnologia_jutsu_medico.jpg|

## 3.29. Relacion 1 a N
**![a1n](/5imagenes/entidad-relacion/anime_1_n.png)**
- Usuarios tiene una relación de 1:N con la tabla redes_sociales, un usuario puede tener muchas redes sociales
```sql
--relacion 1:N
SELECT  u.id_usuario ,u.nombre as nombre_usuario,
        rs.nombre as nombre_red_social, rs.foto as foto_red_social 
FROM    core.usuarios u ,core.redes_sociales rs 
WHERE   u.id_usuario=rs.id_usuario AND u.id_usuario =1 ;
```

|id_usuario|nombre_usuario|nombre_red_social|foto_red_social|
|----------|--------------|-----------------|---------------|
|1|Sakura Haruno|Twitter|twitter_icon.jpg|
|1|Sakura Haruno|Webex|webex_icon.jpg|

## 3.30. Relacion N a N
**![ann](/5imagenes/entidad-relacion/anime_n_n.png)**
- Usuarios tiene una relación de N:N con la tabla habilidades, muchos usuarios pueden tener muchas habilidades
```sql
--relacion N:N
SELECT  u.id_usuario,u.nombre as nombre_usuario,
        h.id_habilidad ,h.nombre as habilidad
FROM    core.usuarios u,portafolio.habilidades h ,core.usuarios_habilidades uh
WHERE   TRUE
        AND u.id_usuario=uh.id_usuario AND h.id_habilidad=uh.id_habilidad  AND (u.id_usuario =1 OR u.id_usuario=2) ;
```
|id_usuario|nombre_usuario|id_habilidad|habilidad|
|----------|--------------|------------|---------|
|1|Sakura Haruno|1|Jutsu Médico|
|1|Sakura Haruno|2|Piloto de Evangelion|
|2|Asuka Langley Soryu|1|Jutsu Médico|
|2|Asuka Langley Soryu|2|Piloto de Evangelion|

## 3.31. SQL JOINS
- En SQL, existen varios tipos de joins que permiten combinar registros de dos o más tablas en función de una condición relacionada.
**![aj](/5imagenes/entidad-relacion/sqljoin.jpeg)**
## 3.32. INNER JOIN
- El INNER JOIN se utiliza para combinar filas de dos o más tablas basándose en una condición de relación entre ellas. Solo devuelve las filas donde hay coincidencias en todas las tablas involucradas, en resumen es la intersecciòn de las tres tablas
**![aij](/5imagenes/entidad-relacion/anime-inner-join.png)**
```sql
--INNER JOIN:
--Recupera las habilidades de los usuarios que tienen habilidades registradas.
SELECT  u.id_usuario, u.nombre as nombre_usuario,
		    h.nombre AS habilidad_nombre
FROM 	  core.usuarios u
		    INNER JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
		    INNER JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
order by u.id_usuario ;
``` 
|id_usuario|nombre_usuario|habilidad_nombre|
|----------|--------------|----------------|
|1|Sakura Haruno|Jutsu Médico|
|1|Sakura Haruno|Piloto de Evangelion|
|2|Asuka Langley Soryu|Jutsu Médico|
|2|Asuka Langley Soryu|Piloto de Evangelion|

## 3.33. LEFT JOIN (LEFT OUTER JOIN)
- El LEFT JOIN es un tipo de operación de unión que devuelve todos los registros de la tabla de la izquierda (en este caso core.usuarios), y los registros coincidentes de la tabla de la derecha (en este caso core.proyectos). Si no hay coincidencias en la tabla de la derecha, se devolverán valores nulos en las columnas de esa tabla.

**![alj](/5imagenes/entidad-relacion/anime-left-join.png)**
```sql
--LEFT JOIN
--Obtener todos los usuarios y sus proyectos (si tienen alguno)
SELECT  u.*, 
        p.nombre AS proyecto_nombre
FROM    core.usuarios u
        LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario;
--En el ejemplo:
--Sakura Haruno tiene un proyecto llamado "Proyecto de Sakura".
--Asuka Langley Soryu tiene un proyecto llamado "Proyecto de Asuka".
--Si un usuario no tiene proyectos (por ejemplo, si agregamos un usuario nuevo sin proyectos), aparecerá con NULL en la columna proyecto_nombre.
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|proyecto_nombre|
|----------|------|--------|-----|-----------|---------|---------|----|---------|---------------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Proyecto de Sakura|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Proyecto de Asuka|

## 3.34. LEFT JOIN (A - B) 
- Para realizar una consulta que utilice la diferencia de conjuntos (A - B) entre las tablas core.usuarios y portafolio.tecnologias en PostgreSQL, y para entender cómo se relacionan estos conjuntos, podemos usar una operación de LEFT JOIN con una condición que excluya los registros que tienen correspondencia en ambas tablas.

**![aloj](/5imagenes/entidad-relacion/anime-a-b.png)**
```sql
--LEFT JOIN
--Obtener los usuarios que están en core.usuarios pero no tienen ninguna entrada correspondiente en portafolio.tecnologias.
SELECT  u.*,
        t.id_tecnologia,
        t.nombre AS tecnologia_nombre,
        t.foto AS tecnologia_foto
FROM    core.usuarios u
        LEFT JOIN portafolio.tecnologias t ON u.id_usuario = t.id_usuario
WHERE   t.id_usuario IS NULL;
--core.usuarios u: Especificamos la tabla de usuarios como el conjunto A.
--portafolio.tecnologias t: Especificamos la tabla de tecnologías como el conjunto B.
--Realizamos un LEFT JOIN para combinar los usuarios con las tecnologías basado en id_usuario.
--La condición asegura que solo se seleccionen los registros de core.usuarios que no tienen una correspondencia en portafolio.tecnologias, es decir, los usuarios que no están asociados a ninguna tecnología.
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|id_tecnologia|tecnologia_nombre|tecnologia_foto|
|----------|------|--------|-----|-----------|---------|---------|----|---------|-------------|-----------------|---------------|
|21|Nuevo Usuario|123456789|nuevo@usuario.com|Descripción|Ocupación|2000-01-01|foto.jpg|2024-01-22 20:44:33.476||||
|22|Nuevo Usuario2|987654321|nuevo2@usuario.com|Descripción|Ocupación|2000-01-01|foto2.jpg|2024-01-22 20:55:57.484||||

## 3.35. RIGHT JOIN (RIGHT OUTER JOIN)
- Un Right Join en PostgreSQL devuelve todos los registros de la tabla de la derecha (en este caso, core.usuarios) y los registros de la tabla de la izquierda (en este caso, core.proyectos) que tienen una coincidencia en la condición especificada (p.id_usuario = u.id_usuario). Si no hay ninguna coincidencia en la tabla de la izquierda, los campos de esa tabla tendrán valores nulos en el resultado.

**![arj](/5imagenes/entidad-relacion/anime-rigth-join.png)**
```sql
--RIGHT JOIN
-- Obtener todos los proyectos y sus usuarios (incluso si no tienen un usuario asociado)
SELECT  p.*, 
        u.nombre AS usuario_nombre
FROM    core.proyectos p
        RIGHT JOIN core.usuarios u ON p.id_usuario = u.id_usuario;
--Se muestran todos los usuarios, incluso aquellos que no tienen proyectos asociados (Nuevo Usuario y Nuevo Usuario2).
--Los registros de proyectos se muestran solo cuando hay una coincidencia con usuarios.
--Los campos de id_proyecto, nombre, foto, descripcion y link son NULL para los registros de usuarios que no tienen coincidencias en proyectos.
```
|id_proyecto|nombre|foto|descripcion|link|id_usuario|usuario_nombre|
|-----------|------|----|-----------|----|----------|--------------|
|1|Proyecto de Sakura|proyecto_sakura.jpg|Desarrollo de técnicas médicas ninja|https://github.com/sakura/proyecto|1|Sakura Haruno|
|2|Proyecto de Asuka|proyecto_asuka.jpg|Defensa contra los Ángeles|https://github.com/asuka/proyecto|2|Asuka Langley Soryu|
|||||||Nuevo Usuario|
|||||||Nuevo Usuario2|

## 3.36. RIGHT JOIN (B-A)
- Para obtener la diferencia de conjuntos (B - A) entre las tablas usuarios y proyectos utilizando un RIGHT JOIN en PostgreSQL, puedes seguir este enfoque:

**![arj](/5imagenes/entidad-relacion/anime-b-a.png)**
```sql
--RIGHT JOIN
-- Representar los usuarios que no tienen proyectos asociados.
SELECT  p.*,
        u.nombre AS usuario_nombre
FROM    core.proyectos p
        RIGHT JOIN core.usuarios u ON p.id_usuario = u.id_usuario
WHERE p.id_proyecto IS NULL;
--El resultado de esta consulta sería una tabla que muestra información detallada de los usuarios que no tienen proyectos asociados. Esto incluiría todos los campos de usuarios y los campos relevantes de proyectos serán NULL.
```
|id_proyecto|nombre|foto|descripcion|link|id_usuario|usuario_nombre|
|-----------|------|----|-----------|----|----------|--------------|
|||||||Nuevo Usuario|
|||||||Nuevo Usuario2|

## 3.37. VIEW
- Un view en SQL (también conocido como vista) es una representación virtual de datos que se deriva de una o más tablas base. Se define mediante una consulta SQL almacenada que actúa como una tabla virtual cuyos resultados se pueden consultar como si fueran datos reales de una tabla.
### 3.37.1. Caracteristicas
- Consulta definida: Un view se crea utilizando una consulta SELECT que especifica cómo se deben combinar, filtrar o transformar los datos de las tablas base.
- Almacenamiento virtual: A diferencia de una tabla física, un view no almacena datos por sí mismo. En su lugar, almacena la consulta que define los datos a mostrar.
- Actualización automática: Cuando consultas un view, los datos que se muestran se calculan en tiempo real basándose en los datos actuales de las tablas base. Esto asegura que los datos del view estén siempre actualizados.
- Seguridad y simplificación: Los views pueden utilizarse para simplificar consultas complejas, ocultar detalles de implementación de las tablas base y controlar el acceso a los datos mostrando solo la información relevante.
```sql
--View
-- Crear una vista que muestre la información del usuario y sus habilidades
CREATE VIEW vw_usuario_habilidades AS
SELECT u.*, h.nombre AS habilidad_nombre
FROM core.usuarios u
INNER JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
INNER JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad;
--Esta vista combina datos de las tablas usuarios, usuarios_habilidades y habilidades. La consulta INNER JOIN une los usuarios con las habilidades que poseen, mostrando todas las columnas de usuarios junto con el nombre de la habilidad (habilidad_nombre) que cada usuario posee.
```
- Para mostrar los datos del view
```sql
-- Seleccionar todos los datos de la vista vw_usuario_habilidades
SELECT * FROM vw_usuario_habilidades;
--un view en SQL es una herramienta poderosa para simplificar consultas, mejorar la seguridad y asegurar que los datos presentados estén siempre actualizados según las tablas base.
```

|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|habilidad_nombre|
|----------|------|--------|-----|-----------|---------|---------|----|---------|----------------|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Jutsu Médico|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Jutsu Médico|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Piloto de Evangelion|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Piloto de Evangelion|

## 3.38. TEMPORAL
- En SQL, la palabra clave "TEMPORAL" se refiere a la creación de una tabla temporal. Una tabla temporal es una tabla que existe solo por el tiempo de vida de la conexión de la base de datos, es decir, se elimina automáticamente al finalizar la conexión. 
```sql
--temporal
-- Crear una tabla temporal para almacenar usuarios con proyectos
CREATE TEMPORARY TABLE temp_usuarios_proyectos AS
SELECT u.*, p.nombre AS proyecto_nombre
FROM core.usuarios u
LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario;
--Esta consulta crea una tabla temporal llamada "temp_usuarios_proyectos" que almacena datos de usuarios junto con el nombre de sus proyectos, provenientes de las tablas "usuarios" y "proyectos" de la base de datos "core".
```
- Para mostrar los datos de la tabla temporal
```sql
-- Seleccionar todos los datos de la tabla temporal temp_usuarios_proyectos
SELECT * FROM temp_usuarios_proyectos;
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|proyecto_nombre|
|----------|------|--------|-----|-----------|---------|---------|----|---------|---------------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Proyecto de Sakura|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Proyecto de Asuka|

## 3.39. FUNCION
- Una función en SQL es un bloque de código que puede realizar operaciones y devolver un valor, facilitando la reutilización de código y la realización de cálculos o transformaciones de datos de manera modular y consistente.
- Crear la función
```sql
--Funcion
-- Crear una función que calcule la edad a partir de la fecha de nacimiento
CREATE OR REPLACE FUNCTION calcular_edad(fecha_nac DATE) RETURNS INTEGER AS $$
    SELECT EXTRACT(YEAR FROM age(CURRENT_DATE, fecha_nac));
$$ LANGUAGE SQL;
--CREATE OR REPLACE FUNCTION calcular_edad(fecha_nac DATE): Define una nueva función llamada calcular_edad que acepta un parámetro fecha_nac de tipo DATE.
--RETURNS INTEGER: Especifica que la función devuelve un valor de tipo entero (INTEGER).
--AS $$ ... $$: Delimita el cuerpo de la función.
--SELECT EXTRACT(YEAR FROM age(CURRENT_DATE, fecha_nac)): Dentro del cuerpo de la función, se usa la función age para calcular la diferencia entre la fecha actual (CURRENT_DATE) y la fecha de nacimiento (fecha_nac), y luego se extrae el componente de años de esa diferencia.
--LANGUAGE SQL: Indica que el cuerpo de la función está escrito en SQL.
```
- Usar la funcion
```sql
--Funcion
-- Llamada a la función para obtener la edad de un usuario
SELECT u.nombre as nombre_usuario, calcular_edad(fecha_nac) AS edad FROM core.usuarios u;
--SELECT u.nombre AS nombre_usuario, calcular_edad(u.fecha_nac) AS edad: Selecciona el nombre del usuario y la edad calculada usando la función calcular_edad.
--FROM core.usuarios u: Especifica la tabla usuarios en el esquema core y le asigna el alias u para facilitar la referencia a sus columnas.
```
|nombre_usuario|edad|
|--------------|----|
|Sakura Haruno|28|
|Asuka Langley Soryu|22|

## 3.40. TRIGGER
- Un trigger en SQL es un tipo de objeto que permite ejecutar automáticamente un conjunto de instrucciones cuando ocurre un evento específico en una tabla o vista. Los eventos que pueden activar un trigger incluyen operaciones de INSERT, UPDATE, o DELETE. Los triggers se utilizan para mantener la integridad de los datos, auditar cambios o realizar cálculos automáticos.
- Creación de la función para el trigger
```sql
--TRIGGER
-- Crear un trigger que actualice la fecha de registro cada vez que se inserta un nuevo usuario
CREATE OR REPLACE FUNCTION actualizar_fecha_registro()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_reg := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--CREATE OR REPLACE FUNCTION actualizar_fecha_registro(): Define una nueva función llamada actualizar_fecha_registro que no toma parámetros y devuelve un tipo TRIGGER.
--RETURNS TRIGGER: Especifica que la función devuelve un tipo TRIGGER.
--BEGIN ... END;: Delimita el bloque de código de la función.
--NEW.fecha_reg := NOW();: Asigna la fecha y hora actuales a la columna fecha_reg del nuevo registro (NEW).
--RETURN NEW;: Devuelve el nuevo registro modificado.
--LANGUAGE plpgsql;: Indica que la función está escrita en PL/pgSQL, el lenguaje procedimental de PostgreSQL.
```
- Creación del trigger
```sql
CREATE TRIGGER trigger_actualizar_fecha_registro
BEFORE INSERT ON core.usuarios
FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_registro();
--CREATE TRIGGER trigger_actualizar_fecha_registro: Define un nuevo trigger llamado trigger_actualizar_fecha_registro.
--BEFORE INSERT ON core.usuarios: Especifica que el trigger se ejecuta antes de cada operación de INSERT en la tabla usuarios en el esquema core.
--FOR EACH ROW: Indica que el trigger se ejecutará una vez por cada fila que se inserte.
--EXECUTE FUNCTION actualizar_fecha_registro();: Especifica que se debe ejecutar la función actualizar_fecha_registro cuando el trigger se active.
```
- Uso del trigger: Cuando se inserta un nuevo usuario en la tabla usuarios, el trigger se activa automáticamente y actualiza la columna fecha_reg con la fecha y hora actuales. Aquí hay un ejemplo de cómo insertar un nuevo usuario:
```sql
-- Insertar un nuevo usuario (el trigger actualizará la fecha de registro)
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto)
VALUES ('Nuevo Usuario', 123456789, 'nuevo@usuario.com', 'Descripción', 'Ocupación', '2000-01-01', 'foto.jpg');

```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|
|----------|------|--------|-----|-----------|---------|---------|----|---------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|
|3|Nuevo Usuario|123456789|nuevo@usuario.com|Descripción|Ocupación|2000-01-01|foto.jpg|2024-01-22 20:44:33.476|
- En este ejemplo, la columna fecha_reg se actualizará automáticamente con la fecha y hora actuales debido al trigger que hemos creado.
## 3.41. PARTITION
- En SQL, una partición es una forma de dividir los resultados de una consulta en subconjuntos lógicos, permitiendo aplicar funciones de agregación o ventana a cada uno de estos subconjuntos por separado. Esto se logra utilizando la cláusula PARTITION BY en funciones de ventana.
```sql
--PARTITION
-- Calcular la cantidad de proyectos por usuario utilizando PARTITION
SELECT p.id_usuario, COUNT(*) OVER (PARTITION BY p.id_usuario) AS cantidad_proyectos
FROM core.proyectos p;
--SELECT p.id_usuario: Selecciona la columna id_usuario de la tabla proyectos.
--COUNT(*) OVER (PARTITION BY p.id_usuario) AS cantidad_proyectos: Calcula la cantidad de proyectos para cada usuario utilizando la función de ventana COUNT(*) OVER. La cláusula PARTITION BY p.id_usuario divide los resultados en particiones donde cada partición contiene todas las filas con el mismo id_usuario. Luego, COUNT(*) cuenta el número de filas en cada partición.
--FROM core.proyectos p: Especifica la tabla proyectos en el esquema core y le asigna el alias p.
```
|id_usuario|cantidad_proyectos|
|----------|------------------|
|1|1|
|2|1|
|3|1|
### 3.41.1. Funciones de Ventana
- Las funciones de ventana como COUNT() OVER, SUM() OVER, AVG() OVER, etc., se aplican a cada partición independientemente.
- Estas funciones no colapsan las filas como lo hacen las funciones de agregación tradicionales (COUNT, SUM, etc.) cuando se usan con GROUP BY.
## 3.42. PROCEDURE
- Un procedimiento almacenado (stored procedure) es un conjunto de instrucciones SQL que se guardan y se ejecutan en el servidor de base de datos. Los procedimientos almacenados permiten encapsular lógica compleja, simplificar la gestión de transacciones y mejorar el rendimiento al reducir la cantidad de tráfico entre la aplicación y la base de datos.
- Creación del procedimiento almacenado
```sql
--PROCEDIMIENTO
-- Crear un procedimiento almacenado que inserte un nuevo usuario
CREATE OR REPLACE PROCEDURE insertar_usuario(
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000)
)
AS $$
BEGIN
    INSERT INTO core.usuarios(nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto)
    VALUES (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto);
END;
$$ LANGUAGE plpgsql;
--CREATE OR REPLACE PROCEDURE insertar_usuario(...): Define un nuevo procedimiento almacenado llamado insertar_usuario con varios parámetros que corresponden a las columnas de la tabla usuarios.
--AS $$ ... $$: Delimita el cuerpo del procedimiento almacenado.
--BEGIN ... END;: Delimita el bloque de código que se ejecutará cuando se llame al procedimiento.
--INSERT INTO core.usuarios(...) VALUES (...): Inserta un nuevo registro en la tabla usuarios con los valores proporcionados como parámetros.
--LANGUAGE plpgsql: Indica que el procedimiento está escrito en PL/pgSQL, el lenguaje procedimental de PostgreSQL.
```
- Llamada al procedimiento
```sql
-- Llamada al procedimiento para insertar un nuevo usuario
CALL insertar_usuario('Nuevo Usuario2', 987654321, 'nuevo2@usuario.com', 'Descripción', 'Ocupación', '2000-01-01', 'foto2.jpg');
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|
|----------|------|--------|-----|-----------|---------|---------|----|---------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|
|3|Nuevo Usuario|123456789|nuevo@usuario.com|Descripción|Ocupación|2000-01-01|foto.jpg|2024-01-22 20:44:33.476|
|4|Nuevo Usuario2|987654321|nuevo2@usuario.com|Descripción|Ocupación|2000-01-01|foto2.jpg|2024-01-22 20:55:57.484|
## 3.43. SUMA
- En SQL, la suma se refiere a la operación de agregar los valores de una columna específica en las filas seleccionadas de una tabla. La función SUM() se utiliza para realizar esta operación de agregación.
```sql
--SUMA
-- Calcular la suma de los id_usuario agrupada por usuario que tiene mas de una red social
SELECT rs.id_usuario, SUM(rs.id_usuario) AS suma_id_usuarios
FROM core.redes_sociales rs
where rs.id_usuario =1
GROUP BY rs.id_usuario;
--SELECT rs.id_usuario: Selecciona la columna id_usuario de la tabla redes_sociales.
--SUM(rs.id_usuario) AS suma_id_usuarios: Calcula la suma de los valores en la columna id_usuario para cada grupo definido por GROUP BY. La suma se etiqueta como suma_id_usuarios.
--FROM core.redes_sociales rs: Especifica la tabla redes_sociales en el esquema core, y se le asigna el alias rs.
--WHERE rs.id_usuario = 1: Filtra las filas para incluir solo aquellas donde id_usuario es 1.
--GROUP BY rs.id_usuario: Agrupa las filas por el valor de id_usuario.
```
|id_usuario|suma_id_usuarios|
|----------|----------------|
|1|2|
- Para ilustrar un caso más general, donde sumamos los id_usuario de todos los usuarios que tienen más de una red social:
```sql
-- Calcular la suma de los id_usuario agrupada por usuario que tiene más de una red social
SELECT rs.id_usuario, SUM(rs.id_usuario) AS suma_id_usuarios
FROM core.redes_sociales rs
GROUP BY rs.id_usuario
HAVING COUNT(rs.id_red_social) > 1;
```
|id_usuario|suma_id_usuarios|
|----------|----------------|
|1|2|
## 3.44. COUNT
- La función COUNT() en SQL se utiliza para contar el número de filas que cumplen con un criterio específico. Puede ser usada de varias maneras para contar diferentes tipos de valores en una consulta.
```sql
--COUNT
-- Contar la cantidad de usuarios agrupada por nombre
SELECT nombre, COUNT(*) AS cantidad_usuarios
FROM core.usuarios
GROUP BY nombre;
--SELECT nombre, COUNT(*) AS cantidad_usuarios: Selecciona la columna nombre y cuenta el número de filas para cada nombre usando COUNT(*). El resultado se etiqueta como cantidad_usuarios.
--FROM core.usuarios: Especifica la tabla usuarios en el esquema core.
--GROUP BY nombre: Agrupa las filas por el valor en la columna nombre, de modo que COUNT(*) cuente el número de filas en cada grupo.
```
|nombre|cantidad_usuarios|
|------|-----------------|
|Sakura Haruno|1|
|Nuevo Usuario|1|
|Asuka Langley Soryu|1|
|Nuevo Usuario2|1|
- otro ejm
```sql
-- Calcular la cantidad de habilidades por usuario
SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
FROM core.usuarios u
LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
GROUP BY u.id_usuario
order by u.id_usuario ;
--SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades: Selecciona el id_usuario y cuenta el número de habilidades asociadas a cada usuario (h.id_habilidad), etiquetando el resultado como cantidad_habilidades.
--FROM core.usuarios u: Especifica la tabla usuarios en el esquema core con el alias u.
--LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario: Realiza una unión externa izquierda con la tabla usuarios_habilidades para asociar cada usuario con sus habilidades.
--LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad: Realiza otra unión externa izquierda con la tabla habilidades para obtener información detallada sobre las habilidades.
--GROUP BY u.id_usuario: Agrupa las filas por id_usuario para contar el número de habilidades por cada usuario.
--ORDER BY u.id_usuario: Ordena los resultados por id_usuario.
```

|id_usuario|cantidad_habilidades|
|----------|--------------------|
|1|2|
|2|2|
|3|1|
|4|1|

- COUNT(*) vs COUNT(column_name):
  - COUNT(*) cuenta todas las filas en cada grupo, independientemente de los valores en las columnas.
  - COUNT(column_name) cuenta las filas donde column_name no es NULL.
- Uso de GROUP BY:
  - La cláusula GROUP BY agrupa las filas que tienen el mismo valor en las columnas especificadas, permitiendo que las funciones de agregación como COUNT() se apliquen a cada grupo por separado.
- Uniones en SQL:
  - LEFT JOIN incluye todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha. Si no hay coincidencia, los resultados de la tabla derecha serán NULL.
## 3.45. SUB CLAUSULAS (WITH)
- La cláusula WITH en SQL se utiliza para definir subconsultas, también conocidas como Common Table Expressions (CTEs), que se pueden utilizar dentro de una consulta principal. Los CTEs permiten estructurar consultas complejas de manera más legible y modular..
- Consulta simple con WITH:Obtener la cantidad de usuarios en la tabla usuarios.
```sql
-- Ejemplo simple de uso de WITH para contar usuarios
WITH usuarios_cte AS (
     SELECT COUNT(*) AS cantidad_usuarios
     FROM core.usuarios
)
SELECT cantidad_usuarios
FROM usuarios_cte;
--WITH usuarios_cte AS (...): Define un CTE llamado usuarios_cte que cuenta el número de usuarios en la tabla usuarios.
--SELECT cantidad_usuarios FROM usuarios_cte;: Selecciona el resultado del CTE para mostrar la cantidad de usuarios.
```
|cantidad_usuarios|
|-----------------|
|22|

- Consulta con WITH para usuarios y habilidades:Obtener la cantidad de habilidades por usuario.
```sql
-- Ejemplo de uso de WITH para contar habilidades por usuario
WITH habilidades_por_usuario AS (
    SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
    FROM core.usuarios u
    LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
    LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
    GROUP BY u.id_usuario
)
SELECT id_usuario, cantidad_habilidades
FROM habilidades_por_usuario
ORDER BY id_usuario;
--WITH habilidades_por_usuario AS (...): Define un CTE llamado habilidades_por_usuario que cuenta las habilidades por usuario.
--SELECT id_usuario, cantidad_habilidades FROM habilidades_por_usuario;: Selecciona y muestra el resultado del CTE.
```
|id_usuario|cantidad_habilidades|
|----------|--------------------|
|1|2|
|2|2|
|3|1|
|4|1|
|5|1|
|6|1|
|7|1|
|8|1|
|9|1|
|10|1|
|11|1|
|12|1|
|13|1|
|14|1|
|15|1|
|16|1|
|17|1|
|18|1|
|19|1|
|20|1|
|21|0|
|22|0|

- Consulta compleja con múltiples CTEs:Obtener usuarios con sus proyectos, habilidades y redes sociales.
```sql
-- Ejemplo complejo de uso de WITH para obtener detalles de usuarios
WITH proyectos_cte AS (
    SELECT u.id_usuario, p.id_proyecto, p.nombre AS nombre_proyecto
    FROM core.usuarios u
    LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario
),
habilidades_cte AS (
    SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
    FROM core.usuarios u
    LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
    LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
    GROUP BY u.id_usuario
),
redes_sociales_cte AS (
    SELECT u.id_usuario, COUNT(rs.id_red_social) AS cantidad_redes_sociales
    FROM core.usuarios u
    LEFT JOIN core.redes_sociales rs ON u.id_usuario = rs.id_usuario
    GROUP BY u.id_usuario
)
SELECT u.id_usuario, u.nombre, p.nombre_proyecto, h.cantidad_habilidades, r.cantidad_redes_sociales
FROM core.usuarios u
LEFT JOIN proyectos_cte p ON u.id_usuario = p.id_usuario
LEFT JOIN habilidades_cte h ON u.id_usuario = h.id_usuario
LEFT JOIN redes_sociales_cte r ON u.id_usuario = r.id_usuario
ORDER BY u.id_usuario;
--WITH proyectos_cte AS (...): Define un CTE llamado proyectos_cte para obtener los proyectos de cada usuario.
--WITH habilidades_cte AS (...): Define un CTE llamado habilidades_cte para contar las habilidades por usuario.
--WITH redes_sociales_cte AS (...): Define un CTE llamado redes_sociales_cte para contar las redes sociales por usuario.
--La consulta principal selecciona usuarios con sus nombres, proyectos, cantidad de habilidades y cantidad de redes sociales, uniendo los resultados de los CTEs definidos.
```
|id_usuario|nombre|nombre_proyecto|cantidad_habilidades|cantidad_redes_sociales|
|----------|------|---------------|--------------------|-----------------------|
|1|Sakura Haruno|Proyecto de Sakura|2|2|
|2|Asuka Langley Soryu|Proyecto de Asuka|2|1|
|3|Inuyasha|Proyecto de Inuyasha|1|1|
|4|Bulma Brief|Proyecto de Bulma|1|1|
|5|Nami|Proyecto de Nami|1|1|
|6|Mikasa Ackerman|Proyecto de Mikasa|1|1|
|7|Erza Scarlet|Proyecto de Erza|1|1|
|8|Zero Two|Proyecto de Zero Two|1|1|
|9|Hinata Hyuga|Proyecto de Hinata|1|1|
|10|Kagome Higurashi|Proyecto de Kagome|1|1|
|11|Lucy Heartfilia|Proyecto de Lucy|1|1|
|12|Riza Hawkeye|Proyecto de Riza|1|1|
|13|Rei Ayanami|Proyecto de Rei|1|1|
|14|Winry Rockbell|Proyecto de Winry|1|1|
|15|Yoruichi Shihouin|Proyecto de Yoruichi|1|1|
|16|Rukia Kuchiki|Proyecto de Rukia|1|1|
|17|Tsunade Senju|Proyecto de Tsunade|1|1|
|18|Android 18|Proyecto de Android 18|1|1|
|19|Yuno Gasai|Proyecto de Yuno|1|1|
|20|Homura Akemi|Proyecto de Homura|1|1|
|21|Nuevo Usuario||0|0|
|22|Nuevo Usuario2||0|0|
