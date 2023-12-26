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
  - [3.4. Instalar PostgreSql Ubuntu](#34-instalar-postgresql-ubuntu)
  - [3.5. Utilizar roles y bases de datos de PostgreSQL](#35-utilizar-roles-y-bases-de-datos-de-postgresql)
    - [3.5.1. Cambiar cuenta de postgres](#351-cambiar-cuenta-de-postgres)
    - [3.5.2. Acceder a la linea de comandos sin cambiar de cuenta](#352-acceder-a-la-linea-de-comandos-sin-cambiar-de-cuenta)
  - [3.6. Crear un nuevo rol](#36-crear-un-nuevo-rol)
    - [3.6.1. Crear un nuevo usuario](#361-crear-un-nuevo-usuario)
  - [3.7. Crear una nueva base datos](#37-crear-una-nueva-base-datos)
  - [3.8. Abrir la linea de comandos de Postgres con el nuevo rol](#38-abrir-la-linea-de-comandos-de-postgres-con-el-nuevo-rol)
    - [3.8.1. De forma directa](#381-de-forma-directa)
    - [3.8.2. Conectarse a una base de datos diferente](#382-conectarse-a-una-base-de-datos-diferente)
    - [3.8.3. Asignar privilegios a un usuario sobre una base de datos](#383-asignar-privilegios-a-un-usuario-sobre-una-base-de-datos)
    - [3.8.4. Cambiar la contraseña de un usuario](#384-cambiar-la-contraseña-de-un-usuario)
  - [3.9. Crear tablas](#39-crear-tablas)
  - [3.10. Agregar datos en una tabla](#310-agregar-datos-en-una-tabla)
  - [3.11. Eliminar datos en una tabla](#311-eliminar-datos-en-una-tabla)
  - [3.12. Agregar columnas en una tabla](#312-agregar-columnas-en-una-tabla)
  - [3.13. Eliminar columnas en una tabla](#313-eliminar-columnas-en-una-tabla)
  - [3.14. Actualizar datos de una tabla](#314-actualizar-datos-de-una-tabla)
  - [3.15. Comandos más utilizados](#315-comandos-más-utilizados)
- [4. Ejemplo modelo de base de datos](#4-ejemplo-modelo-de-base-de-datos)
  - [4.1. Diagrama Entidad Relación](#41-diagrama-entidad-relación)
  - [4.2. Tablas y atributos](#42-tablas-y-atributos)
  - [4.3. Para crear Tablas](#43-para-crear-tablas)
  - [4.4. Para Insertar datos](#44-para-insertar-datos)
  - [4.5. Tablas creadas](#45-tablas-creadas)



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
## 3.4. Instalar PostgreSql Ubuntu
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
sudo -i -u postgres psql
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
**![3FNS2](/5imagenes/entidad-relacion/usuario.png)**
## 3.7. Crear una nueva base datos
- Iniciar sesion con la cuenta postgres y crear la base de datos
```console
CREATE DATABASE nombre_de_tu_base_de_datos;
```
## 3.8. Abrir la linea de comandos de Postgres con el nuevo rol
### 3.8.1. De forma directa
- También podrá hacerlo de forma directa:
```console
sudo -u nombre_de_tu_usuario psql
```
### 3.8.2. Conectarse a una base de datos diferente
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
You are connected to database "sammy" as user "sammy" via socket in "/var/run/postgresql" at port "5432".
```
### 3.8.3. Asignar privilegios a un usuario sobre una base de datos
```console
GRANT ALL PRIVILEGES ON DATABASE nombre_de_tu_base_de_datos TO nombre_de_usuario;
```
### 3.8.4. Cambiar la contraseña de un usuario
```console
ALTER USER nombre_de_usuario WITH PASSWORD 'nueva_contraseña';
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

| equip_id | type          | color      | location   | install_date |
|----------|---------------|------------|------------|--------------|
| 1        | Swing         | Red        | North      | 2023-01-15   |
| 2        | Slide         | Blue       | South      | 2023-02-20   |
| 3        | Sandbox       | Yellow     | West       | 2023-03-10   |
| 4        | Climbing Frame| Green      | Northeast  | 2023-04-05   |
| 5        | Seesaw        | Purple     | Southeast  | 2023-05-12   |


- Mostrar todas las tablas de la base de datos actual
```console
\dt
```
- Mostrar información sobre una tabla específica
```console
\d nombre_de_tu_tabla;
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
| equip_id | type  | color  | location   | install_date |
|----------|-------|--------|------------|--------------|
| 1        | Slide | Blue   | South      | 2017-04-28   |
| 2        | Swing | Yellow | Northwest  | 2018-08-16   |

## 3.11. Eliminar datos en una tabla
- Eliminar la tabla
```console
DELETE FROM playground WHERE type = 'slide';
```
- Consultar la tabla de nuevo
```console
SELECT * FROM playground;
```

| equip_id | type  | color  | location   | install_date |
|----------|-------|--------|------------|--------------|
| 2        | Swing | Yellow | Northwest  | 2018-08-16   |

## 3.12. Agregar columnas en una tabla
- Agregue una columna para mostrar la última visita de mantenimiento por cada equipo escribiendo lo siguiente
```console
ALTER TABLE playground ADD last_maint date;
```
- Si vuelve a ver la información de su tabla, observará que se agregó la columna nueva, pero no se ingresaron datos
```console
SELECT * FROM playground;
```

| equip_id | type  | color  | location   | install_date | last_maint |
|----------|-------|--------|------------|--------------|------------|
| 2        | Swing | Yellow | Northwest  | 2018-08-16   |            |

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

| equip_id | type  | color  | location   | install_date | last_maint |
|----------|-------|--------|------------|--------------|------------|
| 2        | Swing | Red    | Northwest  | 2018-08-16   |            |

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
# 4. Ejemplo modelo de base de datos
- Este modelo de base de datos representa información de usuarios y sus actividades. La entidad "Usuarios" contiene datos personales como nombre, teléfono, email, y detalles como ocupación y fecha de nacimiento. Además, se almacena la fecha de registro y una foto. Las entidades relacionadas incluyen "Experiencias" (con nombre y descripción), "Redes Sociales" (con nombre y foto), "Habilidades" (con icono, nombre y descripción), "Tecnologías" (con nombre y foto), y "Proyectos" (con nombre, foto, descripción y enlace). Estas entidades se conectan a la entidad "Usuarios" a través de claves foráneas, permitiendo organizar y acceder a información detallada sobre las experiencias, habilidades y proyectos asociados a cada usuario.
## 4.1. Diagrama Entidad Relación
**![3FNS2](/5imagenes/entidad-relacion/ejm_postgres.jpg)**
## 4.2. Tablas y atributos
- Entidad: Usuarios

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

- Entidad: Experiencias

| Atributo        | Tipo        | Clave    | Descripción                                  |
|-----------------|-------------|----------|----------------------------------------------|
| id_experiencia  | PK          |          | Identificador único de la experiencia.       |
| nombre          |             |          | Nombre de la experiencia.                    |
| descripcion     |             |          | Descripción textual de la experiencia.       |
| id_usuario      | FK          |          | Clave foránea que establece relación con el usuario.|

- Entidad: Redes Sociales

| Atributo             | Tipo        | Clave    | Descripción                                  |
|----------------------|-------------|----------|----------------------------------------------|
| id_redes_sociales    | PK          |          | Identificador único de la red social.        |
| nombre               |             |          | Nombre de la red social.                     |
| foto                 |             |          | Ruta o enlace a la foto de la red social.   |
| id_usuario           | FK          |          | Clave foránea que establece relación con el usuario.|

- Entidad: Habilidades

| Atributo          | Tipo        | Clave    | Descripción                                  |
|-------------------|-------------|----------|----------------------------------------------|
| id_habilidades    | PK          |          | Identificador único de la habilidad.        |
| icono             |             |          | Ruta o enlace al ícono representativo.      |
| nombre            |             |          | Nombre de la habilidad.                      |
| descripcion       |             |          | Descripción textual de la habilidad.        |
| id_usuario        | FK          |          | Clave foránea que establece relación con el usuario.|

- Entidad: Tecnologías

| Atributo         | Tipo        | Clave    | Descripción                                  |
|------------------|-------------|----------|----------------------------------------------|
| id_tecnologia    | PK          |          | Identificador único de la tecnología.        |
| nombre           |             |          | Nombre de la tecnología.                     |
| foto             |             |          | Ruta o enlace a la foto representativa.     |
| id_usuario       | FK          |          | Clave foránea que establece relación con el usuario.|

- Entidad: Proyectos

| Atributo         | Tipo        | Clave    | Descripción                                  |
|------------------|-------------|----------|----------------------------------------------|
| id_proyectos     | PK          |          | Identificador único del proyecto.           |
| nombre           |             |          | Nombre del proyecto.                         |
| foto             |             |          | Ruta o enlace a la foto representativa.     |
| descripcion      |             |          | Descripción textual del proyecto.           |
| link             |             |          | Enlace relacionado con el proyecto.         |
| id_usuario       | FK          |          | Clave foránea que establece relación con el usuario.|
## 4.3. Para crear Tablas
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
    fecha_reg TIMESTAMP DEFAULT NOW() -- Ahora se define con el valor por defecto NOW()
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
- Cada entidad tiene sus respectivos atributos y las claves primarias (PK) están indicadas. Además, se mencionan las claves foráneas (FK) que establecen relaciones con otras entidades.
## 4.4. Para Insertar datos
```sql
-- Inserción de datos en la tabla core.usuarios
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto) 
VALUES 
('Sakura Haruno', 123456789, 'sakura@example.com', 'Ninja médica de Konoha', 'Ninja', '1995-03-28', 'sakura.jpg'),
('Asuka Langley Soryu', 987654321, 'asuka@example.com', 'Piloto del Evangelion Unidad-02', 'Piloto de Eva', '2001-12-04', 'asuka.jpg'),
('Inuyasha', 555555555, 'inuyasha@example.com', 'Mitad humano, mitad demonio', 'Hanyo', '1988-07-29', 'inuyasha.jpg'),
('Bulma Brief', 111111111, 'bulma@example.com', 'Científica e inventora', 'Inventora', '1980-08-18', 'bulma.jpg'),
('Nami', 222222222, 'nami@example.com', 'Navegante de los Piratas del Sombrero de Paja', 'Navegante', '1990-07-03', 'nami.jpg'),
('Mikasa Ackerman', 333333333, 'mikasa@example.com', 'Soldado de la Legión de reconocimiento', 'Soldado', '1995-02-10', 'mikasa.jpg'),
('Erza Scarlet', 444444444, 'erza@example.com', 'Titania, la Reina de las Hadas', 'Maga', '1992-04-30', 'erza.jpg'),
('Zero Two', 666666666, 'zero@example.com', 'Piloto de FranXX', 'Piloto', '2002-01-21', 'zero_two.jpg'),
('Hinata Hyuga', 777777777, 'hinata@example.com', 'Ninja de la Aldea Oculta de la Hoja', 'Ninja', '1995-12-27', 'hinata.jpg'),
('Kagome Higurashi', 888888888, 'kagome@example.com', 'Viajera en el tiempo', 'Estudiante', '1987-11-30', 'kagome.jpg'),
('Lucy Heartfilia', 999999999, 'lucy@example.com', 'Maga celestial de Fairy Tail', 'Maga', '1998-07-01', 'lucy.jpg'),
('Riza Hawkeye', 123123123, 'riza@example.com', 'Teniente y tiradora experta', 'Militar', '1989-01-10', 'riza.jpg'),
('Rei Ayanami', 456456456, 'rei@example.com', 'Piloto del Evangelion Unidad-00', 'Piloto de Eva', '2001-03-30', 'rei.jpg'),
('Winry Rockbell', 789789789, 'winry@example.com', 'Mecánica y ingeniera', 'Ingeniera', '1990-05-03', 'winry.jpg'),
('Yoruichi Shihouin', 135135135, 'yoruichi@example.com', 'Ex-capitana del Gotei 13', 'Ex-capitana', '1971-01-01', 'yoruichi.jpg'),
('Rukia Kuchiki', 246246246, 'rukia@example.com', 'Shinigami y ex-teniente', 'Shinigami', '1986-01-14', 'rukia.jpg'),
('Tsunade Senju', 357357357, 'tsunade@example.com', 'Quinta Hokage de Konoha', 'Hokage', '1960-08-02', 'tsunade.jpg'),
('Android 18', 468468468, 'android18@example.com', 'Androide y luchadora', 'Androide', '2010-02-18', 'android18.jpg'),
('Yuno Gasai', 579579579, 'yuno@example.com', 'Portadora del Diario de Yuki', 'Estudiante', '1993-02-14', 'yuno.jpg'),
('Homura Akemi', 681681681, 'homura@example.com', 'Magical Girl y viajera en el tiempo', 'Magical Girl', '1995-12-03', 'homura.jpg');

-- Inserción de datos en la tabla core.proyectos
INSERT INTO core.proyectos (nombre, foto, descripcion, link, id_usuario) 
VALUES 
('Proyecto de Sakura', 'proyecto_sakura.jpg', 'Desarrollo de técnicas médicas ninja', 'https://github.com/sakura/proyecto', 1),
('Proyecto de Asuka', 'proyecto_asuka.jpg', 'Defensa contra los Ángeles', 'https://github.com/asuka/proyecto', 2),
('Proyecto de Inuyasha', 'proyecto_inuyasha.jpg', 'Aventuras en la era feudal', 'https://github.com/inuyasha/proyecto', 3),
('Proyecto de Bulma', 'proyecto_bulma.jpg', 'Inventos revolucionarios', '...', 4), -- Agrega el enlace correspondiente
('Proyecto de Nami', 'proyecto_nami.jpg', 'Navegación en Grand Line', 'https://github.com/nami/proyecto', 5),
('Proyecto de Mikasa', 'proyecto_mikasa.jpg', 'Desarrollo de estrategias de combate', '...', 6),
('Proyecto de Erza', 'proyecto_erza.jpg', 'Aventuras mágicas', '...', 7),
('Proyecto de Zero Two', 'proyecto_zero_two.jpg', 'Investigación sobre FranXX', '...', 8),
('Proyecto de Hinata', 'proyecto_hinata.jpg', 'Desarrollo de técnicas de ninjutsu', '...', 9),
('Proyecto de Kagome', 'proyecto_kagome.jpg', 'Estudio de viajes en el tiempo', '...', 10),
('Proyecto de Lucy', 'proyecto_lucy.jpg', 'Investigación sobre magia celestial', '...', 11),
('Proyecto de Riza', 'proyecto_riza.jpg', 'Mejora de habilidades de tirador', '...', 12),
('Proyecto de Rei', 'proyecto_rei.jpg', 'Desarrollo del Evangelion Unidad-00', '...', 13),
('Proyecto de Winry', 'proyecto_winry.jpg', 'Innovaciones en ingeniería mecánica', '...', 14),
('Proyecto de Yoruichi', 'proyecto_yoruichi.jpg', 'Investigación sobre habilidades shinigami', '...', 15),
('Proyecto de Rukia', 'proyecto_rukia.jpg', 'Estudio de técnicas de shinigami', '...', 16),
('Proyecto de Tsunade', 'proyecto_tsunade.jpg', 'Mejora de técnicas médicas', '...', 17),
('Proyecto de Android 18', 'proyecto_android18.jpg', 'Desarrollo de habilidades de combate', '...', 18),
('Proyecto de Yuno', 'proyecto_yuno.jpg', 'Estudio del Diario de Yuki', '...', 19),
('Proyecto de Homura', 'proyecto_homura.jpg', 'Investigación sobre viajes en el tiempo', '...', 20);
-- ... Agrega más proyectos aquí ...

-- Inserción de datos en la tabla core.redes_sociales
INSERT INTO core.redes_sociales (nombre, foto, id_usuario) 
VALUES 
('Twitter', 'twitter_icon.jpg', 1),
('Instagram', 'instagram_icon.jpg', 2),
('Facebook', 'facebook_icon.jpg', 3),
('LinkedIn', 'linkedin_icon.jpg', 4),
('Pinterest', 'pinterest_icon.jpg', 5),
('Tumblr', 'tumblr_icon.jpg', 6),
('Snapchat', 'snapchat_icon.jpg', 7),
('WhatsApp', 'whatsapp_icon.jpg', 8),
('Telegram', 'telegram_icon.jpg', 9),
('Discord', 'discord_icon.jpg', 10),
('Reddit', 'reddit_icon.jpg', 11),
('YouTube', 'youtube_icon.jpg', 12),
('Twitch', 'twitch_icon.jpg', 13),
('GitHub', 'github_icon.jpg', 14),
('GitLab', 'gitlab_icon.jpg', 15),
('Bitbucket', 'bitbucket_icon.jpg', 16),
('Slack', 'slack_icon.jpg', 17),
('Skype', 'skype_icon.jpg', 18),
('Zoom', 'zoom_icon.jpg', 19),
('Vkontakte', 'vkontakte_icon.jpg', 20);

-- ... Agrega más redes sociales aquí ...
-- Inserción de datos en la tabla portafolio.habilidades
INSERT INTO portafolio.habilidades (icono, nombre, descripcion, id_usuario) 
VALUES 
('habilidad_icon_1.jpg', 'Jutsu Médico', 'Máxima habilidad en técnicas médicas ninja, especializada en jutsu de curación.', 1),
('habilidad_icon_2.jpg', 'Piloto de Evangelion', 'Habilidad excepcional como piloto de la Unidad-02 en la lucha contra los Ángeles.', 2),
('habilidad_icon_3.jpg', 'Control de Energía Youkai', 'Capacidad para controlar y utilizar la energía youkai de manera efectiva.', 3),
('habilidad_icon_4.jpg', 'Inventora Genial', 'Habilidad para inventar dispositivos y tecnologías avanzadas.', 4),
('habilidad_icon_5.jpg', 'Navegación en Grand Line', 'Experiencia en la navegación por los peligrosos mares de Grand Line.', 5),
('habilidad_icon_6.jpg', 'Lanzamiento de Cuchillos', 'Habilidad sobresaliente en el lanzamiento preciso de cuchillos.', 6),
('habilidad_icon_7.jpg', 'Transformación Youkai', 'Capacidad para transformarse en una forma más poderosa como youkai.', 7),
('habilidad_icon_8.jpg', 'Tecnología Avanzada', 'Destreza en el desarrollo y uso de tecnología avanzada para diversos propósitos.', 8),
('habilidad_icon_9.jpg', 'Magia Celestial', 'Maestría en el uso de la magia celestial para invocar espíritus celestiales.', 9),
('habilidad_icon_10.jpg', 'Artes Marciales Ninja', 'Habilidad excepcional en las artes marciales ninja, incluyendo taijutsu y ninjutsu.', 10),
('habilidad_icon_11.jpg', 'Control del Tiempo', 'Capacidad para manipular el tiempo en situaciones específicas.', 11),
('habilidad_icon_12.jpg', 'Alquimia', 'Conocimiento profundo y habilidad en la práctica de la alquimia.', 12),
('habilidad_icon_13.jpg', 'Poderes Psíquicos', 'Habilidad para utilizar poderes psíquicos como la telequinesis y la telepatía.', 13),
('habilidad_icon_14.jpg', 'Transformación de Evangelion', 'Capacidad para transformarse en una forma más poderosa como piloto de Evangelion.', 14),
('habilidad_icon_15.jpg', 'Ninja de Combate', 'Excelencia en las técnicas de combate ninja y el uso de armas tradicionales.', 15),
('habilidad_icon_16.jpg', 'Canto Mágico', 'Poderosa voz utilizada en conjunción con la magia para efectos diversos.', 16),
('habilidad_icon_17.jpg', 'Técnica de Sello', 'Dominio en el uso de sellos mágicos para diversas aplicaciones.', 17),
('habilidad_icon_18.jpg', 'Control de Elementos', 'Capacidad para controlar y manipular diferentes elementos como fuego, agua y tierra.', 18),
('habilidad_icon_19.jpg', 'Arte de la Espada', 'Maestría en el manejo de la espada y técnicas de esgrima.', 19),
('habilidad_icon_20.jpg', 'Teletransportación', 'Habilidad para moverse instantáneamente de un lugar a otro.', 20);
-- ... Agrega más habilidades aquí ...

-- Inserción de datos en la tabla portafolio.tecnologias
-- Inserción de datos en la tabla portafolio.tecnologias
INSERT INTO portafolio.tecnologias (nombre, foto, id_usuario) 
VALUES 
('Jutsu Médico', 'tecnologia_jutsu_medico.jpg', 1),
('Piloto de Evangelion', 'tecnologia_piloto_evangelion.jpg', 2),
('Control de Energía Youkai', 'tecnologia_control_energia_youkai.jpg', 3),
('Inventora Genial', 'tecnologia_inventora_genial.jpg', 4),
('Navegación en Grand Line', 'tecnologia_navegacion_grand_line.jpg', 5),
('Lanzamiento de Cuchillos', 'tecnologia_lanzamiento_cuchillos.jpg', 6),
('Transformación Youkai', 'tecnologia_transformacion_youkai.jpg', 7),
('Tecnología Avanzada', 'tecnologia_tecnologia_avanzada.jpg', 8),
('Magia Celestial', 'tecnologia_magia_celestial.jpg', 9),
('Artes Marciales Ninja', 'tecnologia_artes_marciales_ninja.jpg', 10),
('Control del Tiempo', 'tecnologia_control_tiempo.jpg', 11),
('Alquimia', 'tecnologia_alquimia.jpg', 12),
('Poderes Psíquicos', 'tecnologia_poderes_psiquicos.jpg', 13),
('Transformación de Evangelion', 'tecnologia_transformacion_evangelion.jpg', 14),
('Ninja de Combate', 'tecnologia_ninja_combate.jpg', 15),
('Canto Mágico', 'tecnologia_canto_magico.jpg', 16),
('Técnica de Sello', 'tecnologia_tecnica_sello.jpg', 17),
('Control de Elementos', 'tecnologia_control_elementos.jpg', 18),
('Arte de la Espada', 'tecnologia_arte_espada.jpg', 19),
('Teletransportación', 'tecnologia_teletransportacion.jpg', 20);

-- ... Agrega más tecnologías aquí ...

-- Inserción de datos en la tabla portafolio.experiencias
INSERT INTO portafolio.experiencias (nombre, descripcion, id_usuario) 
VALUES 
('Misión de Protección en Konoha', 'Participación en misiones como ninja médica para proteger la aldea de Konoha.', 1),
('Defensa contra los Ángeles', 'Piloto de la Unidad-02 en la lucha contra los Ángeles para proteger la humanidad.', 2),
('Aventuras en la Era Feudal', 'Viajes y enfrentamientos en la era feudal como mitad humano, mitad demonio.', 3),
('Inventora en la Patrulla del Tiempo', 'Contribuciones como inventora genial en la patrulla del tiempo.', 4),
('Navegante en los Mares Peligrosos', 'Viajes como navegante en los peligrosos mares de Grand Line.', 5),
('Combate en la Legión de reconocimiento', 'Participación en combates como soldado de la Legión de reconocimiento.', 6),
('Aventuras como Titania', 'Aventuras mágicas y misiones como Titania, la Reina de las Hadas.', 7),
('Piloto de FranXX', 'Participación en misiones como piloto de FranXX para proteger la humanidad.', 8),
('Misiones Ninja de la Aldea Oculta de la Hoja', 'Participación en misiones como ninja de la Aldea Oculta de la Hoja.', 9),
('Viajes en el Tiempo', 'Aventuras y descubrimientos en viajes en el tiempo.', 10),
('Magia Celestial en Fairy Tail', 'Aventuras y misiones como maga celestial en el gremio Fairy Tail.', 11),
('Teniente y Tiradora Experta', 'Servicio como teniente y tiradora experta en el ejército.', 12),
('Piloto del Evangelion Unidad-00', 'Participación como piloto del Evangelion Unidad-00 en la defensa contra los Ángeles.', 13),
('Innovaciones en Ingeniería Mecánica', 'Contribuciones como mecánica e ingeniera en innovaciones mecánicas.', 14),
('Ex-Capitana del Gotei 13', 'Servicio como ex-capitana del Gotei 13 en el mundo de los shinigami.', 15),
('Shinigami y Ex-Teniente', 'Experiencia como shinigami y ex-teniente en la Sociedad de Almas.', 16),
('Quinta Hokage de Konoha', 'Servicio como Quinta Hokage para proteger y liderar la aldea de Konoha.', 17),
('Luchadora y Androide', 'Participación en combates como androide y luchadora.', 18),
('Portadora del Diario de Yuki', 'Aventuras y desafíos como portadora del Diario de Yuki.', 19),
('Magical Girl y Viajera en el Tiempo', 'Aventuras como Magical Girl y viajera en el tiempo.', 20);
-- ... Agrega más experiencias aquí ...

```
## 4.5. Tablas creadas
- La tabla usuarios

| id_usuario | nombre               | telefono   | email                | descripcion                               | ocupacion          | fecha_nac  | foto          |
|------------|----------------------|------------|----------------------|-------------------------------------------|--------------------|------------|---------------|
| 1          | Sakura Haruno        | 123456789  | sakura@example.com   | Ninja médica de Konoha                    | Ninja              | 1995-03-28 | sakura.jpg    |
| 2          | Asuka Langley Soryu  | 987654321  | asuka@example.com    | Piloto del Evangelion Unidad-02           | Piloto de Eva      | 2001-12-04 | asuka.jpg     |
| 3          | Inuyasha             | 555555555  | inuyasha@example.com | Mitad humano, mitad demonio               | Hanyo              | 1988-07-29 | inuyasha.jpg  |
| 4          | Bulma Brief          | 111111111  | bulma@example.com    | Científica e inventora                    | Inventora          | 1980-08-18 | bulma.jpg     |
| 5          | Nami                 | 222222222  | nami@example.com     | Navegante de los Piratas del Sombrero de Paja | Navegante      | 1990-07-03 | nami.jpg      |
| 6          | Mikasa Ackerman      | 333333333  | mikasa@example.com   | Soldado de la Legión de reconocimiento   | Soldado            | 1995-02-10 | mikasa.jpg    |
| 7          | Erza Scarlet         | 444444444  | erza@example.com     | Titania, la Reina de las Hadas            | Maga               | 1992-04-30 | erza.jpg      |
| 8          | Zero Two             | 666666666  | zero@example.com     | Piloto de FranXX                          | Piloto             | 2002-01-21 | zero_two.jpg  |
| 9          | Hinata Hyuga         | 777777777  | hinata@example.com   | Ninja de la Aldea Oculta de la Hoja       | Ninja              | 1995-12-27 | hinata.jpg    |
| 10         | Kagome Higurashi     | 888888888  | kagome@example.com   | Viajera en el tiempo                      | Estudiante         | 1987-11-30 | kagome.jpg    |
| 11         | Lucy Heartfilia       | 999999999  | lucy@example.com     | Maga celestial de Fairy Tail               | Maga               | 1998-07-01 | lucy.jpg      |
| 12         | Riza Hawkeye          | 123123123  | riza@example.com     | Teniente y tiradora experta                | Militar            | 1989-01-10 | riza.jpg      |
| 13         | Rei Ayanami           | 456456456  | rei@example.com      | Piloto del Evangelion Unidad-00           | Piloto de Eva      | 2001-03-30 | rei.jpg       |
| 14         | Winry Rockbell        | 789789789  | winry@example.com    | Mecánica y ingeniera                       | Ingeniera          | 1990-05-03 | winry.jpg     |
| 15         | Yoruichi Shihouin     | 135135135  | yoruichi@example.com | Ex-capitana del Gotei 13                   | Ex-capitana        | 1971-01-01 | yoruichi.jpg  |
| 16         | Rukia Kuchiki         | 246246246  | rukia@example.com    | Shinigami y ex-teniente                   | Shinigami          | 1986-01-14 | rukia.jpg     |
| 17         | Tsunade Senju         | 357357357  | tsunade@example.com  | Quinta Hokage de Konoha                    | Hokage             | 1960-08-02 | tsunade.jpg   |
| 18         | Android 18            | 468468468  | android18@example.com| Androide y luchadora                      | Androide           | 2010-02-18 | android18.jpg |
| 19         | Yuno Gasai            | 579579579  | yuno@example.com     | Portadora del Diario de Yuki              | Estudiante         | 1993-02-14 | yuno.jpg      |
| 20         | Homura Akemi          | 681681681  | homura@example.com   | Magical Girl y viajera en el tiempo       | Magical Girl       | 1995-12-03 | homura.jpg    |


- La tabla proyectos

| ID | Nombre                   | Foto                    | Descripción                                      | Enlace                                            | ID Usuario |
|----|--------------------------|-------------------------|--------------------------------------------------|---------------------------------------------------|------------|
| 1  | Proyecto de Sakura       | proyecto_sakura.jpg     | Desarrollo de técnicas médicas ninja             | [Proyecto Sakura](https://github.com/sakura/proyecto) | 1          |
| 2  | Proyecto de Asuka        | proyecto_asuka.jpg      | Defensa contra los Ángeles                       | [Proyecto Asuka](https://github.com/asuka/proyecto)  | 2          |
| 3  | Proyecto de Inuyasha     | proyecto_inuyasha.jpg   | Aventuras en la era feudal                       | [Proyecto Inuyasha](https://github.com/inuyasha/proyecto) | 3          |
| 4  | Proyecto de Bulma        | proyecto_bulma.jpg      | Inventos revolucionarios                          | ...                                               | 4          |
| 5  | Proyecto de Nami         | proyecto_nami.jpg       | Navegación en Grand Line                         | [Proyecto Nami](https://github.com/nami/proyecto)    | 5          |
| 6  | Proyecto de Mikasa       | proyecto_mikasa.jpg     | Desarrollo de estrategias de combate             | ...                                               | 6          |
| 7  | Proyecto de Erza         | proyecto_erza.jpg       | Aventuras mágicas                                | ...                                               | 7          |
| 8  | Proyecto de Zero Two     | proyecto_zero_two.jpg   | Investigación sobre FranXX                       | ...                                               | 8          |
| 9  | Proyecto de Hinata       | proyecto_hinata.jpg     | Desarrollo de técnicas de ninjutsu               | ...                                               | 9          |
| 10 | Proyecto de Kagome       | proyecto_kagome.jpg     | Estudio de viajes en el tiempo                   | ...                                               | 10         |
| 11 | Proyecto de Lucy         | proyecto_lucy.jpg       | Investigación sobre magia celestial              | ...                                               | 11         |
| 12 | Proyecto de Riza         | proyecto_riza.jpg       | Mejora de habilidades de tirador                 | ...                                               | 12         |
| 13 | Proyecto de Rei          | proyecto_rei.jpg        | Desarrollo del Evangelion Unidad-00              | ...                                               | 13         |
| 14 | Proyecto de Winry        | proyecto_winry.jpg       | Innovaciones en ingeniería mecánica              | ...                                               | 14         |
| 15 | Proyecto de Yoruichi     | proyecto_yoruichi.jpg    | Investigación sobre habilidades shinigami        | ...                                               | 15         |
| 16 | Proyecto de Rukia        | proyecto_rukia.jpg       | Estudio de técnicas de shinigami                 | ...                                               | 16         |
| 17 | Proyecto de Tsunade      | proyecto_tsunade.jpg     | Mejora de técnicas médicas                       | ...                                               | 17         |
| 18 | Proyecto de Android 18   | proyecto_android18.jpg   | Desarrollo de habilidades de combate             | ...                                               | 18         |
| 19 | Proyecto de Yuno         | proyecto_yuno.jpg        | Estudio del Diario de Yuki                       | ...                                               | 19         |
| 20 | Proyecto de Homura       | proyecto_homura.jpg      | Investigación sobre viajes en el tiempo          | ...                                               | 20         |

<!-- ... Agrega más proyectos aquí ... -->

- La tabla redes_sociales

| nombre      | foto               | id_usuario |
|-------------|--------------------|------------|
| Twitter     | twitter_icon.jpg   | 1          |
| Instagram   | instagram_icon.jpg | 2          |
| Facebook    | facebook_icon.jpg  | 3          |
| LinkedIn    | linkedin_icon.jpg  | 4          |
| Pinterest   | pinterest_icon.jpg | 5          |
| Tumblr      | tumblr_icon.jpg    | 6          |
| Snapchat    | snapchat_icon.jpg  | 7          |
| WhatsApp    | whatsapp_icon.jpg  | 8          |
| Telegram    | telegram_icon.jpg  | 9          |
| Discord     | discord_icon.jpg   | 10         |
| Reddit      | reddit_icon.jpg    | 11         |
| YouTube     | youtube_icon.jpg   | 12         |
| Twitch      | twitch_icon.jpg    | 13         |
| GitHub      | github_icon.jpg    | 14         |
| GitLab      | gitlab_icon.jpg    | 15         |
| Bitbucket   | bitbucket_icon.jpg | 16         |
| Slack       | slack_icon.jpg     | 17         |
| Skype       | skype_icon.jpg     | 18         |
| Zoom        | zoom_icon.jpg      | 19         |
| Vkontakte   | vkontakte_icon.jpg | 20         |

- La tabla habilidades

| icono                | nombre                      | descripcion                                                  | id_usuario |
|----------------------|-----------------------------|--------------------------------------------------------------|------------|
| habilidad_icon_1.jpg | Jutsu Médico                | Máxima habilidad en técnicas médicas ninja, especializada en jutsu de curación. | 1          |
| habilidad_icon_2.jpg | Piloto de Evangelion        | Habilidad excepcional como piloto de la Unidad-02 en la lucha contra los Ángeles. | 2          |
| habilidad_icon_3.jpg | Control de Energía Youkai   | Capacidad para controlar y utilizar la energía youkai de manera efectiva. | 3          |
| habilidad_icon_4.jpg | Inventora Genial            | Habilidad para inventar dispositivos y tecnologías avanzadas.  | 4          |
| habilidad_icon_5.jpg | Navegación en Grand Line    | Experiencia en la navegación por los peligrosos mares de Grand Line. | 5          |
| habilidad_icon_6.jpg | Lanzamiento de Cuchillos    | Habilidad sobresaliente en el lanzamiento preciso de cuchillos. | 6          |
| habilidad_icon_7.jpg | Transformación Youkai       | Capacidad para transformarse en una forma más poderosa como youkai. | 7          |
| habilidad_icon_8.jpg | Tecnología Avanzada         | Destreza en el desarrollo y uso de tecnología avanzada para diversos propósitos. | 8          |
| habilidad_icon_9.jpg | Magia Celestial              | Maestría en el uso de la magia celestial para invocar espíritus celestiales. | 9          |
| habilidad_icon_10.jpg | Artes Marciales Ninja       | Habilidad excepcional en las artes marciales ninja, incluyendo taijutsu y ninjutsu. | 10         |
| habilidad_icon_11.jpg | Control del Tiempo           | Capacidad para manipular el tiempo en situaciones específicas. | 11         |
| habilidad_icon_12.jpg | Alquimia                     | Conocimiento profundo y habilidad en la práctica de la alquimia. | 12         |
| habilidad_icon_13.jpg | Poderes Psíquicos            | Habilidad para utilizar poderes psíquicos como la telequinesis y la telepatía. | 13         |
| habilidad_icon_14.jpg | Transformación de Evangelion | Capacidad para transformarse en una forma más poderosa como piloto de Evangelion. | 14         |
| habilidad_icon_15.jpg | Ninja de Combate             | Excelencia en las técnicas de combate ninja y el uso de armas tradicionales. | 15         |
| habilidad_icon_16.jpg | Canto Mágico                 | Poderosa voz utilizada en conjunción con la magia para efectos diversos. | 16         |
| habilidad_icon_17.jpg | Técnica de Sello             | Dominio en el uso de sellos mágicos para diversas aplicaciones. | 17         |
| habilidad_icon_18.jpg | Control de Elementos         | Capacidad para controlar y manipular diferentes elementos como fuego, agua y tierra. | 18         |
| habilidad_icon_19.jpg | Arte de la Espada            | Maestría en el manejo de la espada y técnicas de esgrima. | 19         |
| habilidad_icon_20.jpg | Teletransportación          | Habilidad para moverse instantáneamente de un lugar a otro. | 20         |

- La tabla tecnologias

| ID | Nombre                       | Foto                                      | ID Usuario |
|----|------------------------------|-------------------------------------------|------------|
| 1  | Jutsu Médico                 | ![Jutsu Médico](tecnologia_jutsu_medico.jpg)                  | 1          |
| 2  | Piloto de Evangelion         | ![Piloto de Evangelion](tecnologia_piloto_evangelion.jpg)    | 2          |
| 3  | Control de Energía Youkai    | ![Control de Energía Youkai](tecnologia_control_energia_youkai.jpg) | 3          |
| 4  | Inventora Genial              | ![Inventora Genial](tecnologia_inventora_genial.jpg)        | 4          |
| 5  | Navegación en Grand Line      | ![Navegación en Grand Line](tecnologia_navegacion_grand_line.jpg) | 5          |
| 6  | Lanzamiento de Cuchillos      | ![Lanzamiento de Cuchillos](tecnologia_lanzamiento_cuchillos.jpg) | 6          |
| 7  | Transformación Youkai         | ![Transformación Youkai](tecnologia_transformacion_youkai.jpg) | 7          |
| 8  | Tecnología Avanzada           | ![Tecnología Avanzada](tecnologia_tecnologia_avanzada.jpg)  | 8          |
| 9  | Magia Celestial               | ![Magia Celestial](tecnologia_magia_celestial.jpg)          | 9          |
| 10 | Artes Marciales Ninja         | ![Artes Marciales Ninja](tecnologia_artes_marciales_ninja.jpg) | 10         |
| 11 | Control del Tiempo             | ![Control del Tiempo](tecnologia_control_tiempo.jpg)      | 11         |
| 12 | Alquimia                       | ![Alquimia](tecnologia_alquimia.jpg)                      | 12         |
| 13 | Poderes Psíquicos              | ![Poderes Psíquicos](tecnologia_poderes_psiquicos.jpg)    | 13         |
| 14 | Transformación de Evangelion   | ![Transformación de Evangelion](tecnologia_transformacion_evangelion.jpg) | 14         |
| 15 | Ninja de Combate               | ![Ninja de Combate](tecnologia_ninja_combate.jpg)         | 15         |
| 16 | Canto Mágico                   | ![Canto Mágico](tecnologia_canto_magico.jpg)             | 16         |
| 17 | Técnica de Sello               | ![Técnica de Sello](tecnologia_tecnica_sello.jpg)        | 17         |
| 18 | Control de Elementos           | ![Control de Elementos](tecnologia_control_elementos.jpg)| 18         |
| 19 | Arte de la Espada               | ![Arte de la Espada](tecnologia_arte_espada.jpg)         | 19         |
| 20 | Teletransportación              | ![Teletransportación](tecnologia_teletransportacion.jpg) | 20         |

- La tabla experiencias

| ID | Nombre                                     | Descripción                                               | Usuario |
|----|--------------------------------------------|-----------------------------------------------------------|---------|
| 1  | Misión de Protección en Konoha             | Participación en misiones como ninja médica para proteger la aldea de Konoha. | 1       |
| 2  | Defensa contra los Ángeles                | Piloto de la Unidad-02 en la lucha contra los Ángeles para proteger la humanidad. | 2       |
| 3  | Aventuras en la Era Feudal                 | Viajes y enfrentamientos en la era feudal como mitad humano, mitad demonio. | 3       |
| 4  | Inventora en la Patrulla del Tiempo        | Contribuciones como inventora genial en la patrulla del tiempo. | 4       |
| 5  | Navegante en los Mares Peligrosos          | Viajes como navegante en los peligrosos mares de Grand Line. | 5       |
| 6  | Combate en la Legión de reconocimiento     | Participación en combates como soldado de la Legión de reconocimiento. | 6       |
| 7  | Aventuras como Titania                     | Aventuras mágicas y misiones como Titania, la Reina de las Hadas. | 7       |
| 8  | Piloto de FranXX                           | Participación en misiones como piloto de FranXX para proteger la humanidad. | 8       |
| 9  | Misiones Ninja de la Aldea Oculta de la Hoja | Participación en misiones como ninja de la Aldea Oculta de la Hoja. | 9       |
| 10 | Viajes en el Tiempo                        | Aventuras y descubrimientos en viajes en el tiempo. | 10      |
| 11 | Magia Celestial en Fairy Tail              | Aventuras y misiones como maga celestial en el gremio Fairy Tail. | 11      |
| 12 | Teniente y Tiradora Experta                | Servicio como teniente y tiradora experta en el ejército. | 12      |
| 13 | Piloto del Evangelion Unidad-00            | Participación como piloto del Evangelion Unidad-00 en la defensa contra los Ángeles. | 13      |
| 14 | Innovaciones en Ingeniería Mecánica        | Contribuciones como mecánica e ingeniera en innovaciones mecánicas. | 14      |
| 15 | Ex-Capitana del Gotei 13                   | Servicio como ex-capitana del Gotei 13 en el mundo de los shinigami. | 15      |
| 16 | Shinigami y Ex-Teniente                    | Experiencia como shinigami y ex-teniente en la Sociedad de Almas. | 16      |
| 17 | Quinta Hokage de Konoha                    | Servicio como Quinta Hokage para proteger y liderar la aldea de Konoha. | 17      |
| 18 | Luchadora y Androide                      | Participación en combates como androide y luchadora. | 18      |
| 19 | Portadora del Diario de Yuki              | Aventuras y desafíos como portadora del Diario de Yuki. | 19      |
| 20 | Magical Girl y Viajera en el Tiempo        | Aventuras como Magical Girl y viajera en el tiempo. | 20      |
