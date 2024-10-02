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

## Lo que envia al crear el post
```json
act_alcance: "eeeeeeeee"
act_cantidad: "111"
act_descripcion: "bbbbbbbbbbbbbbbbbb"
act_fecha_fin: "09/10/2024"
act_fecha_inicio: "01/10/2024"
act_horas_planificadas: "111"
act_justificacion: "aaaaaaaaaaaaaaa"
act_objetivo: "dddddd"
act_objeto: "cccccc"
aun_codigo_supervisora: 4
caa_codigo: 1
cca_codigo: 2
cfa_codigo: 1
cga_codigo: 1
ent_codigo: 592
pobj_codigo: 1365
sec_codigo: 2
tipact_codigo: 1
ttr_codigo: 75
ume_codigo: 6
```