# Hacer
- Hacer un reporte sin datos
- Este reporte recibira un array de objetos
- Cada objeto tendra como atributo un tipo y un array de objetos
- Si es de tipo 1 llamara a el subreporte para tipo 1, si es de tipo 2 llamara a un subreporte de tipo 2
- Cada subreporte debera empezar en cada pagina por separado, no debera continuar al que ya hay
- Los textos deben estar justificados, no deben achicarse, deben empujar a los que estan abajo
- La entidad, se puede sacar del act_codigo, que se obtiene del inicio actividad, que a su ves proviene de un inicio_actividad_poa, el inicio de actividad tiene un informe, que a su ves tiene tipo de informe
- hay un campo que esta unido el iac_codigo_control vista y tipo de informe,
- los informes solo se visualizaran si estan emitidos, en la cuarta pestaña
# Ejms
## Formato 1
### Muestra
![[img0.jpg]]
### Resultado
![[inicial.pdf]]
## Formato 2
### Muestra
![[img1.jpg]]
### Servicio
```http
### ------- OBTENER - REPORTE INFORME RECOMENDACIONES

GET {{Host}}/informe-recomendaciones/reporte-recomendaciones?inf_codigo=(372)&flag_formato=(1,2) HTTP/1.1

Authorization: {{AuthTokenInterno}}

Content-Type: application/json
```

