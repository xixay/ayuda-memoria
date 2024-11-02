```t
tengo un array de objetos, cada objeto tiene atributos, pero tiene un objeto llamado roles, que tiene los siguientes datos:
    roles: {
      per_codigo: 42,
      es_formulador: '0',
      es_aprobador: '0',
      es_supervisor: '1',
      es_formulador_gerente: '0',
      es_comision: '0',
      es_responsable: '0'
    },

La cosa es que 
```
## SISPOA
### Servicio
- Solicitud
```json
{
	"GET": {
		"scheme": "http",
		"host": "192.168.0.13:7091",
		"filename": "/area-unidad-responsables/personas_responsables",
		"query": {
			"aur_estado": "(1,2)",
			"poa_codigo": "(3)",
			"aun_codigo_ejecutora": "(64)",
			"rol_codigo": "(1,2,3,4,6,7,8)"
		},
		"remote": {
			"Dirección": "192.168.0.13:7091"
		}
	}
}
```
- respuesta
```json
{
	"codigo": 0,
	"error_existente": 0,
	"error_mensaje": "SE OBTUVIERON DATOS DE FORMA CORRECTA.",
	"error_codigo": 2001,
	"trace_id": "263f8115-2a74-4e03-893d-93fed9dddb64",
	"datos": [
		{
			"aur_codigo": 7779,
			"aur_notificacion": false,
			"poa_codigo": 3,
			"poa_descripcion": null,
			"cau_codigo": 1,
			"aun_codigo_ejecutora": 64,
			"aun_nombre": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"aun_codigo_rol": 64,
			"aun_nombre_rol": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"rol_codigo": 8,
			"rol_nombre": "GERENTE CONSOLIDADOR",
			"per_codigo": 784,
			"cro_codigo": 1,
			"cro_descripcion": "FORMULARIO",
			"usuario": 2228,
			"aur_estado": 1,
			"est_color": "#54bebe",
			"aur_estado_descripcion": "EDICION",
			"per_docidentidad": "3386714",
			"per_nombre_completo": "GUERY RAMIRO CUENTAS AGUIRRE",
			"uni_descripcion": "GERENCIA PRINCIPAL DE AUDITORIA 2"
		},
		{
			"aur_codigo": 7170,
			"aur_notificacion": false,
			"poa_codigo": 3,
			"poa_descripcion": null,
			"cau_codigo": 1,
			"aun_codigo_ejecutora": 64,
			"aun_nombre": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"aun_codigo_rol": 5,
			"aun_nombre_rol": "Subcontraloría de Gobiernos Municipales y Universidades - SCGM",
			"rol_codigo": 1,
			"rol_nombre": "FORMULADOR",
			"per_codigo": 305,
			"cro_codigo": 1,
			"cro_descripcion": "FORMULARIO",
			"usuario": 1914,
			"aur_estado": 1,
			"est_color": "#54bebe",
			"aur_estado_descripcion": "EDICION",
			"per_docidentidad": "4319459",
			"per_nombre_completo": "MIRNA JANINE ESCOBAR LUJAN",
			"uni_descripcion": "GERENCIA PRINCIPAL DE AUDITORIA 2"
		},
		{
			"aur_codigo": 7076,
			"aur_notificacion": false,
			"poa_codigo": 3,
			"poa_descripcion": null,
			"cau_codigo": 1,
			"aun_codigo_ejecutora": 64,
			"aun_nombre": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"aun_codigo_rol": 4,
			"aun_nombre_rol": "Subcontraloría de Gobiernos Departamentales - SCGD",
			"rol_codigo": 3,
			"rol_nombre": "SUPERVISOR",
			"per_codigo": 42,
			"cro_codigo": 1,
			"cro_descripcion": "FORMULARIO",
			"usuario": 1914,
			"aur_estado": 1,
			"est_color": "#54bebe",
			"aur_estado_descripcion": "EDICION",
			"per_docidentidad": "2428708",
			"per_nombre_completo": "SANTIAGO MAIDANA QUISPE",
			"uni_descripcion": "SUBCONTRALORÍA DE GOBIERNOS MUNICIPALES Y UNIVERSIDADES"
		},
		{
			"aur_codigo": 7056,
			"aur_notificacion": false,
			"poa_codigo": 3,
			"poa_descripcion": null,
			"cau_codigo": 1,
			"aun_codigo_ejecutora": 64,
			"aun_nombre": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"aun_codigo_rol": 5,
			"aun_nombre_rol": "Subcontraloría de Gobiernos Municipales y Universidades - SCGM",
			"rol_codigo": 2,
			"rol_nombre": "APROBADOR",
			"per_codigo": 784,
			"cro_codigo": 1,
			"cro_descripcion": "FORMULARIO",
			"usuario": 1914,
			"aur_estado": 1,
			"est_color": "#54bebe",
			"aur_estado_descripcion": "EDICION",
			"per_docidentidad": "3386714",
			"per_nombre_completo": "GUERY RAMIRO CUENTAS AGUIRRE",
			"uni_descripcion": "GERENCIA PRINCIPAL DE AUDITORIA 2"
		},
		{
			"aur_codigo": 7026,
			"aur_notificacion": false,
			"poa_codigo": 3,
			"poa_descripcion": null,
			"cau_codigo": 1,
			"aun_codigo_ejecutora": 64,
			"aun_nombre": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"aun_codigo_rol": 64,
			"aun_nombre_rol": "Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GPA2-GAM1",
			"rol_codigo": 4,
			"rol_nombre": "FORMULADOR GERENTE",
			"per_codigo": 305,
			"cro_codigo": 1,
			"cro_descripcion": "FORMULARIO",
			"usuario": 1914,
			"aur_estado": 1,
			"est_color": "#54bebe",
			"aur_estado_descripcion": "EDICION",
			"per_docidentidad": "4319459",
			"per_nombre_completo": "MIRNA JANINE ESCOBAR LUJAN",
			"uni_descripcion": "GERENCIA PRINCIPAL DE AUDITORIA 2"
		}
	]
}
```