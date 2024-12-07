## Consideraciones
- EPTP05S23
- Tiene que buscar para apoyo, con la palabra exacta
- Si pego en codigo CONAUD, directamente, no deberia dejarme registrar
- Si en tipo de trabajo, selecciono de tipo apoyo, si o si deberia seleccionarse la casilla: ¿El actual registro es referente?
## Roles

| _list_ | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| ------ | -------------- | --------------------------------------------- | ------------------ | ------- |
|        | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|        | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
|        | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |
## Query
```sql
      SELECT  iac.*, ges.ges_anio
      FROM        ejecucion_actividades.inicios_actividades iac
              LEFT JOIN parametricas.gestiones ges ON iac.ges_codigo = ges.ges_codigo
      WHERE     TRUE
      AND iac.iac_estado IN (22)
      AND iac.iac_codigo_control LIKE 'ALCP25M07';
--$$$$$$$$$$$$$$$$$$$$$$$$$$$
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE
--		AND ia.iac_codigo_control LIKE 'ALCP25M07'
--		AND ia.iac_estado IN (22)
ORDER BY ia.iac_codigo DESC
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT
		a.act_codigo, a.act_numero, a.iac_codigo_apoyo,a.act_descripcion, a.ttr_codigo, a.tipact_codigo, 
		tt.ttr_descripcion, ta.tipact_descripcion, ac.iac_codigo 
FROM 	estructura_poa.actividades a 
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.tipos_actividades ta ON a.tipact_codigo = ta.tipact_codigo
		LEFT JOIN estructura_poa.actividades_continuidad ac ON a.act_codigo = ac.act_codigo 
ORDER BY a.act_codigo DESC
;
SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac ;
```
## Conaud
- verificaCreateInicioActividad
## backup casa
- backup_20241207_171814.sql
## Codigos Nuevos
- ALEP25S20
- EBEP25J05
- EBEP25S01
- ECEP25G00
- ECEP25J02
- ECEP25M01
- ECEP25O02
- ECFP25Y02
- ECGP25M17
- ECOP25J18
- EHEP25F03
## Codigo Frontend
```vue
<template>
  <v-container fluid>
    <v-list
      subheader
      outlined
    >
      <v-subheader class="text-subtitle-1 font-weight-bold">
        INFORMACIÓN GENERAL: {{ [ClasificacionActividadType.REGULAR, ClasificacionActividadType.REFORMULACION_INCORPORACION].includes(cacCodigo)?'ACTIVIDADES REGULARES (F26)':'ACTIVIDADES INCORPORADAS (F21)' }}
      </v-subheader>
      <v-list-item dense>
        <v-list-item-content>
          <label class="text--secondary text-caption font-weight-bold">
            PROGRAMA:
            <span class="font-weight-regular">
              ({{ PoaObjetivo.pro_numero }}) {{ PoaObjetivo.pobj_pro_descripcion }}
            </span>
          </label>
        </v-list-item-content>
      </v-list-item>
      <v-list-item dense>
        <v-list-item-content>
          <label class="text--secondary text-caption font-weight-bold">
            ACCIÓN ESTRATEGICA:
            <span class="font-weight-regular">
              ({{ PoaObjetivo.aes_numero }}) {{ PoaObjetivo.pobj_aes_descripcion }}
            </span>
          </label>
        </v-list-item-content>
      </v-list-item>
      <v-list-item dense>
        <v-list-item-content>
          <label class="text--secondary text-caption font-weight-bold">
            ACCIÓN/OPERACIÓN A CORTO PLAZO:
            <span class="font-weight-regular">
              ({{ codigoAccionEstrategica }}) {{ PoaObjetivo?.pobj_nombre }}
            </span>
          </label>
        </v-list-item-content>
      </v-list-item>
      <v-list-item dense>
        <v-list-item-content>
          <v-row align="center" class="my-auto">
            <v-col cols="6">
              <label class="text--secondary text-caption font-weight-bold">
                CANTIDAD INDICADOR:
                <span class="font-weight-regular">
                  {{ PoaObjetivo.pobj_indicador }}
                </span>
              </label>
            </v-col>
            <v-col cols="6" v-if="cantidadIndicadorEjecutora > 0">
              <label class="text--secondary text-caption font-weight-bold">
                CANTIDAD INDICADOR ASIGNADO A EJECUTORA:
                <span class="font-weight-regular">
                  {{ cantidadIndicadorEjecutora }}
                </span>
              </label>
            </v-col>
          </v-row>
        </v-list-item-content>
      </v-list-item>
      <v-divider light></v-divider>
      <v-list-item dense>
        <v-list-item-content>
          <v-row align="center" class="my-auto">
            <v-col cols="6">
              <label class="text--secondary text-caption font-weight-bold">
                UNIDAD EJECUTORA:
                <span class="font-weight-regular">
                  {{ AreaUnidadEjecutora.aun_concatenado_invert }}
                </span>
              </label>
            </v-col>
            <v-col cols="6">
              <label class="text--secondary text-caption font-weight-bold">
                UNIDAD SUPERVISORA:
                <span class="font-weight-regular">
                  {{ nombreAreaUnidadSupervisora }}
                </span>
              </label>
            </v-col>
          </v-row>
        </v-list-item-content>
      </v-list-item>
    </v-list>
    <hr>

    <v-data-table
      :headers="tableHeadersMain"
      :items="AllActividades"
      :search="tableSearch"
      :no-results-text="$variables.noResultadosBusqueda()"
      :no-data-text="$variables.noResultados()"
      :header-props="{ sortByText: 'Ordenar por' }"
      :footer-props="{
        'items-per-page-text': $variables.nombreFilas(),
        'itemsPerPageOptions': $variables.itemsPorPagina()
      }"
      class="elevation-1 mt-4"
      v-show="tableShow" dense
      show-expand
      item-key="act_codigo"
      :single-expand="false"
      :expanded.sync="tableExpandedItemArray"
      expand-icon="mdi-car"
      :loading="tableLoading" loading-text="Cargando... Por favor espere"
    >
      <template #expanded-item="{ headers, item }">
        <td :colspan="headers.length" class="light-blue lighten-5 ma-0 pa-0">
          <!-- VIATICOS -->
          <actividades-viaticos
            :codActividadActual="item.act_codigo"
            :actividadEstado="item.act_estado"
            :dataFormulario="{...dataGlobalStatusAndRoles, flagSistemaDesBloqueado: flagSistemaDesBloqueado}"
            :rolGestionInstitucional="rolGestionInstitucional"
            :estadoGlobalFormulario="dataGlobalStatusAndRoles.estado_global"
            :clasificacionActividades="cacCodigo"
            :pobjEstado="PoaObjetivo.pobj_estado"
            :cacCodigo="item.cac_codigo"
            :poaCodigo="poaCodigo"
          >
          </actividades-viaticos>
        </td>
      </template>
      <template #[`header.acciones`]="{}">
        <v-icon>
          list
        </v-icon>
      </template>
      <template #top>
        <v-toolbar flat dense>
          <v-toolbar-title><h5 class="text-subtitle-1">{{ componentName }}</h5></v-toolbar-title>
          <v-divider class="mx-4" inset vertical></v-divider>
          <v-btn
            v-if="[ClasificacionActividadType.REGULAR].includes(cacCodigo)
              && PoaObjetivo.pobj_estado != Status.CONSOLIDADO
              && [Status.EDICION, Status.CONSOLIDADO].includes(dataGlobalStatusAndRoles.estado_global)
              && roles.includes(Rol.FORMULADOR)"
            color="success" outlined small
            @click="openModalDialog(FlagType.CREATE)"
          >
            <v-icon>mdi-plus</v-icon> {{ $t('sispoa.botones.adicionar') }} {{ componentName }}
          </v-btn>
          <v-btn
            v-if="[ClasificacionActividadType.INCORPORACION].includes(cacCodigo)
              && PoaObjetivo.pobj_estado == Status.CONSOLIDADO
              && roles.includes(Rol.FORMULADOR)"
            color="success" outlined small
            @click="openModalDialog(FlagType.CREATE)"
          >
            <v-icon>mdi-plus</v-icon> {{ $t('sispoa.botones.adicionar') }} {{ componentName }}
          </v-btn>
          <v-spacer></v-spacer>
          <v-flex class="mt-4 mx-2">
            <v-text-field
              v-model="tableSearch"
              append-icon="mdi-magnify"
              :label="$variables.busqueda()"
              clearable dense
              v-show="AllActividades && AllActividades.length > 0"
            >
            </v-text-field>
          </v-flex>
        </v-toolbar>
        <v-divider class="mt-1"></v-divider>
      </template>
      <template #no-data>
        NO EXISTE NINGUNA INFORMACIÓN REGISTRADA
      </template>
      <template #[`item.acciones`]="{ item }">
        <v-row align="center" class="my-auto">
          <v-col cols="12">
            <!-- ############ COMPARTEN AMBOS ##############-->
            <global-icon-tool-tip
              @click="openModalDialog(FlagType.READ, item)" tooltip="Ver Información de Actividad"
              prepend-icon="mdi-eye" iconColor="primary" toolTipColor="primary"
            ></global-icon-tool-tip>
            <!-- REPORTE -->
            <global-icon-tool-tip
              v-if="[
                Status.SOLICITUD_ANULACION,
                Status.ANULACION_APROBADO,
                Status.ANULACION_APROBADO_SUPERVISOR,
                Status.RETIRADO].includes(item.act_estado)"
              @click="actionDescargarReporteF24(item)" tooltip="Descargar Reporte F24"
              prepend-icon="mdi-file-pdf-box" iconColor="success" toolTipColor="success"
            ></global-icon-tool-tip>
            <!-- HISTORIAL DE ESTADOS -->
            <global-icon-tool-tip
              @click="openModalDialogHistorial(item)" tooltip="Ver Registros de Estados"
              prepend-icon="mdi-content-paste" iconColor="info" toolTipColor="info"
            ></global-icon-tool-tip>
            <!--ACCIONES--se esconden si el flagBloqueado es FALSE (desbloqueado)-->
            <div v-if="flagSistemaDesBloqueado">
              <!-- EDITA LA ACTIVIDAD-->
              <global-icon-tool-tip
                v-if="item.act_ejecucion_conaud === false
                  && (roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                  && item.act_estado == Status.EDICION"
                @click="openModalDialog(FlagType.UPDATE, item)"
                tooltip="Editar"
                prepend-icon="edit"
                iconColor="#54bebe"
                toolTipColor="#54bebe"
              ></global-icon-tool-tip>
              <!-- INACTIVAR -->
              <global-icon-tool-tip
                v-if="(roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                  && item.act_estado == Status.EDICION
                  && item.act_ejecucion_conaud != true"
                @click="openModalDialog(FlagType.DISABLE, item)"
                tooltip="Inactivar"
                prepend-icon="mdi-delete"
                iconColor="#ea5545"
                toolTipColor="#ea5545"
              >
              </global-icon-tool-tip>
              <!-- ACTIVAR -->
              <global-icon-tool-tip
                v-if="[Status.CONSOLIDADO, Status.APROBADO, Status.HISTORICO].includes(PoaObjetivo.pobj_estado)
                  && (roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                  && item.act_estado === 0"
                @click="openModalDialog(FlagType.ENABLE ,item)" tooltip="Activar"
                prepend-icon="mdi-checkbox-marked-outline" iconColor="info" toolTipColor="info"
              ></global-icon-tool-tip>
              <!-- ------------ RETIROS -------------- -->
              <div v-if="[Status.CONSOLIDADO].includes(PoaObjetivo.pobj_estado)">
                <!-- SOLICITAR RETIRO F-26-->
                <global-icon-tool-tip
                  v-if="(roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                    && item.act_estado === Status.CONSOLIDADO"
                  @click="sendComponentChangeStatus(Status.SOLICITUD_ANULACION, item)"
                  tooltip="Solicitar Retiro" prepend-icon="mdi-trash-can" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- APROBAR RETIRO APROBADOR F-26-->
                <global-icon-tool-tip
                  v-if="roles.includes(Rol.APROBADOR)
                    && item.act_estado === Status.SOLICITUD_ANULACION"
                  @click="sendComponentChangeStatus(Status.ANULACION_APROBADO, item)"
                  tooltip="Aprobar Retiro (Aprobador)" prepend-icon="mdi-check" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- OBSERVAR RETIRO APROBADOR F-26-->
                <global-icon-tool-tip
                  v-if="roles.includes(Rol.APROBADOR)
                    && item.act_estado === Status.SOLICITUD_ANULACION"
                  @click="sendComponentChangeStatus(Status.ANULACION_OBSERVADO, item)"
                  tooltip="Observar Retiro" prepend-icon="mdi-eye" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- APROBAR RETIRO SUPERVISOR F-26-->
                <global-icon-tool-tip
                  v-if="roles.includes(Rol.SUPERVISOR)
                    && item.act_estado === Status.ANULACION_APROBADO"
                  @click="sendComponentChangeStatus(Status.ANULACION_APROBADO_SUPERVISOR, item)"
                  tooltip="Aprobar Retiro (Supervisor)" prepend-icon="mdi-check" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- OBSERVAR RETIRO SUPERVISOR F-26-->
                <global-icon-tool-tip
                  v-if="roles.includes(Rol.SUPERVISOR)
                    && item.act_estado === Status.ANULACION_APROBADO"
                  @click="sendComponentChangeStatus(Status.ANULACION_OBSERVADO, item)"
                  tooltip="Observar Retiro" prepend-icon="mdi-eye" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- APROBAR RETIRO GI 13-45 F-26-->
                <global-icon-tool-tip
                  v-if="rolGestionInstitucional.formulador == FlagExists.EXISTE
                    && item.act_estado === Status.ANULACION_APROBADO_SUPERVISOR"
                  @click="sendComponentChangeStatus(Status.RETIRO_APROBADO_GI, item)"
                  tooltip="Aprobar Retiro (GI)" prepend-icon="mdi-check" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- OBSERVAR RETIRO 13-14 F-26-->
                <global-icon-tool-tip
                  v-if="rolGestionInstitucional.formulador == FlagExists.EXISTE
                    && item.act_estado === Status.ANULACION_APROBADO_SUPERVISOR"
                  @click="sendComponentChangeStatus(Status.ANULACION_OBSERVADO, item)"
                  tooltip="Observar Retiro" prepend-icon="mdi-eye" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- RETIRAR RETIRO F-26    45 - 46 -->
                <global-icon-tool-tip
                  v-if="[rolGestionInstitucional.aprobador, rolGestionInstitucional.verificador].includes(FlagExists.EXISTE)
                    && item.act_estado === Status.RETIRO_APROBADO_GI"
                  @click="sendComponentChangeStatus(Status.RETIRADO, item)"
                  tooltip="Retirar Actividad" prepend-icon="mdi-check" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- OBSERVAR RETIRO F-26-->
                <global-icon-tool-tip
                  v-if="[rolGestionInstitucional.aprobador, rolGestionInstitucional.verificador].includes(FlagExists.EXISTE)
                    && item.act_estado === Status.RETIRO_APROBADO_GI"
                  @click="sendComponentChangeStatus(Status.ANULACION_OBSERVADO, item)"
                  tooltip="Observar Retiro" prepend-icon="mdi-eye" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
              </div>
              <!-- ########### FORMULARIO F -26 ###########-->
              <div v-if="[ClasificacionActividadType.REGULAR, ClasificacionActividadType.REFORMULACION_INCORPORACION].includes(cacCodigo)">
                <!-- EDITAR SOLO HORAS -->
                <global-icon-tool-tip
                  v-if="item.act_ejecucion_conaud === true
                    && dataGlobalStatusAndRoles.flagFormulado == true
                    && item.act_estado === Status.EDICION"
                  @click="accionEditarHoras(item)" tooltip="Editar Horas"
                  prepend-icon="edit" iconColor="#ea5545" toolTipColor="#ea5545"
                ></global-icon-tool-tip>
                <!-- OBSERVAR ACTIVIDAD     F-26-->
                <global-icon-tool-tip
                  v-if="(PoaObjetivo.pobj_estado == Status.APROBADO)
                    && ((item.act_estado === Status.EN_VERIFICACION && roles.includes(Rol.APROBADOR))
                      || (item.act_estado === Status.APROBADO && roles.includes(Rol.SUPERVISOR))
                      || (item.act_estado === Status.APROBADO_SUPERVISOR && rolGestionInstitucional.formulador == FlagExists.EXISTE)
                      || (item.act_estado === Status.CONSOLIDADO_GERENTE && rolGestionInstitucional.formulador == FlagExists.EXISTE)
                      || (item.act_estado === Status.VERIFICADO_GI && rolGestionInstitucional.formulador == FlagExists.EXISTE))"
                  @click="sendComponentChangeStatus(Status.OBSERVADO, item)"
                  tooltip="Observar Actividad"
                  prepend-icon="mdi-alert"
                  iconColor="#ef9b20"
                  toolTipColor="#ef9b20"
                ></global-icon-tool-tip>
                <div v-if="[Status.APROBADO, Status.HISTORICO].includes(PoaObjetivo.pobj_estado)">
                  <!-- CORREGIR OBSERVACIONES F-26-->
                  <global-icon-tool-tip
                    v-if="(roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                      && item.act_estado === Status.OBSERVACION_FINALIZADA"
                    @click="sendComponentChangeStatus(Status.EDICION, item)" tooltip="La Actividad tiene Observaciones, Desea Corregir?"
                    prepend-icon="mdi-alert" iconColor="#ef9b20" toolTipColor="#ef9b20"
                  ></global-icon-tool-tip>
                  <!-- HABILITAR ACTIVIDAD F-26-->
                  <global-icon-tool-tip
                    v-if="roles.includes(Rol.FORMULADOR)
                      && item.act_estado === Status.OBSERVADO"
                    @click="sendComponentChangeStatus(Status.EDICION, item)"
                    tooltip="Habilitar registro" prepend-icon="mdi-check-all" iconColor="info" toolTipColor="info"
                  ></global-icon-tool-tip>
                  <!-- ############## CAMBIOS DE ESTADO  F - 26 ###############-->
                  <div v-if="item.estados_check != Status.OBSERVADO">
                    <!-- ENVIA A VERIFICAR DE 1 - 3-->
                    <global-icon-tool-tip
                      v-if="roles.includes(Rol.FORMULADOR)
                        && item.act_estado === Status.EDICION"
                      @click="sendComponentChangeStatus(Status.EN_VERIFICACION, item)"
                      tooltip="Enviar Verificar" prepend-icon="mdi-file-send" iconColor="info" toolTipColor="info"
                    ></global-icon-tool-tip>
                    <!-- ENVIA A APROBAR DE 3 - 8-->
                    <global-icon-tool-tip
                      v-if="roles.includes(Rol.APROBADOR)
                        && item.act_estado === Status.EN_VERIFICACION"
                      @click="sendComponentChangeStatus(Status.APROBADO, item)"
                      tooltip="Verificar por el aprobador" prepend-icon="mdi-file-send" iconColor="success" toolTipColor="success"
                    ></global-icon-tool-tip>
                    <!-- ENVIA A APROBAR POR SUPERVISOR DE 8 - 7-->
                    <global-icon-tool-tip
                      v-if="roles.includes(Rol.SUPERVISOR)
                        && item.act_estado === Status.APROBADO"
                      @click="sendComponentChangeStatus(Status.APROBADO_SUPERVISOR, item)"
                      tooltip="Aprobado por el supervisor" prepend-icon="mdi-file-send" iconColor="warning" toolTipColor="warning"
                    ></global-icon-tool-tip>
                    <!-- ENVIA A VERIFICADO POR GI DE 7 - 17  provisional solo para poa 3-->
                    <global-icon-tool-tip
                      v-if="poaCodigo == 3
                        && rolGestionInstitucional.formulador == FlagExists.EXISTE
                        && item.act_estado === Status.APROBADO_SUPERVISOR"
                      @click="sendComponentChangeStatus(Status.VERIFICADO_GI, item)"
                      tooltip="Aprobar Gestión Institucional"
                      prepend-icon="mdi-file-send"
                      iconColor="#a250e3"
                      toolTipColor="#a250e3"
                    ></global-icon-tool-tip>
                  </div>
                </div>
                <!-- ENVIA A CONSOLIDAR DE 14 - 2     F-26-->
                <global-icon-tool-tip
                  v-if="[Status.CONSOLIDADO, Status.HISTORICO].includes(PoaObjetivo.pobj_estado)
                    && (roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                    && item.act_estado === Status.ANULACION_OBSERVADO"
                  @click="sendComponentChangeStatus(Status.CONSOLIDADO, item)"
                  tooltip="Consolidar" prepend-icon="mdi-check" iconColor="success" toolTipColor="success"
                ></global-icon-tool-tip>
              </div>
              <!-- ########### FORMULARIO F -21 ###########-->
              <div v-if="(PoaObjetivo.pobj_estado == Status.CONSOLIDADO && cacCodigo === ClasificacionActividadType.INCORPORACION)">
                <!-- OBSERVAR ACTIVIDAD     F-21-->
                <global-icon-tool-tip
                  v-if="((item.act_estado === Status.EN_VERIFICACION && roles.includes(Rol.APROBADOR))
                    || (item.act_estado === Status.APROBADO && roles.includes(Rol.SUPERVISOR))
                    || (item.act_estado === Status.APROBADO_SUPERVISOR && rolGestionInstitucional.formulador == FlagExists.EXISTE)
                    || (item.act_estado === Status.CONSOLIDADO_GERENTE && rolGestionInstitucional.formulador == FlagExists.EXISTE)
                    || (item.act_estado === Status.VERIFICADO_GI && rolGestionInstitucional.formulador == FlagExists.EXISTE))"
                  @click="sendComponentChangeStatus(Status.OBSERVADO, item)"
                  tooltip="Observar Actividad"
                  prepend-icon="mdi-alert"
                  iconColor="#ef9b20"
                  toolTipColor="#ef9b20"
                ></global-icon-tool-tip>
                <!-- CORREGIR OBSERVACIONES F -21 -->
                <global-icon-tool-tip
                  v-if="(roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                    && item.act_estado === Status.OBSERVACION_FINALIZADA"
                  @click="sendComponentChangeStatus(Status.EDICION, item)" tooltip="La Actividad tiene Observaciones, Desea Corregir?"
                  prepend-icon="mdi-alert" iconColor="#ef9b20" toolTipColor="#ef9b20"
                ></global-icon-tool-tip>
                <!-- HABILITAR ACTIVIDAD F-21-->
                <global-icon-tool-tip
                  v-if="roles.includes(Rol.FORMULADOR)
                    && item.act_estado === Status.OBSERVADO"
                  @click="sendComponentChangeStatus(Status.EDICION, item)"
                  tooltip="Habilitar registro" prepend-icon="mdi-check-all" iconColor="info" toolTipColor="info"
                ></global-icon-tool-tip>
                <!-- ############## CAMBIOS DE ESTADO  F - 21 ###############-->
                <div v-if="item.estados_check != Status.OBSERVADO">
                  <!-- ENVIA A VERIFICAR DE 1 - 3-->
                  <global-icon-tool-tip
                    v-if="roles.includes(Rol.FORMULADOR)
                      && item.act_estado === Status.EDICION"
                    @click="sendComponentChangeStatus(Status.EN_VERIFICACION, item)"
                    tooltip="Enviar Verificar" prepend-icon="mdi-file-send" iconColor="info" toolTipColor="info"
                  ></global-icon-tool-tip>
                  <!-- ENVIA A APROBAR DE 3 - 8     F-21-->
                  <global-icon-tool-tip
                    v-if="roles.includes(Rol.APROBADOR)
                      && item.act_estado === Status.EN_VERIFICACION"
                    @click="sendComponentChangeStatus(Status.APROBADO, item)"
                    tooltip="Verificar por el aprobador" prepend-icon="mdi-file-send" iconColor="success" toolTipColor="success"
                  ></global-icon-tool-tip>
                  <!-- ENVIA A APROBAR POR SUPERVISOR DE 8 - 7    F-21-->
                  <global-icon-tool-tip
                    v-if="roles.includes(Rol.SUPERVISOR)
                      && item.act_estado === Status.APROBADO"
                    @click="sendComponentChangeStatus(Status.APROBADO_SUPERVISOR, item)"
                    tooltip="Aprobado por el supervisor" prepend-icon="mdi-file-send" iconColor="warning" toolTipColor="warning"
                  ></global-icon-tool-tip>
                  <!-- ENVIA A VERIFICADO POR GI DE 7 - 17    F-21-->
                  <global-icon-tool-tip
                    v-if="rolGestionInstitucional.formulador == FlagExists.EXISTE
                      && item.act_estado === Status.APROBADO_SUPERVISOR"
                    @click="sendComponentChangeStatus(Status.VERIFICADO_GI, item)"
                    tooltip="Aprobar Gestión Institucional"
                    prepend-icon="mdi-file-send"
                    iconColor="#a250e3"
                    toolTipColor="#a250e3"
                  ></global-icon-tool-tip>
                  <!-- ENVIA A CONSOLIDAR DE 17 - 2     F-21-->
                  <global-icon-tool-tip
                    v-if="[rolGestionInstitucional.aprobador, rolGestionInstitucional.verificador].includes(FlagExists.EXISTE)
                      && item.act_estado === Status.VERIFICADO_GI"
                    @click="sendComponentChangeStatus(Status.CONSOLIDADO, item)"
                    tooltip="Consolidar Actividad"
                    prepend-icon="mdi-file-send"
                    iconColor="success"
                    toolTipColor="success"
                  ></global-icon-tool-tip>
                  <!-- ENVIA A CONSOLIDAR DE 14 - 2     F-21-->
                  <global-icon-tool-tip
                    v-if="(roles.includes(Rol.FORMULADOR) || roles.includes(Rol.FORMULADOR_GERENTE))
                      && item.act_estado === Status.ANULACION_OBSERVADO"
                    @click="sendComponentChangeStatus(Status.CONSOLIDADO, item)"
                    tooltip="Consolidar" prepend-icon="mdi-check" iconColor="success" toolTipColor="success"
                  ></global-icon-tool-tip>
                  <!-- ANULAR 8 - 9  o  7 - 9 -->
                  <global-icon-tool-tip
                    v-if="(roles.includes(Rol.APROBADOR) && item.act_estado == Status.APROBADO)
                      || (roles.includes(Rol.SUPERVISOR) && item.act_estado == Status.APROBADO_SUPERVISOR) "
                    @click="sendComponentChangeStatus(Status.ANULADO, item)"
                    tooltip="Anular Registro de Actividad"
                    prepend-icon="mdi-close-circle"
                    iconColor="#D81B60"
                    toolTipColor="#D81B60"
                  >
                  </global-icon-tool-tip>
                </div>
              </div>
            </div>
            <!-- REPORTE F - 21 -->
            <global-icon-tool-tip
              v-if="(cacCodigo === ClasificacionActividadType.INCORPORACION || [ClasificacionActividadType.REFORMULACION_INCORPORACION, ClasificacionActividadType.INCORPORACION].includes(item.cac_codigo))
                && PoaObjetivo.pobj_estado == Status.CONSOLIDADO"
              @click="actionDescargarReporteF21(item)" tooltip="Descargar Reporte F21"
              prepend-icon="mdi-file-pdf-box" iconColor="error" toolTipColor="error"
            ></global-icon-tool-tip>
          </v-col>
        </v-row>
      </template>
      <template #[`item.act_estado_descripcion`]="{ item }">
        <v-chip
          v-if="![Status.INACTIVO, Status.RETIRADO].includes(item.act_estado)"
          :color="item.est_color"
          x-small dark>
          {{ item.act_estado == Status.RETIRADO ? 'Registro Retirado':item.act_estado_descripcion }}
        </v-chip>
        <v-chip
          v-else-if="item.act_estado == Status.INACTIVO && item?.act_codigo_anterior && parseInt(item.act_codigo_anterior) > 0"
          :color="item.est_color"
          x-small dark>
          RETIRADO REFORMULADO
        </v-chip>
        <!-- OTROS ESTADOS -->
        <v-chip
          v-else
          :color="item.est_color"
          x-small dark>
          {{ item.act_estado_descripcion }}
        </v-chip>
      </template>
      <!-- DICE SI TIENE OBSERVADOS O NO -->
      <template #[`item.estados_check`]="{ item }">
        <v-chip
          :color="item.estados_check == Status.OBSERVADO ? '#ef9b20' : '#54bebe'"
          x-small dark>
          {{ item.estados_check == Status.OBSERVADO ? 'TIENE OBSERVACIONES': 'SIN OBSERVACIONES' }}
        </v-chip>
      </template>
      <template #[`item.act_cac_descripcion`]="{ item }">
        <v-chip
          v-if="item.act_no_planificado"
          color="#ef9b20"
          x-small dark>
          NO PLANIFICADO
        </v-chip>
        <v-chip
          v-if="!item.act_no_planificado"
          color="primary"
          x-small dark>
          {{ item.act_cac_descripcion }}
        </v-chip>
      </template>
      <template slot="footer.page-text" slot-scope="props">
        {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
      </template>
    </v-data-table>
    <!-- Modal de registro normal -->
    <v-dialog v-model="dialogBoolean" scrollable persistent max-width="80%">
      <v-card>
        <v-toolbar dark color="primary" right>
          <v-toolbar-title>
            <h5 v-if="flagShowData === FlagType.CREATE">
              {{ $t('sispoa.nuevo') }} - {{ componentName }}
            </h5>
            <h5 v-if="flagShowData === FlagType.UPDATE">
              {{ $t('sispoa.modificar') }} - {{ componentName }}
            </h5>
            <h5 v-if="flagShowData === FlagType.DISABLE">
              {{ $t('sispoa.inactivar') }} - {{ componentName }}
            </h5>
            <h5 v-if="flagShowData === FlagType.ENABLE">
              {{ $t('sispoa.activar') }} - {{ componentName }}
            </h5>
            <h5 v-if="flagShowData === FlagType.READ">
              {{ $t('sispoa.ver') }} - {{ componentName }}
            </h5>
          </v-toolbar-title>
          <v-spacer></v-spacer>
          <v-btn icon dark @click="closeModalDialog()">
            <v-icon>close</v-icon>
          </v-btn>
        </v-toolbar>
        <v-card-text style="padding-top: 0 !important;">
          <br>
          <v-alert outlined v-if="[FlagType.DISABLE, FlagType.ENABLE].includes(flagShowData)" type="warning">
            <b>Está seguro de {{ dialogConfirmationTextDisableEnable }} el registro?</b>
          </v-alert>
          <v-alert
            v-if="formActividad.desc_nombre
              && [Status.EDICION, Status.OBSERVADO, Status.OBSERVACION_FINALIZADA, Status.ANULACION_OBSERVADO].includes(formActividad.act_estado)"
            outlined
            type="warning">
            <span>
              <v-row><v-col><b> Observación : </b> {{ formActividad.desc_observacion.observacion }}</v-col></v-row>
              <v-row>
                <v-col><b> Realizado Por : </b> {{ formActividad.desc_nombre }}</v-col>
                <v-col><b> Fecha Observación : </b> {{ formActividad.fech_registro }}</v-col>
              </v-row>
            </span>
          </v-alert>
          <v-alert
            v-if="formActividad.act_justificacion
              && [Status.SOLICITUD_ANULACION, Status.ANULACION_APROBADO, Status.ANULACION_APROBADO_SUPERVISOR, Status.RETIRADO].includes(formActividad.act_estado)"
            outlined
            type="warning">
            <span>
              <v-row><v-col><b> Motivo del Retiro : </b> {{ formActividad.act_justificacion }}</v-col></v-row>
              <v-row>
                <v-col><b> Realizado Por : </b> {{ formActividad.desc_nombre }}</v-col>
                <v-col><b> Fecha de Solicitud : </b> {{ formActividad.fech_registro }}</v-col>
              </v-row>
            </span>
          </v-alert>
          <br>
          <v-form :readonly="formActividadReadOnly" :v-model="true" ref="formDialogActividad" lazy-validation>
            <v-row class="no-gutters-y">
              <v-row v-if="cacCodigo == ClasificacionActividadType.INCORPORACION && !formActividadReadOnly">
                <v-col cols="6" sm="6" md="6" xs="6">
                  <v-autocomplete
                    label="Seleccionar Acción A Corto Plazo"
                    :items="ArrayAccionOperacionCortoPlazo" item-text="pobj_nombre" item-value="pobj_codigo"
                    :value="formActividad.dato"
                    @change="(v) => (changeValueAccionACortoPlazo(v))"
                    outlined
                  ></v-autocomplete>
                </v-col>
                <v-col cols="6" sm="6" md="6" xs="6">
                  <v-autocomplete
                    label="Seleccionar Actividad"
                    :items="ArrayBolsaActividades" item-text="act_num_desc" item-value="act_codigo"
                    :rules="[$rules.obligatoria()]"
                    :value="formActividad.act_codigo_bolsa"
                    @change="(v) => (verificaActividadBolsa(v))"
                    outlined
                  ></v-autocomplete>
                </v-col>
              </v-row>
              <v-row v-if="Object.keys(formActividadBolsa).length !== 0" class="caption pa-4 ma-1 hard-outlined rounded" >
                <v-col cols="12" md="6" sm="6" xs="6">
                  <b>Número Act.:</b> {{ formActividadBolsa.act_numero }} <br>
                </v-col>
                <v-col cols="12" md="6" sm="6" xs="6">
                  <b>Nombre:</b> {{ formActividadBolsa.act_descripcion }} <br>
                </v-col>
                <v-col cols="12" md="6" sm="6" xs="6">
                  <b>Horas Iniciales:</b> {{ formActividadBolsa.horas_iniciales }} <br>
                </v-col>
                <v-col cols="12" md="6" sm="6" xs="6">
                  <b>Ejecutora:</b> {{ formActividadBolsa.aun_sigla }} <br>
                </v-col>
                <v-col cols="12" md="6" sm="6" xs="6">
                  <b>Horas Disponibles por comisión:</b> {{ formActividadBolsa.horas_disponibles_comision }} <br>
                </v-col>
              </v-row>
              <!-- <v-col cols="12" sm="12" md="12" xs="12">
                <v-text-field
                  outlined :value="formActividad.oau_descripcion" @change="(v) => (formActividad.oau_descripcion = v)"
                  :disabled="formActividadDisabled"
                  label="Descripción*">
                </v-text-field>
              </v-col> -->
              <!-- <v-col cols="6" sm="12" md="12" xs="12">
                <v-autocomplete
                  label="Área/Unidad Ejecutora"
                  :items="ArrayAreasUnidades" item-text="aun_concatenado_invert" item-value="aun_codigo"
                  :rules="[$rules.obligatoria()]"
                  :value="formActividad.aun_codigo_ejecutora"
                  @change="(v) => (changeValueAunCodigoEjecutora(v))"
                  outlined
                ></v-autocomplete>
              </v-col> -->
              <v-col cols="12" sm="12" md="12" xs="12">
                <v-row dense align="center" justify="center">
                  <v-radio-group
                    row
                    :disabled="[flagActividadApoyo].includes(true)"
                    :value="formActividad.tipact_codigo"
                    :rules="[$rules.obligatoria()]"
                    @change="(v) => (changeActividadType(v))"
                  >
                    <v-radio label="NUEVO" :value="ActividadType.NUEVO"></v-radio>
                    <v-radio label="CONTINUIDAD" :value="ActividadType.CONTINUIDAD"></v-radio>
                  </v-radio-group>
                </v-row>
              </v-col>
              <v-divider></v-divider>
              <v-col v-if="cacCodigo == ClasificacionActividadType.INCORPORACION || formActividad.act_justificacion != null" class="mt-2" >
                <v-textarea
                  :value="formActividad.act_justificacion"
                  @change="(v) => (formActividad.act_justificacion = v)"
                  :rules="[$rules.obligatoria() , $rules.longitudMaxima(400)]"
                  outlined dense rows="2" no-resize
                  label="Justificación de Actividad Excepcional*">
                </v-textarea>
              </v-col>
              <v-col v-else-if="[ClasificacionActividadType.REGULAR,ClasificacionActividadType.REFORMULACION_INCORPORACION].includes(cacCodigo) && formActividad && flagShowData == Status.OBSERVACION_FINALIZADA && formActividad.act_justificacion" class="mt-2">
                <v-textarea
                  :value="formActividad.act_justificacion"
                  @change="(v) => (formActividad.act_justificacion = v)"
                  :rules="[$rules.obligatoria() , $rules.longitudMaxima(400)]"
                  outlined dense rows="2" no-resize
                  label="Justificación del Retiro de la Actividad*">
                </v-textarea>
              </v-col>
              <actividades-continuidad
                v-if="checkModalSubComponentCondition() && flagActividadType === ActividadType.CONTINUIDAD"
              ></actividades-continuidad>
              <actividades-no-planificadas
                v-if="checkModalSubComponentCondition() && flagActividadType === ActividadType.NO_PLANIFICADO"
              ></actividades-no-planificadas>
            </v-row>
            <v-row justify="center" class="mb-2 pr-0 pl-0">
              <v-expansion-panels v-model="panel" multiple accordion>
                <v-expansion-panel
                  v-if="formActividad.tipact_codigo != ActividadType.NUEVO && flagResumenContinuo">
                  <v-expansion-panel-header><strong>Actividad CONAUD</strong></v-expansion-panel-header>
                  <v-expansion-panel-content>
                    <v-row class="my-0">
                      <v-col v-if="[Status.EDICION, Status.CONSOLIDADO, Status.SOLICITUD_ANULACION].includes(flagShowData)" cols="12" class="text-right">
                        <v-spacer></v-spacer>
                        <global-icon-tool-tip
                          v-if="flagActividadReturn" outlined
                          @click="searchOtherConaud(false)"
                          tooltip="Cambiar Actividad CONAUD"
                          prepend-icon="mdi-magnify" iconColor="primary" toolTipColor="primary"
                        ></global-icon-tool-tip>
                        <global-icon-tool-tip
                          v-if="!flagActividadReturn" outlined
                          @click="searchOtherConaud(true)"
                          tooltip="Cancelar Cambio"
                          prepend-icon="mdi-close" iconColor="#ea5545" toolTipColor="#ea5545"
                        ></global-icon-tool-tip>
                      </v-col>
                      <actividades-continuidad-resumen v-if="flagResumenContinuo && iac_codigo > 0" :iacCodigo="iac_codigo"></actividades-continuidad-resumen>
                    </v-row>
                  </v-expansion-panel-content>
                </v-expansion-panel>
                <v-expansion-panel>
                  <v-expansion-panel-header><strong> Datos de la Actividad </strong></v-expansion-panel-header>
                  <v-expansion-panel-content eager>
                    <v-row>
                      <v-col cols="12" sm="12" md="12" xs="12">
                        <v-autocomplete
                          dense
                          label="Área/Unidad Supervisora"
                          :items="ArrayAreaSupervisoras" item-text="aun_concatenado_invert" item-value="aun_codigo"
                          :rules="[$rules.obligatoria()]"
                          :value="formActividad.aun_codigo_supervisora"
                          @change="(v) => (formActividad.aun_codigo_supervisora = v)"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="12" sm="6" md="6" xs="6" v-if="cacCodigo == ClasificacionActividadType.INCORPORACION">
                        <v-checkbox
                          class="my-auto"
                          :disabled="[flagBloqueoActividadApoyo].includes(true)"
                          v-model="flagActividadApoyo"
                          label="¿El actual registro es referente de apoyo a otra actividad?"
                          @change="(v) => (onChangeActividadApoyoBoolean(v))"
                        ></v-checkbox>
                      </v-col>
                      <v-col cols="12" lg="6" md="6" sm="6" xs="6" v-if="flagActividadApoyo">
                        <v-text-field
                          :rules="[$rules.obligatoria()]"
                          :value="iacCodigoControl"
                          @input="(v) => (iacCodigoControl = v)"
                          solo
                          dense
                          prefix="CODIGO CONAUD:  "
                          append-outer-icon="mdi-magnify-plus"
                          @click:append-outer="searchActividadConaud"
                          :loading="tableConaudLoading"
                        >
                          <template #append-outer>
                            <global-icon-tool-tip
                              @click="searchActividadConaud()" tooltip="Buscar Código"
                              prepend-icon="mdi-magnify" iconColor="error" toolTipColor="error"
                              :disabled="flagHoras || formActividadReadOnly || [Status.EN_VERIFICACION, Status.OBSERVADO, Status.ANULACION_APROBADO_SUPERVISOR].includes(flagShowData)"
                            ></global-icon-tool-tip>
                          </template>
                        </v-text-field>
                      </v-col>
                      <v-col cols="12" lg="12" md="12" sm="12" xs="12" v-if="flagActividadApoyo && iacCodigoApoyo != 0">
                        <v-text-field
                          class="mb-2"
                          :value="iacCodigoControlApoyo"
                          outlined
                          dense
                          label="Código Control Apoyo Seleccionado"
                          readonly
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="12" md="12" xs="12">
                        <v-textarea
                          outlined dense
                          rows="2" no-resize
                          :value="formActividad.act_descripcion"
                          @change="(v) => (formActividad.act_descripcion = v)"
                          :rules="[$rules.obligatoria(), $rules.longitudMaxima(400)]"
                          label="Actividad / Sujeto *">
                        </v-textarea>
                      </v-col>
                      <v-col cols="6" sm="6" md="6" xs="6">
                        <v-autocomplete
                          dense
                          :key="refreshTipoTrabajo"
                          label="Tipo de Trabajo *"
                          :items="ArrayTipoTrabajos" item-text="ttr_sigla_descripcion" item-value="ttr_codigo"
                          :rules="[$rules.obligatoria()]"
                          :value="formActividad.ttr_codigo"
                          @change="(v) => changeValueTipoTrabajo(formActividad.ttr_codigo = v)"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="6" sm="6" md="6" xs="6">
                        <v-autocomplete
                          dense
                          label="Sector *"
                          :items="ArraySectores" item-text="sec_descripcion" item-value="sec_codigo"
                          :rules="[$rules.obligatoria()]"
                          :value="formActividad.sec_codigo"
                          @change="(v) => (formActividad.sec_codigo = v)"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="8" sm="8" md="8" xs="8">
                        <v-autocomplete
                          v-if="flagTipoTrabajo" :disabled="true"
                          dense
                          label="Entidad *"
                          :items="ArrayEntidades" item-text="ent_descripcion" item-value="ent_codigo"
                          :rules="[$rules.obligatoria()]"
                          :value="formActividad.ent_codigo"
                          @change="(v) => (formActividad.ent_codigo = v)"
                          outlined
                        ></v-autocomplete>
                        <v-autocomplete
                          v-if="!flagTipoTrabajo"
                          dense
                          label="Entidad *"
                          :items="ArrayEntidades" item-text="ent_descripcion" item-value="ent_codigo"
                          :rules="[$rules.obligatoria()]"
                          :value="formActividad.ent_codigo"
                          @change="(v) => (formActividad.ent_codigo = v)"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="4" sm="4" md="4" xs="4">
                        <v-autocomplete
                          dense
                          label="Unidad de Medida *"
                          :items="ArrayUnidadesMedidas" item-text="ume_sigla_descripcion" item-value="ume_codigo"
                          :rules="[$rules.obligatoria()]"
                          :value="formActividad.ume_codigo"
                          @change="(v) => (formActividad.ume_codigo = v)"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="4" sm="4" md="4" xs="4">
                        <global-date-input-picker
                          dense
                          :disabled="formActividadReadOnly"
                          :outlined="true" v-model="formActividad.act_fecha_inicio" :rules="[$rules.obligatoria() ]" label="Fecha Inicio *">
                        </global-date-input-picker>
                      </v-col>
                      <v-col cols="4" sm="4" md="4" xs="4">
                        <global-date-input-picker
                          dense
                          :disabled="formActividadReadOnly"
                          :outlined="true" v-model="formActividad.act_fecha_fin" :rules="[$rules.obligatoria() ]" label="Fecha Final *">
                        </global-date-input-picker>
                      </v-col>
                      <v-col cols="4" sm="4" md="4" xs="4">
                        <v-text-field
                          dense
                          outlined rows="2" :value="formActividad.act_cantidad" @change="(v) => (formActividad.act_cantidad = v)"
                          :rules="[
                            $rules.obligatoria(),
                            $rules.soloNumeros()
                          ]"
                          label="Indicador *">
                        </v-text-field>
                      </v-col>
                    </v-row>
                  </v-expansion-panel-content>
                </v-expansion-panel>
                <v-expansion-panel>
                  <v-expansion-panel-header><strong> Información adicional </strong></v-expansion-panel-header>
                  <v-expansion-panel-content eager>
                    <v-row>
                      <v-col cols="12" sm="12" md="12" xs="12">
                        <v-textarea
                          outlined dense
                          rows="2" no-resize
                          :value="formActividad.act_objeto"
                          @change="(v) => (formActividad.act_objeto = v)"
                          :rules="[$rules.obligatoria(), $rules.longitudMaxima(400)]"
                          label="Objeto *">
                        </v-textarea>
                      </v-col>
                      <v-col cols="12" sm="12" md="12" xs="12">
                        <v-textarea
                          outlined dense
                          rows="2" no-resize
                          :value="formActividad.act_objetivo"
                          @change="(v) => (formActividad.act_objetivo = v)"
                          :rules="[$rules.obligatoria(), $rules.longitudMaxima(400)]"
                          label="Objetivo *">
                        </v-textarea>
                      </v-col>
                      <v-col cols="12" sm="12" md="12" xs="12">
                        <v-text-field
                          dense
                          outlined :value="formActividad.act_alcance" @change="(v) => (formActividad.act_alcance = v)" :rules="[$rules.obligatoria(), $rules.longitudMaxima(400)]"
                          label="Alcance *">
                        </v-text-field>
                      </v-col>
                    </v-row>
                  </v-expansion-panel-content>
                </v-expansion-panel>
                <v-expansion-panel>
                  <v-expansion-panel-header><strong> Horas Hombre Planificadas </strong></v-expansion-panel-header>
                  <v-expansion-panel-content eager>
                    <v-row>
                      <v-col cols="12" xs="12" sm="12" md="4">
                        <v-text-field
                          v-if="!flagHoras"
                          dense
                          outlined rows="2"
                          :value="formActividad.act_horas_planificadas"
                          @change="(v) => (formActividad.act_horas_planificadas = v)"
                          :rules="[$rules.obligatoria(), $rules.soloNumeros()]"
                          label="Hora Planificada *">
                        </v-text-field>
                        <v-text-field
                          v-if="flagHoras"
                          :disabled="false"
                          :readonly="formActividadReadOnly && !flagHoras"
                          dense
                          outlined rows="2"
                          :value="formActividad.act_horas_planificadas"
                          @change="(v) => (formActividad.act_horas_planificadas = v)"
                          :rules="[
                            $rules.obligatoria(), $rules.soloNumeros(),
                            (/^[0-9]*$/.test(formActividad.act_horas_planificadas) && parseInt(formActividad.act_horas_planificadas) >= totalHorasEjecucion ) || `El valor minimo debe ser ${totalHorasEjecucion}`,
                          ]"
                          label="Hora Planificadas *">
                        </v-text-field>
                      </v-col>
                      <v-col cols="12" xs="12" sm="12" md="8" v-if="flagHoras && formActividad?.ett_codigo != EspecificacionTipoTrabajoType.ADMINISTRACION">
                        <v-simple-table dense>
                          <template #default>
                            <thead>
                              <tr>
                                <th class="text-left">
                                  CONAUD
                                </th>
                                <th class="text-left">
                                  Estado
                                </th>
                                <th class="text-left">
                                  Hrs. Ejecución ({{ totalHorasEjecucion }})
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr
                                v-for="ejecucion in ArrayOfEjecuciones"
                                :key="ejecucion.id"
                              >
                                <td>{{ ejecucion.codigo_conaud }}</td>
                                <td>{{ ejecucion.estado }}</td>
                                <td>{{ ejecucion.total_horas_ejecucion }}</td>
                              </tr>
                            </tbody>
                          </template>
                        </v-simple-table>
                      </v-col>
                    </v-row>
                  </v-expansion-panel-content>
                </v-expansion-panel>
                <v-expansion-panel>
                  <v-expansion-panel-header><strong> Clasificadores de Actividad </strong></v-expansion-panel-header>
                  <v-expansion-panel-content>
                    <v-row class="no-gutters-y">
                      <v-col cols="12" lg="6" md="6" sm="12" xs="12">
                        <v-autocomplete
                          auto-select-first
                          dense
                          label="Clasificación Auditoria *"
                          :items="ArrayClasificacionAuditoriaActividad" item-text="caa_nombre" item-value="caa_codigo"
                          :rules="[$rules.obligatoriaIncluyendoCero()]"
                          :value="formActividad.caa_codigo"
                          @change="(v) => (formActividad.caa_codigo = v)"
                          :clearable="formActividadReadOnly ? false : true"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="12" lg="6" md="6" sm="12" xs="12">
                        <v-autocomplete
                          dense
                          label="Clasificación Función *"
                          :items="ArrayClasificacionFuncionActividad" item-text="cfa_nombre" item-value="cfa_codigo"
                          :rules="[$rules.obligatoriaIncluyendoCero()]"
                          :value="formActividad.cfa_codigo"
                          @change="(v) => (formActividad.cfa_codigo = v)"
                          :clearable="formActividadReadOnly ? false : true"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="12" lg="6" md="6" sm="12" xs="12">
                        <v-autocomplete
                          dense
                          label="Clasificación Agrupación *"
                          :items="ArrayClasificacionGrupoActividad" item-text="cga_nombre" item-value="cga_codigo"
                          :rules="[$rules.obligatoriaIncluyendoCero()]"
                          :value="formActividad.cga_codigo"
                          @change="(v) => (formActividad.cga_codigo = v)"
                          :clearable="formActividadReadOnly ? false : true"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                      <v-col cols="12" lg="6" md="6" sm="12" xs="12">
                        <v-autocomplete
                          dense
                          label="Clasificación Control *"
                          :items="ArrayClasificacionControlActividad" item-text="cca_nombre" item-value="cca_codigo"
                          :rules="[$rules.obligatoriaIncluyendoCero()]"
                          :value="formActividad.cca_codigo"
                          @change="(v) => (formActividad.cca_codigo = v)"
                          :clearable="formActividadReadOnly ? false : true"
                          outlined
                        ></v-autocomplete>
                      </v-col>
                    </v-row>
                  </v-expansion-panel-content>
                </v-expansion-panel>
              </v-expansion-panels>
            </v-row>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn v-if="flagShowData === FlagType.CREATE" :loading="dialogLoading" color="primary" @click="agregar()">
            {{ $t('sispoa.botones.agregar') }}
          </v-btn>
          <v-btn v-if="flagShowData === FlagType.UPDATE" :loading="dialogLoading" color="primary" @click="modificar()">
            {{ $t('sispoa.botones.modificar') }}
          </v-btn>
          <v-btn v-if="flagShowData === FlagType.DISABLE" :loading="dialogLoading" color="primary" @click="inactivar()">
            {{ $t('sispoa.botones.inactivar') }}
          </v-btn>
          <v-btn v-if="flagShowData === FlagType.ENABLE" :loading="dialogLoading" color="primary" @click="activar()">
            {{ $t('sispoa.botones.activar') }}
          </v-btn>
          <v-btn color="error" @click="closeModalDialog()">{{ $t('sispoa.botones.cancelar') }}</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!-- <change-status ref="changeStatusComponentOau"></change-status> -->
    <change-status ref="changeStatusComponentPobj"></change-status>
    <!-- MOdal de Registro de Estados -->
    <v-dialog
      v-model="dialogBooleanHistorial" scrollable persistent
      fullscreen
      :scrim="false"
      transition="dialog-bottom-transition"
    >
      <v-card>
        <v-alert :value="true" color="primary">
          <v-card-title >
            <h5 style="color:#fff">Cambios realizados en la Actividad</h5>
            <v-spacer></v-spacer>
            <v-btn icon dark @click="cancelaDialogHistorial()">
              <v-icon>close</v-icon>
            </v-btn>
          </v-card-title>
        </v-alert>
        <v-card-text style="padding-top: 0 !important;">
          <br>
          <estados-tabla
            :nombreTabla="componentName"
            :tabCodigo="formActividad.act_codigo">
          </estados-tabla>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="error" @click="cancelaDialogHistorial()">VOLVER A LAS ACTIVIDADES</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>
<script>
  // import ChangeStatus from './ChangeStatus.vue'
  const ActividadType = Object.freeze({
    NUEVO: 1,
    CONTINUIDAD: 2,
  })
  const ClasificacionActividadType = Object.freeze({
    REGULAR: 1,
    INCORPORACION: 2,
    REFORMULACION_INCORPORACION: 3,
  })
  const FlagType = Object.freeze({
    CREATE: 1,
    UPDATE: 2,
    DISABLE: 3,
    ENABLE: 4,
    READ: 5,
  })
  const Status = Object.freeze({
    INACTIVO: 0,
    EDICION: 1,
    CONSOLIDADO: 2,
    EN_VERIFICACION: 3,
    OBSERVADO: 4,
    HISTORICO: 5,
    EN_VERIFICACION_SUPERVISOR: 6,
    APROBADO_SUPERVISOR: 7,
    APROBADO: 8,
    ANULADO: 9,
    OBSERVACION_FINALIZADA: 10,
    SOLICITUD_ANULACION: 11,
    ANULACION_APROBADO: 12,
    ANULACION_APROBADO_SUPERVISOR: 13,
    ANULACION_OBSERVADO: 14,
    SINCRONIZACION: 15,
    VERIFICADO: 16,
    VERIFICADO_GI: 17,
    APROBADO_DESPACHO: 18,
    BLOQUEADO: 21,
    EJECUCION: 22,
    RETIRO_APROBADO_GI: 45,
    CONSOLIDADO_GERENTE: 48,
    RETIRADO: 46
  })
  const EspecificacionTipoTrabajoType = Object.freeze({
    NO_DEFINIDO: 0,
    AUDITORIA: 1,
    APOYO: 2,
    SEGUIMIENTO: 3,
    ADMINISTRACION: 4,
    EVALUACION: 5
  })
  const ProgramaType = Object.freeze({
    PRO_500: 1,
    PRO_510: 2,
    PRO_520: 3,
    PRO_530: 4,
    PRO_540: 5,
    PRO_550: 6,
    PRO_560: 7,
    PRO_570: 8,
    PRO_98: 9,
    PRO_00: 10,
  })
  const ClasificacionFuncionType = Object.freeze({
    NO_APLICA: 0,
    ADMINISTRATIVO: 1,
    SUSTANTIVO: 2,
    LEGAL: 3,
    CAPACITACION: 4,
  })
  const TipoIndicadorType = Object.freeze({
    NUMERICO: 1,
    PORCENTUAL: 2,
  })
  const NivelAreaUnidadType = Object.freeze({
    DIRECTIVO: 1,
    EJECUTIVO: 2,
    OPERATIVO: 3,
  })
  const Rol = Object.freeze({
    FORMULADOR: 1,
    APROBADOR: 2,
    SUPERVISOR: 3,
    FORMULADOR_GERENTE: 4,
    COMISION: 5,
    RESPONSABLE: 6,
    OFICIAL_ADMINISTRATIVO: 7,
    GERENTE_CONSOLIDADOR: 8
  })
  const FlagExists = Object.freeze({
    NO_EXISTE: 0,
    EXISTE: 1,
  })
  const TipoApoyo = Object.freeze({
    ALACE: 8,
    APOYO: 10,
  })

  import ActividadesContinuidad from '@/components/sispoa/estructura_formulario/ActividadesContinuidad.vue'
  import ActividadesContinuidadResumen from '@/components/sispoa/estructura_formulario/ActividadesContinuidadResumen.vue'
  import ActividadesNoPlanificadas from '@/components/sispoa/estructura_formulario/ActividadesNoPlanificadas.vue'
  import EstadosTabla from '@/components/sispoa/generic/EstadosTabla.vue'
  import ChangeStatus from '../estructura_poa/ChangeStatus.vue'
  import ActividadesViaticos from '@/components/sispoa/estructura_formulario/ActividadesViaticos.vue'
	export default {
    components: {
      ActividadesViaticos,
      ActividadesContinuidad,
      ActividadesContinuidadResumen,
      ActividadesNoPlanificadas,
      EstadosTabla,
      ChangeStatus,
		},
		props: {
			pobjCodigo: {
				type: Number,
				default: 0,
			},
      aunCodigoEjecutora: {
				type: Number,
				default: 0,
			},
      cacCodigo: {
				type: Number,
				default: 1,
			},


      poaGlobalStatus: {
        type: Number,
				default: 0
      },
    },
    watch: {
      pobjCodigo: async function(newPobjCodigo, oldPobjCodigo) {
        await this.getAllParametricas()
        await this.getPoaObjetivo()
        await this.getAreaUnidadEjecutora()
        await this.getAllActividades()
        await this.getEstadoGlobalAndRoles()
        await this.getAllRoleGestionInstitucional()
      },
      // cacCodigo: function(newCacCodigo, oldCacCodigo) {
      // },
      // poaGlobalStatus: function(newPoaGlobalStatus, oldPoaGlobalStatus) {
			// 	this.getAllActividades()
      //   this.getAllParametricas()
			// 	this.$forceUpdate()
      // },
    },
    async mounted() {
    /**
     * * Actualización de Tipo de Actividad
     */
    this.$nuxt.$on('UpdateTypeActividad', async (formActividadContinuidad) => {
      if (formActividadContinuidad.flagResumenContinuo) {
        this.iac_codigo = formActividadContinuidad.iac_codigo
        this.flagActividadReturn = true
        this.formActividad.iac_codigo_continuo = this.iac_codigo
        this.flagResumenContinuo = formActividadContinuidad.flagResumenContinuo
        this.formActividad.actividad_object = structuredClone(formActividadContinuidad)
      } else {
        this.flagActividadType = ActividadType.NUEVO
        this.formActividad.tipact_codigo = ActividadType.NUEVO
      }
      // -----------------------------------
    })
    /**
     * * Actualización de Actividad cuando se hace el cambio de estado
     */
    this.$nuxt.$on('actualizadorActividad', (value) => {
      this.getAllActividades()
    })
    },
		async created () {
      await this.getPoaObjetivo()
      await this.getAreaUnidadEjecutora()
      await this.getAllActividades()
      await this.getEstadoGlobalAndRoles()
      await this.getAllRoleGestionInstitucional()
      await this.getAllParametricas()
		},
		data () {
			return {
        componentName: 'Actividades',
				componentServicePath: 'actividades',
				flagShowData: 0,
        flagActividadType: 0,
        // ----------- ACTIVIDAD CONTINUO-----------
        flagActividadReturn: false,
        flagResumenContinuo: false,
        iacCodigoContinuo: 0,
        // ----------- ACTIVIDAD APOYO-----------
        flagBloqueoActividadApoyo: false,
        flagActividadApoyo: false,
        iacCodigoApoyo: 0,
        iacCodigoControlApoyo: '',
        // ----------- BUSQUEDA-----------
        iacCodigoControl: '',
        tableConaudLoading: false,
        // ----------- HORAS HOMBRE PLANIFICADAS
        flagHoras: false,
        // ----------- ACTIVIDAD
        AllActividades: [],
        dialogBoolean: false,
				dialogLoading: false,
				dialogConfirmationTextDisableEnable: '',
        dialogBooleanHistorial: false,
        dialogLoadingHistorial: false,
        formActividadReadOnly: false,
				formActividadDisabled: false,
        formActividadUpdate: false,
        formActividad: {},
        formActividadBolsa: {},
        tableSearch: '',
				tableShow: true,
        tableLoading: false,
				tableHeadersMain: [
          { text: 'Acciones', sortable: false, value: 'acciones' },
          // { text: 'Sigla Supervisora', sortable: true, value: 'aun_sigla_supervisora' },
          { text: 'Estado', sortable: true, value: 'act_estado_descripcion' },
          { text: 'Código', sortable: true, value: 'act_numero' },
          { text: 'Actividad', sortable: true, value: 'act_descripcion' },
          { text: 'Cant. HorasPlanificadas',  align: 'center', sortable: true, value: 'act_horas_planificadas' },
          { text: 'Total Hrs. para Ejecución',  align: 'center', sortable: true, value: 'total_horas_presupuestadas' },
          { text: 'Saldo Horas',  align: 'center', sortable: true, value: 'horas_saldo' },
          { text: 'Tipo trabajo', sortable: true,  align: 'center', value: 'ttr_sigla' },
          // { text: 'Sector', sortable: true,  align: 'center', value: 'sec_descripcion' },ume_sigla_act_indicador
          { text: 'Indicador - Und. Medida', sortable: true,  align: 'center', value: 'ume_sigla_act_indicador' },
          { text: 'Tipo Actividad', sortable: true, value: 'act_tipact_descripcion' },
          { text: 'Clasificación Actividad', sortable: true, value: 'act_cac_descripcion' },
          { text: 'Cant. Viaticos',  align: 'center', sortable: true, value: 'cant_viaticos' },
          // { text: 'Viaticos Observados', sortable: true, value: 'estados_check' },
					{ text: 'Fecha Registro', sortable: true, value: 'fecha_registro' },
				],
        AreaUnidadEjecutora: {},
        PoaObjetivo: {},
        // ----------- TIPO TRABAJO ----------
        flagTipoTrabajo: false,
        refreshTipoTrabajo: 10,
        // ----------- INDICADOR -------------
        cantidadIndicadorEjecutora: 0,
        nombreAreaUnidadSupervisora: '',
        codigoAccionEstrategica: '',
        // ----------- MOSTRAR EJECUCION CONAUD
        ArrayOfEjecuciones: [],
        totalHorasEjecucion: 0,
        // ----------- VIATICOS --------------
        tableExpandedItemArray: [],
        // ------------ ROLES Y ESTADO GLOBAL--
        dataGlobalStatusAndRoles: {},
        roles: [],
        // ----------- ROLE VARIABLES
        rolGestionInstitucional: {
          formulador: 0,
          aprobador: 0,
          verificador: 0,
        },
        // ----------- DESBLOQUEO--------------
        flagSistemaDesBloqueado: true,
        // ----------- PARAMETRICAS -----------
        ArrayUnidadesMedidas: [],
        ArrayEntidades: [],
        ArraySectores: [],
        ArrayAreaSupervisoras: [],
        ArrayTipoTrabajos: [],
        ArrayAccionOperacionCortoPlazo: [],
        ArrayBolsaActividades: [],
        ArrayActividades: [],
        // ----------- Clasificadores de Actividad -----------
        ArrayClasificacionAuditoriaActividad: [],
        ArrayClasificacionFuncionActividad: [],
        ArrayClasificacionGrupoActividad: [],
        ArrayClasificacionControlActividad: [],

				ArrayPoasObjetivos: [],
				ArrayAreasUnidades: [],
        ArrayAreasUnidadesSupervisoras: [],
        PoaObjetivoStatus: 0,
				poaCodigo: 0,
        gesCodigo: 0,
        // ----------- CONSTANTES -----------
				FlagType: FlagType,
        Status: Status,
        ActividadType: ActividadType,
        ClasificacionActividadType: ClasificacionActividadType,
        EspecificacionTipoTrabajoType: EspecificacionTipoTrabajoType,
        ProgramaType: ProgramaType,
        ClasificacionFuncionType: ClasificacionFuncionType,
        TipoIndicadorType: TipoIndicadorType,
        NivelAreaUnidadType: NivelAreaUnidadType,
        Rol: Rol,
        FlagExists: FlagExists,
        TipoApoyo: TipoApoyo,
        // ----------- PANEL -------------
        panel: [],
			}
		},
		methods: {
      /**
       * * Get Iniciales
       */
      async getAllActividades () {
        this.tableLoading = true
        let cacCodigo = `cac_codigo=(${this.cacCodigo})`
        if (this.cacCodigo == ClasificacionActividadType.REGULAR) {
          cacCodigo = `cac_codigo=(${this.cacCodigo}, ${ClasificacionActividadType.REFORMULACION_INCORPORACION})`
        }
				await this.$service.get(
          'SISPOA',
          `${this.componentServicePath}/cantidad_viaticos?pobj_codigo=(${this.pobjCodigo})&${cacCodigo}&aun_codigo_ejecutora=(${this.aunCodigoEjecutora})`
        ).then(async response => {
					if (response) {
            this.AllActividades = response
            await this.verificaSistemaBloqueado()
          }
				}).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
					this.AllActividades = []
				}).finally(() => {
          this.tableLoading = false
        })
			},
      async getAreaUnidadEjecutora () {
        await this.$service.get(
          'SISPOA',
          `areas-unidades?aun_codigo=(${this.aunCodigoEjecutora})`
        ).then(response => {
          if (response) {
            this.AreaUnidadEjecutora = response[0]
          }
        }).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
          this.AreaUnidadEjecutora = {}
        })
      },
      async getPoaObjetivo () {
				await this.$service.get(
          'SISPOA',
          `poas-objetivos?pobj_codigo=(${this.pobjCodigo})`
        ).then(async response => {
					if (response) {
            this.PoaObjetivo = response[0]
            this.poaCodigo = this.PoaObjetivo.poa_codigo
            this.gesCodigo = this.PoaObjetivo.ges_codigo
            await this.getAllAreasUnidades()
            this.codFormularioSupervisor = this.PoaObjetivo.aun_codigo_supervisora
            this.formActividad = { aun_codigo_supervisora: this.codFormularioSupervisor }
            if (this.PoaObjetivo.objetivos_area_unidad.length > 1) {
              let record = this.PoaObjetivo.objetivos_area_unidad.find(item => item.aun_codigo_ejecutora == this.aunCodigoEjecutora)
              if (record) {
                this.cantidadIndicadorEjecutora = record.oau_indicador
                this.codigoAccionEstrategica = record.poa_pobj_oau_codigo
              }
            } else {
              this.cantidadIndicadorEjecutora = 0
              this.codigoAccionEstrategica = this.PoaObjetivo.objetivos_area_unidad[0]?.poa_pobj_oau_codigo
            }
            if (this.ArrayAreasUnidades.length > 0) {
              let recordSupervisora = this.ArrayAreasUnidades.find(item => item.aun_codigo == this.PoaObjetivo.aun_codigo_supervisora)
              if (recordSupervisora) {
                this.nombreAreaUnidadSupervisora = recordSupervisora.aun_concatenado_invert
              }
            }
					}
				}).catch(error => {
          this.$toast.clear()
					this.$toast.info(error.error_mensaje)
					this.PoaObjetivo = []
				})
			},
      async getEstadoGlobalAndRoles () {
				await this.$service.get(
          'SISPOA',
          `poas-objetivos/estado-global-refactor?poa_codigo=(${this.poaCodigo})&cac_codigo=(${this.cacCodigo})&pobj_codigo=(${this.pobjCodigo})&aun_codigo_ejecutora=(${this.aunCodigoEjecutora})`
        ).then(response => {
          if (response) {
            this.dataGlobalStatusAndRoles = response
            this.roles = response.roles
            this.dataGlobalStatusAndRoles.flagSistemaDesBloqueado = this.flagSistemaDesBloqueado
					}
				}).catch(error => {
          this.$toast.clear()
					this.$toast.info(error.error_mensaje)
					this.dataGlobalStatusAndRoles = {}
				})
			},
      async getAllRoleGestionInstitucional() {
        await this.$service.get(
          'SISPOA',
          `_autenticacion/roles-sesion`
        ).then(response => {
          if (response) {
            this.rolGestionInstitucional.formulador = response[0].es_ges_ins_formulador
            this.rolGestionInstitucional.aprobador = response[0].es_ges_ins_aprobador
            this.rolGestionInstitucional.verificador = response[0].es_ges_ins_verificador
          }
        }).catch(error => {
          // this.$toast.info(error.error_mensaje)
          this.rolGestionInstitucional = {
            formulador: 0,
            aprobador: 0,
            verificador: 0,
          }
        })
      },
      /**
       * * Get Parametricas
       */
      async getAllParametricas () {
        // ----------- Parametricas -----------
        await this.getAllAreasUnidadesSupervisoras()
        this.getAllTiposTrabajos()
        if (this.ArraySectores.length === 0) {this.getAllSectores()}
        if (this.ArrayEntidades.length === 0) {this.getAllEntidades()}
        if (this.ArrayUnidadesMedidas.length === 0) {this.getAllUnidadesMedidas()}
        if (this.ArrayClasificacionAuditoriaActividad.length === 0) {this.getAllClasificacionAuditoriaActividad()}
        if (this.ArrayClasificacionFuncionActividad.length === 0) {this.getAllClasificacionFuncionActividad()}
        if (this.ArrayClasificacionGrupoActividad.length === 0) {this.getAllClasificacionGrupoActividad()}
        if (this.ArrayClasificacionControlActividad.length === 0) {this.getAllClasificacionControlActividad()}
        this.getAccionACortoPlazo()
      },
      getAllAreasUnidadesSupervisoras () {
        this.$service.get(
          'SISPOA',
          `areas-unidades/supervision-compartida?aun_codigo=(${this.aunCodigoEjecutora})`
        ).then(response => {
          if (response) {
            this.ArrayAreaSupervisoras = response
          }
        }).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
          this.ArrayAreaSupervisoras = []
        })
      },
      getAllTiposTrabajos(ett_codigo = 0) {
        this.$service.get(
          'SISPOA',
          `tipos-trabajos/clasificacion-area-unidad?ttr_estado=(${Status.EDICION})&cau_codigo=(${this.AreaUnidadEjecutora.cau_codigo})${(ett_codigo ? `&ett_codigo=(${ett_codigo})` : '')}`
        ).then(response => {
          if (response) {
              this.ArrayTipoTrabajos = response
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
          this.ArrayTipoTrabajos = []
        })
      },
      getAllSectores () {
        this.$service.get(
          'SISPOA',
          `sector?sec_estado=(${Status.EDICION})`
        ).then(response => {
          if (response) {
            this.ArraySectores = response
          }
        }).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
          this.ArraySectores = []
        })
      },
      getAllEntidades () {
        this.$service.get(
          'SISPOA',
          `_entidades?ent_estado=(${Status.EDICION})`
        ).then(response => {
          if (response) {
            this.ArrayEntidades = response
          }
        }).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
          this.ArrayEntidades = []
        })
      },
      getAllUnidadesMedidas () {
        this.$service.get(
          'SISPOA',
          `unidades-medidas?ume_estado=(${Status.EDICION})`
        ).then(response => {
          if (response) {
            this.ArrayUnidadesMedidas = response
          }
        }).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
          this.ArrayUnidadesMedidas = []
        })
      },
      getAllClasificacionAuditoriaActividad() {
        this.$service.get('SISPOA', `clasificacion-auditoria-actividad?caa_estado=(${Status.EDICION})`).then(response => {
          if (response) {
            this.ArrayClasificacionAuditoriaActividad = response
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
          this.ArrayClasificacionAuditoriaActividad = []
        })
      },
      getAllClasificacionFuncionActividad() {
        this.$service.get('SISPOA', `clasificacion-funcion-actividad?cfa_estado=(${Status.EDICION})`).then(response => {
          if (response) {
            this.ArrayClasificacionFuncionActividad = response
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
          this.ArrayClasificacionFuncionActividad = []
        })
      },
      getAllClasificacionGrupoActividad() {
        this.$service.get('SISPOA', `clasificacion-grupo-actividad?cga_estado=(${Status.EDICION})`).then(response => {
          if (response) {
            this.ArrayClasificacionGrupoActividad = response
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
          this.ArrayClasificacionGrupoActividad = []
        })
      },
      getAllClasificacionControlActividad() {
        this.$service.get('SISPOA', `clasificacion-control-actividad?cca_estado=(${Status.EDICION})`).then(response => {
          if (response) {
            this.ArrayClasificacionControlActividad = response
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
          this.ArrayClasificacionControlActividad = []
        })
      },
      async getAccionACortoPlazo() {
        await this.$service.get(
          'SISPOA',
          `poas-objetivos/formularios-objetivos?aun_codigo=(${this.aunCodigoEjecutora})&poa_codigo=(${this.poaCodigo})&cac_codigo=(${ClasificacionActividadType.REGULAR},${ClasificacionActividadType.REFORMULACION_INCORPORACION})`
        ).then(response => {
          if (response) {
            this.ArrayAccionOperacionCortoPlazo = response
          }
        }).catch(error => {
          this.ArrayAccionOperacionCortoPlazo = []
        }).finally(() => {
          this.tableLoading = false
        })
      },
      async getAllAreasUnidades () {
        await this.$service.get(
          'SISPOA',
          `gestiones-organigramas/areas-unidades?ges_codigo=(${this.gesCodigo})&gor_estado=(${Status.APROBADO},${Status.CONSOLIDADO})`
        ).then(response => {
          if (response) {
            this.ArrayAreasUnidades = response[0].lista_areas_unidades
          }
        }).catch(error => {
          this.$toast.clear()
          this.$toast.info(error.error_mensaje)
        })
			},
      /**
       * * Dialog functions
       */
      async openModalDialog (bandera, item) {
      console.log("🐱==pp1==> ~ item:", item)
				this.flagShowData = bandera
        this.dialogBoolean = true
        // -------MODIFICAR, ELIMINAR, ACTIVAR Y VER -----
				if (item) {
          if ([8,10].includes(item.ttr_codigo)) {
            console.log('entro a editarrrrrrrrrrrrrrr')
            this.getAllTiposTrabajos(EspecificacionTipoTrabajoType.APOYO)
          }
          this.formActividad = structuredClone(item)
          await this.setDefaultValuePrograma([FlagType.DISABLE,FlagType.ENABLE].includes(bandera)? FlagType.READ : FlagType.UPDATE)
          this.verificaActividadBolsa(this.formActividad.act_codigo_bolsa)
          this.changeActividadType(this.formActividad.tipact_codigo)
					if ([FlagType.ENABLE, FlagType.DISABLE, FlagType.READ].includes(this.flagShowData)) {
						this.formActividadReadOnly = true
            this.formActividadDisabled = true
						this.dialogConfirmationTextDisableEnable = (this.flagShowData === FlagType.DISABLE) ? 'inactivar' : 'activar'
					}
          if (item.ent_codigo == 54){ this.flagTipoTrabajo = true }
				} else {
          // ---------- NUEVA ACTIVIDAD -----------
          this.newActividad()
        }
			},
      async newActividad () {
        // Inicio
        this.formActividad.tipact_codigo = ActividadType.NUEVO
        await this.setDefaultValuePrograma(FlagType.CREATE)
        const { tin_codigo, pobj_indicador, aun_codigo_supervisora } = this.PoaObjetivo
        const { cantidad_actividades } = this.dataGlobalStatusAndRoles
        const area = this.ArrayAreaSupervisoras.find(f => f.aun_codigo == aun_codigo_supervisora && f.nau_codigo == NivelAreaUnidadType.DIRECTIVO)
        // Lógica para configurar `formActividad`
        this.formActividad.cac_codigo = this.cacCodigo || ClasificacionActividadType.REGULAR
        this.formActividad.aun_codigo_supervisora = area ? this.ArrayAreaSupervisoras[0].aun_codigo : aun_codigo_supervisora
        // Condición para actividades no planificadas
        this.formActividad.act_no_planificado = (this.cacCodigo == ClasificacionActividadType.INCORPORACION)
          ? tin_codigo == TipoIndicadorType.NUMERICO && pobj_indicador <= cantidad_actividades
          : false
        // Si `tin_codigo` es NUMERICO y `pobj_indicador` es mayor que `cantidad_actividades`, actualizar `cac_codigo`
        if (tin_codigo == TipoIndicadorType.NUMERICO && pobj_indicador > cantidad_actividades) {
          this.formActividad.cac_codigo = this.cacCodigo || ClasificacionActividadType.REGULAR
          this.formActividad.act_no_planificado = false
        }
        this.changeActividadType(ActividadType.NUEVO)
      },
      async setDefaultValuePrograma(flagFormType) {
        if (
          this.PoaObjetivo?.pro_codigo
          && this.PoaObjetivo.pro_codigo
          && [FlagType.CREATE, FlagType.UPDATE].includes(flagFormType)
        ) {
          switch (this.PoaObjetivo.pro_codigo) {
            case ProgramaType.PRO_500:
            case ProgramaType.PRO_510:
            case ProgramaType.PRO_520:
              this.ArrayClasificacionFuncionActividad = this.ArrayClasificacionFuncionActividad.filter(
                (item) => [ClasificacionFuncionType.SUSTANTIVO].includes(item.cfa_codigo)
              )
              if (flagFormType == FlagType.CREATE) {
                this.formActividad.cfa_codigo = ClasificacionFuncionType.SUSTANTIVO
              }
              break
            case ProgramaType.PRO_530:
              this.ArrayClasificacionFuncionActividad = this.ArrayClasificacionFuncionActividad.filter(
                (item) => [ClasificacionFuncionType.CAPACITACION].includes(item.cfa_codigo)
              )
              if (flagFormType == FlagType.CREATE) {
                this.formActividad.cfa_codigo = ClasificacionFuncionType.CAPACITACION
              }
              break
            case ProgramaType.PRO_540:
            case ProgramaType.PRO_550:
              this.ArrayClasificacionFuncionActividad = this.ArrayClasificacionFuncionActividad.filter(
                (item) => [ClasificacionFuncionType.LEGAL].includes(item.cfa_codigo)
              )
              if (flagFormType == FlagType.CREATE) {
                this.formActividad.cfa_codigo = ClasificacionFuncionType.LEGAL
              }
              break
            case ProgramaType.PRO_560:
            case ProgramaType.PRO_570:
              this.ArrayClasificacionFuncionActividad = this.ArrayClasificacionFuncionActividad.filter(
                (item) => [ClasificacionFuncionType.ADMINISTRATIVO].includes(item.cfa_codigo)
              )
              if (flagFormType == FlagType.CREATE) {
                this.formActividad.cfa_codigo = ClasificacionFuncionType.ADMINISTRATIVO
              }
              break
            case ProgramaType.PRO_98:
              break
            case ProgramaType.PRO_00:
              this.ArrayClasificacionFuncionActividad = this.ArrayClasificacionFuncionActividad.filter(
                (item) => [ClasificacionFuncionType.ADMINISTRATIVO, ClasificacionFuncionType.LEGAL].includes(item.cfa_codigo)
              )
              break
            default:
              break
          }
        }
      },
      async getActividades() {
        await this.$service.get(
          'SISPOA',
          `actividades?pobj_codigo=(${this.pobjCodigo})&cac_codigo=(${ClasificacionActividadType.REGULAR}, ${ClasificacionActividadType.REFORMULACION_INCORPORACION})`
        ).then(response => {
          if (response) {
            this.ArrayActividades = response
          }
        }).catch(error => {
          this.ArrayActividades = []
        })
      },
			closeModalDialog (booleanRefreshEmitParent = false) {
        this.dialogBoolean = false
        // ----------- RESET INITIAL DATA -----------
				this.dialogLoading = false
				this.formActividadReadOnly = false
        this.formActividadDisabled = false
				this.formActividad = {}
				this.dialogConfirmationTextDisableEnable = ''
				this.$refs.formDialogActividad.reset()
        this.flagShowData = FlagType.CREATE
        this.formActividad.pobj_codigo = this.pobjCodigo
        this.ArrayAreasUnidadesSupervisoras = []
        this.panel = []
        // ---------- EDITA SOLO HORAS ----
        this.flagHoras = false
        this.totalHorasEjecucion = 0
        // ---------- APOYO ------
        this.iacCodigoApoyo = 0
        this.iacCodigoControlApoyo = ''
        this.iacCodigoControl = ''
        this.flagBloqueoActividadApoyo = false
        this.flagActividadApoyo = false
        // --------- CONTINUO -----
        this.flagResumenContinuo = false
        // --------- ENTIDAD ------
        this.flagTipoTrabajo = false
        this.formActividadBolsa = {}
        this.iac_codigo = 0
        // this.iacCodigo = 0
        if (booleanRefreshEmitParent === true) {
          this.getAllActividades()
          this.getEstadoGlobalAndRoles()
          this.$nuxt.$emit('ActualizarFormularioActual', true)
        }
			},
			agregar () {
				if (this.$refs.formDialogActividad.validate()) {
          console.log('%%%%%%%% this.flagBloqueoActividadApoyo',this.flagBloqueoActividadApoyo)
          console.log('%%%%%%%% this.flagActividadApoyo',this.flagActividadApoyo)
          console.log('%%%%%%%% this.iacCodigoApoyo',this.iacCodigoApoyo)
          console.log('%%%%%%%% this.iacCodigoControlApoyo',this.iacCodigoControlApoyo)
          console.log('%%%%%%%%%%% this.formActividad %%%%%%%%%%%%%',this.formActividad)
          if (this.flagActividadApoyo && this.iacCodigoApoyo == 0 && this.iacCodigoControlApoyo == '') {
            console.log('entrooooooooooooooooo')
            this.$toast.error('Debe buscar un Código CONAUD ')
            return
          }
          this.formActividad.fob_codigo = 1
          this.formActividad.pobj_codigo = this.pobjCodigo
          this.formActividad.tin_codigo = this.PoaObjetivo.tin_codigo
          this.formActividad.aun_codigo_ejecutora = this.aunCodigoEjecutora
					this.dialogLoading = true
					this.$service.post(
            'SISPOA',
            `${this.componentServicePath}`,
            this.formActividad
          ).then(response => {
						if (response) {
							this.$toast.success(response.err_mensaje)
							this.closeModalDialog(true)
						}
					}).catch( error => this.$toast.error(error.error_mensaje))
          .finally( () => this.dialogLoading = false )
				} else {
					this.$toast.error(this.$t('sispoa.requeridos'))
				}
			},
			modificar () {
				if (this.$refs.formDialogActividad.validate()) {
          // ---- Si el apoyo esta seleccionado
          if (!this.flagActividadApoyo) {
            this.formActividad.iac_codigo_apoyo = null
          }
					this.dialogLoading = true
					this.$service.put(
            'SISPOA',
            `${this.componentServicePath}`,
            this.formActividad
          ).then(response => {
						if (response) {
							this.$toast.success(response.err_mensaje)
							this.closeModalDialog(true)
						}
					}).catch( error => this.$toast.error(error.error_mensaje))
          .finally( () => this.dialogLoading = false )
				} else {
					this.$toast.error(this.$t('sispoa.requeridos'))
				}
			},
			inactivar () {
				this.dialogLoading = true
				this.$service.delete(
          'SISPOA',
          `${this.componentServicePath}/${this.formActividad.act_codigo}`
        ).then(response => {
					if (response) {
						this.$toast.success(response.err_mensaje)
            this.$nuxt.$emit('actualizadorActividadViatico', true)
						this.closeModalDialog(true)
					}
				}).catch( error => this.$toast.error(error.error_mensaje))
        .finally( () => this.dialogLoading = false )
			},
			activar() {
				this.dialogLoading = true
				this.$service.patch(
          'SISPOA',
          `${this.componentServicePath}/${this.formActividad.act_codigo}`
        ).then(response => {
          if (response) {
						this.$toast.success(response.err_mensaje)
						this.closeModalDialog(true)
					}
				}).catch( error => this.$toast.error(error.error_mensaje))
        .finally( () => this.dialogLoading = false )
			},
      /**
       * * Change Value
       */
      changeValueAccionACortoPlazo (pobjCodigo) {
        switch (this.flagShowData) {
          case FlagType.CREATE:
            this.formActividadBolsa = {}
            this.formActividad.act_codigo_bolsa = ''
            break
          case FlagType.UPDATE:
            console.log('update')
            break
          default:
            break
        }
        this.getBolsaActividades(pobjCodigo)
        // this.formActividad.aun_codigo_ejecutora = aun_codigo
      },
      async getBolsaActividades(pobCodigo) {
        await this.$service.get(
          'SISPOA',
          `actividades?pobj_codigo=(${pobCodigo})&aun_codigo_ejecutora=(${this.aunCodigoEjecutora})&act_estado=(${Status.CONSOLIDADO},${Status.RETIRADO})`
        ).then(response => {
          if (response) {
            response = response.map((item) => {
              if (item.act_estado == Status.RETIRADO) {
                item.act_num_desc = `(REGISTRO RETIRADO) ${item.act_num_desc}`
              }
              return item
            })
            this.ArrayBolsaActividades = response
          }
        }).catch(error => {
          this.ArrayBolsaActividades = []
        }).finally(() => {
          this.tableLoading = false
        })
      },
      verificaActividadBolsa (actCodigoBolsa) {
        this.formActividad.act_codigo_bolsa = actCodigoBolsa
        this.verificaHorasDisponibles(actCodigoBolsa)
      },
      async verificaHorasDisponibles(actCodigoBolsa) {
        if (actCodigoBolsa) {
          await this.$service.get(
            'SISPOA',
            `actividades/actividad-bolsa?act_codigo_bolsa=(${actCodigoBolsa})&act_estado=(${Status.EDICION},${Status.CONSOLIDADO},${Status.EN_VERIFICACION},${Status.OBSERVADO},${Status.HISTORICO},${Status.EN_VERIFICACION_SUPERVISOR},${Status.APROBADO_SUPERVISOR},${Status.APROBADO},${Status.RETIRADO},${Status.OBSERVACION_FINALIZADA},${Status.SOLICITUD_ANULACION},${Status.ANULACION_APROBADO},${Status.ANULACION_APROBADO_SUPERVISOR},${Status.ANULACION_OBSERVADO},${Status.SINCRONIZACION},${Status.VERIFICADO},${Status.VERIFICADO_GI},${Status.APROBADO_DESPACHO})`
          ).then(response => {
            if (response) {
              this.formActividadBolsa = response
            }
          }).catch(error => {
            this.formActividadBolsa = {}
          })
        }
      },
      changeActividadType(value) {
        console.log("🐱==vv1==> ~ value:", value)
        this.flagActividadType = value
        // Nuevo switch para clasificar entre NUEVO y CONTINUIDAD
        switch (value) {
          case ActividadType.NUEVO:
            this.formActividad.tipact_codigo = ActividadType.NUEVO
            this.flagBloqueoActividadApoyo = false
            this.flagResumenContinuo = false
            break

          case ActividadType.CONTINUIDAD:
            this.formActividad.tipact_codigo = ActividadType.CONTINUIDAD
            this.flagBloqueoActividadApoyo = true
            this.flagActividadReturn = false  // Mantener el valor original de `flagActividadReturn`
            break
          default:
            break
        }
        switch (this.flagShowData) {
          case FlagType.CREATE:
            // Restablecer valores para el modo CREATE
            this.iacCodigoControlApoyo = ''
            this.iacCodigoApoyo = 0
            this.flagActividadApoyo = false
            this.formActividad.ttr_codigo = 0
            this.refreshTipoTrabajo++
            break

          case FlagType.UPDATE:
          case FlagType.ENABLE:
          case FlagType.DISABLE:
          case FlagType.READ:
            switch (value) {
              case ActividadType.CONTINUIDAD:
                // ----- existe el objeto actividad
                if (Object.keys(this.formActividad.actividad_object).length > 0) {
                  // El objeto no está vacío(ERA CONTINUO)
                  this.iac_codigo = this.formActividad.actividad_object.iac_codigo
                  this.flagResumenContinuo = true
                  this.flagActividadReturn = true
                }
                break
              default:
                if (this.formActividad.ett_codigo === EspecificacionTipoTrabajoType.APOYO) {
                  // Configurar en caso de ser APOYO
                  this.flagActividadApoyo = true
                  this.flagBloqueoActividadApoyo = false
                  this.iacCodigoControlApoyo = this.formActividad.iac_concatenado
                  this.iacCodigoApoyo = this.formActividad.iac_codigo_apoyo
                  this.iacCodigoControl = this.formActividad.iac_codigo_control
                }
                break
            }
            break
          default:
            break
        }
      },
      checkModalSubComponentCondition () {
        if ([FlagType.CREATE, FlagType.UPDATE].includes(this.flagShowData)) {
          if (!this.flagActividadReturn) {
            return true
          } else { return false }
        } else { return false }
      },
      onChangeActividadApoyoBoolean (booleanValue) {
        console.log("🐱==mm0==> ~ booleanValue:", booleanValue)
        // this.tableConaudForm.codigo = null
        this.flagActividadApoyo = booleanValue
        // --- muestra todos los tipos de trabajo que no es APOYO ---
        console.log("🐱==mm1==> ~ this.flagActividadApoyo:", this.flagActividadApoyo)
        if (this.flagActividadApoyo) {
          this.formActividad.ttr_codigo = 0
          this.refreshTipoTrabajo++
          this.getAllTiposTrabajos(EspecificacionTipoTrabajoType.APOYO)
        } else {// --- muestra todos los tipos de trabajo para APOYO ---
          this.formActividad.ttr_codigo = 0
          this.refreshTipoTrabajo++
          this.getAllTiposTrabajos()
        }
        // ---- cuando se crea se resetea lo de APOYO
        if (this.flagShowData == FlagType.CREATE) {
          this.iacCodigoApoyo = 0
          this.iacCodigoControlApoyo = ''
          this.iacCodigoControl = ''
          this.formActividad.ett_codigo = 0
        }
      },
      changeValueTipoTrabajo (ttr_codigo) {
        console.log("🐱==xx==> ~ ttr_codigo:", ttr_codigo)
        if ([TipoApoyo.ALACE, TipoApoyo.APOYO].includes(ttr_codigo)) {
          console.log('ES APOYOOOOOOOOOOOOOOOOOOOOOOO')
          // this.tableConaudForm.codigo = null
          this.flagActividadApoyo = true
          // --- muestra todos los tipos de trabajo que no es APOYO ---
          console.log("🐱==nn0==> ~ this.flagActividadApoyo:", this.flagActividadApoyo)
          this.getAllTiposTrabajos(EspecificacionTipoTrabajoType.APOYO)
          if (this.flagActividadApoyo) {
          }
          // ---- cuando se crea se resetea lo de APOYO
          if (this.flagShowData == FlagType.CREATE) {
            console.log('entrooooo 2222')
            this.formActividad.tipact_codigo = ActividadType.NUEVO
            this.flagBloqueoActividadApoyo = false
            this.flagResumenContinuo = false
            this.iacCodigoControl = ''
            console.log('========zzzzzzz',this.flagActividadType)
            this.flagActividadType = ActividadType.NUEVO
          }
        }
        this.$service.get('SISPOA', `tipos-trabajos?ttr_codigo=(${ttr_codigo})`).then(response => {
          this.flagTipoTrabajo = false
        }).catch(error => {
        })
      },
      /**
       * * Search Conaud tipo APOYO
       */
      searchActividadConaud () {
        this.tableConaudLoading = true
        if (!['', null].includes(this.iacCodigoControl)){
          this.$service.get(
            'SISPOA',
            `actividades/conaud_actividad?iac_estado=(${Status.EDICION}, ${Status.BLOQUEADO},${Status.EJECUCION})&iac_codigo_control=${this.iacCodigoControl}`
          ).then(response => {
            if (response) {
              this.iacCodigoApoyo = response[0].iac_codigo
              this.formActividad.iac_codigo = response[0].iac_codigo
              this.formActividad.iac_codigo_apoyo = response[0].iac_codigo
              this.tableConaudLoading = false
              this.iacCodigoControlApoyo = response[0].iac_codigo_control
            }
          }).catch(error => {
            this.$toast.clear()
            this.$toast.info(error.error_mensaje)
            this.iacCodigoApoyo = 0
            this.iacCodigoControlApoyo = ''
          })
          .finally(() => this.tableConaudLoading = false)
        } else {
          this.tableConaudLoading = false
          this.$toast.error(this.$t('sispoa.requeridos'))
        }
      },
      searchOtherConaud (booleanValue) {
        this.flagResumenContinuo = false
        this.flagActividadReturn = booleanValue
      },
      /**
       * * Editar Horas F-26
       */
      async accionEditarHoras(item) { //Cuando Edita la actividad
        this.flagHoras = true
        this.formActividadReadOnly = true
        this.openModalDialog (FlagType.UPDATE, item)
        // ---- OBTENER DATOS DE EJECUCION
        await this.findDataTotalHorasEjecución(item.act_codigo)
      },
      async findDataTotalHorasEjecución(act_codigo) {
        this.totalHorasEjecucion = 0
        await this.$service.get(
          'SISPOA',
          `actividades/total-horas-ejecucion/${act_codigo}`
        ).then(response => {
          if (response) {
            this.ArrayOfEjecuciones = response
            this.ArrayOfEjecuciones.forEach(item => {
              this.totalHorasEjecucion += item.total_horas_ejecucion
            })
          }
        }).catch(error => {
          this.ArrayOfEjecuciones = []
        })
      },
      /**
       * * Reportes
       */
      async actionDescargarReporteF24 (item) {
        let reportDto = {}
        reportDto.s_act_codigo = `(${item.act_codigo})`
        reportDto.s_act_estado = `(${item.act_estado})`
        await this.$service.post(
          'SISPOA',
          `/reporte-jasper/actividades-reporte-f24`,
          reportDto
        ).then(async (response) => {
          if (await response) {
            if (response) {
              this.$utils.descargarDPF(response, 'sispoa-actividades-reporte-f24')
            } else {
              this.$toast.info('Reporte incorrecto')
            }
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
        })
      },
      async actionDescargarReporteF21 (item) {
        let reportDto = {}
        reportDto.s_act_codigo = `(${item.act_codigo})`
        await this.$service.post(
          'SISPOA',
          `/reporte-jasper/actividades-reporte-f21`,
          reportDto
        ).then(async (response) => {
          if (await response) {
            if (response) {
              this.$utils.descargarDPF(response, 'sispoa-actividades-reporte-f21')
            } else {
              this.$toast.info('Reporte incorrecto')
            }
          }
        }).catch(error => {
          this.$toast.info(error.error_mensaje)
        })
      },
      /**
       * * Historial de Estados
       */
      openModalDialogHistorial(item){
        this.formActividad = structuredClone(item)
        this.dialogBooleanHistorial = true
      },
      cancelaDialogHistorial(){
        this.dialogLoadingHistorial = false
        this.dialogBooleanHistorial = false
      },
      /**
       * * Actividad, Change Status
       */
      sendComponentChangeStatus (newStatus, item) {
        item.type = 5 // ACTIVIDADES
        this.$refs.changeStatusComponentPobj.openModalDialogChangeStatusChild(newStatus, item)
      },
      //Verificación Bloqueos Sistema
      async verificaSistemaBloqueado() {
        try {
          let response = await this.$service.get('SISPOA', `/bloqueos-sistemas/verificar?poa_codigo=(${this.poaCodigo})`)
          this.flagSistemaDesBloqueado = response > 0 ? false : true
        } catch(error) {
          console.log(error.error_mensaje || error)
        }
      },
		}
	}
</script>
```

