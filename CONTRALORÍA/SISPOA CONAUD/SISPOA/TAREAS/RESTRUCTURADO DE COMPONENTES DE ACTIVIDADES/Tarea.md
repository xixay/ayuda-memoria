## Base de prueba
- backup_20241001_135955.sql
## Donde se ubica componente
- El cual remplazara el actual
- components/sispoa/estructura_formulario/RActividades.vue
## Áreas donde Norka es responsable

| aun_sigla |
| --------- |
| DC        |
| GDT-GAM1  |
| SCG       |
## Codigos de prueba para apoyo iac_codigo_control

| ETEP25J09 |
| --------- |
| ELRP25S02 |
| ETGP25G19 |
| ETEP25S08 |
| ALCP25M07 |
| EODP25M23 |
| GPFP25L99 |
| EOEP25A21 |
| GSEP25G02 |
| EXYP25O04 |

- Obtiene
```
flag_migrado: true
iac_codigo: 718
iac_codigo_control: "2009 | ETEP25J09 | EMITIR OPINIÓN INDEPENDIENTE SOBRE LA CORRECTA ADMINISTRACIÇON DE LOS RECURSOS PROVENIENTES DEL IDH"
```

## Para ActividadContinuidad
- Lo que llega
```
  
{  
conaud_gestion: 2002,  
conaud_codigo: '20201',  
conaud_correlativo: 'A01848',  
act_codigo: 0,  
conaud_detalle: {  
	correlativo_codigo: 'A01848',  
	trabajo_codigo: 'ELRP25S02 ',  
	trabajo_codigo_f: 'EL/RP25/S2',  
	actividad_codigo: '20201',  
	actividad_correlativo: '044',  
	actividad_gestion: 2002,  
	entidad_codigo: 14128,  
	entidad_descripcion: 'HOSPITAL MUNICIPAL LOS ANDES',  
	actividad_fecha_inicio: '01/10/2002',  
	actividad_fecha_fin: '31/12/2002',  
	auditoria_fecha_inicio: '26/09/2002',  
	auditoria_dias_habiles: 50,  
	auditoria_dias_calendario: 70,  
	auditoria_fecha_entrega: '04/12/2002',  
	auditoria_fecha_emision: '04/02/2003',  
	auditoria_objeto: 'RELEVAMIENTO DE INFORMACION DEL HOSPITAL LOS ANDES',  
	auditoria_objetivo: 'DETERMINAR ASPECTOS A SER AUDITADOS',  
	auditoria_periodo: 'GESTION 2001 AL 30/09/2002',
```

## Lo que envia al crear el post continuo antes
```json
{
	"act_alcance": "CONTINUO 1",
	"act_cantidad": "111",
	"act_codigo_bolsa": 2729,
	"act_descripcion": "CONTINUO 1",
	"act_fecha_fin": "10/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": "1",
	"act_justificacion": "CONTINUO 1",
	"act_no_planificado": false,
	"act_objetivo": "CONTINUO 1",
	"act_objeto": "CONTINUO 1",
	"actividad_object": {
		"act_codigo": 0,
		"conaud_codigo": "52.14102.117.24 ",
		"conaud_correlativo": "A07907",
		"conaud_detalle": {
			"actividad_codigo": "52.14102.117.24 ",
			"actividad_correlativo": "003",
			"actividad_fecha_fin": "31/12/2023",
			"actividad_fecha_inicio": "01/04/2021",
			"actividad_gestion": 2021,
			"auditoria_dias_calendario": 882,
			"auditoria_dias_habiles": 630,
			"auditoria_fecha_emision": "23/04/2024",
			"auditoria_fecha_entrega": "27/09/2023",
			"auditoria_fecha_inicio": "29/04/2021",
			"auditoria_objetivo": "EMITIR OPINIÓN SOBRE EL ORDEN JURÍDICO ADM. Y OTRAS NORMAS LEG. APLICABLES Y OBLIGATORIAS CONTRACTUA",
			"auditoria_objeto": "INFRAESTRUCTURA SOCIAL (CANCHAS)",
			"auditoria_periodo": "GESTIÓN 2014 - 2015",
			"correlativo_codigo": "A07907",
			"entidad_codigo": 53480,
			"entidad_descripcion": "GOBIERNO AUTONOMO DEPARTAMENTAL DE ORURO",
			"trabajo_codigo": "EOEP25A21",
			"trabajo_codigo_f": "EO/EP25/A21"
		},
		"conaud_gestion": 2021
	},
	"aun_codigo_ejecutora": 1,
	"aun_codigo_supervisora": 1,
	"caa_codigo": 2,
	"cac_codigo": 2,
	"cca_codigo": 2,
	"cfa_codigo": 1,
	"cga_codigo": 1,
	"ent_codigo": 613,
	"flag_iac_codigo_apoyo": false,
	"fob_codigo": 1,
	"iac_codigo": 0,
	"iac_codigo_continuo": 720,
	"pobj_codigo": 1365,
	"sec_codigo": 4,
	"tin_codigo": 2,
	"tipact_codigo": 2,
	"ttr_codigo": 72,
	"ume_codigo": 3
}
```

