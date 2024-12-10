'use client';
// ----------- IMPORTS CORE
import React, { useEffect } from 'react';
import { useForm } from 'react-hook-form';
import { useReduxSessionData } from '@/hooks/redux-session-data.hook';
// ----------- IMPORTS THIRD-PARTY LIB
import { Button } from 'primereact/button';
// ----------- IMPORTS CUSTOM CONTROLLERS
import DropdownController from '@/components/common/ControllerDropdown';
import InputNumberController from '@/components/common/ControllerInputNumber';
import CalendarController from '@/components/common/ControllerCalendar';
import InputController from '@/components/common/ControllerInputText';
import InputTextAreaController from '@/components/common/ControllerInputTextArea';
// ----------- IMPORTS OTHERS
import { t } from '@/utils/textos';
import { ActionType } from '@/constants/environment.enum';
import { RolSistema } from '@/constants/environment.enum';
import { setFormData } from '@/utils/functions';
import { useValidationRules } from '@/utils/validationRules';
// ----------- IMPORTS HOOKS
import { useFindAllEntidades } from '@/hooks/parametricas/entidades.hook';
import { useFindAllUsuarios } from '@/hooks/parametricas/usuarios.hook';
import { useFindAllPersonaCargosItem } from '@/hooks/parametricas/cargos-items.hook';
import { useFechasLibresGestiones } from '@/hooks/fechas-libres-gestiones.hook';
import { useFindAllAreaUnidadResponsables } from '@/hooks/area-unidad-responsables.hook';


