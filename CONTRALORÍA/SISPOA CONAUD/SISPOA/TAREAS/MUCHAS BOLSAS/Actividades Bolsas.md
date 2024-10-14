## Opcion nueva tabla
### Crea la actividad bolsa
- Se registra en la tabla actividad_bolsa:
	- se obtiene de que acción estratégica que se selecciono
	- se toma la actividad de donde viene
	- se agrega las horas iniciales
	- se agrega las horas disponibles por comisión
- Se debe validar para que no se pueda registrar la misma  bolsa, osea que tenga los mismos datos que de otra acción estratégica
- el componente en base a su act_codigo, debe traer los datos , solo para el caso de F21(cacCodigo = 2)
- al ir al componente nuevo,verifica si ya tiene un act_codigo_bolsa, de los que eran antes, y si tiene que lo adicione a la tabla actividad_bolsa(pero que esta no este registrada en la tabla actividad_bolsa)
### Modifica la actividad bolsa
- se modifica la acción estratégica
-  se modifica las horas iniciales
- se modifica las horas disponibles por comisión
- al ir al componente nuevo,verifica si ya tiene un act_codigo_bolsa, de los que eran antes, y si tiene que lo adicione a la tabla actividad_bolsa(pero que esta no este registrada en la tabla actividad_bolsa)
### Servicios que se afectarían
#### creación
- que al crear ya no se considere solo uno si no varios
#### Validaciones
- revisar el servicio validateHorasPlanificadasBolsa, considera solo una bolsa
#### findAll
- Crear un nuevo findAll que considere para muchas actividades de tipo bolsa
#### reportes
- Se debe modificar los servicios que traen los reportes, para que considere muchas bolsas(hay por lo menos 2)
#### reformulación
- Se debe considerar en la reformulación, para que considere las muchas bolsas,  y ya no solo uno
## Opción array de actividades bolsa
- Se agrega un nuevo campo que tiene act_codigo_bolsa, que representa las actividades bolsa que tiene