CONSOLIDADO GERENTE
#69e0b7

INSERT INTO parametricas.roles
(rol_codigo, rol_nombre, rol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(8, 'GERENTE CONSOLIDADOR', 1, 0, 0, 0, '2024-08-27 15:38:21.677', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');

VALIDADOR
validatorStatusGlobalAreasDependientes
GDC
	3792170	LETICIA MIRANDA VARGAS		FORMULADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	4385501	JULIO CARLOS GUERRA VILLARROEL	APROBADOR 	EDICION
	3792170	LETICIA MIRANDA VARGAS	OFICIAL ADMINISTRATIVO 	EDICION 
	
GDC-GSL
	3622660	MARCOS MIGUEL RODRIGUEZ FERNANDEZ	FORMULADOR GERENTE 	EDICION
	4385501	JULIO CARLOS GUERRA VILLARROEL		APROBADOR 		EDICION
	4374363	EDINO CLAUDIO CLAVIJO PONCE		SUPERVISOR 		EDICION
	3622660	MARCOS MIGUEL RODRIGUEZ FERNANDEZ	FORMULADOR 		EDICION
GDC-GAD
	4385501	JULIO CARLOS GUERRA VILLARROEL		APROBADOR 		EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ		SUPERVISOR 		EDICION
	1397469	RUTH TARCAYA GALLARDO			FORMULADOR GERENTE 	EDICION
	1397469	RUTH TARCAYA GALLARDO			FORMULADOR 		EDICION
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ M1:ANTES
backup_20240828_112103.sql
 
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& M2: CON ACTIVIDADES
backup_20240828_112850.sql


sigla		aun_codigo	existe
GDC-GSL		14		x
GDC		17		padre
GDC-GAD		18		x
GDC-GAM1	19		no existe
GDC-GAM2	20		no existe
      
pobj_codigo	pobj_nombre	aun_codigo_ejecutora
1937		Pruebax1	17
1756		Pruebax2	17
1752		Pruebax3	17
1731		Pruebax4	17
1728		Pruebax5	17
1726		Pruebax6	17
1668		Pruebax7	17

|pobj_codigo|act_codigo|act_numero      |act_descripcion|act_estado|
|-----------|----------|----------------|---------------|----------|
|1.937      |3.554     |540.0013.42.1.25|act_1          |1         |
|1.937      |3.555     |540.0013.42.2.25|act_2          |1         |
|1.756      |3.556     |00.0013.17.1.25 |act_3          |1         |
|1.756      |3.557     |00.0013.17.2.25 |act_4          |1         |
|1.752      |3.558     |570.0013.6.1.25 |act_5          |1         |
|1.731      |3.559     |570.0013.2.1.25 |act_6          |1         |
|1.728      |3.560     |570.0013.1.1.25 |act_7          |1         |
|1.726      |3.561     |530.0013.1.1.25 |act_8          |1         |

|act_codigo|avi_codigo|avi_estado|
|----------|----------|----------|
|3.554     |739       |1         |
|3.554     |740       |1         |
|3.555     |741       |1         |
|3.556     |742       |1         |

&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& M3: GDC-APROBAD SUP(ALGUNOS)
backup_20240828_113151.sql
|pobj_codigo|pobj_nombre|pobj_estado|oau_codigo|oau_descripcion|aun_codigo_ejecutora|aun_codigo_supervisora|oau_estado|
|-----------|-----------|-----------|----------|---------------|--------------------|----------------------|----------|
|1.668      |Prueba x7  |8          |1.917     |               |17                  |17                    |8         |
|1.726      |Prueba x6  |8          |2.002     |               |17                  |17                    |8         |
|1.728      |Prueba x5  |8          |2.004     |               |17                  |17                    |8         |
|1.731      |Prueba x4  |8          |2.007     |               |17                  |17                    |8         |
|1.752      |Prueba x3  |8          |2.031     |               |17                  |17                    |8         |
|1.756      |Prueba x2  |8          |2.035     |               |17                  |17                    |8         |
|1.937      |Prueba x1  |8          |2.216     |               |17                  |17                    |8         |

|pobj_codigo|act_codigo|act_numero      |act_descripcion|act_estado|
|-----------|----------|----------------|---------------|----------|
|1.756      |3.556     |00.0013.17.1.25 |act_3          |1         |
|1.756      |3.557     |00.0013.17.2.25 |act_4          |1         |
|1.752      |3.558     |570.0013.6.1.25 |act_5          |1         |
|1.731      |3.559     |570.0013.2.1.25 |act_6          |1         |
|1.728      |3.560     |570.0013.1.1.25 |act_7          |1         |
|1.726      |3.561     |530.0013.1.1.25 |act_8          |1         |
|1.937      |3.555     |540.0013.42.2.25|act_2          |7         |
|1.937      |3.554     |540.0013.42.1.25|act_1          |7         |

|act_codigo|avi_codigo|avi_estado|
|----------|----------|----------|
|3.556     |742       |1         |
|3.555     |741       |7         |
|3.554     |740       |7         |
|3.554     |739       |7         |
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% M4:TODAS LAS AREAS PADRE E HIJOS EN APROB SUPERVISOR
backup_20240828_113925.sql
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% M4:TODAS LAS AREAS PADRE E HIJOS EN ESTADO_48  
backup_20240828_114157.sql
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% M4:TODAS LAS AREAS PADRE E HIJOS EN ESTADO_17
backup_20240828_114353.sql

#################################################################################################################################################
GNAF aun_codigo_ejecutora = 9
	4421594	JOSE ALEJANDRO SALVADOR ACHA		GERENTE CONSOLIDADOR 	EDICION
	3492371	DEMETRIA LUCY CHACOLLA VARGAS		RESPONSABLE 		EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		FORMULADOR GERENTE 	EDICION
	4823710	ROSA PAOLA LEONOR BURGOA BELTRAN	SUPERVISOR 		EDICION
	4823710	ROSA PAOLA LEONOR BURGOA BELTRAN	APROBADOR 		EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		FORMULADOR 		EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		OFICIAL ADMINISTRATIVO 	EDICION 

GNAF-SGAF

	4823710	ROSA PAOLA LEONOR BURGOA BELTRAN	SUPERVISOR 		EDICION
	4823710	ROSA PAOLA LEONOR BURGOA BELTRAN	APROBADOR 		EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		FORMULADOR 		EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		OFICIAL ADMINISTRATIVO 	EDICION 

GNAF-SGSIR 
	4823710	ROSA PAOLA LEONOR BURGOA BELTRAN	SUPERVISOR 		EDICION
	4823710	ROSA PAOLA LEONOR BURGOA BELTRAN	APROBADOR 		EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		OFICIAL ADMINISTRATIVO 	EDICION
	4421594	JOSE ALEJANDRO SALVADOR ACHA		FORMULADOR 		EDICION 
%%%%%%%%%%%%%%%% ANTES: M1
backup_20240828_115255.sql
%%%%%%%%%%%%%%%% LISTOS PARA CAMBIAR A 48: M2
backup_20240828_120304.sql




        let data = {}
        data.poa_codigo = this.poaCodigo
        data.poa_estado = this.newEstados
        data.aun_codigo_ejecutora = this.formChangeStatusData.aun_codigo_ejecutora
        data.cac_codigo = this.CacCodigo
        this.dialogButtonLoading = true
        await this.$service.put(
          'SISPOA',
          `/poas/estado-all`,
          data
        ).then(async (response) => {
          if (response) {
            this.$toast.clear()
            this.$toast.success(response.err_mensaje)
            this.closeModalDialogChangeStatus()
            this.tableExpandedItemArray = []
            this.getAllFormularios()
            // this.getAllFormulariosObjetivos()
            // this.$nuxt.$emit('actualizadorActividad', true)
          }
        }).catch(error => {
          this.$toast.error(error.error_mensaje)
        }).finally( () => this.dialogButtonLoading = false )
