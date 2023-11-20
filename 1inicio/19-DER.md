# Diagrama entidad relacion
- Los diagramas ER se componen de entidades, relaciones y atributos. También representan la cardinalidad, que define las relaciones en términos de números.
## Entidad
### Entidad Fuerte
- No depende de ninguna otra tabla, puede existir por si solo

**![Entidad Fuerte](/5imagenes/entidad-relacion/entidadFuerte.jpg)**
### Entidad Debil
- Depende de otra tabla(Entidad Fuerte), no puede existir, por si solo

**![Entidad Debil](/5imagenes/entidad-relacion/entidadDebil.jpg)**
## Atributos
### Normal o Simple
- son aquellos que tienen un solo componente y que no se pueden dividir en partes más pequeñas con significado propio

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

## Relaciones
### Normal
- son asociaciones entre dos o más entidades

**![Normal](/5imagenes/entidad-relacion/relacionNormal.jpg)**
### Debil
- son conexiones entre una entidad débil y su propietario

**![Normal](/5imagenes/entidad-relacion/relacionDebil.jpg)**




