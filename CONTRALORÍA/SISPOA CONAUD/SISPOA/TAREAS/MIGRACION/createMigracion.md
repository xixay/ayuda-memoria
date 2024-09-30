  async createMigracion(createActividadesDto: CreateActividadesDto, manager: EntityManager): Promise<any> {

    try {
      let respIacCodigo = { codigo: 0 };
      delete createActividadesDto.s_token;
      let act_codigo_apoyo = createActividadesDto.act_codigo_apoyo ? createActividadesDto.act_codigo_apoyo : 0;
      let act_codigo_ejecucion = createActividadesDto.act_codigo_ejecucion ? createActividadesDto.act_codigo_ejecucion : 0;
      delete createActividadesDto.act_codigo_apoyo;
      delete createActividadesDto.act_codigo_ejecucion;
      // ----------- CHECK AREA-UNIDAD-RESPONSABLES -----------
      let createUpdateActividadesDto = new UpdateActividadesDto();
      createUpdateActividadesDto.act_codigo = 0;
      createUpdateActividadesDto.fob_codigo = 1;
      createUpdateActividadesDto.pobj_codigo = createActividadesDto.pobj_codigo;
      createUpdateActividadesDto.aun_codigo_supervisora = createActividadesDto.aun_codigo_supervisora;
      createUpdateActividadesDto.usuario = createActividadesDto.usuario;
      if (!createActividadesDto.is_migrate) {
        await this.checkIfExistAreaUnidadResponsable(createUpdateActividadesDto, manager);
      }
      delete createActividadesDto.is_migrate;
      // -----------
      let ActividadObject: any = {};
      let ActividadUsuario = 0;
      if (createActividadesDto.tipact_codigo != 1) {
        ActividadObject = createActividadesDto.actividad_object;
        ActividadUsuario = createActividadesDto.usuario;
      }
      delete createActividadesDto.actividad_object;
      const actividades: Actividades = await this.validations(Operation.INSERT_TWO, manager, createActividadesDto);
      const sql = 'SELECT COALESCE(MAX(actividades.act_codigo), 0) + 1 codigo FROM estructura_poa.actividades;';
      const codeResult: any = await manager.query(sql);
      actividades.act_codigo = codeResult[0].codigo;
      // TODO: Incrementar numero correlativo (act_correlativo)
      const queryFiltro = {
        aunCodigEjecutora: createActividadesDto.aun_codigo_ejecutora,
        pobjCodigo: createActividadesDto.pobj_codigo
      };
      const codCorrelativoResult = await this.generateCorrelativo(queryFiltro, manager);
      actividades.act_correlativo = codCorrelativoResult.actcorrelativo;

      /** TODO: Devuelve el codigo generado por poa-objetivo de la actividad */
      let resultAreaEjecutora: any = {};
      try {
        const getAllAreasUnidadesDto = new GetAllAreasUnidadesDto();
        getAllAreasUnidadesDto.aun_codigo = `(${createActividadesDto.aun_codigo_ejecutora})`;
        getAllAreasUnidadesDto.aun_estado = `(1,2)`;
        resultAreaEjecutora = (await this.areasUnidadesService.findAll(getAllAreasUnidadesDto, manager))[0];
      } catch (error) { }
      let poa_pobj_oau_act_codigo = '';
      try {
        const getAllPoasObjetivosDto = new GetAllPoasObjetivosDto();
        getAllPoasObjetivosDto.pobj_codigo = `(${createActividadesDto.pobj_codigo})`;
        const resultPoaObjetivo = (await this.poasObjetivosService.findAll(getAllPoasObjetivosDto, manager))[0];
        poa_pobj_oau_act_codigo = `${resultPoaObjetivo.pro_numero}.${resultAreaEjecutora.aun_numero}.${resultPoaObjetivo.pobj_numero}.${codCorrelativoResult.actcorrelativo}.` + `${resultPoaObjetivo.ges_anio}`.substring(2);
      } catch (error) { }
      actividades.act_numero = poa_pobj_oau_act_codigo;
      const resultQuery = await manager.save(actividades);

      // ----- (BEGIN) save: estados historicos
      const createEstadosTablasDto = new CreateEstadosTablasDto();
      createEstadosTablasDto.tab_nombre = Actividades.name;
      createEstadosTablasDto.tab_codigo = resultQuery.act_codigo;
      createEstadosTablasDto.tab_descripcion = 'CREATE';
      createEstadosTablasDto.tab_detalle = this.tmpHistoryDetail;
      createEstadosTablasDto.tab_estado = 1;
      createEstadosTablasDto.usuario = actividades.usuario_registro;
      await this.estadosTablasService.create(createEstadosTablasDto, manager);

      // ----- (END) save: estados historicos
      // ----------- CHECK IF EXIST ACTIVIDADES_APOYO
      if (createActividadesDto.cac_codigo == 1 || createActividadesDto.cac_codigo == 3) {
        try {
          //-------buscar actividad apoyo
          let resConApoyo: any = {};
          try {
            const getAllActividadesApoyoDto = new GetAllActividadesApoyoDto();
            getAllActividadesApoyoDto.act_codigo = `(${resultQuery.act_codigo_anterior})`;
            resConApoyo = (await this.actividadesApoyoService.findAll(getAllActividadesApoyoDto, manager))[0];
          } catch (error) { }
          //-----------------------------
          //--------buscar actividad
          if (Object.keys(resConApoyo).length !== 0) {
            let resAct: any = {};
            try {
              const getAllActividadesDto = new GetAllActividadesDto();
              getAllActividadesDto.act_codigo = `(${resConApoyo.act_codigo_apoyo})`;
              resAct = (await this.findAll(getAllActividadesDto, manager))[0];
            } catch (error) { }
            //-----------------------------
            if (Object.keys(resAct).length !== 0) {
              const createActividadApoyo = new CreateActividadesApoyoDto();
              createActividadApoyo.act_horas_planificadas = resultQuery.act_horas_planificadas;
              createActividadApoyo.act_codigo = resultQuery.act_codigo;
              createActividadApoyo.act_codigo_apoyo = resAct.act_codigo;
              createActividadApoyo.act_codigo_ejecucion = act_codigo_ejecucion;
              createActividadApoyo.usuario = resultQuery.usuario_registro;
              await this.actividadesApoyoService.create(createActividadApoyo, manager);
            }
          }
        } catch (error) { }
      }
      //----------- CHECK IF ACTIVIDAD CONTINUIDAD
      if (createActividadesDto.tipact_codigo == 2) {
        const createActividadContinuidadDto = new CreateActividadesContinuidadDto();
        createActividadContinuidadDto.aco_descripcion = '';
        createActividadContinuidadDto.act_codigo = resultQuery.act_codigo;
        createActividadContinuidadDto.conaud_gestion = ActividadObject.conaud_gestion;
        createActividadContinuidadDto.conaud_correlativo = ActividadObject.conaud_correlativo;
        createActividadContinuidadDto.conaud_codigo = ActividadObject.conaud_codigo;
        createActividadContinuidadDto.conaud_detalle = ActividadObject.conaud_detalle;
        if (respIacCodigo.codigo != 0 && createActividadesDto.tipact_codigo == 2) {
          createActividadContinuidadDto.iac_codigo = respIacCodigo.codigo;
        }
        createActividadContinuidadDto.usuario = ActividadUsuario;
        await this.actividadesContinuidadService.create(createActividadContinuidadDto, manager, (ActividadObject.aco_codigo) ? ActividadObject.aco_codigo : 0);
      }

      //----------- CHECK IF HORAS PLANIFICADAS
      if (([1, 3].includes(Number(resultQuery.cac_codigo)))) {
        try {
          //-------buscar actividad horas planificadas
          let resConHorasPlanif: any = {};
          try {
            const getAllActividadesHorasPlanificadasDto = new GetAllActividadesHorasPlanificadasDto();
            getAllActividadesHorasPlanificadasDto.act_codigo = `(${resultQuery.act_codigo_anterior})`;
            resConHorasPlanif = (await this.actividadesHorasPlanificadasService.findAll(getAllActividadesHorasPlanificadasDto, manager))[0];
          } catch (error) { }
          //-----------------------------
          //--------buscar actividad
          if (Object.keys(resConHorasPlanif).length !== 0) {
            let resAct: any = {};
            try {
              const getAllActividadesDto = new GetAllActividadesDto();
              getAllActividadesDto.act_codigo = `(${resConHorasPlanif.act_codigo})`;
              resAct = (await this.findAll(getAllActividadesDto, manager))[0];
            } catch (error) { }
            //-----------------------------
            if (Object.keys(resAct).length !== 0) {
              // El objeto NO está vacío
              const createActividadesHorasPlanificadasDto = new CreateActividadesHorasPlanificadasDto();
              createActividadesHorasPlanificadasDto.ahp_horas = resAct.act_horas_planificadas;
              createActividadesHorasPlanificadasDto.act_codigo = resAct.act_codigo;
              createActividadesHorasPlanificadasDto.ahp_descripcion = resConHorasPlanif.ahp_descripcion;
              createActividadesHorasPlanificadasDto.usuario = resAct.usuario_registro;
              await this.actividadesHorasPlanificadasService.create(createActividadesHorasPlanificadasDto, manager);
            }
          }
        } catch (error) { }
      }

      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }
