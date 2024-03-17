

--###  ------------------- ORGANIGRAMA - EL ORGANIGRAMA CON SUS ÁREAS UNIDADES

    select * from parametricas.lugares l

    select * from parametricas.tipos_lugares tl 

    select * from estructura_organizacional.organigramas o where o.org_codigo in (3)

    select * from estructura_organizacional.gestiones_organigramas go2 where go2.org_codigo in (3)

    select * from estructura_organizacional.areas_unidades au where au.org_codigo in (3) and au.aun_estado !=9

    ;

--###  ------------------- ORGANIGRAMA - GESTIONES ORGANIGRAMAS - AREAS UNIDADES -CARGOS ITEMS

    select * from estructura_organizacional.organigramas o where o.org_codigo in (10)   

    select * from estructura_organizacional.gestiones_organigramas go2 where go2.org_codigo in (3)

    select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (1)

    select * from estructura_organizacional.cargos_items ci where ci.aun_codigo in (1)

    select * from estructura_organizacional.cargos c where c.car_codigo in (1)

    select * from estructura_organizacional.items i where i.ite_codigo in (1)

    ;

--###  ------------------- CARGOS ITEM MOVIMIENTOS - CARGOS QUE FUERON MOVIDOS A OTRAS AREAS UNIDADES

    select *from parametricas.tipos_movimientos tm 

    select * from estructura_organizacional.cargos_item_movimientos cim 

    ;

--###  ------------------- FECHAS LIBRES DE GESTIONES - FECHAS, Y FERIADOS PARA UNA GESTION

    select * from parametricas.gestiones g 

    select * from parametricas.fechas_libres_gestiones flg where flg.ges_codigo in (3)

    select *from parametricas.estados e

    ;

--###  ------------------- ORGANIGRAMA - BUSCA ORGANIGRAMA CONSOLIDADO, CON SUS CARGOS ITEMS

    --encontrar el organigrama

    select *  from estructura_organizacional.organigramas o 

    left join estructura_organizacional.gestiones_organigramas go2 on go2.org_codigo  = o.org_codigo  

    where go2.ges_codigo in (3) and o.org_estado in(2)--consolidado

    --buscar las areas unidades con ese org_codigo no eliminadas

    select * from estructura_organizacional.areas_unidades au where au.org_codigo in (1) and au.aun_estado !=9 order by au.aun_codigo 

    --buscar para una determinada area unidad sus cargos items

    select *

    from estructura_organizacional.cargos_items ci 

    left join estructura_organizacional.cargos c on c.car_codigo =ci.car_codigo 

    left join estructura_organizacional.items i on i.ite_codigo =ci.ite_codigo

    where ci.aun_codigo in (211)

    ;

--###  ------------------- PEI - M_UESTRA EL ARBOL DE PEI

    select *from estructura_organizacional.areas_unidades au 

    select *from pei.plan_estrategico_institucional pei where pei.pei_codigo =1

    select *from pei.dimensiones d where d.pei_codigo =1

    --dentro pei

    select *from pei.objetivos_estrategicos oe where oe.dim_codigo in (1,2,3,4)

    select *from pei.objetivos_estrategicos oe where oe.oes_codigo in (1,2,3,4,5)

    select *from pei.estrategias e where e.oes_codigo in (1,2,3,4,5)

    select *from pei.acciones_estrategicas ae where ae.est_codigo in (1,2,3,4,5,6)

    select *from pei.acciones_estrategicas_gestiones aeg where aeg.aes_codigo in (1,2,3,4,5,6)

    --areas

    select *from pei.objetivos_estrategicos_areas oea where oea.oes_codigo  in (1,2,3,4,5)

    select *from pei.estrategias_areas ea where ea.est_codigo in (1,2,3,4,5,6)

    select * from pei.acciones_estrategias_areas aea where aea.aes_codigo in (1,2,3,4,5,6)

    --areas unidades en organigrama 

    select * from estructura_organizacional.areas_unidades au where au.org_codigo in (1)

    ;

--###  ------------------- ORGANIGRAMA - MUESTRA LAS ACTIVIDADES PARA UNA ÁREA UNIDAD

    select * from estructura_organizacional.gestiones_organigramas go2 where go2.ges_codigo in (3)

    select * from estructura_organizacional.organigramas o where o.org_codigo in (2)

    select * from estructura_organizacional.areas_unidades au where au.org_codigo in (2) and au.aun_codigo in (33)

    --poa actividades

    select * from estructura_poa.actividades a where a.act_codigo in (1)

    select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (25)

    ;

--###  ------------------- POAS - POAS OBJETIVOS, OBJETIVOS, ROL, ÁREA UNIDAD, FORMULARIOS, ACTIVIDADES Y VIATICOS, DENTRO DE UN POA

    select * from estructura_poa.area_unidad_responsables aur where aur.aun_codigo_ejecutora in (52)

    select * from estructura_poa.poas p where p.poa_codigo in (4,5,6)

    select * from estructura_poa.formularios f where f.for_codigo in (18,23,28)

    select * from estructura_poa.formularios_objetivos fo where fo.fob_codigo in (21,26,31)

    select * from estructura_poa.actividades a where a.act_codigo in (213,218,223)

    -- EL SERVICIO

    select * from parametricas.roles r where r.rol_codigo in(4)

    select * from estructura_poa.area_unidad_responsables aur where aur.rol_codigo in (4)

    select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (50)

    select * from estructura_poa.poas p where p.ges_codigo in (4) and p.poa_estado in (2)

    select * from parametricas.gestiones g 

    ;