## Lo que envia de tipo continuo nuevo
```json
{
	"act_alcance": "CONTINUO 1",
	"act_cantidad": "111",
	"act_codigo_bolsa": 1823,
	"act_descripcion": "CONTINUO 1",
	"act_fecha_fin": "10/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": "1",
	"act_justificacion": "CONTINUO 1",
	"act_no_planificado": true,
	"act_objetivo": "CONTINUO 1",
	"act_objeto": "CONTINUO 1",
	"actividad_object": {
		"act_codigo": 0,
		"conaud_codigo": "20201",
		"conaud_correlativo": "A01848",
		"conaud_detalle": {
			"actividad_codigo": "20201",
			"actividad_correlativo": "044",
			"actividad_fecha_fin": "31/12/2002",
			"actividad_fecha_inicio": "01/10/2002",
			"actividad_gestion": 2002,
			"auditoria_dias_calendario": 70,
			"auditoria_dias_habiles": 50,
			"auditoria_fecha_emision": "04/02/2003",
			"auditoria_fecha_entrega": "04/12/2002",
			"auditoria_fecha_inicio": "26/09/2002",
			"auditoria_objetivo": "DETERMINAR ASPECTOS A SER AUDITADOS",
			"auditoria_objeto": "RELEVAMIENTO DE INFORMACION DEL HOSPITAL LOS ANDES",
			"auditoria_periodo": "GESTION 2001 AL 30/09/2002",
			"correlativo_codigo": "A01848",
			"entidad_codigo": 14128,
			"entidad_descripcion": "HOSPITAL MUNICIPAL LOS ANDES",
			"trabajo_codigo": "ELRP25S02           ",
			"trabajo_codigo_f": "EL/RP25/S2"
		},
		"conaud_gestion": 2002
	},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_supervisora": 4,
	"caa_codigo": 2,
	"cac_codigo": 2,
	"cca_codigo": 2,
	"cfa_codigo": 2,
	"cga_codigo": 1,
	"ent_codigo": 592,
	"fob_codigo": 1,
	"iac_codigo_continuo": 719,
	"pobj_codigo": 899,
	"sec_codigo": 2,
	"tin_codigo": 1,
	"tipact_codigo": 2,
	"ttr_codigo": 48,
	"ume_codigo": 5
}
```

## Lo que manda tipo apoyo en el antiguo

```
**GPA2-GAD**
|3386714|GUERY RAMIRO CUENTAS AGUIRRE|GERENTE CONSOLIDADOR|EDICION|
|3363823|JUAN JOSE CHUQUIMIA|FORMULADOR|EDICION|
|2389409|OLGA EDITH SUAREZ JIMENEZ|SUPERVISOR|EDICION|
|3386714|GUERY RAMIRO CUENTAS AGUIRRE|APROBADOR|EDICION|
|3363823|JUAN JOSE CHUQUIMIA|FORMULADOR GERENTE|EDICION|
```

