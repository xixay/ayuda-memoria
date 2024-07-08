report-jasper.controller.ts

	@Post('poa-areas-unidades-ejecutoras')
	async findReportPoaAreasUnidadesEjecutoras(@LoggerMethodController() myLogger, @Req() req, @Res() res, @Body() getAllReportePoaProgramaDto: GetAllReportePoaProgramaDto) {
		const queryRunner = null;

		try {
			getAllReportePoaProgramaDto.s_token = req.headers.authorization;
			res.req.method = 'GET';
			return sendSuccessCustom(queryRunner, res, HttpStatus.OK, 0, 'SE OBTUVO EL REPORTE DE FORMA CORRECTA.', await this.reporteJasperService.findReportPoaAreasUnidadesEjecutoras(getAllReportePoaProgramaDto));
		} catch (error) {
			return sendErrorCustom(queryRunner, res, HttpStatus.BAD_REQUEST, 0, error.message);
		}
	}
	

report-jasper.service.ts
	async findReportPoaAreasUnidadesEjecutoras(getAllReportePoaProgramaDto: GetAllReportePoaProgramaDto) {
		try {
			getAllReportePoaProgramaDto.reporte = 'RptXlsPoasAreasEjecutoras.xlsx';
			const body = await this.getBody(getAllReportePoaProgramaDto);
			return await this.jasperProvider.findReport(body);
		} catch (error) {
			return throwError(400, error.message);
		}
	}

poas.controller.ts
  @Get('report-poa-areas-unidades-ejec')
  async getReportPoaAreasUnidadesEjecutoras(@LoggerMethodController() myLogger, @Res() res, @Query() query: GetReportPoaAreasUnidadesEjecActividadesDto) {
    const queryRunner = this.dataSource.createQueryRunner();
    await queryRunner.connect();

    try {
      const findResult = await this.poasService.getReportPoaAreasUnidadesEjecutoras(query, queryRunner.manager);
      return sendSuccessCustom(queryRunner, res, HttpStatus.OK, 0, 'SE OBTUVIERON DATOS DE FORMA CORRECTA.', findResult);
    } catch (error) {
      return sendErrorCustom(queryRunner, res, HttpStatus.BAD_REQUEST, 0, error.message);
    }
  }

