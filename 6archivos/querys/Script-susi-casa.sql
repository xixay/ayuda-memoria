-- EMPRESA UNIPERSONAL
select 	* 
from 	controleg_persona.empresa_unipersonal eu 
where	true
--		and eu.empuni_codigo in (49)
--		and eu.perjur_codigo in (127)
--		and eu.pernat_codigo in (106)
order by eu.empuni_codigo desc;
--limit 16;
-- ENTIDADES
select 	* 
from 	controleg_persona.entidad e   
where	true 	
--		and e.ent_codigo in (1139)
order by e.ent_codigo  desc;
--limit 16;
-- PERSONA JURIDICA
select 	* 
from 	controleg_persona.persona_juridica pj  
where	true 	
--		and pj.perjur_codigo in (1)
--		and pj.perjur_nit like '54%'
--		and pj.perjur_sigla  like 'siga'
--		and pj.tpj_codigo in (1)
order by pj.perjur_codigo desc;
--limit 16;
-- PERSONA RESPONSABLE
select 	* 
from 	controleg_persona.persona_responsable pr  
where	true 	
--		and a.act_numero = '00.1601.110.2.24'
--		and a.act_codigo in (1121)
order by pr.perres_codigo desc 
limit 16;
-- REPRESENTANTE LEGAL
select 	* 
from 	controleg_persona.representante_legal rl 
where	true 	
--		and a.act_numero = '00.1601.110.2.24'
--		and a.act_codigo in (1121)
order by rl.repleg_codigo desc 
limit 16;
-- PERSONA NATURAL
select 	* 
from 	controleg_persona.persona_natural pn  
where	true 	
--		and pn.pernat_codigo in (125)
--		and pn.pernat_nombres like 'MIRIAM NICOLAZA'
order by pn.pernat_codigo  desc;
--limit 16;
--ROL
select 	*
from 	autenticacion.rol r
where 	true 
order by r.rol_codigo desc;
--TIPO ROL
select 	*
from 	parametricas.tipo_rol tr
where 	true 
order by tr.tiprol_codigo desc;
--USUARIO
--select 	u.*
select 	u.usu_codigo, u.usu_usuario, u.usu_contrasenia,u.usu_estado,
		pn.pernat_codigo ,pn.pernat_nombres , pn.per_codigo,
	 	r.rol_codigo,
	 	tr.tiprol_codigo,tr.tiprol_nombre 
from 	autenticacion.usuario u
		left join controleg_persona.persona_natural pn on u.pernat_codigo = pn.pernat_codigo 
		left join autenticacion.usuario_rol ur on u.usu_codigo = ur.usu_codigo
		left join autenticacion.rol r on ur.rol_codigo = r.rol_codigo 
		left join parametricas.tipo_rol tr on r.tiprol_codigo = tr.tiprol_codigo 
where 	true
		and u.usu_codigo in (1,2,3,7,8,9,10,11,15,18,20,24,32,33,34,35,36)
--		and u.usu_codigo in (23)
order by u.usu_codigo desc;
--######################## OTROS ###########################################
--TRAE USUARIOS--
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
            where true 
            --	  and tr.tiprol_codigo in (2)
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
            where true
		          and ue.usuent_estado > 0
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
--SUSI
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
        JOIN (
        	SELECT DISTINCT r.tiprol_codigo, ur.usu_codigo
        	FROM autenticacion.usuario_rol ur
        	JOIN autenticacion.rol r USING (rol_codigo)
        	WHERE r.tiprol_codigo = 1
        ) rol 
        ON rol.usu_codigo = t.usu_codigo       
        WHERE TRUE 
        )
        ,
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
        )     
        ,
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
--CHAT
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
    WHERE t.usu_estado IN (1, 2)
    ORDER BY t.usu_codigo DESC
    LIMIT 10
),
roles AS (
    SELECT
        tabla_subconsulta.usu_codigo,
        array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
    FROM (
        SELECT ur.usu_codigo, r.rol_nombre, tr.tiprol_nombre, r.tiprol_codigo, r.rol_codigo
        FROM autenticacion.usuario_rol ur
        JOIN usuarios USING (usu_codigo)
        JOIN autenticacion.rol r USING (rol_codigo)
        LEFT JOIN parametricas.tipo_rol tr USING (tiprol_codigo)
    ) tabla_subconsulta
    GROUP BY tabla_subconsulta.usu_codigo
),
entidades AS (
    SELECT
        tabla_subconsulta.usu_codigo,
        array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
    FROM (
        SELECT u.usu_codigo, ue.usuent_codigo, ue.ent_codigo, e.ent_descripcion
        FROM autenticacion.usuario_entidad ue
        JOIN usuarios u USING (usu_codigo)
        LEFT JOIN public.entidad e USING (ent_codigo)
        WHERE ue.usuent_estado > 0
        ORDER BY ue.usuent_codigo DESC
    ) tabla_subconsulta
    GROUP BY tabla_subconsulta.usu_codigo
)
SELECT u.*,
       COALESCE(r.conjunto, '[]') AS roles_codigos,
       COALESCE(e.conjunto, '[]') AS entidades
FROM usuarios u
LEFT JOIN roles r USING (usu_codigo)
LEFT JOIN entidades e USING (usu_codigo)
WHERE e.conjunto::text IS NOT NULL AND e.conjunto::text != '[]';
--
select 	*
from 	autenticacion.usuario_rol ur 
		left join autenticacion.rol r on ur.rol_codigo = r.rol_codigo ;

     
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       