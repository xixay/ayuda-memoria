-- FROMULADOR 4319459
SELECT *
FROM estructura_poa.actividades a
WHERE a.act_numero = '520.1202.270.1.24'
;

SELECT *
FROM ejecucion_actividades.inicios_actividades ia
WHERE ia.iac_codigo_control LIKE 'GLEP02G21'
;