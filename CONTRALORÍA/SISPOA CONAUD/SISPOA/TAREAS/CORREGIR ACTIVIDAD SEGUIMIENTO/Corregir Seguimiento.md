## Consideraciones
- Para F-26 y F-21, cuando quiere buscar uno de tipo seguimiento no lo encuentra con el provider, porque ese provider solo busca los que son de auditoria
- Tengo que corregir los servicios para buscar tanto en el provider de auditoria, el provider en la base y en el nuevo provider
- GPOP09E20
- GPOP09E20O1PY231
## Ramas
- front: fix/correccion-reporte-datos-iniciales
- back: 

## SEGUIMIENTO
### COANUD
inicios-actividades/migrado (2 objetos)
- createByInicioActividadMigrado
	- verificaCreateInicioActividad
	- verificaCreateInforme
![[seguimiento.png]]
![[seguimiento informes.png]]

## CONTINUIDAD
### SISPOA
- sispoa-conaud/verifica
- verificaCreateInicioActividad
	- verificaCreateInicioActividad

## Lugares
- 
## url
- 
## Base
- backup_20241216_095954.sql
## Roles

| _list_   | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| -------- | -------------- | --------------------------------------------- | ------------------ | ------- |
|          | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|          | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
| comision | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |
## Trae Provider Auditorias
```json
    {
      "correlativo_codigo": "A07306",
      "trabajo_codigo": "GPOP09E20",
      "trabajo_codigo_f": "GP/OP9/E20",
      "actividad_codigo": "50.12103.119.12",
      "actividad_correlativo": "003",
      "actividad_gestion": 2020,
      "entidad_codigo": 979,
      "entidad_descripcion": "GOBIERNO AUTONOMO MUNICIPAL DE UYUNI (THOLA PAMPA)",
      "actividad_fecha_inicio": "27/01/2021",
      "actividad_fecha_fin": "30/05/2021",
      "auditoria_fecha_inicio": "27/01/2020",
      "auditoria_dias_habiles": 90,--
      "auditoria_dias_calendario": 124,--
      "auditoria_fecha_entrega": "29/05/2020",--
      "auditoria_fecha_emision": "30/07/2020",--
      "auditoria_objeto": "PROGRAMA DE ALIMENTACIÓN COMPLEMENTARIA ESCOLAR ÁREA URBANA Y LA DOC.E INF.RELAC",--
      "auditoria_objetivo": "EMITIR PRONUNC.S/LA EFICACIA DEL PROGRAMA DE ALIMENTACIÓN COMPLEMENTARIA DESAYUNO ESCOLAR AREA URBAN",--
      "auditoria_periodo": "GESTIÓN 2019"--
    }
```
## Trae Provider Seguimientos
```json
    {
      "correlativo_codigo": "S02921",
      "trabajo_codigo": "GPOP09E20O1PY231",
      "actividad_codigo": "500.11103.119.16",
      "actividad_correlativo": "001",
      "actividad_gestion": 2023,
      "entidad_codigo": 979,
      "entidad_descripcion": "GOBIERNO AUTONOMO MUNICIPAL DE UYUNI (THOLA PAMPA)",
      "actividad_fecha_inicio": "03/05/2023",
      "actividad_fecha_fin": "29/02/2024",
      "seguimiento_fecha_inicio": "25/05/2023",
      "seguimiento_dias_habiles": 100,
      "seguimiento_dias_calendario": 140,
      "seguimiento_fecha_entrega": "11/10/2023",
      "seguimiento_fecha_emision": "12/12/2023",
      "seguimiento_objeto": "RECOMENDACIONES FORMULADAS EN EL INF.GP/OP09/E20 O1 Y LA DOC.RELACIONADA C/CUMPL",
      "seguimiento_objetivo": "ESTABLECER EL CUMPLIMIENTO DE LAS RECOMENDACIONES FORMULADASEN EL INFORME N° GP/OP09/E20 O1.",
      "seguimiento_periodo": "AL 28 DE ABRIL DE 2023"
    }
```
## Query
```sql
--############# findAll ##################

```
## Backend Sispoa
- 1ra Solucion
```ts
  async findAuditoriasSeguimientosInformes(query: GetAllAuditoriasSeguimientosInformesDto, manager: EntityManager) {
    console.log("🐱==xx0==> ~ query:", query)
    try {
      const resultQueryNuevo = await this.findAllConaudNuevo(query, manager);
      if (resultQueryNuevo.length > 0) {
        let resultQueryAntiguo = [];
        if (query.auditoria_codigo.length == 16) {
          query.seguimiento_codigo = query.auditoria_codigo;
          let resultSeguimientos = [];
          resultSeguimientos = await this.findAllConaudAntiguoSeguimiento(query, manager);
          if (resultSeguimientos.length > 0) {
            resultQueryAntiguo = await this.replaceSeguimientoWithAuditoria(resultSeguimientos);
          }
        } else {
          resultQueryAntiguo = await this.findAllConaudAntiguo(query, manager);
        }
        const resultQuery = resultQueryAntiguo.length > 0
          ? await this.fylterNuevosEnAntiguos(resultQueryNuevo, resultQueryAntiguo)
          : resultQueryNuevo;
        return CustomService.verifyingDataResult(resultQuery, this.message_custom);
      } else {
        let resultQueryAntiguo = await this.findAllConaudAntiguo(query, manager);
        console.log("🐱==xx1==> ~ resultQueryAntiguo:", resultQueryAntiguo)
        if (resultQueryAntiguo.length == 0) {
          query.seguimiento_codigo = query.auditoria_codigo;
          let resultSeguimientos = [];
          resultSeguimientos = await this.findAllConaudAntiguoSeguimiento(query, manager);
          console.log("🐱==xx2==> ~ resultSeguimientos:", resultSeguimientos)
          if (resultSeguimientos.length > 0) {
            resultQueryAntiguo = await this.replaceSeguimientoWithAuditoria(resultSeguimientos);
          }
          console.log("🐱==xx3==> ~ resultQueryAntiguo:", resultQueryAntiguo)
        }
        return CustomService.verifyingDataResult(resultQueryAntiguo, this.message_custom);
      }
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }

  async replaceSeguimientoWithAuditoria(array: any) {
    console.log("🐱====> ~ array:", array)
    return array.map(item => {
      const newItem = {};
      Object.keys(item).forEach(key => {
        const newKey = key.replace(/^seguimiento/, 'auditoria'); // Reemplaza "seguimiento" por "auditoria"
        newItem[newKey] = item[key];
      });
      return newItem;
    });
  }
```
- 2da solucion
```ts
async verificaCreateInicioActividad(createIniciosActividadesWithObjectDto, manager) {
  try {
    let iacCodigo = 0;
    let actividadObject = createIniciosActividadesWithObjectDto.actividad_object;
    let resInicAct = [];

    try {
      const getAllIniciosActividadesDto = new GetAllIniciosActividadesDto();
      getAllIniciosActividadesDto.iac_codigo_control = actividadObject.trabajo_codigo.trim();
      if (createIniciosActividadesWithObjectDto.iac_estado != null) {
        getAllIniciosActividadesDto.iac_estado = createIniciosActividadesWithObjectDto.iac_estado;
      }
      resInicAct = await this.iniciosActividadesServices.findAllBusqueda(getAllIniciosActividadesDto, manager);
    } catch (error) {}

    if (resInicAct.length > 0) {
      iacCodigo = resInicAct[0].iac_codigo;
    } else {
      const createInicioActividad = new CreateIniciosActividadesOnlyTableDto();
      createInicioActividad.iac_codigo_control = actividadObject.trabajo_codigo.trim();
      createInicioActividad.iac_objeto = actividadObject.auditoria_objeto || actividadObject.seguimiento_objeto;
      createInicioActividad.iac_objetivo = actividadObject.auditoria_objetivo || actividadObject.seguimiento_objetivo;
      createInicioActividad.iac_alcance = actividadObject.auditoria_periodo || actividadObject.seguimiento_periodo;

      if (actividadObject.actividad_fecha_inicio != null) {
        createInicioActividad.iac_fecha_inicio = actividadObject.actividad_fecha_inicio?.trim();
      } else if (actividadObject.auditoria_fecha_inicio || actividadObject.seguimiento_fecha_inicio) {
        createInicioActividad.iac_fecha_inicio = (actividadObject.auditoria_fecha_inicio || actividadObject.seguimiento_fecha_inicio).trim();
      } else {
        let fecha = new Date().toLocaleDateString('es-ES').split('/').reverse().join('/');
        createInicioActividad.iac_fecha_inicio = fecha;
      }

      createInicioActividad.iac_fecha_fin = actividadObject.actividad_fecha_fin?.trim();
      createInicioActividad.iac_dias_habiles = actividadObject.auditoria_dias_habiles || actividadObject.seguimiento_dias_habiles;
      createInicioActividad.iac_dias_calendario = actividadObject.auditoria_dias_calendario || actividadObject.seguimiento_dias_calendario;
      createInicioActividad.iac_mes_inicio = actividadObject.actividad_fecha_inicio;
      createInicioActividad.iac_mes_fin = actividadObject.actividad_fecha_fin;

      if (actividadObject.auditoria_fecha_emision || actividadObject.seguimiento_fecha_emision) {
        const fechaEmision = actividadObject.auditoria_fecha_emision || actividadObject.seguimiento_fecha_emision;
        createInicioActividad.iac_fecha_emision = fechaEmision.length > 10
          ? this.stringToDate(fechaEmision, 'DD/MM/yyyy', '01/01/1993')
          : fechaEmision;
      }

      createInicioActividad.iac_migrado = true;
      let getionesRetrieved = {};
      let anio = '';

      try {
        const gestionFilter = new GetAllGestionesByAnioProviderDto();
        gestionFilter.ges_anio = actividadObject.conaud_gestion || actividadObject.actividad_gestion || createInicioActividad.iac_fecha_inicio?.split('/')[2];
        if (gestionFilter.ges_anio != null) {
          getionesRetrieved = (await this.parametricasProvider.findAllRequestProvider(gestionFilter))[0];
        }
      } catch (error) {}

      if (Object.keys(getionesRetrieved).length != 0) {
        createInicioActividad.ges_codigo = getionesRetrieved.ges_codigo;
      }

      createInicioActividad.ttr_codigo = 0;

      let resuCodContVista = '';
      if (actividadObject.trabajo_codigof != null) {
        createInicioActividad.iac_codigo_control_vista = actividadObject.trabajo_codigof;
      } else {
        let strCodControl = `${actividadObject.trabajo_codigo.trim()}`;
        if (strCodControl.length == 16) {
          resuCodContVista = `${strCodControl.slice(0, 2)}/${strCodControl.slice(2, 6)}/${strCodControl.slice(6, 9)}/${strCodControl.slice(9, 11)}(${strCodControl.slice(11, 15)}/${strCodControl.slice(15)})`;
        } else {
          resuCodContVista = `${strCodControl.slice(0, 2)}/${strCodControl.slice(2, -3)}/${strCodControl.slice(-3)}`;
        }
        createInicioActividad.iac_codigo_control_vista = resuCodContVista;
      }

      createInicioActividad.usuario = createIniciosActividadesWithObjectDto.usuario;
      let resInicioAct = await this.createOnlyTable(createInicioActividad, manager);
      iacCodigo = resInicioAct.iac_codigo;

      if (iacCodigo != 0) {
        let resultMigrada = { iac_codigo: iacCodigo };
        const createActividadMigradaConaudDto = new CreateActividadMigradaConaudDto();
        createActividadMigradaConaudDto.iac_codigo = iacCodigo;
        createActividadMigradaConaudDto.amc_datos_informe = {};
        createActividadMigradaConaudDto.amc_datos_actividad = createIniciosActividadesWithObjectDto.actividad_object;
        createActividadMigradaConaudDto.usuario = createIniciosActividadesWithObjectDto.usuario;
        await this.checkOrCreateActividadMigradaConaud(resultMigrada, createActividadMigradaConaudDto, manager);
      }
    }
    return iacCodigo;
  } catch (error) {
    this.logger.debug(error);
    throwError(400, error.message);
  }
}

```
## codigo_conaud de prueba
```c
ECEP25O02L1PF041
```
## Componentes
- components/sispoa/estructura_formulario/ActividadesContinuidad.vue
- src/feature/inicios-actividades/service/create-inicios-actividades.service.ts
	- verificaCreateInicioActividad
- src/feature/conaud/conaud.service.ts
	- findAuditoriasSeguimientosInformes
## Revisar
- createActividadMigrada
	- createInicioActividadMigrado