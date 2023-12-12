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
- [3. Gestor de base de datos PostgreSQL](#3-gestor-de-base-de-datos-postgresql)
  - [3.1. Ventajas](#31-ventajas)
  - [3.2. Interacción con comandos](#32-interacción-con-comandos)
  - [3.3. Jerarquia de base de datos](#33-jerarquia-de-base-de-datos)
  - [3.4. Instalar Ubuntu](#34-instalar-ubuntu)
  - [3.5. Utilizar roles y bases de datos de PostgreSQL](#35-utilizar-roles-y-bases-de-datos-de-postgresql)
    - [3.5.1. Cambiar cuenta de postgres](#351-cambiar-cuenta-de-postgres)
    - [3.5.2. Acceder a la linea de comandos sin cambiar de cuenta](#352-acceder-a-la-linea-de-comandos-sin-cambiar-de-cuenta)
  - [3.6. Crear un nuevo rol](#36-crear-un-nuevo-rol)
    - [3.6.1. Crear un nuevo usuario](#361-crear-un-nuevo-usuario)
  - [3.7. Crear una nueva base datos](#37-crear-una-nueva-base-datos)
  - [3.8. Abrir la linea de comandos de Postgres con el nuevo rol](#38-abrir-la-linea-de-comandos-de-postgres-con-el-nuevo-rol)
    - [3.8.1. De forma directa](#381-de-forma-directa)
    - [3.8.2. Conectarse a una base de datos diferente](#382-conectarse-a-una-base-de-datos-diferente)
  - [3.9. Crear tablas](#39-crear-tablas)
  - [3.10. Agregar datos en una tabla](#310-agregar-datos-en-una-tabla)
  - [3.11. Eliminar datos en una tabla](#311-eliminar-datos-en-una-tabla)
  - [3.12. Agregar columnas en una tabla](#312-agregar-columnas-en-una-tabla)
  - [3.13. Eliminar columnas en una tabla](#313-eliminar-columnas-en-una-tabla)
  - [3.14. Actualizar datos de una tabla](#314-actualizar-datos-de-una-tabla)
  - [3.15. Comandos más utilizados](#315-comandos-más-utilizados)
  - [3.16. Ejm](#316-ejm)
    - [3.17. Entidad: Usuarios](#317-entidad-usuarios)
    - [3.18. Entidad: Experiencias](#318-entidad-experiencias)
    - [3.19. Entidad: Redes Sociales](#319-entidad-redes-sociales)
    - [3.20. Entidad: Habilidades](#320-entidad-habilidades)
    - [3.21. Entidad: Tecnologías](#321-entidad-tecnologías)
    - [3.22. Entidad: Proyectos](#322-entidad-proyectos)
    - [Para crear las tablas](#para-crear-las-tablas)

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
# 3. Gestor de base de datos PostgreSQL
- PostgreSQL es un potente sistema de base de datosrelacional de objetos de código abierto con más de 35 años de desarrollo activo que le ha ganado una sólida reputación por su confiabilidad, solidez de funciones y rendimiento.
## 3.1. Ventajas
- Instalación ilimitada y gratuita
- Gran escalabilidad
- Estabilidad y confiabilidad
- Estandar SQL
- Potencia y robustez
- Extensibilidad
- pgAdmin
## 3.2. Interacción con comandos
- La consola en PostgreSQL es una herramienta muy potente para crear, administrar y depurar nuestra base de datos, podemos acceder a ella después de instalar PostgreSQL
## 3.3. Jerarquia de base de datos
- Servidor de base de datos: Computador que tiene un motor de base de datos instalado y en ejecución.
- Motor de base de datos: Software que provee un conjunto de servicios encargados de administrar una base de datos
- Base de datos: Grupo de datos que pertenencen a un mismo contexto.
- Esquemas de base de datos en PostgreSQL: Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias)
- Tablas de base de datos: Estructura de datos: Estructura que organiza los datos en filas y columnas formando una matriz.
## 3.4. Instalar Ubuntu
- Actualizar primero:
```console
sudo apt update
```
- Instale el paquete de Postgres junto con un paquete -contrib
```console
sudo apt install postgresql postgresql-contrib
```
## 3.5. Utilizar roles y bases de datos de PostgreSQL
### 3.5.1. Cambiar cuenta de postgres
- Cambie a la cuenta de postgres en su servidor
```console
sudo -i -u postgres
```
- Acceder de inmediato a una línea de comandos de PostgresSQL
```console
psql
```
- Salir
```console
\q
```
### 3.5.2. Acceder a la linea de comandos sin cambiar de cuenta
- Con lo siguiente
```console
sudo -u postgres psql
```
## 3.6. Crear un nuevo rol
### 3.6.1. Crear un nuevo usuario
- Normalmente
```console
createuser --interactive
```
- Usando sudo
```console
createuser --interactive
```

**![3FNS2](/5imagenes/entidad-relacion/usuario.png)**
## 3.7. Crear una nueva base datos
- Iniciar sesion con la cuenta postgres y crear la base de datos
```console
createdb sammy
```
- Si, como alternativa, prefiere utilizar sudo para cada comando sin dejar de emplear su cuenta normal, escribiría lo siguiente:
```console
sudo -u postgres createdb sammy
```
## 3.8. Abrir la linea de comandos de Postgres con el nuevo rol
- Para iniciar sesión con la autenticación basada en ident, necesitará un usuario de Linux con el mismo nombre de su rol y su base de datos de Postgres.

- Si no tiene un usuario disponible de Linux que coincida, puede crear uno con el comando adduser. Deberá hacerlo desde su cuenta non-root con privilegios sudo (es decir, sin iniciar sesión como usuario de postgres):
```console
sudo adduser sammy
```
- Una vez que esté disponible esta cuenta nueva, podrá cambiar y conectarse a la base de datos escribiendo lo siguiente:
```console
sudo -i -u sammy
psql
```
### 3.8.1. De forma directa
- También podrá hacerlo de forma directa:
```console
sudo -u sammy psql
```
### 3.8.2. Conectarse a una base de datos diferente
- Si desea que su usuario se conecte a una base de datos diferente, puede lograrlo especificando la base de datos de esta manera:
```console
psql -d postgres
```
- Ya que inició sesión, puede verificar la información de su conexión actual escribiendo lo siguiente:
```console
\conninfo
```
```text
Output
You are connected to database "sammy" as user "sammy" via socket in "/var/run/postgresql" at port "5432".
```
## 3.9. Crear tablas
- La sintaxis básica para la creación de tablas es la siguiente
```console
CREATE TABLE playground (
    equip_id serial PRIMARY KEY,
    type varchar (50) NOT NULL,
    color varchar (25) NOT NULL,
    location varchar(25) check (location in ('north', 'south', 'west', 'east', 'northeast', 'southeast', 'southwest', 'northwest')),
    install_date date
);
```
- Puede ver su tabla nueva escribiendo lo siguiente:
```console
\d
```

**![3FNS2](/5imagenes/entidad-relacion/tablas.png)**

- Si desea ver solo la tabla sin la secuencia
```console
\dt
```

**![3FNS2](/5imagenes/entidad-relacion/tablas2.png)**
## 3.10. Agregar datos en una tabla
- Como ejemplo, añada un tobogán y un columpio al invocar la tabla en la que los desea agregar, nombrar las columnas y, luego, proporcionar datos para cada una de ellas
```console
INSERT INTO playground (type, color, location, install_date) VALUES ('slide', 'blue', 'south', '2017-04-28');
INSERT INTO playground (type, color, location, install_date) VALUES ('swing', 'yellow', 'northwest', '2018-08-16');
```
- Ver la tabla playground
```console
SELECT * FROM playground;
```
**![3FNS2](/5imagenes/entidad-relacion/select.png)**
## 3.11. Eliminar datos en una tabla
- Eliminar la tabla
```console
DELETE FROM playground WHERE type = 'slide';
```
- Consultar la tabla de nuevo
```console
SELECT * FROM playground;
```

**![3FNS2](/5imagenes/entidad-relacion/eliminado.png)**
## 3.12. Agregar columnas en una tabla
- Agregue una columna para mostrar la última visita de mantenimiento por cada equipo escribiendo lo siguiente
```console
ALTER TABLE playground ADD last_maint date;
```
- Si vuelve a ver la información de su tabla, observará que se agregó la columna nueva, pero no se ingresaron datos
```console
SELECT * FROM playground;
```

**![3FNS2](/5imagenes/entidad-relacion/addColumna.png)**
## 3.13. Eliminar columnas en una tabla
- Eliminar la columna
```console
ALTER TABLE playground DROP last_maint;
```
## 3.14. Actualizar datos de una tabla
- Puede actualizar los valores de una entrada existente buscando el registro que desee y fijando el valor que prefiera utilizar para la columna. Puede consultar el registro de swing (se incluirán todos los columpios de su tabla) y cambiar su color a red. Esto puede ser útil si asignó una tarea de pintura al columpio:
```console
UPDATE playground SET color = 'red' WHERE type = 'swing';
```
- Puede verificar la eficacia de la operación consultando los datos de nuevo:
```console
SELECT * FROM playground;
```

**![3FNS2](/5imagenes/entidad-relacion/update.png)**

## 3.15. Comandos más utilizados

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
## 3.16. Ejm
- Este modelo de base de datos representa información de usuarios y sus actividades. La entidad "Usuarios" contiene datos personales como nombre, teléfono, email, y detalles como ocupación y fecha de nacimiento. Además, se almacena la fecha de registro y una foto. Las entidades relacionadas incluyen "Experiencias" (con nombre y descripción), "Redes Sociales" (con nombre y foto), "Habilidades" (con icono, nombre y descripción), "Tecnologías" (con nombre y foto), y "Proyectos" (con nombre, foto, descripción y enlace). Estas entidades se conectan a la entidad "Usuarios" a través de claves foráneas, permitiendo organizar y acceder a información detallada sobre las experiencias, habilidades y proyectos asociados a cada usuario.
```sql
Entidad: Usuarios

    id_usuario (PK, integer)
    nombre (VARCHAR(2000))
    telefono (integer)
    email (varchar(100))
    descripcion (TEXT)
    ocupacion (VARCHAR(2000))
    fecha_nac (DATE)
    foto (VARCHAR(5000))
    fecha_reg (TIMESTAMP)

Entidad: Experiencias

    id_experiencia (PK, integer)
    nombre (VARCHAR)
    descripcion (TEXT)
    id_usuario (FK, integer)

Entidad: Redes Sociales

    id_redes_sociales (PK, integer)
    nombre (VARCHAR)
    foto (VARCHAR)
    id_usuario (FK, integer)

Entidad: Habilidades

    id_habilidades (PK, integer)
    icono (VARCHAR)
    nombre (VARCHAR)
    descripcion (TEXT)
    id_usuario (FK, integer)

Entidad: Tecnologías

    id_tecnologia (PK, integer)
    nombre (VARCHAR)
    foto (VARCHAR)
    id_usuario (FK, integer)

Entidad: Proyectos

    id_proyectos (PK, integer)
    nombre (VARCHAR)
    foto (VARCHAR)
    descripcion (TEXT)
    link (VARCHAR)
    id_usuario (FK, integer)

Cada entidad tiene sus respectivos atributos y las claves primarias (PK) están indicadas. Además, se mencionan las claves foráneas (FK) que establecen relaciones con otras entidades.
```

### 3.17. Entidad: Usuarios

| Atributo        | Tipo        | Clave    | Descripción                                  |
|-----------------|-------------|----------|----------------------------------------------|
| id_usuario      | PK          |          | Identificador único del usuario.             |
| nombre          |             |          | Nombre del usuario.                          |
| telefono        |             |          | Número de teléfono del usuario.              |
| email           |             |          | Dirección de correo electrónico del usuario.|
| descripcion     |             |          | Descripción textual del usuario.             |
| ocupacion       |             |          | Ocupación o profesión del usuario.           |
| fecha_nac       |             |          | Fecha de nacimiento del usuario.             |
| foto            |             |          | Ruta o enlace a la foto del usuario.        |
| fecha_reg       |             |          | Fecha y hora de registro del usuario.       |

### 3.18. Entidad: Experiencias

| Atributo        | Tipo        | Clave    | Descripción                                  |
|-----------------|-------------|----------|----------------------------------------------|
| id_experiencia  | PK          |          | Identificador único de la experiencia.       |
| nombre          |             |          | Nombre de la experiencia.                    |
| descripcion     |             |          | Descripción textual de la experiencia.       |
| id_usuario      | FK          |          | Clave foránea que establece relación con el usuario.|

### 3.19. Entidad: Redes Sociales

| Atributo             | Tipo        | Clave    | Descripción                                  |
|----------------------|-------------|----------|----------------------------------------------|
| id_redes_sociales    | PK          |          | Identificador único de la red social.        |
| nombre               |             |          | Nombre de la red social.                     |
| foto                 |             |          | Ruta o enlace a la foto de la red social.   |
| id_usuario           | FK          |          | Clave foránea que establece relación con el usuario.|

### 3.20. Entidad: Habilidades

| Atributo          | Tipo        | Clave    | Descripción                                  |
|-------------------|-------------|----------|----------------------------------------------|
| id_habilidades    | PK          |          | Identificador único de la habilidad.        |
| icono             |             |          | Ruta o enlace al ícono representativo.      |
| nombre            |             |          | Nombre de la habilidad.                      |
| descripcion       |             |          | Descripción textual de la habilidad.        |
| id_usuario        | FK          |          | Clave foránea que establece relación con el usuario.|

### 3.21. Entidad: Tecnologías

| Atributo         | Tipo        | Clave    | Descripción                                  |
|------------------|-------------|----------|----------------------------------------------|
| id_tecnologia    | PK          |          | Identificador único de la tecnología.        |
| nombre           |             |          | Nombre de la tecnología.                     |
| foto             |             |          | Ruta o enlace a la foto representativa.     |
| id_usuario       | FK          |          | Clave foránea que establece relación con el usuario.|

### 3.22. Entidad: Proyectos

| Atributo         | Tipo        | Clave    | Descripción                                  |
|------------------|-------------|----------|----------------------------------------------|
| id_proyectos     | PK          |          | Identificador único del proyecto.           |
| nombre           |             |          | Nombre del proyecto.                         |
| foto             |             |          | Ruta o enlace a la foto representativa.     |
| descripcion      |             |          | Descripción textual del proyecto.           |
| link             |             |          | Enlace relacionado con el proyecto.         |
| id_usuario       | FK          |          | Clave foránea que establece relación con el usuario.|


**![3FNS2](/5imagenes/entidad-relacion/ejm_postgres.jpg)**
### Para crear las tablas
```sql
-- Esquema Core
CREATE SCHEMA IF NOT EXISTS core;

CREATE TABLE IF NOT EXISTS core.usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000),
    fecha_reg TIMESTAMP
);

CREATE TABLE IF NOT EXISTS core.proyectos (
    id_proyecto SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    descripcion TEXT,
    link VARCHAR(2000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_proyecto FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS core.redes_sociales (
    id_red_social SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_red_social FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Esquema Portafolio
CREATE SCHEMA IF NOT EXISTS portafolio;

CREATE TABLE IF NOT EXISTS portafolio.habilidades (
    id_habilidad SERIAL PRIMARY KEY,
    icono VARCHAR(2000),
    nombre VARCHAR(2000),
    descripcion TEXT,
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_habilidad FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS portafolio.tecnologias (
    id_tecnologia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_tecnologia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS portafolio.experiencias (
    id_experiencia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    descripcion TEXT,
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_experiencia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);
```
