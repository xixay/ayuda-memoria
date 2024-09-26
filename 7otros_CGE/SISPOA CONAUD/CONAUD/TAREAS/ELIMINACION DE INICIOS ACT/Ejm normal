src/components/sispoa-actividades-formularios/component/sispoa-actividades.table.jsx
base=bd_cge_poa_conaud_local_b

#GESTION INSTITUCIONAL
act_numero=510.1902.34.1.24
Gerencia Departamental de Auditoría en Gobiernos Departamentales
sigla=GDB-GAD

##SISPOA##
510.1903.34
formulador_gerente=5491571


##Inicio Actividad Formularios##
entrar=GDB-GAD
buscar=510.1902.34.1.24
act_codigo =446
iap_codigo = 154
iac_codigo = 258
rol= GESTION INSTITUCIONAL
inicios_actividades, no este en wstado 22
inicio_actividad_poa, asignaciones, inicios_actividades_adicional,asignaciones_cargos_item, no esten es 2

edicion		1 x
verificado	3 x
aprobado	8 x
aprob sup	16x
ver adm conaud	17x



SELECT	a.act_codigo, iap.iap_codigo, ia.iac_codigo, iapa.iapa_codigo, asi.asi_codigo, aci.aci_codigo
FROM	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE	iap.iap_codigo = 154
;

|act_codigo|iap_codigo|iac_codigo|iapa_codigo|asi_codigo|aci_codigo|
|----------|----------|----------|-----------|----------|----------|
|446       |154       |258       |154        |161       |764       |
|446       |154       |258       |154        |161       |763       |
|446       |154       |258       |154        |161       |762       |
|446       |154       |258       |154        |161       |761       |
|446       |154       |258       |154        |161       |760       |
