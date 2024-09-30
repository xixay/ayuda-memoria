SELECT
		ia.iac_codigo, ia.iac_estado, ia.iac_migrado, ia.iac_codigo_control,
		i.inf_codigo, i.inf_correlativo, i.inf_codigo_control, i.inf_nombre,
		iai.iai_codigo, iai.iac_codigo
FROM	ejecucion_actividades.informes i
		left join ejecucion_actividades.inicios_actividades ia on i.iac_codigo = ia.iac_codigo
		left join ejecucion_actividades.inicio_actividad_informe iai on i.inf_codigo = iai.inf_codigo AND iai.iac_codigo IN (512)
WHERE	i.inf_codigo in (165)
;


{
"SELECT\n\t\tia.iac_codigo, ia.iac_estado, ia.iac_migrado, ia.iac_codigo_control,\n\t\ti.inf_codigo, i.inf_correlativo, i.inf_codigo_control, i.inf_nombre,\n\t\tiai.iai_codigo, iai.iac_codigo\nFROM\tejecucion_actividades.informes i\n\t\tleft join ejecucion_actividades.inicios_actividades ia on i.iac_codigo = ia.iac_codigo\n\t\tleft join ejecucion_actividades.inicio_actividad_informe iai on i.inf_codigo = iai.inf_codigo AND iai.iac_codigo IN (512)\nWHERE\ti.inf_codigo in (165)\n": [
	{
		"iac_codigo" : 1,
		"iac_estado" : 1,
		"iac_migrado" : true,
		"iac_codigo_control" : "ETEP46J23",
		"inf_codigo" : 165,
		"inf_correlativo" : 0,
		"inf_codigo_control" : "R1",
		"inf_nombre" : "8b ",
		"iai_codigo" : 15,
		"iac_codigo" : 512
	}
]}

