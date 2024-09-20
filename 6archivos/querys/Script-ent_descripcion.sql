-- AGREGAR COLUMNA A ACTIVIDADES
ALTER TABLE estructura_poa.actividades
ADD COLUMN ent_descripcion VARCHAR;

-- COMENTARIO PARA LA COLUMNA ent_descripcion EN estructura_poa.actividades
COMMENT ON COLUMN estructura_poa.actividades.ent_descripcion IS 'Descripción de la entidad relacionada a la actividad';

-- AGREGAR COLUMNA A INFORMES UAIS
ALTER TABLE ejecucion_informes.informes_uai
ADD COLUMN ent_descripcion VARCHAR;

-- COMENTARIO PARA LA COLUMNA ent_descripcion EN ejecucion_informes.informes_uai
COMMENT ON COLUMN ejecucion_informes.informes_uai.ent_descripcion IS 'Descripción de la entidad relacionada al informe UAI';

SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (2982)
ORDER BY a.act_codigo DESC
;

SELECT 	*
FROM 	ejecucion_informes.informes_uai iu 
ORDER BY iu.iua_codigo DESC
;