const IniciosActividadesFormContinuoNoMigrado = ({ toast, flagAction, setFlagAction, actividadObject, infCodigo, iacCodigo }) => {
  // ----------- SECTION VARIABLES
  const { entidades, loadingEntidades, fetchFindAllEntidades } = useFindAllEntidades();
  const { usuarios, loadingUsuarios, fetchFindAllUsuarios } = useFindAllUsuarios();
  const { fetchFindAllAreaUnidadResponsables } = useFindAllAreaUnidadResponsables();
  const { personasCargosItem, loadingCargosItem, fetchFindAllCargosItemDependientes, error } =
    useFindAllPersonaCargosItem('');
  const {
    fechasLibresGestiones,
    loadingFechasLibresGestiones,
    errorFechasLibresGestiones,
    fetchFindAllFechasLibresGestiones,
  } = useFechasLibresGestiones();
  let usuariosAreaUnidadEjec = personasCargosItem.filter((f) => f.item_nombre_persona_asignada != 'ACÉFALO');
  const rules = useValidationRules();
  const { ReduxGesCodigo, ReduxPoaCodigo } = useReduxSessionData();
  console.log("🐱====> ~ ReduxGesCodigo:", ReduxGesCodigo)
  const {
    control,
    setValue,
    getValues,
    formState: { errors },
    handleSubmit,
    reset,
  } = useForm({});
  // ----------- SECTION METHODS
  const initForm = async () => {
    setValue('ent_codigo', actividadObject.ent_codigo);
    setValue(
      'iac_objeto',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_objeto
        ? actividadObject.actividad_object.conaud_detalle.auditoria_objeto
        : ''
    );
    setValue(
      'iac_objetivo',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_objetivo
        ? actividadObject.actividad_object.conaud_detalle.auditoria_objetivo
        : ''
    );
    setValue(
      'iac_alcance',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_periodo
        ? actividadObject.actividad_object.conaud_detalle.auditoria_periodo
        : ''
    );
    setValue(
      'iac_fecha_inicio_historico',
      actividadObject?.actividad_object?.conaud_detalle?.actividad_fecha_inicio
        ? actividadObject.actividad_object.conaud_detalle.actividad_fecha_inicio
        : ''
    );
    setValue(
      'iac_fecha_inicio',
      actividadObject?.actividad_object?.conaud_detalle?.actividad_fecha_inicio
        ? actividadObject.actividad_object.conaud_detalle.actividad_fecha_inicio
        : ''
    );
    setValue(
      'iac_dias_habiles',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_dias_habiles
        ? actividadObject.actividad_object.conaud_detalle.auditoria_dias_habiles
        : ''
    );
    setValue(
      'iac_dias_calendario',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_dias_calendario
        ? actividadObject.actividad_object.conaud_detalle.auditoria_dias_calendario
        : ''
    );
    setValue(
      'iac_fecha_emision',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_fecha_emision
        ? actividadObject.actividad_object.conaud_detalle.auditoria_fecha_emision
        : ''
    );
    setValue(
      'iac_fecha_borrador',
      actividadObject?.actividad_object?.conaud_detalle?.auditoria_fecha_entrega
        ? actividadObject.actividad_object.conaud_detalle.auditoria_fecha_entrega
        : ''
    );
    setValue('ttr_codigo', actividadObject.ttr_codigo);
    setValue('iac_mes_inicio', actividadObject.act_fecha_inicio);
    setValue('iac_mes_fin', actividadObject.act_fecha_fin);
    await fetchFindAllCargosItemDependientes(
      actividadObject?.aun_codigo_ejecutora ? `?aun_codigo=(${actividadObject?.aun_codigo_ejecutora})` : ''
    );
    switch (flagAction) {
      case ActionType.CREATE:
        console.log('InitForm CREATE');
        const result = await fetchFindAllAreaUnidadResponsables(
          `?poa_codigo=(${ReduxPoaCodigo})&aun_codigo_ejecutora=(${actividadObject?.aun_codigo_ejecutora})`
        );
        const gerente = result?.find((a) => a.rol_codigo == RolSistema.APROBADOR).per_codigo;
        const responsable = result?.find((a) => a.rol_codigo == RolSistema.FORMULADOR_GERENTE).per_codigo;
        setValue('per_codigo_gerente', gerente);
        setValue('per_codigo_responsable', responsable);
        break;
      case ActionType.UPDATE:
        console.log('InitForm UPDATE');
        setFormData(valuesForm, setValue);
        break;
      case ActionType.DISABLE:
        console.log('InitForm DISABLE');
        setFormData(valuesForm, setValue);
        break;
      case ActionType.ENABLE:
        console.log('InitForm ENABLE');
        setFormData(valuesForm, setValue);
        break;
      case ActionType.DETAIL:
        console.log('InitForm DETAIL');
        setFormData(valuesForm, setValue);
        break;
      default:
        console.log('InitForm ERROR');
        break;
    }
  };
  const onSubmitForm = async (dataForm) => {
    console.log("🐱==xx1==> ~ dataForm:", dataForm)

  }
  const calculofechas = async () => {
    const iacFechaInicio = moment(
      getValues('iac_fecha_inicio'),
      ['YYYY-MM-DDTHH:mm:ss.SSSZ', 'DD/MM/YYYY'],
      true
    ).format('DD/MM/YYYY');
    const iacDiasDuracion = getValues('iac_dias_duracion');

    if (iacFechaInicio && iacDiasDuracion) {
      if ([3, 9].includes(ttrCodigo)) {
        fetchFindAllFechasLibresGestiones(
          `/fechas_datos?ges_codigo=(${gesCodigo})&lug_codigo=(${lugCodigo})&fecha_inicio=(${iacFechaInicio})&dias_habiles=(${iacDiasDuracion})&cantidad_dias=(45)`
        );
      } else {
        fetchFindAllFechasLibresGestiones(
          `/fechas_datos?ges_codigo=(${gesCodigo})&lug_codigo=(${lugCodigo})&fecha_inicio=(${iacFechaInicio})&dias_habiles=(${iacDiasDuracion})&cantidad_dias=(150)`
        );
      }
    }
  };
  // ----------- useEffects
  useEffect(() => {
    initForm();
  }, []);
  return (
    <>
      <div>======================{JSON.stringify(actividadObject)}</div>
      <form onSubmit={handleSubmit(onSubmitForm)} className='mt-5'>
        <div className='grid p-fluid'>
          <div className='field col-12 md:col-12'>
            <DropdownController
              name='ent_codigo'
              control={control}
              label='Entidad'
              options={entidades}
              optionValue='ent_codigo'
              optionLabel='ent_descripcion'
              disabled={true}
            />
          </div>
          <div className='field col-12 md:col-6'>
            <DropdownController
              name='per_codigo_gerente'
              control={control}
              rules={rules.required()}
              label='Gerente Deptal./ Principal/ SCST/ GNAL.*'
              options={usuarios}
              optionValue='per_codigo'
              optionLabel='per_nombre_completo'
              disabled={true}
            />
          </div>
          <div className='field col-12 md:col-6'>
            <DropdownController
              name='per_codigo_responsable'
              control={control}
              rules={rules.required()}
              label='Gerente Responsable Auditoria*'
              options={usuariosAreaUnidadEjec}
              optionValue='per_codigo'
              optionLabel='item_nombre_persona_asignada'
              disabled={true}
            />
          </div>
          <div className='field col-12 md:col-12'>
            <div className='font-normal'>
              <span className='font-semibold'>Objeto POA : </span>
              <span className='text-600'>{actividadObject.act_objeto}</span>
            </div>
          </div>
          <div className='field col-12 md:col-12'>
            <InputTextAreaController
              autoResize={true}
              name='iac_objeto'
              control={control}
              rules={rules.required()}
              label='Objeto*'
              rows={2}
              disabled={true}
            // disabled={disableForm | isContinuidad}//Todo: revisar disable
            />
          </div>
          <div className='field col-12 md:col-12'>
            <div className='font-normal'>
              <span className='font-semibold'>Objetivo POA : </span>
              <span className='text-600'>{actividadObject.act_objetivo}</span>
            </div>
          </div>
          <div className='field col-12 md:col-12'>
            <InputTextAreaController
              autoResize={true}
              name='iac_objetivo'
              control={control}
              rules={rules.required()}
              label='Objetivo*'
              rows={2}
              disabled={true}
            // disabled={disableForm | isContinuidad}//Todo: revisar disable
            />
          </div>
          <div className='field col-12 md:col-8'>
            <div className='font-normal'>
              <span className='font-semibold'>Alcance POA : </span>
              <span className='text-600'>{actividadObject.act_alcance}</span>
            </div>
          </div>
          <div className='field col-12 md:col-6'>
            <InputController
              name='iac_alcance'
              control={control}
              rules={rules.required()}
              label='Alcance*'
              disabled={true}//Todo: revisar disable
            // disabled={disableForm | isContinuidad}
            />
          </div>
          <div className='field col-12 md:col-6'>
            <CalendarController
              name='iac_fecha_inicio_historico'
              control={control}
              label='Fecha de Inicio Histórico'
              editable={true}
            // disabled={disableForm}//Todo: revisar disable
            />
          </div>
          <div className='field col-12 md:col-6'>
            <CalendarController
              name='iac_fecha_inicio'
              control={control}
              label='Fecha de Inicio*'
              rules={rules.dateESLocationFormat()}
              editable={true}
            // disabled={disableForm}//Todo: revisar disable
            />
          </div>
          <div className='field col-12 md:col-5'>
            <InputNumberController
              name='iac_dias_duracion'
              control={control}
              rules={rules.required()}
              label='Días de duración*'
            // disabled={disableForm}//Todo: revisar disable
            />
          </div>
          <div className='field col-12 md:col-1'>
            <div className='flex gap-2'>
              <Button
                type='button'
                onClick={() => calculofechas()}
                icon='pi pi-stopwatch'
                severity='primary'
                tooltip='Calcular Días Hábiles y Calendario'
                tooltipOptions={{
                  position: 'top',
                  event: 'hover',
                  mouseTrack: true,
                  autoHide: true,
                  showDelay: 300,
                }}
              />
            </div>
          </div>
          <div className='field col-12 md:col-3'>
            <InputController
              name='iac_dias_habiles'
              control={control}
              rules={{}}
              label='Habiles'
            />
          </div>
          <div className='field col-12 md:col-3'>
            <InputController
              name='iac_dias_calendario'
              control={control}
              rules={{}}
              label='Calendario'
            />
          </div>
          <div className='field col-12 md:col-3'>
            <CalendarController
              name='iac_mes_inicio'
              control={control}
              label='Mes Inicio*'
              rules={rules.required()}
              view='month'
              dateFormat='mm/yy'
            />
          </div>
          <div className='field col-12 md:col-3'>
            <CalendarController
              name='iac_mes_fin'
              control={control}
              label='Mes Fin*'
              rules={rules.required()}
              view='month'
              dateFormat='mm/yy'
            />
          </div>
          <div className='field col-12 md:col-6'>
            <CalendarController
              name='iac_fecha_borrador'
              control={control}
              label='Fecha Entrega Proyecto de informe en Borrador*'
              rules={rules.dateESLocationFormat()}
            />
          </div>
          <div className='field col-12 md:col-6'>
            <CalendarController
              name='iac_fecha_emision'
              control={control}
              label='Fecha Emisión SubContralor'
              rules={rules.dateESLocationFormat()}
            />
          </div>
          <div className='field col-12 md:col-12'>
            <InputTextAreaController
              autoResize={true}
              name='iac_observaciones'
              control={control}
              rules={{}}
              label='Justificación'
              rows={2}
            // disabled={disableForm}//Todo: revisar disable
            />
          </div>
        </div>
      </form>
    </>
  );
};

export default IniciosActividadesFormContinuoNoMigrado;
