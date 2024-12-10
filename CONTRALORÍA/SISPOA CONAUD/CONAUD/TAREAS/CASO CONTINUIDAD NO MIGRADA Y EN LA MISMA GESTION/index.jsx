'use client';
// ----------- IMPORTS REACT CORE
import React, { useEffect, useState } from 'react';
// ----------- IMPORTS THIRD-PARTY LIB
import { Accordion, AccordionTab } from 'primereact/accordion';
// ----------- IMPORTS OTHERS
import { t } from '@/utils/textos';
import { useToast } from '@/plugins/Notification/toast';
import { EstadoType, ActionType, InicioActividadType } from '@/constants/environment.enum';
import { useReduxSessionData } from '@/hooks/redux-session-data.hook';
// ----------- IMPORTS COMPONENTS
import IniciosActividadesForm from './component/inicios-actividades.form';
import IniciosActividadesFormContinuoNoMigrado from './component/inicios-actividades.form-continuo-no-migrado';
import IniciosActividadesAdicionalForm from '../inicios-actividades-adicional/component/inicios-actividades-adicional.form';
import AsignacionesCargosItemTable from '../asignaciones-cargos-item/component/asignaciones-cargos-item.table';
import IniciosActividadesSearchInforme from './component/inicios-actividades.searchinforme';
import ApoyoInicioActividadPoaComisionTable from '@/components/apoyo-inicio-actividad-poa/component/apoyo-inicio-actividad-poa-comision.table';
// ----------- IMPORTS HOOKS
import { useFindAllInicioActividadPoaAsignaciones } from '@/hooks/inicio-actividad-poa-asignaciones.hook';
import { useActividadMigradaConaud } from '@/hooks/actividad-migrada-conaud.hook';
import { useAsignacionesCargosItemContext } from '../asignaciones-cargos-item/context/asignaciones-cargos-item.context';

/**
 * @description Componente INICIOS ACTIVIDADES
 * @param title (Opcional) Titulo
 * @param dataRow (Requerido) Row item de SISPOA-ACTIVIDADES
 * @returns <component></component>
 */