## Resumen Ejecutivo
![[img2.jpg]]
### 
```jsx
'use client';
// ----------- IMPORTS REACT LIB
import React, { useEffect, useState } from 'react';
import { useForm } from 'react-hook-form';
// ----------- IMPORTS THIRD-PARTY LIB
import { Card } from 'primereact/card';
import { Panel } from 'primereact/panel';
import { DataTable } from 'primereact/datatable';
import { InputText } from 'primereact/inputtext';
import { Dialog } from 'primereact/dialog';
import { Column } from 'primereact/column';
import { Button } from 'primereact/button';
import { ButtonGroup } from 'primereact/buttongroup';
import { RadioButtonController } from '@/components/common/ControllerRadioButton';
import { IconField } from 'primereact/iconfield';
import { InputIcon } from 'primereact/inputicon';
import { ConfirmDialog, confirmDialog } from 'primereact/confirmdialog';
// ----------- IMPORTS CUSTOM COMPONENTS
import CustomView from '@/components/common/CustomView';
import CustomBadge from '@/components/common/CustomBadge';
import CustomActions from '@/components/common/CustomActions';
import InformeRecomendacionesForm from '@/components/informe_recomendaciones/component/informe-recomendaciones.form';
// ----------- IMPORTS OTHERS
import { t } from '@/utils/textos';
import { useValidationRules } from '@/utils/validationRules';
import { useToast } from '@/plugins/Notification/toast';
import {
  EstadoType,
  ActionType,
  ButtonActionType,
  FilterMatchMode,
  TipoRecomendaciones,
} from '@/constants/environment.enum';
import { InformeRecomendacionesSeguimientosMethod } from '@/components/informe_recomendaciones/method/informe-recomendaciones-seguimientos.method';
// ------------- IMPORT STATE -----------------------
import { useReduxSessionData } from '@/hooks/redux-session-data.hook';
// ----------- IMPORTS CUSTOM HOOKS
import { useInformesRecomendaciones } from '../hook/informe-recomendaciones.hook';
import { useInicioActividadPoa } from '@/hooks/inicio-actividad-poa.hook';
import { useInformes } from '@/components/informes/hook/informes.hook';
import { useGenerateReporte } from '../../reportes/hook/reportes.hook';
// ----------- IMPORTS METHODS
import { InformeDetailMethod } from '@/components/informes/method/informes-detail.method';

/**
 * @description Componente Tabla de INFORME-RECOMENDACIONES con 'INFORME-RECOMENDACIONES-SEGUIMIENTOS'
 * @param PropTitle (Opcional) Titulo
 * @param PropInfCodigo (Opcional) Unidad Ejecutora
 * @returns <component></component>
 */
const IrInformeRecomendacionesSeguimientosTable = (Props) => {
  // ----------- PROPS
  const { PropTitle = 'Recomendaciones', PropIapCodigoSeguimiento = 0, PropInfCodigo = 0 } = Props;
  // ----------- REDUX
  const { ReduxGesCodigo, ReduxPoaCodigo } = useReduxSessionData();
  // ----------- CONSTANTS
  const PathMainTable = `/informe-recomendaciones-seguimientos?ire_estado=(1,2)&irs_estado=(1,2)`;
  // ----------- STATE VARIABLES
  const [globalFilterValue, setGlobalFilterValue] = useState('');
  const [flagAction, setFlagAction] = useState(0);
  const [valuesForm, setValuesForm] = useState({});
  const [filters, setFilters] = useState({
    global: { value: null, matchMode: FilterMatchMode.CONTAINS },
    aad_descripcion: { value: null, matchMode: FilterMatchMode.STARTS_WITH },
    aad_horas: { value: null, matchMode: FilterMatchMode.IN },
    aad_estado_descripcion: { value: null, matchMode: FilterMatchMode.EQUALS },
    tpe_nombre: { value: null, matchMode: FilterMatchMode.CONTAINS },
  });
  const [flagRecomendacionesForm, setFlagRecomendacionesForm] = useState(false);
  // ------ REPORTES ----
  const { fetchGetReport } = useGenerateReporte();
  const [flagReporteRecomendaciones, setFlagReporteRecomendaciones] = useState(false);
  // ----------- CUSTOM HOOKS VARIABLES
  const toast = useToast();
  const { ToastComponent } = useToast();
  const {
    informesRecomendaciones,
    loadingInformesRecomendaciones,
    errorInformesRecomendaciones,
    fetchFindAllInformesRecomendacionesCorregido,
  } = useInformesRecomendaciones();
  const { informes, loadingInformes, errorInformes, fetchFindAllInformes } = useInformes();
  const { inicioActividadPoa, loadingInicioActividadPoa, errorInicioActividadPoa, fetchFindAllInicioActividadPoa } =
    useInicioActividadPoa();
  const rules = useValidationRules();
  const {
    control,
    setValue,
    getValues,
    formState: { errors },
    handleSubmit,
    watch,
    reset,
  } = useForm({});
  // ----------- SECTION METHODS
  const onGlobalFilterChange = (e) => {
    const value = e.target.value;
    let _filters = { ...filters };
    _filters['global'].value = value;
    setFilters(_filters);
    setGlobalFilterValue(value);
  };
  const closeRecomendacionesForm = async (refreshTable = false) => {
    setFlagRecomendacionesForm(false);
    if (refreshTable) {
      await initComponent();
    }
  };
  const showRecomendacionesForm = (flag = 0, dataRow = {}) => {
    setFlagRecomendacionesForm(true);
    setFlagReporteRecomendaciones(false);
    setFlagAction(flag);
    setValuesForm(dataRow);
  };
  const showReportesForm = () => {
    setFlagReporteRecomendaciones(true);
    setValue('tre_codigo', 1);
  };
  const onCancelButtonReporte = () => {
    setFlagReporteRecomendaciones(false);
    reset();
  };
  const onSubmitForm = async (dataForm) => {
    let flagFormato = '';
    switch (dataForm.tre_codigo) {
      case 1:
        flagFormato = '(1)'
        break;
      case 2:
        flagFormato = '(2)'
        break;
      case 3:
        flagFormato = '(1,2)'
        break;
      default:
        break;
    }
    let nameReport = '';
    let requestBase64 = '';
    const bodyRequest = {
      s_inf_codigo: `(${PropInfCodigo})`,
      s_iap_codigo: `(${informes[0]?.iap_codigo})`,
      s_flag_formato: flagFormato
    };
    if (informes[0].iap_codigo) {
      try {
        requestBase64 = await fetchGetReport('/reporte-recomendaciones', bodyRequest);
        nameReport = `Reporte Recomendaciones`;
        let optionsPdf = {
          file: `data:application/pdf;base64,${requestBase64}`,
          file_name: `${nameReport}`,
        };
        const pdfLink = `${optionsPdf.file}`;
        const anchorElement = document.createElement('a');
        const fileName = `${optionsPdf.file_name}.pdf`;
        anchorElement.href = pdfLink;
        anchorElement.download = fileName;
        anchorElement.click();
      } catch (error) { }
    }
  }
  // ----------- SECTION FRAGMENTS
  const PanelHeaderHtml = () => {
    return <>{PropTitle}</>;
  };
  // ----------- SECTION FRAGMENTS
  const TableColumnAccion = (rowData) => {
    // ----------- NEW ARRAY OF ACTIONS
    let actionsArray = [];
    // ----------- ARRAY OF ACTIONS
    switch (parseInt(rowData.ire_estado)) {
      case EstadoType.EDICION:
        actionsArray.push(ActionType.UPDATE, ActionType.DISABLE);
        // -----------
        if (PropIapCodigoSeguimiento && PropIapCodigoSeguimiento > 0 && rowData?.ris_codigo == 0) {
          let createRecomendacionInicioSeguimiento = {
            flag: ActionType.CREATE,
            icon: 'pi pi-check-circle',
            severity: 'success',
            tooltip: `Adicionar al seguimiento`,
            outlined: true,
            onClick: ConfirmDialogRecomendacionInicioSeguimiento,
          };
          actionsArray.push(createRecomendacionInicioSeguimiento);
        }
        break;
      case EstadoType.INACTIVO:
        actionsArray.push(ActionType.ENABLE);
        break;
      default:
        break;
    }
    // ----------- RETURN
    return (
      <>
        {!flagRecomendacionesForm && (
          <CustomActions
            rowData={rowData}
            onButtonClickDefault={showRecomendacionesForm}
            actionsArray={actionsArray}
          ></CustomActions>
        )}
      </>
    );
  };
  const TableColumnIrsAceptacion = (rowData) => {
    if (rowData?.tre_codigo && rowData.tre_codigo == TipoRecomendaciones.FORMATO_1) {
      return (
        <>
          <div>
            <b>Aceptación:</b>{' '}
            {rowData?.irs_aceptacion && (rowData.irs_aceptacion == 1 || rowData.irs_aceptacion == '1') ? `SI` : `NO`}
          </div>
          {rowData?.irs_aceptacion && (rowData.irs_aceptacion == 1 || rowData.irs_aceptacion == '1') ? (
            ''
          ) : (
            <div>
              <b>Justificación:</b> {rowData?.irs_justificacion ? rowData.irs_justificacion : ''}
            </div>
          )}
        </>
      );
    } else {
      return <></>;
    }
  };
  const TableColumnIrsPeriodoImplantacion = (rowData) => {
    if (rowData?.tre_codigo && rowData.tre_codigo == TipoRecomendaciones.FORMATO_2) {
      let periodoImplantacion = `Del ${rowData.irs_fecha_inicio} Al ${rowData.irs_fecha_fin}`;
      return <>{periodoImplantacion}</>;
    } else {
      return <></>;
    }
  };
  const TableColumnIrsResponsables = (rowData) => {
    if (rowData?.tre_codigo && rowData.tre_codigo == TipoRecomendaciones.FORMATO_2) {
      let irsResponsables = rowData?.irs_responsables ? rowData.irs_responsables : [];
      return (
        <>
          <ul className='pl-2'>
            {irsResponsables.map((item, index) => {
              return (
                <li key={`responsables-${index}`}>
                  <div>{item?.per_nombre_completo}</div>
                  <div>
                    <b>Cargo:</b> {item?.per_cargo}
                  </div>
                </li>
              );
            })}
          </ul>
        </>
      );
    } else {
      return <></>;
    }
  };
  const TableHeaderColumnsMain = [
    {
      field: 'ire_codigo',
      header: 'Acción',
      body: TableColumnAccion,
      frozen: true,
    },
    {
      field: 'ire_numero_recomendacion',
      header: 'N° Recomendación',
      sortable: true,
      className: 'text-center uppercase',
    },
    {
      field: 'ire_nombre',
      header: 'Titulo Recomendación',
      sortable: true,
      className: 'text-justify uppercase',
    },
    {
      field: 'ire_descripcion',
      header: 'Descripción Recomendación',
      sortable: true,
      className: 'text-justify uppercase',
    },
    {
      field: 'tre_nombre',
      header: 'Formato',
      sortable: true,
      className: 'text-center uppercase',
    },
    {
      field: 'irs_aceptacion',
      header: 'Aceptación Justificación',
      sortable: true,
      className: 'text-justify',
      body: TableColumnIrsAceptacion,
    },
    {
      field: 'irs_fecha_inicio',
      header: 'Periodo Implantación',
      sortable: true,
      className: 'text-center',
      body: TableColumnIrsPeriodoImplantacion,
    },
    {
      field: 'irs_responsables',
      header: 'Responsable',
      sortable: true,
      className: 'text-justify',
      body: TableColumnIrsResponsables,
    },
    {
      field: 'irs_tareas_desarrollar',
      header: 'Tareas a Desarrollar',
      sortable: true,
      className: 'text-justify uppercase',
    },
  ];
  const RenderTableHeader = () => {
    const value = filters['global'] ? filters['global'].value : '';
    return (
      <>
        <div className='flex flex-wrap align-items-center justify-content-between gap-2'>
        <div className="flex gap-2">
          {!flagRecomendacionesForm && (
            <Button
              type='button'
              onClick={() => showRecomendacionesForm(ActionType.CREATE, {})}
              size='small'
              icon='pi pi-plus'
              severity='secondary'
              label={t.conaud.nuevo}
              className='px-2'
            />
          )}
          {!flagReporteRecomendaciones && informesRecomendaciones.length >0 && (
            <Button
              type='button'
              onClick={() => showReportesForm()}
              size='small'
              disabled={flagRecomendacionesForm}
              icon='pi pi-file-pdf'
              severity='warning'
              label='Reportes'
              className='px-2'
            />
          )}
        </div>
          <IconField iconPosition='left' className='p-input-icon-left mr-2'>
            <InputIcon className='pi pi-search' />
            <InputText
              type='search'
              value={value || ''}
              onChange={(e) => onGlobalFilterChange(e)}
              placeholder={t.conaud.busqueda}
            />
          </IconField>
        </div>
      </>
    );
  };
  const TableHeaderHtml = RenderTableHeader();
  // ---
  const TableRisColumnAccion = (rowData) => {
    // ----------- RETURN
    return (
      <>
        {!flagRecomendacionesForm && (
          <>
            <Button
              key={`buttonAction-delete`}
              outlined={true}
              size={'small'}
              icon={'pi pi-times-circle'}
              severity={'danger'}
              className={'border-none border-0'}
              onClick={() => ConfirmDialogRecomendacionInicioSeguimiento(ActionType.DISABLE, rowData)}
              tooltip={'Quitar seguimiento'}
              tooltipOptions={{
                position: 'right',
                event: 'hover',
                mouseTrack: true,
                autoHide: true,
                showDelay: 300,
              }}
            />
          </>
        )}
      </>
    );
  };
  const TableRisHeaderColumnsMain = [
    {
      field: 'ris_codigo',
      header: 'Acción',
      body: TableRisColumnAccion,
      frozen: true,
    },
    {
      field: 'ire_numero_recomendacion',
      header: 'N° Recomendación',
      sortable: true,
      className: 'text-center uppercase',
    },
    {
      field: 'ire_nombre',
      header: 'Titulo Recomendación',
      sortable: true,
      className: 'text-center uppercase',
    },
    {
      field: 'ire_descripcion',
      header: 'Descripción Recomendación',
      sortable: true,
      className: 'text-center uppercase',
    },
    {
      field: 'tre_nombre',
      header: 'Formato',
      sortable: true,
      className: 'text-center uppercase',
    },
  ];
  // ----------- SECTION INIT
  const initComponent = async () => {
    setFlagAction(0);
    // ----------- FINDALL-DATA-TABLE
    try {
      await fetchFindAllInformes(
        `/full-join${PropInfCodigo > 0 ? `?inf_codigo=(${PropInfCodigo})` : '?inf_estado=(2)'}`
      );
      await fetchFindAllInformesRecomendacionesCorregido(
        `${PathMainTable}${PropInfCodigo > 0 ? `&inf_codigo=(${PropInfCodigo})` : ''}${PropIapCodigoSeguimiento > 0 ? `&iap_codigo=(${PropIapCodigoSeguimiento})` : ''}`
      );
    } catch (error) {
      toast.error(error.error_mensaje);
    }
    // ----------- CHECK IF SEGUIMIENTO
    await initSeguimiento();
  };
  const initSeguimiento = async () => {
    if (PropIapCodigoSeguimiento && PropIapCodigoSeguimiento > 0) {
      try {
        await fetchFindAllInicioActividadPoa(`/full-join?iap_codigo=(${PropIapCodigoSeguimiento})`);
        await fetchFindAllRecomendacionesIniciosSeguimientos(
          `?ris_estado=(1)&iap_codigo=(${PropIapCodigoSeguimiento})`
        );
      } catch (error) {
        toast.error(error.error_mensaje);
      }
    }
  };

  // ----------- useEffects
  useEffect(() => {
    initComponent();
  }, []);

  return (
    <>
      {ToastComponent}
      <ConfirmDialog />
      {!loadingInformes && (
        <div className='mt-4 px-2'>
          <CustomView title='RESUMEN INFORME:' detailObject={InformeDetailMethod(informes[0])} />
        </div>
      )}
      {flagRecomendacionesForm && (
        <div className='mt-2'>
          <InformeRecomendacionesForm
            infCodigo={PropInfCodigo}
            closeRecomendacionesForm={closeRecomendacionesForm}
            flagAction={flagAction}
            setFlagAction={setFlagAction}
            valuesForm={valuesForm}
            toast={toast}
          ></InformeRecomendacionesForm>
        </div>
      )}
      {flagReporteRecomendaciones && (
        <>
          <form
            onSubmit={handleSubmit(onSubmitForm)}
            className='mt-4 border-1 border-solid border-round surface-border p-3'
          >
            <div className='flex flex-wrap'>
              <strong className='text-primary font-medium'>IMPRIMIR REPORTES</strong>
            </div>
            <div className='flex justify-content-center mb-4'>
              <RadioButtonController
                name='tre_codigo'
                control={control}
                errors={errors}
                rules={rules.required()}
                radioBtnsData={[
                  { id: 'uno', name: 'FORMATO 1', value: 1 },
                  { id: 'dos', name: 'FORMATO 2', value: 2 },
                  { id: 'tres', name: 'AMBOS FORMATOS', value: 3 }
                ]}
              />
            </div>
            <div className='flex align-items-end justify-content-end'>
              <div className='flex gap-2'>
                <Button
                  type='submit'
                  size='small'
                  label='IMPRIMIR'
                  loading={loadingInformesRecomendaciones}
                  // disabled={
                  //   flagAction == ActionType.CREATE ? true : false
                  // }
                  icon='pi pi-check'
                  severity='warning'
                />
                <Button
                  type='button'
                  onClick={onCancelButtonReporte}
                  label={t.botones.cancelar}
                  loading={loadingInformes}
                  icon='pi pi-times'
                  severity='danger'
                  size='small'
                />
              </div>
            </div>
          </form>
        </>
      )}
      <div className='mt-2'></div>
      <DataTable
        dataKey='ire_codigo'
        value={informesRecomendaciones}
        loading={loadingInformesRecomendaciones}
        header={TableHeaderHtml}
        rows={5}
        rowsPerPageOptions={[5, 10, 20, informesRecomendaciones?.length]}
        filters={filters}
        filterDisplay='menu'
        globalFilterFields={[
          'ire_codigo',
          'ire_numero_recomendacion',
          'ire_nombre',
          'ire_descripcion',
          'tre_nombre',
          'irs_aceptacion',
          'irs_fecha_inicio',
          'irs_responsables',
          'irs_tareas_desarrollar',
        ]}
        className='p-datatable-gridlines'
        rowHover
        scrollable
        scrollHeight='590px'
        paginator
        size='small'
        showGridlines
        removableSort
        tableStyle={{ minWidth: '50rem' }}
        paginatorTemplate='FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink RowsPerPageDropdown CurrentPageReport'
        currentPageReportTemplate='{first} a {last} de {totalRecords}'
        emptyMessage='NO EXISTE NINGUNA INFORMACIÓN REGISTRADA'
        tableClassName='text-700 font-light text-sm align-middle'
        paginatorClassName='text-100 font-light text-sm'
        pt={{
          header: { className: 'bg-gray-200 my-0' },
        }}
      >
        {TableHeaderColumnsMain.map((col, index) => {
          return (
            <Column
              key={`recomendacion-${index}`}
              field={col.field}
              header={col.header}
              body={col.body ? col.body : col.value}
              sortable={col.sortable ? col.sortable : false}
              align={col.align ? col.align : 'center'}
              frozen={col.frozen ? col.frozen : false}
              style={{ fontSize: '10px' }}
              className={col.className ? col.className : ''}
            />
          );
        })}
      </DataTable>
      {PropIapCodigoSeguimiento > 0 && inicioActividadPoa.length > 0 && (
        <div className='mt-4 px-2'>
          {!loadingInicioActividadPoa && (
            <CustomView
              title='DATOS DE ACTIVIDAD QUE REALIZARÁ EL SEGUIMIENTO:'
              detailObject={InformeRecomendacionesSeguimientosMethod(inicioActividadPoa[0])}
            />
          )}
          <DataTable
            dataKey='ris_codigo'
            value={recomendacionesIniciosSeguimientos}
            loading={loadingRecomendacionesIniciosSeguimientos}
            // header={TableHeaderHtml}
            rows={5}
            rowsPerPageOptions={[5, 10, 20, recomendacionesIniciosSeguimientos?.length]}
            filters={filters}
            filterDisplay='menu'
            globalFilterFields={[
              'ire_codigo',
              'ire_numero_recomendacion',
              'ire_nombre',
              'ire_descripcion',
              'tre_nombre',
              'irs_aceptacion',
              'irs_fecha_inicio',
              'irs_responsables',
              'irs_tareas_desarrollar',
            ]}
            className='p-datatable-gridlines mt-2'
            rowHover
            scrollable
            scrollHeight='590px'
            paginator
            size='small'
            showGridlines
            removableSort
            tableStyle={{ minWidth: '50rem' }}
            paginatorTemplate='FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink RowsPerPageDropdown CurrentPageReport'
            currentPageReportTemplate='{first} a {last} de {totalRecords}'
            emptyMessage='NO EXISTE NINGUNA INFORMACIÓN REGISTRADA'
            tableClassName='text-700 font-light text-sm align-middle'
            paginatorClassName='text-100 font-light text-sm'
            pt={{
              header: { className: 'bg-gray-200 my-0' },
            }}
          >
            {TableRisHeaderColumnsMain.map((col, index) => {
              return (
                <Column
                  key={`recomendacion-inicio-${index}`}
                  field={col.field}
                  header={col.header}
                  body={col.body ? col.body : col.value}
                  sortable={col.sortable ? col.sortable : false}
                  align={col.align ? col.align : 'center'}
                  frozen={col.frozen ? col.frozen : false}
                  style={{ fontSize: '10px' }}
                  className={col.className ? col.className : ''}
                />
              );
            })}
          </DataTable>
        </div>
      )}
    </>
  );
};

export default IrInformeRecomendacionesSeguimientosTable;

```
### roles
SCAT-GAAPIP
	9945262	CLAUDIA PARRA MAMANI	RESPONSABLE 	EDICION
	486424	LUIS FERNANDO SAAVEDRA MORATO	GERENTE CONSOLIDADOR 	EDICION
		SIN IDENTIFICAR	FORMULADOR GERENTE 	EDICION
		SIN IDENTIFICAR	FORMULADOR 	EDICION
	486424	LUIS FERNANDO SAAVEDRA MORATO	SUPERVISOR 	EDICION
		SIN IDENTIFICAR	APROBADOR 	EDICION
	3445997	CAROLINA LEA RODRIGUEZ BONIVENTO	FORMULADOR 	EDICION
	3445997	CAROLINA LEA RODRIGUEZ BONIVENTO	FORMULADOR GERENTE 	EDICION
	3445997	CAROLINA LEA RODRIGUEZ BONIVENTO	APROBADOR 	EDICION 