```json
{
	"act_alcance": "APOYO 1",
	"act_cantidad": "111",
	"act_codigo_bolsa": 1823,
	"act_descripcion": "APOYO 1",
	"act_fecha_fin": "10/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": "1",
	"act_justificacion": "APOYO 1",
	"act_no_planificado": true,
	"act_objetivo": "APOYO 1",
	"act_objeto": "APOYO 1",
	"actividad_object": {},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_supervisora": 4,
	"caa_codigo": 3,
	"cac_codigo": 2,
	"cca_codigo": 1,
	"cfa_codigo": 2,
	"cga_codigo": 1,
	"ent_codigo": 613,
	"flag_iac_codigo_apoyo": true,
	"fob_codigo": 1,
	"iac_codigo": 721,
	"iac_codigo_continuo": 0,
	"pobj_codigo": 899,
	"sec_codigo": 2,
	"tin_codigo": 1,
	"tipact_codigo": 1,
	"ttr_codigo": 8,
	"ume_codigo": 2
}
```

## Lo que manda tipo apoyo en el Nuevo
```json
{
	"act_alcance": "APOYO 1",
	"act_cantidad": "111",
	"act_codigo_bolsa": 1852,
	"act_descripcion": "APOYO 1",
	"act_fecha_fin": "10/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": "1",
	"act_justificacion": "APOYO 1",
	"act_no_planificado": true,
	"act_objetivo": "APOYO 1",
	"act_objeto": "APOYO 1",
	"actividad_object": {},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_supervisora": 4,
	"caa_codigo": 1,
	"cac_codigo": 2,
	"cca_codigo": 2,
	"cfa_codigo": 2,
	"cga_codigo": 1,
	"ent_codigo": 613,
	"fob_codigo": 1,
	"iac_codigo": 718,
	"pobj_codigo": 899,
	"sec_codigo": 2,
	"tin_codigo": 1,
	"tipact_codigo": 1,
	"ttr_codigo": 8,
	"ume_codigo": 2
}
```
Sugerencia Codigo Nuevo
```js
async accionNuevo(bandera) {
  await this.setDefaultValuePrograma(FlagFormType.CREATE);

  const { tin_codigo, pobj_indicador } = this.objectPoaObjetivo;
  const { cantidad_actividades } = this.dataFormulario;
  const area = await this.ArrayAreaSupervisoras.find(f => f.aun_codigo == this.codFormularioSupervisor && f.nau_codigo == 1);

  // Lógica para configurar `registro`
  this.dialogNuevo = true;
  this.bandera_muestra_datos = bandera;
  this.registro.cac_codigo = 1;
  this.registro.aun_codigo_supervisora = area ? this.ArrayAreaSupervisoras[0].aun_codigo : this.codFormularioSupervisor;
  this.registro.tipact_codigo = 1;

  // Si bandera es 11, realizar actividades adicionales
  if (bandera === 11) {
    this.registro.cac_codigo = this.clasificacionActividades || 2;
    this.registro.act_no_planificado = tin_codigo == 1 && pobj_indicador <= cantidad_actividades;
    this.getActividades();
    this.getActividadesConaud();
  }

  // Si existe directivo
  this.banderaSiExisteDirectivo = !!area;

  // Si tin_codigo es 1 y pobj_indicador es mayor que cantidad_actividades, realizar acciones adicionales
  if (tin_codigo == 1 && pobj_indicador > cantidad_actividades) {
    this.registro.cac_codigo = 1;
    if (bandera === 11) {
      this.getActividades();
      this.getActividadesConaud();
    }
  }

  this.changeActividadType(1);
}

```

## Cuando tin_codigo es 2
![[accion nuevo tin_codigo 2.png]]
- Resultado
```
act_codigo_bolsa: null,  
tipact_codigo: 1,  
ttr_codigo: 0,  
cac_codigo: 2,  
aun_codigo_supervisora: 1,  
act_no_planificado: false,
```
- Resultado Nuevo
```
tipact_codigo: 1,  
act_fecha_inicio: null,  
act_fecha_fin: null,  
cac_codigo: 2,  
aun_codigo_supervisora: 1,  
act_no_planificado: false,
```
## Cuando tin_codigo es 1
| pobj_codigo | act_codigo | act_numero        | aun_sigla |
| ----------- | ---------- | ----------------- | --------- |
| 930         | 4745       | 500.1201.47.2.24  | GPA2-GAD  |
| 1150        | 4754       | 520.1101.43.3.24  | GPA-GA1   |
| 1150        | 4755       | 520.1102.43.4.24  | GPA-GA2   |
| 1395        | 4756       | 520.1103.164.2.24 | GPA-GA3   |
- Roles
```
**GPA2-GAD**
|3386714|GUERY RAMIRO CUENTAS AGUIRRE|GERENTE CONSOLIDADOR|EDICION|
|3363823|JUAN JOSE CHUQUIMIA|FORMULADOR|EDICION|
|2389409|OLGA EDITH SUAREZ JIMENEZ|SUPERVISOR|EDICION|
|3386714|GUERY RAMIRO CUENTAS AGUIRRE|APROBADOR|EDICION|
|3363823|JUAN JOSE CHUQUIMIA|FORMULADOR GERENTE|EDICION|
```
![[accion nuevo tin_codigo 1.png]]
- Resultado antes
```
act_codigo_bolsa: null,  
tipact_codigo: 1,  
ttr_codigo: 0,  
cfa_codigo: 2,  
cac_codigo: 2,
```
- Resultado del nuevo
```
act_fecha_fin: null
act_fecha_inicio: null
act_no_planificado: false
aun_codigo_supervisora: 4
cac_codigo: 2
cfa_codigo: 2
tipact_codigo: 1
```
## No puede ser de apoyo y de tipo continuo a la vez
- Si esta tickeado Continuo no debe aparecer el de apoyo
- Si esta tickeado el de apoyo si osi va ser nuevo, no habra la opcion de condinuidad
## Se creo una actividad
- La base local: backup_20241002_140938.sql
- Rol: 3363823 : Formulador
## TRES ACTIVIDADES DE PRUEBA 
- backup_20241002_194348.sql
## Version postgres Trabajo
```
╰─ psql --version
psql (PostgreSQL) 17.0 (Debian 17.0-1.pgdg110+1)

╰─ pg_dump --version
pg_dump (PostgreSQL) 13.16 (Debian 13.16-1.pgdg110+1)
```
## Se edita de tipo apoyo antiguo
![[editar tipo apoyo.png]]
```json
{
	"act_alcance": "APOYO 3",
	"act_cac_descripcion": "INCORPORACIÓN",
	"act_cantidad": 111,
	"act_codigo": 4769,
	"act_codigo_anterior": null,
	"act_codigo_apoyo": 0,
	"act_codigo_bolsa": 1861,
	"act_codigo_ejecucion": 0,
	"act_correlativo": 4,
	"act_denuncia": null,
	"act_descripcion": "APOYO 3",
	"act_ejecucion_conaud": false,
	"act_estado": 1,
	"act_estado_descripcion": "EDICION",
	"act_fecha_fin": "06/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": 1,
	"act_justificacion": "APOYO 3",
	"act_no_planificado": true,
	"act_num_desc": "500.1201.44.4.24 - NUEVO 2",
	"act_numero": "500.1201.44.4.24",
	"act_objetivo": "APOYO 3",
	"act_objeto": "APOYO 3",
	"act_tipact_descripcion": "NUEVO",
	"actividad_object": {},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_ejecutora_actividad": 63,
	"aun_codigo_supervisora": 4,
	"aun_estado": 2,
	"aun_inicial_ejecutora": "L",
	"aun_inicial_supervisora": "E",
	"aun_nombre_ejecutora": "Gerencia Departamental de Auditoría en Gobiernos Departamentales - GPA2-GAD",
	"aun_nombre_supervisora": "Subcontraloría de Gobiernos Departamentales - SCGD",
	"aun_numero": "1201",
	"aun_sigla_ejecutora": "GPA2-GAD",
	"aun_sigla_supervisora": "SCGD",
	"avi_estado": null,
	"bandera_unidad_supervisora_asignada": 0,
	"caa_codigo": 2,
	"caa_nombre": "SUPERVISIÓN",
	"cac_codigo": 2,
	"cant_viaticos": 0,
	"cau_codigo": 1,
	"cca_codigo": 2,
	"cca_nombre": "CONTROL EXTERNO",
	"cfa_codigo": 2,
	"cfa_nombre": "SUSTANTIVO",
	"cga_codigo": 1,
	"cga_nombre": "AGRUPACIÓN SUBCONTRALORIAS",
	"conaud": "",
	"desc_nombre": "",
	"desc_observacion": "",
	"ent_codigo": 614,
	"ent_descripcion": "ADMINISTRACION DE AEROPUERTOS Y SERVICIOS AUXILIARES A LA NAVEGACION AEREA - COCHABAMBA",
	"est_color": "#54bebe",
	"ett_codigo": 5,
	"ett_nombre": "EVALUACIÓN",
	"fech_registro": "",
	"fecha_registro": "09:19 am 03/10/2024",
	"fob_codigo": 1,
	"ges_anio": 2024,
	"ges_codigo": 2,
	"horas_saldo": "1",
	"iac_codigo_apoyo": 722,
	"iac_codigo_continuo": 0,
	"iac_codigo_control": null,
	"iac_concatenado": "",
	"lug_codigo": 2,
	"poa_codigo": 3,
	"pobj_codigo": 899,
	"pobj_numero": 44,
	"pro_numero": "500",
	"sec_codigo": 2,
	"sec_descripcion": "AGROPECUARIO",
	"tin_codigo": 1,
	"tipact_codigo": 1,
	"total_horas_presupuestadas": "0",
	"ttr_codigo": 8,
	"ttr_inicial": "T",
	"ttr_sigla": "EVFIRM",
	"ume_codigo": 2,
	"ume_descripcion": "BOLETINES INFORMATIVOS"
}
```
## Se edita de tipo apoyo nuevo
![[editar tipo apoyo nuevo.png]]
```json
{
	"act_alcance": "APOYO 2",
	"act_cac_descripcion": "INCORPORACIÓN",
	"act_cantidad": 111,
	"act_codigo": 4766,
	"act_codigo_anterior": null,
	"act_codigo_apoyo": 0,
	"act_codigo_bolsa": 1824,
	"act_codigo_ejecucion": 0,
	"act_correlativo": 3,
	"act_denuncia": null,
	"act_descripcion": "APOYO 2",
	"act_ejecucion_conaud": false,
	"act_estado": 1,
	"act_estado_descripcion": "EDICION",
	"act_fecha_fin": "04/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": 1,
	"act_justificacion": "APOYO 2",
	"act_no_planificado": true,
	"act_num_desc": "500.1201.44.3.24 - CONTINUO 1",
	"act_numero": "500.1201.44.3.24",
	"act_objetivo": "APOYO 2",
	"act_objeto": "APOYO 2",
	"act_tipact_descripcion": "CONTINUIDAD",
	"actividad_object": {
		"aco_act_objetivo": "CONTINUO 1",
		"aco_codigo": 399,
		"aco_descripcion": "",
		"aco_estado": 1,
		"aco_estado_descripcion": "EDICION",
		"act_codigo": 4766,
		"conaud_codigo": "010.01.25.01",
		"conaud_correlativo": "A04076",
		"conaud_detalle": {
			"actividad_codigo": "010.01.25.01",
			"actividad_correlativo": "006",
			"actividad_fecha_fin": "30/10/2014",
			"actividad_fecha_inicio": "01/07/2009",
			"actividad_gestion": 2009,
			"auditoria_dias_calendario": 1508,
			"auditoria_dias_habiles": 1058,
			"auditoria_fecha_emision": "25/02/2014",
			"auditoria_fecha_entrega": "31/07/2013",
			"auditoria_fecha_inicio": "15/06/2009",
			"auditoria_objetivo": "EMITIR OPINIÓN INDEPENDIENTE SOBRE LA CORRECTA ADMINISTRACIÇON DE LOS RECURSOS PROVENIENTES DEL IDH",
			"auditoria_objeto": "RECURSOS PROVENIENTES DEL IDH",
			"auditoria_periodo": "GESTIÓN 2008",
			"correlativo_codigo": "A04076",
			"entidad_codigo": 1207,
			"entidad_descripcion": "PREFECTURA DEL DEPARTAMENTO DE TARIJA",
			"trabajo_codigo": "ETEP25J09",
			"trabajo_codigo_f": "ET/EP25/J9"
		},
		"conaud_gestion": 2009,
		"est_color": "#54bebe",
		"fecha_registro": "19:41 pm 02/10/2024",
		"iac_codigo": 718
	},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_ejecutora_actividad": 63,
	"aun_codigo_supervisora": 4,
	"aun_estado": 2,
	"aun_inicial_ejecutora": "L",
	"aun_inicial_supervisora": "E",
	"aun_nombre_ejecutora": "Gerencia Departamental de Auditoría en Gobiernos Departamentales - GPA2-GAD",
	"aun_nombre_supervisora": "Subcontraloría de Gobiernos Departamentales - SCGD",
	"aun_numero": "1201",
	"aun_sigla_ejecutora": "GPA2-GAD",
	"aun_sigla_supervisora": "SCGD",
	"avi_estado": null,
	"bandera_unidad_supervisora_asignada": 0,
	"caa_codigo": 2,
	"caa_nombre": "SUPERVISIÓN",
	"cac_codigo": 2,
	"cant_viaticos": 0,
	"cau_codigo": 1,
	"cca_codigo": 2,
	"cca_nombre": "CONTROL EXTERNO",
	"cfa_codigo": 2,
	"cfa_nombre": "SUSTANTIVO",
	"cga_codigo": 1,
	"cga_nombre": "AGRUPACIÓN SUBCONTRALORIAS",
	"conaud": "",
	"desc_nombre": "",
	"desc_observacion": "",
	"ent_codigo": 613,
	"ent_descripcion": null,
	"est_color": "#54bebe",
	"ett_codigo": 0,
	"ett_nombre": "AUDITORÍA",
	"fech_registro": "",
	"fecha_registro": "19:41 pm 02/10/2024",
	"fob_codigo": 1,
	"ges_anio": 2024,
	"ges_codigo": 2,
	"horas_saldo": "1",
	"iac_codigo": 719,
	"iac_codigo_apoyo": null,
	"iac_codigo_control": null,
	"iac_concatenado": "",
	"lug_codigo": 2,
	"poa_codigo": 3,
	"pobj_codigo": 899,
	"pobj_numero": 44,
	"pro_numero": "500",
	"sec_codigo": 6,
	"sec_descripcion": "DEFENSA NACIONAL",
	"tipact_codigo": 1,
	"total_horas_presupuestadas": "0",
	"ttr_codigo": 8,
	"ttr_inicial": "F",
	"ttr_sigla": "AUFIN",
	"ume_codigo": 2,
	"ume_descripcion": "BOLETINES INFORMATIVOS"
}
```
## Se edita cambiando de continuo a nuevo (ANTIGUO)
```json
{
	"act_alcance": "NUEVO 2",
	"act_cac_descripcion": "INCORPORACIÓN",
	"act_cantidad": 111,
	"act_codigo": 4769,
	"act_codigo_anterior": null,
	"act_codigo_apoyo": 0,
	"act_codigo_bolsa": 1861,
	"act_codigo_ejecucion": 0,
	"act_correlativo": 4,
	"act_denuncia": null,
	"act_descripcion": "NUEVO 2",
	"act_ejecucion_conaud": false,
	"act_estado": 1,
	"act_estado_descripcion": "EDICION",
	"act_fecha_fin": "06/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": 1,
	"act_justificacion": "NUEVO 2",
	"act_no_planificado": true,
	"act_num_desc": "500.1201.44.4.24 - CONTINUO 1",
	"act_numero": "500.1201.44.4.24",
	"act_objetivo": "NUEVO 2",
	"act_objeto": "NUEVO 2",
	"act_tipact_descripcion": "CONTINUIDAD",
	"actividad_object": {},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_ejecutora_actividad": 63,
	"aun_codigo_supervisora": 4,
	"aun_estado": 2,
	"aun_inicial_ejecutora": "L",
	"aun_inicial_supervisora": "E",
	"aun_nombre_ejecutora": "Gerencia Departamental de Auditoría en Gobiernos Departamentales - GPA2-GAD",
	"aun_nombre_supervisora": "Subcontraloría de Gobiernos Departamentales - SCGD",
	"aun_numero": "1201",
	"aun_sigla_ejecutora": "GPA2-GAD",
	"aun_sigla_supervisora": "SCGD",
	"avi_estado": null,
	"bandera_unidad_supervisora_asignada": 0,
	"caa_codigo": 2,
	"caa_nombre": "SUPERVISIÓN",
	"cac_codigo": 2,
	"cant_viaticos": 0,
	"cau_codigo": 1,
	"cca_codigo": 2,
	"cca_nombre": "CONTROL EXTERNO",
	"cfa_codigo": 2,
	"cfa_nombre": "SUSTANTIVO",
	"cga_codigo": 1,
	"cga_nombre": "AGRUPACIÓN SUBCONTRALORIAS",
	"conaud": "",
	"desc_nombre": "",
	"desc_observacion": "",
	"ent_codigo": 614,
	"ent_descripcion": null,
	"est_color": "#54bebe",
	"ett_codigo": 5,
	"ett_nombre": "EVALUACIÓN",
	"fech_registro": "",
	"fecha_registro": "09:19 am 03/10/2024",
	"fob_codigo": 1,
	"ges_anio": 2024,
	"ges_codigo": 2,
	"horas_saldo": "1",
	"iac_codigo_apoyo": null,
	"iac_codigo_continuo": 0,
	"iac_codigo_control": null,
	"iac_concatenado": "",
	"lug_codigo": 2,
	"poa_codigo": 3,
	"pobj_codigo": 899,
	"pobj_numero": 44,
	"pro_numero": "500",
	"sec_codigo": 2,
	"sec_descripcion": "AGROPECUARIO",
	"tin_codigo": 1,
	"tipact_codigo": 1,
	"total_horas_presupuestadas": "0",
	"ttr_codigo": 77,
	"ttr_inicial": "T",
	"ttr_sigla": "EVFIRM",
	"ume_codigo": 2,
	"ume_descripcion": "BOLETINES INFORMATIVOS"
}
```