const IniciosActividades = ({
  title = 'Inicios Actividades',
  actividadObject,
  getSispoaActividad,
  setFlagVerificar,
}) => {
  // ----------- REDUX
  const { ReduxGesCodigo } = useReduxSessionData();
  // ----------- STATE VARIABLES
  const toast = useToast();
  const { ToastComponent } = useToast();
  const [flagAction, setFlagAction] = useState(0);
  const [activeAccordionTab, setActiveAccordionTab] = useState();
  const {
    inicioActividadPoaAsignaciones,
    loadingInicioActividadPoaAsignaciones,
    fetchFindAllInicioActividadPoaAsignaciones,
  } = useFindAllInicioActividadPoaAsignaciones();
  const { accumHoras } = useAsignacionesCargosItemContext();
  const [showSearchInforme, setShowSearchInforme] = useState(false);
  const [informeSeguimiento, setInformeSeguimiento] = useState({});
  const [infCodigo, setInfCodigo] = useState(0);
  const [iacCodigo, setIacCodigo] = useState(0);
  const { fetchFindAllActividadMigradaConaud } = useActividadMigradaConaud();

  // ----------- SECTION METHODS
  const initComponent = async () => {
    if (actividadObject?.inicio_actividad_poa && actividadObject?.array_inicio_actividad_poa?.length == 0) {
      setFlagAction(ActionType.CREATE);
      if (actividadObject?.ett_codigo == InicioActividadType.F2) {
        setActiveAccordionTab();
        setShowSearchInforme(true);
      } else {
        setActiveAccordionTab(0);
      }
    } else if (actividadObject?.inicio_actividad_poa?.iap_estado == EstadoType.EDICION) {
      setFlagAction(ActionType.UPDATE);
    } else {
      setFlagAction(ActionType.DETAIL);
    }
  };

  const checkIfGetInformeSeguimiento = async () => {
    if (actividadObject?.ett_codigo == InicioActividadType.F2) {
      let informeSeguimientoArray = await fetchFindAllActividadMigradaConaud(
        `/migrado?amc_estado=(1)&iac_codigo_migrado=(${actividadObject?.inicio_actividad_poa?.iac_codigo})`
      );
      setInformeSeguimiento(informeSeguimientoArray[0]);
    }
  };

  // ----------- useEffects
  useEffect(() => {
    console.log('actividadObject::', actividadObject.aun_sigla_ejecutora);
    if (Object.keys(actividadObject).length > 0) {
      initComponent();
    }
  }, [actividadObject]);

  useEffect(() => {
    if (![0, ActionType.CREATE].includes(flagAction)) {
      fetchFindAllInicioActividadPoaAsignaciones(`?iap_codigo=(${actividadObject.inicio_actividad_poa.iap_codigo})`);
      checkIfGetInformeSeguimiento();
    }
  }, [flagAction]);

  useEffect(() => {
    if (!showSearchInforme && Object.keys(informeSeguimiento).length == 2) {
      setActiveAccordionTab(0);
    } else if (showSearchInforme && Object.keys(informeSeguimiento).length == 2 && flagAction == ActionType.CREATE) {
      setActiveAccordionTab();
    }
  }, [showSearchInforme]);

  return (
    <>
      {ToastComponent}
      <div className='m-0 p-0'>
        {showSearchInforme && (
          <IniciosActividadesSearchInforme
            actividadObject={actividadObject}
            setShowSearchInforme={setShowSearchInforme}
            setInformeSeguimiento={setInformeSeguimiento}
            setInfCodigo={setInfCodigo}
            setIacCodigo={setIacCodigo}
          />
        )}
        <Accordion activeIndex={activeAccordionTab} onTabChange={(e) => setActiveAccordionTab(e.index)}>
          <AccordionTab header='Sección I (Formulario)' disabled={showSearchInforme}>
            <>
              {JSON.stringify(actividadObject)}
              {actividadObject?.inicio_actividad_poa.iac_migrado === undefined && actividadObject?.tipact_codigo == 2 && actividadObject?.ges_codigo == ReduxGesCodigo? (
                <div>
                  <IniciosActividadesFormContinuoNoMigrado
                    toast={toast}
                    flagAction={flagAction}
                    setFlagAction={setFlagAction}
                    actividadObject={actividadObject}
                    infCodigo={infCodigo}
                    iacCodigo={iacCodigo}
                  />
                </div>
              ) : (
                  <IniciosActividadesForm
                    toast={toast}
                    flagAction={flagAction}
                    setFlagAction={setFlagAction}
                    getSispoaActividad={getSispoaActividad}
                    actividadObject={actividadObject}
                    informeSeguimiento={informeSeguimiento}
                    setFlagVerificar={setFlagVerificar}
                    infCodigo={infCodigo}
                    iacCodigo={iacCodigo}
                    setShowSearchInforme={setShowSearchInforme}
                    isViewMode={
                      [2, 4].includes(actividadObject?.inicio_actividad_poa.tia_codigo) &&
                      actividadObject?.inicio_actividad_poa.iap_estado === 1 &&
                      actividadObject.inicio_actividad_poa.iac_migrado !== undefined &&
                      !actividadObject.inicio_actividad_poa.iac_migrado
                    }
                  />
              )}
            </>
          </AccordionTab>
          <AccordionTab
            header='Sección II (Información Adicional)'
            disabled={[0, ActionType.CREATE].includes(flagAction)}
          >
            {actividadObject.inicio_actividad_poa && (
              <IniciosActividadesAdicionalForm
                toast={toast}
                flagAction={flagAction}
                iacCodigo={actividadObject.inicio_actividad_poa.iac_codigo}
                isViewMode={
                  [2, 4].includes(actividadObject?.inicio_actividad_poa.tia_codigo) &&
                  actividadObject?.inicio_actividad_poa.iap_estado === 1 &&
                  actividadObject.inicio_actividad_poa.iac_migrado !== undefined &&
                  !actividadObject.inicio_actividad_poa.iac_migrado
                }
              />
            )}
          </AccordionTab>
          <AccordionTab
            header='Sección III (Asignación de Personal)'
            disabled={[0, ActionType.CREATE].includes(flagAction)}
          >
            {loadingInicioActividadPoaAsignaciones ? (
              'Cargando...'
            ) : inicioActividadPoaAsignaciones.length > 0 ? (
              <AsignacionesCargosItemTable
                toast={toast}
                asiCodigo={inicioActividadPoaAsignaciones[0].asi_codigo}
                actividadHorasPlanificadas={actividadObject.act_horas_planificadas}
                flagAction={flagAction}
                aunCodigoEjecutora={actividadObject.aun_codigo_ejecutora}
                aunAreaNombre={actividadObject.aun_nombre_ejecutora}
                title={'Asignaciones Cargos Item'}
              />
            ) : (
              'Error'
            )}
          </AccordionTab>
          {actividadObject?.aun_sigla_ejecutora && actividadObject.aun_sigla_ejecutora.match(/SCAT.*/) && false && (
            <AccordionTab
              header='Sección IV (Apoyo de Personal)'
              disabled={[0, ActionType.CREATE].includes(flagAction)}
            >
              <ApoyoInicioActividadPoaComisionTable
                PropNotPage={true}
                PropIapCodigo={actividadObject?.inicio_actividad_poa?.iap_codigo}
              />
            </AccordionTab>
          )}
        </Accordion>
      </div>
    </>
  );
};

export default IniciosActividades;