- actividad : 520.0504.38.10.24
- ruta: http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=3167
- componente: src/components/informes/component/informes.table.jsx
- Servicio Sushy: 
```http
http://172.16.22.232:7008/informes-resumen-ejecutivo?inf_codigo=(377)&rei_estado=(1)
```
### query
```sql
INSERT INTO ejecucion_actividades.informes_resumen_ejecutivo
(rei_codigo, inf_codigo, ent_codigo, ent_descripcion, rei_referencia, rei_numero_informe, rei_objetivo, rei_objeto, rei_periodo_auditado, rei_resultado_uno, rei_resultado_dos, rei_resultado_tres, rei_conclusion, rei_observacion, rei_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(1, 372, 729, 'ADMINISTRACIÓN REGIONAL TARIJA - CPS', 'Auditoria de cumplimiento sobre el proyecto "Construcción oficinas y residencia área protegida Monte Villca"', 'GH/EP09/G22 C1, Complementario al Informe Preliminar de Ausitoría N° GH/EP09/G22 R1', 'Emitir una opinión independiente sobre el cumplimiento del ordenamiento jurídico administrativo y cumplimiento del objetivo del proyecto "Construcción oficinas y residencia área protegida Monte Villca".', 'Lo constituyo el proyecto "Construcción oficinas y residencia áerea protegida Monte Villca" y la documentación relacionada con el mismo, consistente en:
- Informe Técnico de condiciones Previas.
- Estudio de Diseño Técnico de Preinversión.
- Contrato Administrativo N° 048/2017 por la ejecución del proyecto.
- Comprobantes de registros de ejecución de gastos (C - 31), y su documentación de respaldo.
- Actas de entrega provisional y definitiva.
- Otra documentación relacionada con el objetivo del examen.', 'Del 9 de septiembre de 2016 al 27 de abril de 2022.', 'Como resultado de la auditoría y en relación al objetivo expuesto procedentemente, se ha establecido el hallazgo que se describe a continuación, sobre el cual se emite la siguiente conclusión', 'Como resultado de la auditoría y en relación al objetivo expuesto procedentemente, se ha establecido el hallazgo que se describe a continuación, sobre el cual se emite la siguiente conclusión', 'Como resultado de la auditoría y en relación al objetivo expuesto procedentemente, se ha establecido el hallazgo que se describe a continuación, sobre el cual se emite la siguiente conclusión', 'Conclusion', NULL, 1, 1349, 1349, 0, '2024-10-28 12:48:58.297', '2024-10-28 17:00:02.630', '1900-01-01 00:00:00.000');
```
### Tomar en cuenta
- Texto justificado
- Debe aceptar cualquier tipo de caracter
- Es una nueva tabla, Sushy lo esta haciendo
### Servidor
```
npm install -g json-server
```
- reporte.json
```json
{
  "data": [
    {
      "tipo": "example1",
      "items": [
        {"name": "item1", "value": "100"},
        {"name": "item2", "value": "200"}
      ]
    },
    {
      "tipo": "example2",
      "items": [
        {"name": "item3", "value": "300"},
        {"name": "item4", "value": "400"}
      ]
    }
  ]
}

```
- dsdsd
```
json-server --watch reporte.json --port 7008  
```

