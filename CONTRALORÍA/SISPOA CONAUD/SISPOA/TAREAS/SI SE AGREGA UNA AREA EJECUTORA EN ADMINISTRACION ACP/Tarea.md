######ACCIONES A CORTO PLAZO
##ROL: NORKA

##QUERY:
SELECT 	
	oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora, oau.oau_estado,
	au.aun_sigla, 
	po.pobj_codigo, po.pobj_estado
FROM 	estructura_poa.objetivos_area_unidad oau
	LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
	LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
	AND oau.pobj_codigo IN (1067)
ORDER BY oau.oau_codigo DESC
;

##COMPONENTE
http://172.16.22.243:3000/sispoa/administracion_acp

##EXISTEN DOS AREAS EJECUTORAS: backup_20240927_180433.sql
1.-GDT-GAD1
2.-GDT-GAM1

##GDT-GAD1: TIENE LA ACCION A CORTO PLAZO
520.1702.113	Emitir 10 informes de supervisiones de Entidades Públicas del nivel departamental en la Gerencia Departamental de Tarija en la gestión 2024.

##GDT-GAM1: NO TIENE LA MISMA

##SE VA ASOCIAR DESDE GDT-GAD1 EL ÁREA EJECUTORA GDT-GAM1, PARA LA ACCION :
Emitir 10 informes de supervisiones de Entidades Públicas del nivel departamental en la Gerencia Departamental de Tarija en la gestión 2024.

##REALIZA POST:
http://172.16.22.243:7091/objetivos-area-unidad

##ENVIA
{
	"aun_codigo_ejecutora": 39,
	"aun_codigo_supervisora": 39,
	"aun_numero": "1702",
	"aun_sigla": "GDT-GAD1",
	"estado_global": 2,
	"estado_global_color": "#43A047",
	"estado_global_descripcion": "CONSOLIDADO",
	"estado_global_pobj": 2,
	"estado_global_pobj_color": "#43A047",
	"estado_global_pobj_descripcion": "CONSOLIDADO",
	"oau_codigo": 1255,
	"oau_descripcion": "prueba",
	"oau_estado": 2,
	"oau_indicador": 11,
	"observacion_detalle": null,
	"pobj_codigo": 1067,
	"pobj_codigo_sigla": "520.1702.113",
	"pobj_estado": 2,
	"pobj_nombre": "Emitir 10 informes de supervisiones de Entidades Públicas del nivel departamental en la Gerencia Departamental de Tarija en la gestión 2024.",
	"pobj_numero": 113,
	"pro_codigo": 3,
	"pro_numero": "520"
}

##CUANDO VAMOS A GDT-GAM1, se agrego bien pero DEBERIA ESTAR CON EL ESTADO EN EL QUE ESTA LA ACCION A CORTO PLAZO : backup_20240927_171609.sql

##AL ENVIAR EL pob_estado, se creara con ese estado : backup_20240928_173114.sql



  @LoggerMethod
  async create(createObjetivosAreaUnidadDto: CreateObjetivosAreaUnidadDto, manager: EntityManager): Promise<ObjetivosAreaUnidad> {
    try {
      const objetivosAreaUnidad: ObjetivosAreaUnidad = await this.validations(Operation.INSERT, manager, createObjetivosAreaUnidadDto);
      const sql = 'SELECT COALESCE(MAX(objetivos_area_unidad.oau_codigo), 0) + 1 codigo FROM estructura_poa.objetivos_area_unidad;';
      const codeResult: any = await manager.query(sql);
      objetivosAreaUnidad.oau_codigo = codeResult[0].codigo;

      const resultQuery = await manager.save(objetivosAreaUnidad);
      // ----- (BEGIN) save: Historico
      const createEstadosTablasDto = new CreateEstadosTablasDto();
      this.tmpHistoryDetail = objetivosAreaUnidad;
      createEstadosTablasDto.tab_nombre = ObjetivosAreaUnidad.name;
      createEstadosTablasDto.tab_codigo = resultQuery.oau_codigo;
      createEstadosTablasDto.tab_descripcion = DescripcionControlEstados.CREATE;
      createEstadosTablasDto.tab_detalle = this.tmpHistoryDetail;
      if (createObjetivosAreaUnidadDto.pobj_estado && createObjetivosAreaUnidadDto.pobj_estado != EstadoPoa.EDICION) {
        createEstadosTablasDto.tab_estado = createObjetivosAreaUnidadDto.pobj_estado;
      } else {
        createEstadosTablasDto.tab_estado = EstadoPoa.EDICION;
      }
      createEstadosTablasDto.usuario = objetivosAreaUnidad.usuario_registro;
      await this.estadosTablasService.create(createEstadosTablasDto, manager);
      // ----- (END) save: Historico
      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }

  
  
