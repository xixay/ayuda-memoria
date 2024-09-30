      let actividadesRetrieved: any[] = [];
      let entidadRetrieved: GetAllEntidadesProviderResponse[] = [];
      try {
        const actividadesFilter: GetAllActividadesProviderDto = new GetAllActividadesProviderDto();
        actividadesFilter.act_codigo = `(${inicioActividadPoa.act_codigo})`;
        actividadesRetrieved = await this.actividadesProvider.findAll(actividadesFilter);
        const actividad = actividadesRetrieved[0];
        const tieneEntidadValida = actividad.ent_descripcion == null && actividad.ent_codigo;

        const entidadFilter: GetAllEntidadesDto = new GetAllEntidadesDto();
        entidadFilter.codigo_entidad = actividadesRetrieved[0].ent_codigo;

        entidadRetrieved = tieneEntidadValida
          ? await this.entidadesProvider.findAll(entidadFilter).catch(() => [{
            ent_codigo: actividad.ent_codigo,
            ent_descripcion: '',
            ent_codigo_presupuestario: '',
            ent_sigla: '',
            ent_estado: 1,
            ent_identificador: ''
          }])
          : [{
            ent_codigo: actividad.ent_codigo,
            ent_descripcion: actividad.ent_descripcion || '',
            ent_codigo_presupuestario: '',
            ent_sigla: '',
            ent_estado: 1,
            ent_identificador: ''
          }];

      } catch (err) {
        throwError(400, 'NO SE ENCONTRÓ LA ENTIDAD RELACIONADA A LA ACTIVIDAD DEL INICIO ACTIVIDAD POA');
      }