- acceder
```
GET http://localhost:7008/data HTTP/1.1

Content-Type: application/json
```
- CONAUD
- Las acciones sobre Registro de Informes aún no pueden ser utilizados.
- El usuario debe contar con el rol adecuado
- La actividad debe estar consolidada
- La actividad no cuenta con un inicio actividad POA
- http://192.168.0.13:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=2837
  
### ejm backup_20241027_211308.sql
- act_codigo=2054
- act_numero=510.1502.23.3.24
#### query
```sql
SELECT 	*
FROM 	ejecucion_actividades.informes_estados ie
WHERE 	ie.eev_codigo IN (38)
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.iac_codigo IN (187)
;

--tipo evaluacion
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_numero LIKE 	'520.1502.90.1.24'
;
```

|     | **GDH-GAD** |                                 |                      |         |
| --- | ----------- | ------------------------------- | -------------------- | ------- |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | GERENTE CONSOLIDADOR | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR           | EDICION |
|     | 2389409     | OLGA EDITH SUAREZ JIMENEZ       | SUPERVISOR           | EDICION |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | APROBADOR            | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR GERENTE   | EDICION |

![[conau.png]]
### Con formulador gerente se crea el informe
![[conau2.png]]

### Con Gestion institucional
- http://192.168.0.13:3002/conaud/sispoa-actividades-formularios-informes?act_codigo=2054&ges_codigo=2&iac_codigo=187&ges_inst=1&ges_verf=1&aun_codigo_ejecutora=28
- se registra su estado a emision
![[conau3.png]]
![[conau4.png]]
  ### Deberia poderse registrar recomendaciones en formulador gerente
  ![[conau6.png]]