## Se edita cambiando de continuo a nuevo (NUEVO)
```json
{
	"act_alcance": "cont",
	"act_cac_descripcion": "INCORPORACIÓN",
	"act_cantidad": 111,
	"act_codigo": 4766,
	"act_codigo_anterior": null,
	"act_codigo_apoyo": 0,
	"act_codigo_bolsa": 1823,
	"act_codigo_ejecucion": 0,
	"act_correlativo": 3,
	"act_denuncia": null,
	"act_descripcion": "cont",
	"act_ejecucion_conaud": false,
	"act_estado": 1,
	"act_estado_descripcion": "EDICION",
	"act_fecha_fin": "17/10/2024",
	"act_fecha_inicio": "01/10/2024",
	"act_horas_planificadas": 1,
	"act_justificacion": "cont",
	"act_no_planificado": true,
	"act_num_desc": "500.1201.44.3.24 - cont",
	"act_numero": "500.1201.44.3.24",
	"act_objetivo": "cont",
	"act_objeto": "cont",
	"act_tipact_descripcion": "CONTINUIDAD",
	"actividad_object": {
		"aco_act_objetivo": "cont",
		"aco_codigo": 399,
		"aco_descripcion": "",
		"aco_estado": 1,
		"aco_estado_descripcion": "EDICION",
		"act_codigo": 4766,
		"conaud_codigo": "20201",
		"conaud_correlativo": "A01848",
		"conaud_detalle": {
			"actividad_codigo": "20201",
			"actividad_correlativo": "044",
			"actividad_fecha_fin": "31/12/2002",
			"actividad_fecha_inicio": "01/10/2002",
			"actividad_gestion": 2002,
			"auditoria_dias_calendario": 70,
			"auditoria_dias_habiles": 50,
			"auditoria_fecha_emision": "04/02/2003",
			"auditoria_fecha_entrega": "04/12/2002",
			"auditoria_fecha_inicio": "26/09/2002",
			"auditoria_objetivo": "DETERMINAR ASPECTOS A SER AUDITADOS",
			"auditoria_objeto": "RELEVAMIENTO DE INFORMACION DEL HOSPITAL LOS ANDES",
			"auditoria_periodo": "GESTION 2001 AL 30/09/2002",
			"correlativo_codigo": "A01848",
			"entidad_codigo": 14128,
			"entidad_descripcion": "HOSPITAL MUNICIPAL LOS ANDES",
			"trabajo_codigo": "ELRP25S02           ",
			"trabajo_codigo_f": "EL/RP25/S2"
		},
		"conaud_gestion": 2002,
		"est_color": "#54bebe",
		"fecha_registro": "14:35 pm 03/10/2024",
		"iac_codigo": 719
	},
	"aun_codigo_ejecutora": 63,
	"aun_codigo_ejecutora_actividad": 63,
	"aun_codigo_supervisora": 4,
	"aun_estado": 2,
	"aun_inicial_ejecutora": "L",
	"aun_inicial_supervisora": "E",
	"aun_nombre_ejecutora": "Gerencia Departamental de Auditoría en Gobiernos Departamentales - GPA2-GAD",
	"aun_nombre_supervisora": "Subcontraloría de Gobiernos Departamentales - SCGD",
	"aun_numero": "1201",
	"aun_sigla_ejecutora": "GPA2-GAD",
	"aun_sigla_supervisora": "SCGD",
	"avi_estado": null,
	"bandera_unidad_supervisora_asignada": 0,
	"caa_codigo": 1,
	"caa_nombre": "AUDITORÍA",
	"cac_codigo": 2,
	"cant_viaticos": 0,
	"cau_codigo": 1,
	"cca_codigo": 2,
	"cca_nombre": "CONTROL EXTERNO",
	"cfa_codigo": 2,
	"cfa_nombre": "SUSTANTIVO",
	"cga_codigo": 1,
	"cga_nombre": "AGRUPACIÓN SUBCONTRALORIAS",
	"conaud": "",
	"dato": 899,
	"desc_nombre": "",
	"desc_observacion": "",
	"ent_codigo": 612,
	"ent_descripcion": null,
	"est_color": "#54bebe",
	"ett_codigo": 4,
	"ett_nombre": "ADMINISTRACIÓN",
	"fech_registro": "",
	"fecha_registro": "14:35 pm 03/10/2024",
	"fob_codigo": 1,
	"ges_anio": 2024,
	"ges_codigo": 2,
	"horas_saldo": "1",
	"iac_codigo_apoyo": null,
	"iac_codigo_control": null,
	"iac_concatenado": "",
	"lug_codigo": 2,
	"poa_codigo": 3,
	"pobj_codigo": 899,
	"pobj_numero": 44,
	"pro_numero": "500",
	"sec_codigo": 6,
	"sec_descripcion": "DEFENSA NACIONAL",
	"tipact_codigo": 1,
	"total_horas_presupuestadas": "0",
	"ttr_codigo": 47,
	"ttr_inicial": "-",
	"ttr_sigla": "RDBR",
	"ume_codigo": 5,
	"ume_descripcion": "REGISTROS"
}
```

## Rol Gestion Institucional

```json
/**
* * GET ROLE - GESTIÓN INSTITUCIONAL
*/
async getAllRoleGestionInstitucional() {
await this.$service.get(
'SISPOA',
`_autenticacion/roles-sesion`
).then(response => {
if (response) {
this.rolGestionInstitucional.formulador = response[0].es_ges_ins_formulador
this.rolGestionInstitucional.aprobador = response[0].es_ges_ins_aprobador
this.rolGestionInstitucional.verificador = response[0].es_ges_ins_verificador
}
}).catch(error => {
// this.$toast.info(error.error_mensaje)
this.rolGestionInstitucional = {
formulador: 0,
aprobador: 0,
verificador: 0,
}
})
},
```