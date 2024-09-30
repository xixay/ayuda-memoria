################# F -26 ##############################
          <div v-if="([8,5].includes(pobjEstado))">
            <!-- OBSERVAR VIATICO     F-26-->
            <global-icon-tool-tip
              v-if="((item.avi_estado == 3 && (dataFormulario.roles).includes(2)) 
                || (item.avi_estado == 8 && (dataFormulario.roles).includes(3)) 
                || (item.avi_estado == 7 && rolGestionInstitucional.formulador == 1))"
              @click="accionObservarViatico(item, 5)" tooltip="Observar Viatico"
              prepend-icon="mdi-alert" iconColor="#ef9b20" toolTipColor="#ef9b20">
            </global-icon-tool-tip>
            <!-- ########### CAMBIOS DE ESTADO ############ -->
            <!-- ENVIA A VERIFICAR DE 1 - 3     F - 26-->
            <global-icon-tool-tip
              v-if="((dataFormulario.roles).includes(1))
                && item.avi_estado === 1"
              @click="sendComponentChangeStatusInd(item, 3)" tooltip="Enviar a Verificación"
              prepend-icon="mdi-file-send" iconColor="info" toolTipColor="info"
            ></global-icon-tool-tip>
            <!-- ENVIA A APROBAR DE 3 - 8       F - 26-->
            <global-icon-tool-tip
              v-if="((dataFormulario.roles).includes(2))
                && item.avi_estado === 3"
              @click="sendComponentChangeStatusInd(item, 8)" tooltip="Realizar Aprobación"
              prepend-icon="mdi-file-send" iconColor="success" toolTipColor="success"
            ></global-icon-tool-tip>
            <!-- ENVIA A APROBAR POR SUPERVISOR DE 8 - 7      F - 26-->
            <global-icon-tool-tip
              v-if="((dataFormulario.roles).includes(3))
                && item.avi_estado === 8"
              @click="sendComponentChangeStatusInd(item, 7)" tooltip="Realizar Aprobación"
              prepend-icon="mdi-file-send" iconColor="warning" toolTipColor="warning"
            ></global-icon-tool-tip>
            <!-- ENVIA A VERIFICADO POR GI DE 7 - 17 provisional solo para poa 3     F - 26-->
            <global-icon-tool-tip
              v-if="(poaCodigo== 3) 
                && rolGestionInstitucional.formulador == 1
                && item.avi_estado === 7"
              @click="sendComponentChangeStatusInd(item, 17)" tooltip="Aprobar Gestión Institucional"
              prepend-icon="mdi-file-send" iconColor="#a250e3" toolTipColor="#a250e3"
            ></global-icon-tool-tip>
          </div>
          
          
          
###################### F - 21 ###############################
<!-- OBSERVAR VIATICO     F-21-->
          <global-icon-tool-tip
            v-if="((item.avi_estado == 3 && (dataFormulario.roles).includes(2)) 
              || (item.avi_estado == 8 && (dataFormulario.roles).includes(3)) 
              || (item.avi_estado == 7 && rolGestionInstitucional.formulador == 1))"
            @click="accionObservarViatico(item, 5)" tooltip="Observar Viatico"
            prepend-icon="mdi-alert" iconColor="#ef9b20" toolTipColor="#ef9b20">
          </global-icon-tool-tip>
          <!-- ########### CAMBIOS DE ESTADO ############ -->
          <!-- ENVIA A VERIFICAR DE 1 - 3     F - 21-->
          <global-icon-tool-tip
            v-if="((dataFormulario.roles).includes(1))
              && item.avi_estado === 1"
            @click="sendComponentChangeStatusInd(item, 3)" tooltip="Enviar a Verificación"
            prepend-icon="mdi-file-send" iconColor="info" toolTipColor="info"
          ></global-icon-tool-tip>
          <!-- ENVIA A APROBAR DE 3 - 8       F - 21-->
          <global-icon-tool-tip
            v-if="((dataFormulario.roles).includes(2))
              && item.avi_estado === 3"
            @click="sendComponentChangeStatusInd(item, 8)" tooltip="Realizar Aprobación"
            prepend-icon="mdi-file-send" iconColor="success" toolTipColor="success"
          ></global-icon-tool-tip>
          <!-- ENVIA A APROBAR POR SUPERVISOR DE 8 - 7      F - 21-->
          <global-icon-tool-tip
            v-if="((dataFormulario.roles).includes(3))
              && item.avi_estado === 8"
            @click="sendComponentChangeStatusInd(item, 7)" tooltip="Realizar Aprobación"
            prepend-icon="mdi-file-send" iconColor="warning" toolTipColor="warning"
          ></global-icon-tool-tip>
          <!-- ENVIA A VERIFICADO POR GI DE 7 - 17      F - 21-->
          <global-icon-tool-tip
            v-if="rolGestionInstitucional.formulador == 1
              && item.avi_estado === 7"
            @click="sendComponentChangeStatusInd(item, 17)" tooltip="Aprobar Gestión Institucional"
            prepend-icon="mdi-file-send" iconColor="#a250e3" toolTipColor="#a250e3"
          ></global-icon-tool-tip>
          <!-- ENVIA A CONSOLIDAR DE 17 - 2      F - 21-->
          <global-icon-tool-tip
            v-if="rolGestionInstitucional.formulador == 1
              && item.avi_estado === 17"
            @click="sendComponentChangeStatusInd(item, 2)" tooltip="Consolidar Viático"
            prepend-icon="mdi-file-send" iconColor="success" toolTipColor="success"
          ></global-icon-tool-tip>
