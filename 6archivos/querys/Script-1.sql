        WITH usuarios AS (
          SELECT
          t.usu_codigo,
          t.usu_usuario,
          t.usu_contrasenia,
          TO_CHAR(t.usu_fecha_expiracion, 'dd/mm/yyyy') as usu_fecha_expiracion,
          t.pernat_codigo,
          p.pernat_nombres || ' ' || p.pernat_apellido_paterno || ' ' || p.pernat_apellido_materno AS pernat_nombre_completo,
          p.pernat_documento_identidad,
          p.pernat_correo_electronico,
          t.usu_estado,
          e.est_color,
          e.est_nombre AS usu_estado_descripcion,
          TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
        FROM autenticacion.usuario t
        LEFT JOIN parametricas.estados e ON e.est_codigo = t.usu_estado
        LEFT JOIN controleg_persona.persona_natural p ON t.pernat_codigo = p.pernat_codigo
        --LEFT JOIN autenticacion.usuario_entidad ue USING (usu_codigo)
        --LEFT JOIN controleg_persona.entidad ent USING (ent_codigo)
        WHERE TRUE
        and t.usu_estado in (1,2)
        ORDER by usu_codigo desc
        limit 10
        ),
        roles AS (
        SELECT
              tabla_subconsulta.usu_codigo,
              array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
          FROM (
            SELECT ur.usu_codigo, r.rol_nombre,  tr.tiprol_nombre  ,r.tiprol_codigo, r.rol_codigo
            FROM autenticacion.usuario_rol ur
            JOIN usuarios USING (usu_codigo)
            JOIN autenticacion.rol r USING (rol_codigo)
            LEFT JOIN parametricas.tipo_rol tr USING (tiprol_codigo)
          ) tabla_subconsulta
          GROUP BY tabla_subconsulta.usu_codigo
        ),
        entidades as (
          SELECT
              tabla_subconsulta.usu_codigo,
              array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
          FROM (
            SELECT u.usu_codigo, ue.usuent_codigo, ue.ent_codigo, e.ent_descripcion
            FROM autenticacion.usuario_entidad ue
            JOIN usuarios u USING (usu_codigo)
            LEFT JOIN public.entidad  e USING (ent_codigo)
            where ue.usuent_estado > 0
            order by ue.usuent_codigo desc
          ) tabla_subconsulta
          GROUP BY tabla_subconsulta.usu_codigo
        )
        SELECT u.*,
        COALESCE (r.conjunto,'[]') AS roles_codigos,
        COALESCE (e.conjunto, '[]') entidades
        FROM usuarios u
        LEFT JOIN roles r USING (usu_codigo)
        LEFT JOIN entidades e USING (usu_codigo)
        ;