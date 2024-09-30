Tengo un array de objetos llamado objectStatus:
[
{
act_estado:17,
act_codigo_anterior:1244,
avi_estado:17
},
{
act_estado:17,
act_codigo_anterior:1220,
avi_estado:17
},
{
act_estado:17,
act_codigo_anterior:1223,
avi_estado:17
},
]
y el array:
  private StatusOrderByJerarquia: Array<EstadoPoa> = [
    EstadoPoa.OBSERVADO,
    EstadoPoa.OBSERVACION_FINALIZADA,
    EstadoPoa.ANULACION_OBSERVADO,
    EstadoPoa.SOLICITUD_ANULACION,
    EstadoPoa.ANULACION_APROBADO,
    EstadoPoa.ANULACION_APROBADO_SUPERVISOR,
    EstadoPoa.ANULACION_APROBADO_GI,
    EstadoPoa.EDICION,
    EstadoPoa.EN_VERIFICACION,
    EstadoPoa.APROBADO,
    EstadoPoa.APROBADO_SUPERVISOR,
    EstadoPoa.VERIFICADO_GI,
    EstadoPoa.CONSOLIDADO,
    EstadoPoa.HISTORICO,
  ];
puedes desglozarlo paso por paso nestjs:
  private async checkLevelStatus (objectStatus: any): Promise<Number> {
    console.log("🐱==rr1==> ~ objectStatus:", objectStatus)
    try {
      /**
       * * Jerarquia de estados Formularios
       * TODO: Verificar, clasificaciones de Actividades
       * ! Comprobar jerarquia de estados POA
       */
      for (let itemStatus of this.StatusOrderByJerarquia) {
        let findStatus = _.findIndex(objectStatus, function (item: any) {
          return [
            //item.poa_estado, item.pobj_estado, item.oau_estado, // --- LVL 1 POA ---
            item.act_estado, item.avi_estado // --- LVL 2 FORMULARIOS, ACTIVIDADES ---
          ].includes(itemStatus);
        });
        // ----------- IF EXIST STATUS, RETURN -----------
        if (findStatus !== -1) { return itemStatus; }
      }
      // ----------- RETURN DEFAULT -----------
      return 0;
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }
