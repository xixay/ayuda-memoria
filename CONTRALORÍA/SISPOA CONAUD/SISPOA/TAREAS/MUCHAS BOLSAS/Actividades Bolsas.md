## Opción nueva tabla
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
- que al crear ya no guarde el act_codigo_bolsa
#### Validaciones
- revisar el servicio validateHorasPlanificadasBolsa, considera solo una bolsa, que a su ves usa el servicio: verificarActividadBolsa
#### findAll
- Crear un nuevo findAll que considere para muchas actividades bolsa, tal ves que envié un array de bolsas
#### reportes
- Se debe modificar los servicios que traen los reportes, para que considere muchas bolsas(hay por lo menos 3)
- revisar el servicio getReportActividadesF21, solo considera una bolsa
- revisar el servicio getReporteActividadesPoa, solo considera una bolsa
- revisar el servicio para Excel: findAllAccionCorto, para que considere mas de una bolsa
#### reformulación
- Se debe considerar en la reformulación, para que considere las muchas bolsas,  y ya no solo uno
- Revisar el servicio : createNewActividad, donde usa checkBolsa, solo considera una bolsa para la reformulacion
## Opción array de actividades bolsa
- Se agrega un nuevo campo que tiene act_codigo_bolsa, que representa las actividades bolsa que tiene
```
[2,3,4,5,22,45]
```
- cada ves que se agrega o modifica una actividad bolsa, se actualiza el array
- osea se filtra, o se elimina cada ves.
