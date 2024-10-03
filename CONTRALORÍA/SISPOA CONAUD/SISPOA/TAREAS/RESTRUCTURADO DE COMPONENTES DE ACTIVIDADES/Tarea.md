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
	"act_codigo_bolsa": 1823,
	"act_descripcion": "APOYO 1",
	"act_fecha_fin": "17/10/2024",
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
	"flag_iac_codigo_apoyo": true,
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

## Se edita de tipo apoyo antiguo
![[editar tipo apoyo.png]]

## Se edita de tipo apoyo nuevo
![[editar tipo apoyo nuevo.png]]

