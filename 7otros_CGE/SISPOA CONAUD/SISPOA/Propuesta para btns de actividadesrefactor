        <global-icon-tool-tip
          v-if="shouldShowTooltip(objectPoaObjetivo, item)"
          @click="sendComponentChangeStatusInd(3, item)"
          tooltip="Aprobar Retiro (Supervisor)" prepend-icon="mdi-file-send" iconColor="#ea3545" toolTipColor="#ea3545"
        ></global-icon-tool-tip>

    shouldShowTooltip(objectPoaObjetivo, item) {
      console.log("🐱==xx0==> ~ item:", item)
      console.log("🐱==xx==> ~ objectPoaObjetivo:", objectPoaObjetivo)
      if(item.cac_codigo == 1 ){

      }
      const condition1 = objectPoaObjetivo.pobj_estado === 2 && (item.cac_codigo === 1 || item.cac_codigo === 2);
      const condition2 = objectPoaObjetivo.pobj_estado === 5 && (item.cac_codigo === 1 || item.cac_codigo === 3);
      const condition3 = item.act_estado === 12 && this.dataFormulario.roles.includes(3);

      return (condition1 || condition2) && condition3;
    },