poas.service.ts
  @LoggerMethod
  async getReportPoaAreasUnidadesEjecutoras(query: GetReportPoaAreasUnidadesEjecActividadesDto, manager: EntityManager) {
    try {
      //obtener el nombre del padre
      let resultQueryPadre: any = await this.getNombreAreaPadre(query.aun_codigo_padre, manager);
      //obteniendo el array de orden
      const inputString = query.aun_codigo_hijos;
      const trimmedString = inputString.slice(1, -1);
      const stringArray = trimmedString.split(',');
      const numberArray = stringArray.map(Number);
      let resultQuery = [];
      let sql = `
          WITH order_values AS (
          SELECT unnest(array[${numberArray}]) AS aun_codigo_ejecutora, generate_series(1, array_length(array[${numberArray}], 1)) AS orden
          ),
          numered_activities AS (
              SELECT a.act_codigo, a.act_estado, a.act_numero, au.aun_sigla, a.ent_codigo, a.act_objetivo, a.ttr_codigo, tt.ttr_descripcion, tt.ett_codigo, ett.ett_nombre, a.caa_codigo, caa.caa_nombre, ov.orden,
                    row_number() OVER (ORDER BY ov.orden) AS numero_dato
              FROM estructura_poa.actividades a
              LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo
              LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo
              LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
              LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
              LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON a.caa_codigo = caa.caa_codigo
              JOIN order_values ov ON a.aun_codigo_ejecutora = ov.aun_codigo_ejecutora
              WHERE true
                AND a.aun_codigo_ejecutora IN ${query.aun_codigo_hijos}
                AND a.act_estado NOT IN (0, 9)
                AND p.poa_codigo IN ${query.poa_codigo}
          )
          SELECT * FROM numered_activities
          ORDER BY orden;
      `;
      resultQuery = await manager.query(sql);
      const getAllEntidadesDto = new GetAllEntidadesDto();
      let resultEntidades = await this.entidadesService.findAllProvider(getAllEntidadesDto, manager)
      for (const item of resultQuery) {
        let entidad = resultEntidades.find(entidad => entidad.ent_codigo == item.ent_codigo);
        item.ent_descripcion = entidad?.ent_descripcion || ''
        item.area_padre = resultQueryPadre?.aun_nombre || ''
        item.estado_conaud = await this.findEstadoConaud(item.act_codigo, item.ett_codigo, manager)//obtener el estado en Conaud
      }
      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      throwError(400, error.message);
    }
  }

 @LoggerMethod
  async getNombreAreaPadre(aunCodigoPadre: string, manager: EntityManager) {
    let resultQueryPadre = {};
    try {
      //obtener el nombre del padre
      let sqlPadre = `
           select 	aud.aud_codigo, aud.aun_codigo_padre,au.aun_sigla,au.aun_nombre, aud.aun_codigo_hijo,aud.aud_estado
           from 	  estructura_organizacional.areas_unidades_dependencias aud
                   left join estructura_organizacional.areas_unidades au on aud.aun_codigo_padre = au.aun_codigo
           where 	au.aun_codigo in ${aunCodigoPadre}
           limit 1;
       `;
      resultQueryPadre = (await manager.query(sqlPadre))[0];
    } catch (error) { }
    return resultQueryPadre;
  }

  @LoggerMethod
  async findEstadoConaud(actCodigo: number, ettCodigo: number, manager: EntityManager) {
    let cantEjec = 0;
    if (ettCodigo == 1 || ettCodigo == 2 || ettCodigo == 3) {
      cantEjec = await this.findInicioActPoa(actCodigo, manager);
    } else if (ettCodigo == 4) {
      cantEjec = await this.findIniciosAdm(actCodigo, manager);
    } else if (ettCodigo == 5) {
      cantEjec = await this.findInformesUai(actCodigo, manager);
    }
    if (cantEjec > 0) {
      return `${cantEjec}`;
    } else {
      return 'NO INICIADA EN CONAUD';
    }
  }

  @LoggerMethod
  async findInicioActPoa(actCodigo: number, manager: EntityManager) {
    let resultQuery = [];
    try {
      let sql = `
          select 	iap.iap_codigo, iap.iap_estado, iap.act_codigo, a.act_estado
          from 	  ejecucion_actividades.inicio_actividad_poa iap
		              left join estructura_poa.actividades a on iap.act_codigo = a.act_codigo
          where 	true
		              and a.act_codigo in (${actCodigo}) and iap.iap_estado in (2);
      `;
      resultQuery = await manager.query(sql);
    } catch (error) { }
    return resultQuery.length;
  }

  @LoggerMethod
  async findInformesUai(actCodigo: number, manager: EntityManager) {
    let resultQuery = [];
    try {
      let sql = `
          select 	iu.iua_codigo, iu.iua_estado,
		              a.act_codigo, a.act_estado
          from 	  ejecucion_informes.informes_uai iu
		              left join estructura_poa.actividades a on iu.act_codigo = a.act_codigo
          where 	true
		              and a.act_codigo in (${actCodigo}) and iu.iua_estado in (22);
      `;
      resultQuery = await manager.query(sql);
    } catch (error) { }
    return resultQuery.length;
  }

  @LoggerMethod
  async findIniciosAdm(actCodigo: number, manager: EntityManager) {
    let resultQuery = [];
    let cantEjec = 0;
    try {
      let sql = `
          with resultAdm as (
          select 	ia.iad_codigo, ia.iad_estado, a.act_codigo, a.act_estado, pe.pej_ejecutado, pe.pej_estado 
          from 	  ejecucion_administrativas.inicios_administrativas ia
                  left join estructura_poa.actividades a on ia.act_codigo = a.act_codigo
                  left join ejecucion_administrativas.planificaciones_ejecuciones pe on ia.iad_codigo = pe.iad_codigo 
          where   true
                  and a.act_codigo in (${actCodigo}) and ia.iad_estado in (22)
          )
          --select * from resultAdm;
          select 	act_codigo, SUM(pej_ejecutado) as suma
          from    resultAdm
          group by	act_codigo;
      `;
      resultQuery = await manager.query(sql);
    } catch (error) { }
    if (resultQuery.length > 0) {
      cantEjec = resultQuery[0].suma;
    }
    return cantEjec;
  }

get-report-poa-areas-unidades-ejec.dto.ts
import { IsNotEmpty, IsOptional, Max, Min } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { IsCodesQuery } from '@/common/decorator/IsCodesQuery';
export class GetReportPoaAreasUnidadesEjecActividadesDto {
  @ApiProperty()
  @IsNotEmpty({ message: '($property) Es requerido' })
  public poa_codigo: string;

  @ApiProperty()
  @IsNotEmpty({ message: '($property) Es requerido' })
  public aun_codigo_padre: string;

  @ApiProperty()
  @IsNotEmpty({ message: '($property) Es requerido' })
  public aun_codigo_hijos: string;

  @IsNotEmpty({ message: '($property) Es requerido' })
  @Min(0, { message: 'El usuario no cumple con el valor minimo' })
  @Max(999999, { message: 'El usuario no cumple con el valor maximo' })
  public usuario: number;
}  