--###  ------------------- FECHAS LIBRES GESTIONES - QUERYS DE FECHAS

    -- obtiene los dias de un año

    select

        g.ges_anio,

        DATE_PART('doy',

        ('31/12/' || g.ges_anio)::date) as dias_gestion

    from

        parametricas.gestiones g

    where

        g.ges_codigo in (3)

    -- cantidad de dias libres  

    select

        count(*) dias_libres_nac

    from

        parametricas.fechas_libres_gestiones flg

    where

        flg.ges_codigo in (3)

        and flg.lug_codigo = 10

    -- obtiene los dias libres por departamento

    select

        flg.lug_codigo,

        count(flg.lug_codigo) dias_libres_dep

    from

        parametricas.fechas_libres_gestiones flg

    where

        flg.ges_codigo in (3)

        and flg.lug_codigo in (7,8,9,1,2,6)

    group by

        flg.lug_codigo 

    -- obtiene todos los dias del año

    select

        generate_series(

              ('01/01/' || g.ges_anio)::date,

        --comienzo

              ('31/12/' || g.ges_anio)::date,

        --final

              '1 day') as serie_fechas

    from

        parametricas.gestiones g

    where

        g.ges_codigo in (3)

;

--###  ------------------- INICIO ACT POA - CAMBIO GLOBAL DE ESTADOS, POR ROL

    select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (25)

    select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (10) 

    select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_poa.inicios_actividades_adicional iaa where iaa.iac_codigo in (10)

    select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (25) 

    select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (18)

    select aci.aci_codigo ,aci.asi_codigo ,aci.aci_estado  from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (18)

    -- obtiene los estados de cada uno

    select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (25)

    select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (10)

    select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (24)

    select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (18)

    select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (83)

    select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (82)

    select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (81)

    select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (80)

;

--###  ------------------- INFORMES EMERGENTES Y RECOMENDACIONES- Y SUS INFORMES Y TIPOS DE TRABAJOS 

    select * from parametricas.tipos_trabajos tt

    select * from parametricas.especificacion_tipos_trabajo ett

    select * from ejecucion_poa.informes i where i.inf_codigo in (25,24)

    select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (9)

    select * from parametricas.informes_emergentes ie where ie.iem_codigo in (9,11)

    select * from ejecucion_poa.informe_recomendaciones ir 

;

--###  ------------------- INICIO ACTIVIDAD POA - REFERENTE A SUS INFORMES Y INFORMES EMERGENTES; Y TIPOS DE TRABAJOS

    select * from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (2)

    select * from estructura_poa.actividades a WHERE a.act_codigo in (58)

    select * from parametricas.tipos_trabajos tt where tt.ttr_codigo in (11)

    select * from parametricas.informes_emergentes ie where ie.ttr_codigo in (11)

    select * from ejecucion_poa.informes i where i.iap_codigo in (2)

;

--###  ------------------- FLUJOS ESTADOS EVOLUCION - Y SUS INFORMES, INF RECOMENDACIONES, INF EMERGENTES 

    select * from parametricas.flujos_estados_evolucion fee where fee.iem_codigo in (10)

    select * from parametricas.informes_emergentes ie where ie.iem_codigo in (10)

    select * from ejecucion_poa.informes i where i.inf_codigo in (25)

    select * from ejecucion_poa.informes_estados ie where ie.inf_codigo in (17)

    select * from ejecucion_poa.informe_recomendaciones ir where ir.inf_codigo in (17)

    select * from control_estados.estados_informes ei where ei.inf_codigo in (17)

;

--###  ------------------- INICIO ACTIVIDAD POA ASIGNACIONES - SUS ASIGNACIONES, ASIG CARGOS ITEM - ACT - INICIOS ACT

    select * from ejecucion_poa.inicio_actividad_poa_asignaciones iapa

    select * from ejecucion_poa.asignaciones a

    select * from ejecucion_poa.asignaciones_cargos_item aci 

    select * from estructura_poa.actividades a where a.act_codigo in (222)

    select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (11)

;

--###  ------------------- INFORMES - CAMBIO DE ESTADO A ANULACION Y SUSPENSIÓN

    -- Inicios Actividades iac_codigo(9)

    select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (9)

    -- Primer Informe

    select * from ejecucion_poa.informes i where i.iac_codigo in (9) order by i.inf_codigo desc--inf_codigo(32,26,25,24)

    -- Primer informe estados inf_codigo(32)

    select * from ejecucion_poa.informes_estados ie where ie.inf_codigo in (32)--nada

    -- Segundo informe estados inf_codigo(26)

    select * from ejecucion_poa.informes_estados ie where ie.inf_codigo in (26) order by ie.fecha_registro desc--ies_codigo(42,41,38,26)

    -- Primer informe recomendaciones inf_codigo(32)

    select * from ejecucion_poa.informe_recomendaciones ir2  where ir2.inf_codigo in (32)--nada

    -- Segundo informe recomendaciones inf_codigo(26)

    select * from ejecucion_poa.informe_recomendaciones ir2  where ir2.inf_codigo in (26)--nada

    -- Tercer informe recomendaciones inf_codigo(25)

    select * from ejecucion_poa.informe_recomendaciones ir2  where ir2.inf_codigo in (25)--ire_codigo(19)

    -- Estados Informes

    select * from control_estados.estados_informes ei2 where ei2.inf_codigo in (32)--CERO CAMBIOS DE ESTADO

    select * from control_estados.estados_informes ei2 where ei2.inf_codigo in (26)--CONSOLIDADO

    -- Primer Informe Emergente

    select * from parametricas.informes_emergentes ie where ie.iem_codigo in (10)

    -- Inicio Actividad Informe iac_codigo(9)

    select * from ejecucion_poa.inicio_actividad_informe iai where iai.iac_codigo in (9) 

;