## Tarea a realizar

### considerar
- La entidad, se puede sacar del act_codigo, que se obtiene del inicio actividad, que a su ves proviene de un inicio_actividad_poa, el inicio de actividad tiene un informe, que a su ves tiene tipo de informe
- hay un campo que esta unido el iac_codigo_control vista y tipo de informe,
- Se enviara un inf_codigo
- un informes tine N informe_recomendaciones
- 1 informe_recomendaciones tiene N informe_recomendaciones_seguimientos
- informe_recomendaciones_seguimientos (Formato) aqui esta el formato tre_codigo 1(Formato 1) , 2(Formato 2)
- N° Recomendacion es (informe_recomendaciones.ire_numero_recomendacion)
- Recomendación(informe_recomendaciones.ire_nombre)
- Recomendación, la parte de abajo opocional(informe_recomendaciones.ire_descripcion)
- Aceptacíon(informe_recomendaciones_seguimientos.irs_aceptacion)
- Justificacion(informe_recomendaciones_seguimientos.irs_justificacion)
- Tomar el ultimo de informe_recomendaciones su estado, como la relacion de infome recomendaciones puede tener N informe_recomendaciones_seguimientos
- Periodo de implantación(informe_recomendaciones_seguimientos.irs_fecha_inicio y informe_recomendaciones_seguimientos.irs_fecha_fin )
- Responsable, se le enviara un json con los N responsables(informe_recomendaciones_seguimientos.irs_responsables)

