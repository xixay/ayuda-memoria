

Gerencia de Auditoria - GPA-GA3 

{
"-- ACTIVIDADES\n--select \t*\n--select \ta.act_codigo ,a.act_numero ,a.act_descripcion ,a.act_fecha_inicio ,a.act_fecha_fin ,a.act_objeto ,a.ttr_codigo ,a.tipact_codigo,a.cac_codigo \nselect \ta.act_codigo ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, \n\t\tau.aun_nombre, au.aun_sigla,\n\t\tpo.pobj_codigo ,po.pobj_nombre, po.pobj_estado,\n\t\tp.poa_codigo \nfrom \testructura_poa.actividades a \n\t\tleft join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo \n\t\tleft join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo \n\t\tleft join estructura_poa.poas p on p.poa_codigo = po.poa_codigo \nwhere\ttrue \t\n--\t\tand a.act_numero = '00.1601.110.2.24'\n--\t\tand a.act_codigo in (1121)\n\t\tand au.aun_sigla like 'GPA-GA3'\n--\t\tand a.act_estado not in (2,9,0,13)\n\t\tand po.pobj_estado not in (0)\n--\t\tand a.iac_codigo_apoyo is not null\n--\t\tand a.tipact_codigo in (2)\n\t\tand a.cac_codigo in (1,2)\n\t\tand p.poa_codigo in (2)\norder by au.aun_codigo desc": [
	{
		"act_codigo" : 1436,
		"act_numero" : "510.1103.15.10.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Comando General de la Policía Boliviana",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:24:04.124Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 403,
		"act_numero" : "520.1101.43.4.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "AGENCIA DEL DESARROLLO DEL CINE Y AUDIOVISUAL BOLIVIANOS",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 2,
		"fecha_registro" : "2023-11-08T22:37:20.587Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 396,
		"pobj_nombre" : "Emitir 4 Informe Complementario de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1426,
		"act_numero" : "510.1103.15.5.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Fondo Nacional de Desarrollo Regional",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:10:24.940Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1427,
		"act_numero" : "510.1103.15.6.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Fondo Nacional de Inversión Productiva y Social",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:12:39.548Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1432,
		"act_numero" : "510.1103.15.7.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Ministerio de Gobienro",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:17:37.466Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1433,
		"act_numero" : "510.1103.15.8.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Instituto Nacional de Estadística",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:19:53.875Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1434,
		"act_numero" : "510.1103.15.9.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Mutual de Servicios al Policía",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:21:57.892Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 589,
		"act_numero" : "520.1101.47.19.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "FONDO NACIONAL DE INVERSIÓN PRODUCTIVA Y SOCIAL",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T19:04:53.075Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 635,
		"pobj_nombre" : "Emitir 22 informe de Supervisión de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 209,
		"act_numero" : "500.1101.41.7.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "SERVICIO GEOLÓGICO MINERO",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T22:34:09.662Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 234,
		"pobj_nombre" : "Emitir 8 informes de Auditorías Operacionales de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 210,
		"act_numero" : "500.1101.41.8.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "MINISTERIO DE PLANIFICACIÓN DEL DESARROLLO",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T22:36:13.790Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 234,
		"pobj_nombre" : "Emitir 8 informes de Auditorías Operacionales de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1262,
		"act_numero" : "500.1103.42.1.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE LOS PLANES ANUALES DE ACTIVIDADES, GESTIÓN 2025, DE LAS UAI.",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T19:31:23.697Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 236,
		"pobj_nombre" : "Emitir 90 informes analíticos de los planes anuales elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1270,
		"act_numero" : "520.1103.46.1.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "BOLSA PARA ATENCIÓN DE DENUNCIAS",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T23:31:14.772Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 425,
		"pobj_nombre" : "Previsionar el 30% de horas hombre para atención de denuncias y supervisión en Entidades Públicas del Nivel Central en la Gerencia Principal de Auditoria 2en la gestión 2024",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1273,
		"act_numero" : "510.1103.15.2.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE INFORMES DE AUDITORÍA FINANCIERA EMITIDOS POR LAS UAI DE LOS ENTES TUTORES",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T13:40:22.812Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1344,
		"act_numero" : "500.1103.42.1.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE LOS PLANES ANUALES DE ACTIVIDADES, GESTIÓN 2025, DE LAS UAI.",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T19:31:23.697Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 236,
		"pobj_nombre" : "Emitir 90 informes analíticos de los planes anuales elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1345,
		"act_numero" : "510.1103.15.2.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE INFORMES DE AUDITORÍA FINANCIERA EMITIDOS POR LAS UAI DE LOS ENTES TUTORES",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T13:40:22.812Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1346,
		"act_numero" : "520.1103.44.1.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE INFORMES DE AUDITORÍA DE CUMPLIMIENTO EMITIDOS POR LAS UAI.",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T19:48:26.894Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 398,
		"pobj_nombre" : "Emitir 70 informes analíticos de auditorías de cumplimiento elaborados por las UAI de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1347,
		"act_numero" : "510.1103.15.1.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE INFORMES DE CONFIABILIDAD EMITIDOS POR LAS UAI.",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T19:42:46.247Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1348,
		"act_numero" : "500.1103.43.1.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "EVALUACIÓN DE INFORMES DE AUDITORÍA OPERACIONAL EMITIDOS POR LAS UAIS",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-07T19:36:58.332Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 237,
		"pobj_nombre" : "Emitir 35 informes analíticos de Auditorias Operacionales significativos elaborados por las UAI´S de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1420,
		"act_numero" : "510.1103.15.2.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Autoridad Jurisdiccional Adminsitrativa Minera",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:00:45.891Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1422,
		"act_numero" : "510.1103.15.3.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Banco Central de Bolivia",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:04:30.615Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 1423,
		"act_numero" : "510.1103.15.4.24",
		"cac_codigo" : 2,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "Consejo Nacional de Vivienda Policial",
		"aun_codigo_ejecutora" : 77,
		"tipact_codigo" : 1,
		"fecha_registro" : "2024-04-29T14:07:57.306Z",
		"aun_nombre" : "Gerencia de Auditoria",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 282,
		"pobj_nombre" : "Emitir 100 informes analíticos de exámenes de confiabilidad significativos elaborados por las UAI de Entidades Públicas del Nivel Central en la Gerencia de Auditoria Principal en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 592,
		"act_numero" : "520.1101.47.20.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "CONSEJO NACIONAL DE VIVIENDA POLICIAL",
		"aun_codigo_ejecutora" : 75,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T19:07:10.530Z",
		"aun_nombre" : "Gerencia de Auditoría",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 635,
		"pobj_nombre" : "Emitir 22 informe de Supervisión de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 585,
		"act_numero" : "520.1101.47.18.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "MINISTERIO DE GOBIERNO",
		"aun_codigo_ejecutora" : 75,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T19:01:38.680Z",
		"aun_nombre" : "Gerencia de Auditoría",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 635,
		"pobj_nombre" : "Emitir 22 informe de Supervisión de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 609,
		"act_numero" : "520.1101.47.21.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "FONDO DE DESARROLLO DEL SISTEMA FINANCIERO Y APOYO AL SECTOR PRODUCTIVO",
		"aun_codigo_ejecutora" : 75,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T19:23:33.989Z",
		"aun_nombre" : "Gerencia de Auditoría",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 635,
		"pobj_nombre" : "Emitir 22 informe de Supervisión de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 613,
		"act_numero" : "520.1101.47.22.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "MINISTERIO DE EDUCACIÓN",
		"aun_codigo_ejecutora" : 75,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T19:26:20.434Z",
		"aun_nombre" : "Gerencia de Auditoría",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 635,
		"pobj_nombre" : "Emitir 22 informe de Supervisión de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	},
	{
		"act_codigo" : 580,
		"act_numero" : "520.1101.47.17.24",
		"cac_codigo" : 1,
		"iac_codigo_apoyo" : null,
		"act_estado" : 2,
		"act_descripcion" : "MINISTERIO DE PLANIFICACIÓN DEL DESARROLLO",
		"aun_codigo_ejecutora" : 75,
		"tipact_codigo" : 1,
		"fecha_registro" : "2023-11-09T18:58:41.481Z",
		"aun_nombre" : "Gerencia de Auditoría",
		"aun_sigla" : "GPA-GA3",
		"pobj_codigo" : 635,
		"pobj_nombre" : "Emitir 22 informe de Supervisión de Entidades Públicas del Nivel Central a nivel nacional en la Gerencia Principal de Auditoria en la gestión 2024.",
		"pobj_estado" : 2,
		"poa_codigo" : 2
	}
]}

