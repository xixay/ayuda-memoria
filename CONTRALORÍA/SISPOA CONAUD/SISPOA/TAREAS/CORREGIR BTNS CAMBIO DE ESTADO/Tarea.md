BASE LOCAL: YA CONSOLIDADA
backup_20240902_183544.sql

## ANTES DE EFECTUAR LOS CAMBIOS DE ESTADOS
backup_20240905_181206.sql

EN ACTIVIDADES VERIFICAR
        <!-- ENVIA A VERIFICADO POR GI DE 7 - 17 -->
        <!-- F - 21 -->
        <!-- <global-icon-tool-tip
          v-if="([2,8].includes(objectPoaObjetivo.pobj_estado) && [1,2,3].includes(item.cac_codigo))
            && item.estados_check != 4 && item.act_estado === 7 && rolGestionInstitucional.formulador== 1 "
          @click="sendComponentChangeStatusInd(17, item)"
          tooltip="Aprobar Gestión Institucional"
          prepend-icon="mdi-file-send"
          iconColor="#a250e3"
          toolTipColor="#a250e3"
        ></global-icon-tool-tip> -->
        

SIN IDENTIFICAR						FORMULADOR 	EDICION
3457029		RAFAEL MARTIN PORCEL DE LA BARRA	SUPERVISOR 	EDICION
SIN IDENTIFICAR						FORMULADOR 	EDICION
SIN IDENTIFICAR						FORMULADOR 	EDICION
2468864		NORA HERMINIA MAMANI CABRERA		SUPERVISOR 	EDICION
2468864		NORA HERMINIA MAMANI CABRERA		APROBADOR 	EDICION
2573781		ERIKA CAROLINA CARDENAS SALAS		FORMULADOR 	EDICION
4755293		NORKA VALERIA CHAVEZ LIMACHI		FORMULADOR 	EDICION 
-PARA PROBAR CAMBIOS DE ESTADOS ACTIVIDADES
backup_20240906_090626.sql

disabled="PoaRecordSelected && PoaRecordSelected.poa_estado !== 2"
        
        PoaRecordSelected.poa_estado{{ PoaRecordSelected.poa_estado }}
        Status.VERIFICADO_GI{{Status.VERIFICADO_GI}}
        GlobalStatus{{ GlobalStatus }}
        rolGestionInstitucional{{ rolGestionInstitucional }}
        
                objectPoaObjetivo.pobj_estado{{ objectPoaObjetivo.pobj_estado }}
        item.cac_codigo{{ item.cac_codigo }}
        item.estados_check{{ item.estados_check }}
        item.act_estado{{item.act_estado}}
        
con una nueva actividad
backup_20240906_151625.sql

PARA PROBAR RETIROS
backup_20240909_121314.sql

PARA PROBAR CAMBIOS EN VIATICOS
backup_20240909_151657.sql






CORREGIR OBSERVACIONES 
OBSERVAR RETIRO