#### datos: backup_20241028_101441.sql
- act_codigo=2054
- act_numero=510.1502.23.3.24
#### query
```sql
SELECT 	*
FROM 	ejecucion_actividades.informes_estados ie
WHERE 	ie.eev_codigo IN (38)
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.iac_codigo IN (187)
;

--tipo evaluacion
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_numero LIKE 	'520.1502.90.1.24'
;
```

#### Roles

|     | **GDH-GAD** |                                 |                      |         |
| --- | ----------- | ------------------------------- | -------------------- | ------- |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | GERENTE CONSOLIDADOR | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR           | EDICION |
|     | 2389409     | OLGA EDITH SUAREZ JIMENEZ       | SUPERVISOR           | EDICION |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | APROBADOR            | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR GERENTE   | EDICION |

#### http://172.16.22.243:7002/informe-recomendaciones?inf_codigo=(375)&iac_codigo=(undefined)
#### base backup_20241028_175029.sql
![[db_poa_update_b_-_ejecucion_actividades.png]]

#### query
```sql
SELECT 	*
FROM 	ejecucion_actividades.informes_estados ie
WHERE 	ie.eev_codigo IN (38)
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.iac_codigo IN (187)
;

--tipo evaluacion
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_codigo IN (2054)
;
SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones ir
WHERE 	TRUE
		AND ir.inf_codigo IN (375)
ORDER BY ir.ire_codigo DESC
;
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
;

SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
--WHERE 	irs.inf_codigo IN (375)
ORDER BY irs.irs_codigo DESC;
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(217, '1', 'dsdsdsssdsd dsdsd dsdsd', '2024-03-01', '2024-10-31', 217, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(218, '1', 'zzzz zzz zzzzz zzzz', '2024-03-01', '2024-10-31', 218, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(219, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 219, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(220, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 220, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(221, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 221, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(222, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 222, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(223, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 223, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(224, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 224, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(225, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 225, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(226, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 226, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(227, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 227, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(228, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 228, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(229, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 229, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(230, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 230, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(231, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 231, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(232, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 232, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(233, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 233, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(234, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 234, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
SELECT 	*
FROM 	ejecucion_actividades.informes i 
WHERE 	i.inf_codigo IN (375);
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(217, 'R06.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(218, 'R07.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(219, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(220, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(221, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(222, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(223, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(224, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(225, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(226, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(227, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(228, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(229, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(230, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(231, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(232, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(233, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(234, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
--
SELECT 	i.*
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
WHERE 	i.inf_codigo IN (375)
;
SELECT 	--i.*,
		iap.act_codigo, a.ent_codigo ,a.ent_descripcion,
		CONCAT(ia.iac_codigo_control_vista, ' ', i.inf_codigo_control) AS nro_informe_auditoria,
		i.inf_descripcion AS inf_tipo
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo 
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
WHERE 	TRUE
		AND i.inf_estado NOT IN (0,5,9)
		AND i.inf_codigo IN (375)
;
--
SELECT
		ir.ire_nombre AS desc_recomendacion,
		ir.ire_descripcion,
		ir.ire_numero_recomendacion AS nro_recomendacion,
		irs.irs_aceptacion AS aceptacion,
		irs.irs_justificacion AS justificacion_no_aceptacion,
		CONCAT('Del ',TO_CHAR(irs.irs_fecha_inicio, 'dd/mm/yyyy'), ' Al ', TO_CHAR(irs.irs_fecha_fin, 'dd/mm/yyyy')) AS periodo_implantacion,
		irs.irs_responsables AS responsable,
		irs.irs_tareas_desarrollar AS tareas_implantacion,
		irs.tre_codigo
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
WHERE 	i.inf_codigo IN (375)
;
--$$$$$$$$$$$$$$$$$$$$$$
SELECT
    ir.ire_nombre AS desc_recomendacion,
    ir.ire_descripcion,
    ir.ire_numero_recomendacion AS nro_recomendacion,
    irs.irs_aceptacion AS aceptacion,
    irs.irs_justificacion AS justificacion_no_aceptacion,
    CONCAT('Del ', TO_CHAR(irs.irs_fecha_inicio, 'dd/mm/yyyy'), ' Al ', TO_CHAR(irs.irs_fecha_fin, 'dd/mm/yyyy')) AS periodo_implantacion,
    CONCAT('<ul>', 
           STRING_AGG(CONCAT('<li>', responsable ->> 'per_nombre_completo', ' - ', responsable ->> 'per_cargo', '</li>'), ''),
           '</ul>') AS responsable,
    irs.irs_tareas_desarrollar AS tareas_implantacion,
    irs.tre_codigo
FROM ejecucion_actividades.informes i
LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
LEFT JOIN LATERAL jsonb_array_elements(irs.irs_responsables::jsonb) AS responsable ON TRUE
WHERE i.inf_codigo IN (367)
--WHERE i.inf_codigo IN (375)
GROUP BY ir.ire_nombre, ir.ire_descripcion, ir.ire_numero_recomendacion, irs.irs_aceptacion, irs.irs_justificacion, irs.irs_fecha_inicio, irs.irs_fecha_fin, irs.irs_tareas_desarrollar, irs.tre_codigo;
--########################33
SELECT
    	ir.ire_nombre AS desc_recomendacion,
    	ir.ire_descripcion,
    	ir.ire_numero_recomendacion AS nro_recomendacion,
	    CASE 
	        WHEN irs.irs_aceptacion::int = 1 THEN 'SI'
	        ELSE 'NO'
	    END AS aceptacion,
    	irs.irs_justificacion AS justificacion_no_aceptacion,
	    CONCAT('Del ', TO_CHAR(irs.irs_fecha_inicio, 'dd/mm/yyyy'), ' Al ', TO_CHAR(irs.irs_fecha_fin, 'dd/mm/yyyy')) AS periodo_implantacion,
	    -- Subconsulta para la columna 'responsable'
	    (SELECT 
	        CASE 
	            WHEN irs.irs_responsables IS NOT NULL AND jsonb_array_length(irs.irs_responsables::jsonb) > 0 THEN
	                CONCAT('<ul>', 
	                       STRING_AGG(CONCAT('<li>', responsable ->> 'per_nombre_completo', '<br>', responsable ->> 'per_cargo', '</li>'), ''),
	                       '</ul>')
	            ELSE NULL
	        END
	     FROM LATERAL jsonb_array_elements(irs.irs_responsables::jsonb) AS responsable) AS responsable,
	    irs.irs_tareas_desarrollar AS tareas_implantacion,
	    irs.tre_codigo
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
WHERE 	TRUE
		AND ir.ire_estado NOT IN (0,5,9)
		AND i.inf_codigo IN (375)
		AND irs.tre_codigo IN (2)
--WHERE i.inf_codigo IN (375)
;

--%%%%%%%%%%%%%%%%%%%
SELECT tre_codigo, tre_nombre, tre_descripcion, tre_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja
FROM parametricas.tipo_recomendaciones
;

SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones ir
WHERE 	TRUE
		AND ir.inf_codigo IN (375)
ORDER BY ir.ire_codigo ASC
;
SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
WHERE 	TRUE
		AND irs.inf_codigo IN (375);
--WHERE 	irs.inf_codigo IN (374);
```
#### Api recomendaciones seguimientos
```http
#### LOGIN
# @name login_interno
POST [http://172.16.80.32:4002/api/v1/auth_cge](http://172.16.80.32:4002/api/v1/auth_cge) HTTP/1.1
Content-type: application/json

{
    "usuario": "4755293",
    "password": "Pruebas"
}


#### SERVICES OBJETIVOS-AREA-UNIDAD
@token = {{login_interno.response.body.datos.token}}
@host = [http://172.16.22.234:7001/](http://172.16.22.234:7001/)
@path = informe-recomendaciones

### FindAll
GET {{host}}{{path}}/informe-recomendaciones-seguimientos?ire_estado=(1)&irs_estado=(1)&inf_codigo=(365) HTTP/1.1
Content-Type: application/json
Authorization: {{token}}

### FindOne
GET {{host}}{{path}}/informe-recomendaciones-seguimientos?ire_codigo=(213) HTTP/1.1
Content-Type: application/json
Authorization: {{token}}

### CREATE
POST {{host}}{{path}}/informe-recomendaciones-seguimientos HTTP/1.1
Content-Type: application/json
Authorization: {{token}}

{
    "ire_numero_recomendacion": "1.1",
    "ire_nombre": "Incorporar procedimientos de detección de necesidades referidas a mantenimiento, mejora, conservación de los bienes, ambientes y otros requerimientos para el buen funcionamiento de los hogares y albergues.",
    "ire_descripcion": "Incorporar procedimientos de detección de necesidades referidas a mantenimiento, mejora, conservación de los bienes, ambientes y otros requerimientos para el buen funcionamiento de los hogares y albergues, incorporando actividades de control que garantice la programación anual de los recursos financieros necesarios y se efectúen el mantenimiento, mejora y conservación de la infraestructura y mobiliario de los hogares y albergues de acogida administrados por el Servicio Regional de Gestión Social (SEREGES) - Yacuiba de manera oportuna, a efectos de que se brinde condiciones de habitabilidad para un desarrollo adecuado y una mejor estadía de las niñas, niños y adolescentes que se encuentran en dichos centros de acogida.",
    "inf_codigo": 372,
    "tre_codigo": 2,
    "eir_codigo": 1,
    "irs_fecha_inicio": "28/05/2024",
    "irs_fecha_fin": "01/12/2024",
    "irs_responsables": [
        {
            "per_nombre_completo": "JUAN PEREZ",
            "per_cargo": "CARGO 1"
        },
        {
            "per_nombre_completo": "PEDRO PEREZ",
            "per_cargo": "CARGO 2"
        }
    ],
    "irs_tareas_desarrollar": "El gerente nacional administratvio financiero, emitira ..."
}


### UPDATE
PUT {{host}}{{path}}/informe-recomendaciones-seguimientos HTTP/1.1
Content-Type: application/json
Authorization: {{token}}
```
#### 
```
--- REPORTES FORMATOS ---
RptPdfRecomendaciones.jrxml
SrptPdfRecomendacionesFormato1.jrxml
SrptPdfRecomendacionesFormato2.jrxml

s_token
s_inf_codigo
s_flag_formato
--------------------------
###  ------- OBTENER - REPORTE INFORME RECOMENDACIONES
  GET {{Host}}/informe-recomendaciones/reporte-recomendaciones?inf_codigo=(372)&flag_formato=(1,2) HTTP/1.1
  Authorization: {{AuthTokenInterno}}
  Content-Type: application/json



--- RESUMEN --------------
RptPdfResumen.jrxml

s_token
s_inf_codigo
-------------------------
###  ------- OBTENER - REPORTE RESUMEN EJECUTIVO
  GET {{Host}}/informes-resumen-ejecutivo/resumen?inf_codigo=(372) HTTP/1.1
  Authorization: {{AuthTokenInterno}}
  Content-Type: application/json
```