## Codigo Backend
```ts
  @LoggerMethod
  async findAllActividadEnEjecucionConaud(query: GetAllActividadesConaudDto, manager: EntityManager) {
    try {
      let resultQuery: any = [];
      let resultQueryInicioActividad: any = {};
      let resultQueryInicioActividadMigrado: any = {};
      let respIacCodigo = { codigo: 0 };
      //busca el inicio actividad
      try {
        resultQueryInicioActividad = (await this.findAllActividadEnConaud(query, manager))[0];
      } catch (error) { }
      //-----SI ENCONTRO UN INICIO DE ACTIVIDAD
      if (Object.keys(resultQueryInicioActividad).length != 0) {
        let resp = { iac_concatenado: '' };
        try {
          const respInicioAct = new GetAllActividadesDto();
          respInicioAct.iac_codigo = `(${resultQueryInicioActividad.iac_codigo})`;
          resp = (await this.findAllCodigoControl(respInicioAct, manager))[0];
        } catch (error) { }
        resultQuery.push({
          iac_codigo: resultQueryInicioActividad.iac_codigo,
          iac_codigo_control: resp.iac_concatenado,
          flag_migrado: false
        });
      } else {
        //-----SI NO SE ENCONTRO BUSCAR EN CONAUD ANTIGUO
        try {
          const getAllAuditoriasInformesDto = new GetAllAuditoriasInformesDto();
          getAllAuditoriasInformesDto.auditoria_codigo = query.iac_codigo_control;
          resultQueryInicioActividadMigrado = (await this.coanudService.findAuditoriasInformes(getAllAuditoriasInformesDto, manager))[0];
        } catch (error) { }
        if (Object.keys(resultQueryInicioActividadMigrado).length != 0) {
          if (resultQueryInicioActividadMigrado.trabajo_codigo != query.iac_codigo_control) {
            throwError(400, 'NO SE ENCONTRO EL REGISTRO, VERIFIQUE EL CODIGO CONAUD')
          }
          resultQueryInicioActividadMigrado.flat_migrado = true
          // CREATE INICIO ACTIVIDAD
          const findCreateIniciosActividadesProviderDto = new FindCreateIniciosActividadesProviderDto();
          findCreateIniciosActividadesProviderDto.actividad_object = resultQueryInicioActividadMigrado;
          findCreateIniciosActividadesProviderDto.iac_estado = query.iac_estado;
          findCreateIniciosActividadesProviderDto.s_token = `${query.s_token}`;
          respIacCodigo = await this.sispoaConaudService.verificaCreateInicioActividad(findCreateIniciosActividadesProviderDto);
        }
      }
      let mensaje = '';
      if (resultQuery.length > 0) {
        mensaje = this.message_custom;
      } else if (resultQuery.length == 0 && respIacCodigo.codigo != 0) {
        let resp = { iac_concatenado: '' };
        try {
          const respInicioAct = new GetAllActividadesDto();
          respInicioAct.iac_codigo = `(${respIacCodigo.codigo})`;
          resp = (await this.findAllCodigoControl(respInicioAct, manager))[0];
        } catch (error) { }
        resultQuery.push({
          iac_codigo: respIacCodigo.codigo,
          iac_codigo_control: resp.iac_concatenado,
          flag_migrado: true
        });
        mensaje = 'SE REGISTRO EL INICIO DE ACTIVIDAD MIGRADO';
      } else {
        mensaje = 'INICIOS ACTIVIDADES EN EL COANUD NUEVO Y EN EL ANTIGUO';
      }
      return CustomService.verifyingDataResult(resultQuery, mensaje);
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }
```

## Ramas
- fix/correccion_registro_actividad_apoyo_frontend
- fix/correccion_registro_actividad_apoyo_backend_oficial