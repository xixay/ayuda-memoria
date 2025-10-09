SELECT	
		au.aun_sigla, au.aun_codigo ,
		a.act_numero, a.act_codigo, a.act_estado,
		po.pobj_codigo, po.pobj_estado, po.poa_codigo,
		oau.oau_codigo, oau.oau_estado 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo 
WHERE 	TRUE
		AND a.act_codigo IN (2568)
;



----------------
        SELECT
              t.act_codigo,
              t.act_descripcion,
              t.act_cantidad,
              TO_CHAR(t.act_fecha_inicio, 'dd/mm/yyyy') as act_fecha_inicio,
              TO_CHAR(t.act_fecha_fin, 'dd/mm/yyyy') as act_fecha_fin,
              t.act_objeto,
              t.act_objetivo,
              t.act_alcance,
              t.act_horas_planificadas,
              t.act_estado,
              t.act_no_planificado,
              t.act_codigo_anterior,
              t.act_codigo_bolsa,
              --fo.for_codigo, -- COMENTADO PORQUE YA NO SE UTILIZARA LA RELACIÓN
              ge.ges_codigo,
              pobj.pobj_numero,
              aune.aun_numero,
              aune.aun_estado,
              pr.pro_numero,
              t.act_correlativo,
              ge.ges_anio,
              t.act_numero,
              CONCAT_WS(' - ', t.act_numero, t.act_descripcion)AS act_num_desc,
              e.est_color,
              e.est_nombre AS act_estado_descripcion,
              t.ttr_codigo,
              tt.ttr_sigla,
              tt.ttr_inicial,
              tt.ett_codigo,
              ett.ett_nombre,
              t.ume_codigo,
              um.ume_descripcion,
              t.ent_codigo,
              t.ent_descripcion,
              t.fob_codigo,
              t.tipact_codigo,
              ta.tipact_descripcion AS act_tipact_descripcion,
              t.cac_codigo,
              t.sec_codigo,
              se.sec_descripcion,
              ca.cac_descripcion AS act_cac_descripcion,
              t.aun_codigo_supervisora,
              auns.aun_sigla AS aun_sigla_supervisora,
              auns.aun_inicial AS aun_inicial_supervisora,
              CONCAT_WS(' - ', auns.aun_nombre, auns.aun_sigla)AS aun_nombre_supervisora,
              t.act_ejecucion_conaud,
              t.aun_codigo_ejecutora,
              t.aun_codigo_ejecutora AS aun_codigo_ejecutora_actividad,
              t.pobj_codigo,
              aune.aun_sigla AS aun_sigla_ejecutora,
              aune.aun_inicial AS aun_inicial_ejecutora,
              aune.lug_codigo,
              CONCAT_WS(' - ', aune.aun_nombre, aune.aun_sigla)AS aun_nombre_ejecutora,
              COALESCE(aa.act_codigo_apoyo, 0) AS act_codigo_apoyo,
              COALESCE(aa.act_codigo_ejecucion, 0) AS act_codigo_ejecucion,
              t.act_justificacion,
              t.iac_codigo_apoyo,
              CONCAT_WS(' | ', ge2.ges_anio, ia.iac_codigo_control, ia.iac_objetivo) AS iac_concatenado,
              ia.iac_codigo_control,
              actv.avi_estado,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
              t.act_denuncia,
              pobj.poa_codigo,
              aune.cau_codigo,
              t.act_codigo,
              t.caa_codigo,
              caa.caa_nombre,
              t.cfa_codigo,
              cfa.cfa_nombre,
              t.cga_codigo,
              cga.cga_nombre,
              t.cca_codigo,
              cca.cca_nombre
        FROM  estructura_poa.actividades t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.act_estado
              LEFT JOIN parametricas.unidades_medidas um ON t.ume_codigo = um.ume_codigo
              LEFT JOIN parametricas.tipos_actividades ta ON t.tipact_codigo = ta.tipact_codigo
              LEFT JOIN parametricas.clasificacion_actividades ca ON t.cac_codigo = ca.cac_codigo
              LEFT JOIN parametricas.sector se ON t.sec_codigo = se.sec_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
              LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
              LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON t.caa_codigo = caa.caa_codigo
              LEFT JOIN parametricas.clasificacion_funcion_actividad cfa ON t.cfa_codigo = cfa.cfa_codigo
              LEFT JOIN parametricas.clasificacion_grupo_actividad cga ON t.cga_codigo = cga.cga_codigo
              LEFT JOIN parametricas.clasificacion_control_actividad cca ON t.cca_codigo = cca.cca_codigo
              LEFT JOIN estructura_organizacional.areas_unidades aune ON t.aun_codigo_ejecutora = aune.aun_codigo
              LEFT JOIN estructura_organizacional.areas_unidades auns ON t.aun_codigo_supervisora = auns.aun_codigo
              LEFT JOIN estructura_poa.actividades_viaticos actv ON t.act_codigo = actv.avi_codigo
              LEFT JOIN estructura_poa.actividades_apoyo aa ON t.act_codigo = aa.act_codigo AND aa.aap_estado = 1
              LEFT JOIN estructura_poa.poas_objetivos pobj ON t.pobj_codigo = pobj.pobj_codigo
              LEFT JOIN pei.programas pr ON pobj.pro_codigo = pr.pro_codigo
              LEFT JOIN estructura_poa.poas po ON pobj.poa_codigo = po.poa_codigo
              LEFT JOIN parametricas.gestiones ge ON po.ges_codigo = ge.ges_codigo
              LEFT JOIN ejecucion_actividades.inicios_actividades ia ON t.iac_codigo_apoyo = ia.iac_codigo
              LEFT JOIN parametricas.gestiones ge2 ON ge2.ges_codigo = ia.ges_codigo
        WHERE TRUE
              AND t.act_codigo IN (2579)
              AND t.act_estado IN (2)
              AND t.aun_codigo_ejecutora IN (1,17,21,31,36,41,44,65,66) -- PARA FILTRO DE AREA UNIDAD EJECUTORA VIA ACTIVIDAD
               -- PARA FILTRO DE AREA UNIDAD EJECUTORA QUE NO ESTE EN ESTADO 9
              AND po.poa_codigo IN (3)
        ORDER BY t.act_codigo DESC
        ;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT
      t.aur_codigo,
      t.aur_notificacion,
      t.poa_codigo,
      po.poa_descripcion,
      au.cau_codigo,
      t.aun_codigo_ejecutora,
      -- au.aun_nombre,
      CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_nombre,
      t.aun_codigo_rol,
      -- au_rol.aun_nombre AS aun_nombre_rol,
      CONCAT_WS(' - ', au_rol.aun_nombre, au_rol.aun_sigla) AS aun_nombre_rol,
          t.rol_codigo,
          ro.rol_nombre,
          t.per_codigo,
          t.cro_codigo,
          cr.cro_descripcion,
          t.usuario_registro AS usuario,
          t.aur_estado,
          e.est_color,
          e.est_nombre AS aur_estado_descripcion
FROM  estructura_poa.area_unidad_responsables t
      LEFT JOIN parametricas.estados e ON e.est_codigo = t.aur_estado
      LEFT JOIN estructura_poa.poas po ON po.poa_codigo = t.poa_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = t.aun_codigo_ejecutora
      LEFT JOIN estructura_organizacional.areas_unidades au_rol ON au_rol.aun_codigo = t.aun_codigo_rol
      LEFT JOIN parametricas.roles ro ON ro.rol_codigo = t.rol_codigo
      LEFT JOIN parametricas.clasificacion_rol cr ON cr.cro_codigo = t.cro_codigo
WHERE TRUE
      AND t.aur_estado IN (1)
      AND t.poa_codigo IN (3)
      AND t.rol_codigo IN (2, 3, 4, 5, 6)
      AND t.per_codigo IN (1914)
--      AND au.aun_codigo IN (3)--Para este
ORDER BY t.aur_codigo DESC, t.fecha_registro DESC
;

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
;