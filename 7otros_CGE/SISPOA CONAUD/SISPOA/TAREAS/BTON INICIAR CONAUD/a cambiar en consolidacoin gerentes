Poas.t
linea 61
  @Column("boolean", {
    name: "poa_actualizado_conaud",
    nullable: true,
    default: () => "false",
  })
  poa_actualizado_conaud: boolean | null;


conaud.service.ts
  @LoggerMethod
  async verificaInicioConaud (query: UpdateStatePoasDto, manager: EntityManager) {
    try {
      let sql = `
          ---VALIDADOR DE BOTON INICIAR CONAUD
          WITH poas_anteriores AS (
          SELECT	p.poa_codigo, p.ges_codigo, p.poa_actualizado_conaud
          FROM	estructura_poa.poas p
          WHERE	TRUE
              AND p.poa_estado NOT IN (0,9)	-- ESTADOS PARA NO TOMAR EN CUENTA
              AND p.poa_codigo < ${query.poa_codigo}			-- POA_CODIGO ENVIADo
          ORDER BY p.poa_codigo DESC
          ),
          poa_actual AS (
            SELECT	p.poa_codigo, p.ges_codigo, p.poa_actualizado_conaud
            FROM	estructura_poa.poas p
            WHERE	TRUE
                AND p.poa_estado NOT IN (0,9)	-- ESTADOS PARA NO TOMAR EN CUENTA
                AND p.poa_codigo = ${query.poa_codigo}			-- POA_CODIGO ENVIADO
            ORDER BY p.poa_codigo DESC
          )
          SELECT	count(*) = SUM(CASE WHEN pa.poa_actualizado_conaud IS TRUE THEN 1 ELSE 0 END) AS inits_olds,
          count(*) = SUM(CASE WHEN poa_actual.poa_actualizado_conaud IS TRUE THEN 1 ELSE 0 END) AS init_actual
          FROM	poas_anteriores pa,
          poa_actual
          ;
        `;
      const resultQuery = await manager.query(sql);
      let validador = resultQuery[0].inits_olds==true && resultQuery[0].init_actual==false
      return validador
    } catch (error) {
      throwError(400, error.message);
    }
  }
  
poas.service.ts
  @LoggerMethod
  async findAll(query: GetAllPoasDto, manager: EntityManager) {
    try {
      let orderBy = 'ORDER BY';
      if (query.order_by && query.order_by.length > 0) {
        for (let orderColumn of query.order_by) {
          if (orderBy !== 'ORDER BY') { orderBy += ','; }
          orderBy += ' ' + orderColumn.column_name + ' ' + orderColumn.orientation;
        };
      } else {
        orderBy += ` t.fecha_registro DESC`;
      }
      let sql = `
        SELECT
              t.poa_codigo,
              t.poa_descripcion,
              t.ges_codigo,
              g.ges_anio AS poa_ges_anio,
              t.tpo_codigo,
              tf.tpo_nombre AS poa_tpo_nombre,
              CASE
                WHEN t.tpo_codigo = 1 THEN tf.tpo_nombre
                WHEN t.tpo_codigo = 2 THEN
                  CONCAT(
                    tf.tpo_nombre,
                    ' (', ROW_NUMBER () OVER ( PARTITION BY t.ges_codigo, t.tpo_codigo ORDER BY t.fecha_registro ASC), ')'
                  )
                ELSE 'NO DEFINIDO'
              END AS poa_tpo_nombre_number,
              t.poa_estado,
              e.est_color,
              e.est_nombre AS poa_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
        FROM	estructura_poa.poas t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.poa_estado
              LEFT JOIN parametricas.gestiones g ON g.ges_codigo = t.ges_codigo
              LEFT JOIN parametricas.tipos_formulaciones tf ON tf.tpo_codigo = t.tpo_codigo
        WHERE TRUE
              ${query.poa_codigo ? `AND t.poa_codigo IN ${query.poa_codigo}` : ''}
              ${query.poa_estado ? `AND t.poa_estado IN ${query.poa_estado}` : ''}
              ${query.ges_codigo ? `AND t.ges_codigo IN ${query.ges_codigo}` : ''}
              ${query.tpo_codigo ? `AND t.tpo_codigo IN ${query.tpo_codigo}` : ''}
              ${query.poa_ejecucion_conaud ? `AND t.poa_ejecucion_conaud = ${query.poa_ejecucion_conaud}` : ''}
              ${query.poa_actualizado_conaud ? `AND t.poa_actualizado_conaud = ${query.poa_actualizado_conaud}` : ''}
        ${ orderBy }
        ;`
      ;

      const resultQuery = await manager.query(sql);
      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      throwError(400, error.message);
    }
  }
  
  
    @LoggerMethod
  async replaceActividadesReformulado(query: UpdateStatePoasDto, manager: EntityManager) {
    let result = {}
    try {
      const queryTablas = new GetAllTablasDto();
      let verificaInicioConaud: any = false;
      queryTablas.tab_nombre = Poas.name;
      queryTablas.est_codigo = `(1)`;
      const tableRecord = (await this.tablasService.findAll(queryTablas, manager))[0];
      const queryControlEstado = new GetAllControlHistoricoDto();
      queryControlEstado.tab_codigo = `(${tableRecord.tab_codigo})`;
      queryControlEstado.reg_codigo_nuevo = `(${query.poa_codigo})`;
      const oldPoa = (await this.controlHistoricoService.findAll(queryControlEstado, manager))[0];
      const getAllPoasDto= new GetAllPoasDto();
      getAllPoasDto.poa_codigo = `(${oldPoa.reg_codigo_anterior})`;
      const resulPoaOld = await this.findAll(getAllPoasDto, manager);
      const getAllPoasRefDto= new GetAllPoasDto();
      getAllPoasRefDto.poa_codigo = `(${query.poa_codigo})`;
      const resulPoaRef = await this.findAll(getAllPoasRefDto, manager);
      try {
        verificaInicioConaud = await this.conaudService.verificaInicioConaud(query, manager);
      } catch (error) {}
      if (verificaInicioConaud==false) {
        throwError(400, 'EL PROCESO DE INICIO CONAUD YA FUE REALIZADO');
      }
      if (resulPoaOld.length > 0 && resulPoaRef[0].poa_estado == EstadoPoa.CONSOLIDADO) {
        let sql = `
            WITH act_mapping AS (
              SELECT
                  a.act_codigo, a.act_codigo_anterior
              FROM	estructura_poa.poas p
                  LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
                  LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
              WHERE 	TRUE
                  AND a.act_codigo IS NOT NULL
                  AND a.act_codigo_anterior IS NOT NULL
                  AND p.poa_codigo IN (${query.poa_codigo})
              ORDER BY a.act_codigo DESC
            )
            UPDATE ejecucion_actividades.inicio_actividad_poa p
            SET act_codigo = act_mapping.act_codigo,
                usuario_modificacion = ${query.usuario},
                fecha_modificacion = now()
            FROM act_mapping
            WHERE p.act_codigo = act_mapping.act_codigo_anterior
            AND p.iap_estado NOT IN (0);
            `;
        let sql1 = `
            WITH act_mapping AS (
              SELECT
                  a.act_codigo, a.act_codigo_anterior
              FROM	estructura_poa.poas p
                  LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
                  LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
              WHERE 	TRUE
                  AND a.act_codigo IS NOT NULL
                  AND a.act_codigo_anterior IS NOT NULL
                  AND p.poa_codigo IN (${query.poa_codigo})
              ORDER BY a.act_codigo DESC
            )
            UPDATE ejecucion_informes.informes_uai uai
            SET act_codigo = act_mapping.act_codigo, usuario_modificacion = ${query.usuario}, fecha_modificacion = now()
            FROM act_mapping
            WHERE uai.act_codigo = act_mapping.act_codigo_anterior
            AND uai.iua_estado NOT IN (0)
            ;
        `;
        let sql2 = `
            WITH act_mapping AS (
              SELECT
                  a.act_codigo, a.act_codigo_anterior
              FROM	estructura_poa.poas p
                  LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
                  LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
              WHERE 	TRUE
                  AND a.act_codigo IS NOT NULL
                  AND a.act_codigo_anterior IS NOT NULL
                  AND p.poa_codigo IN (${query.poa_codigo})
              ORDER BY a.act_codigo DESC
            )
            UPDATE ejecucion_administrativas.inicios_administrativas ia
            SET act_codigo = act_mapping.act_codigo, usuario_modificacion = ${query.usuario}, fecha_modificacion = now()
            FROM act_mapping
            WHERE ia.act_codigo = act_mapping.act_codigo_anterior
            AND ia.iad_estado NOT IN (0)
            ;
        `;
        let sqlUpdatePoa = `
            UPDATE estructura_poa.poas
            SET usuario_modificacion=${query.usuario}, fecha_modificacion=now(), poa_actualizado_conaud=true
            WHERE poa_codigo=${query.poa_codigo}
            ;
        `;
        const resultQuery = await manager.query(sql);
        const resultQuery1 = await manager.query(sql1);
        const resultQuery2 = await manager.query(sql2);
        const resultQueryPoa = await manager.query(sqlUpdatePoa);
        const values = [resultQuery,resultQuery1,resultQuery2,resultQueryPoa].map(arr => arr[1]);
        result = { ...values };
        this.logger.debug(`replace act_codigos old .... ${values}`);
      }
      else{
        throwError(400, 'ERROR EN EL PROCESO REEMPLAZO DE ACTIVIDADES PARA POA REFORMULADO');
      }
      return CustomService.verifyingDataResult(result, this.message_custom);
    } catch (error) {
      throwError(400, error.message);
    }
  }


getall-poas.dto.ts
export class GetAllPoasDto {
  @ApiProperty()
  @IsOptional()
  @IsCodesQuery({ message: '($property) No tiene el formato requerido.' })
  public poa_codigo: string;

  @ApiProperty()
  @IsOptional()
  @IsCodesQuery({ message: '($property) No tiene el formato requerido.' })
  public ges_codigo: string;

  @ApiProperty()
  @IsOptional()
  @IsCodesQuery({ message: '($property) No tiene el formato requerido.' })
  public tpo_codigo: string;

  @ApiProperty()
  @IsBoolean({ message: '($property) Debe ser un valor booleano' })
  @Type(() => Boolean)
  @IsOptional()
  public poa_ejecucion_conaud: boolean;

  @ApiProperty()
  @IsBoolean({ message: '($property) Debe ser un valor booleano' })
  @Type(() => Boolean)
  @IsOptional()
  public poa_actualizado_conaud: boolean;

  @ApiProperty()
  @IsOptional()
  @IsCodesQuery({ message: '($property) No tiene el formato requerido.' })
  public poa_estado: string;

  public usuario: number;

  @ApiProperty()
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => OrderByPoas)
  public order_by: OrderByPoas[];
}

