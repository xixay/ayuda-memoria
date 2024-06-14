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
--		and e.ent_codigo in (1)
--		and e.ent_descripcion LIKE '%ASAMBLEA LEGISLATIVA PLURINACIONAL%'
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
--select 	tr.*
select 	r.rol_codigo, r.rol_nombre,r.rol_descripcion, r.rol_estado, r.fecha_registro,
		tr.tiprol_codigo, tr.tiprol_nombre, tr.tiprol_estado 
from 	autenticacion.rol r
		left join parametricas.tipo_rol tr on r.tiprol_codigo = tr.tiprol_codigo 
where 	true 
order by r.rol_codigo desc;
--TIPO ROL
select 	*
from 	parametricas.tipo_rol tr
where 	true 
order by tr.tiprol_codigo desc;
--MENU
select 	*
from 	autenticacion.menu m 
where 	true 
order by m.men_codigo desc;
--USUARIO
--select 	rro.*
select 	u.usu_codigo, u.usu_usuario, u.usu_contrasenia,u.usu_estado,
      	pn.pernat_codigo ,pn.pernat_nombres , pn.per_codigo
from 	autenticacion.usuario u
		left join controleg_persona.persona_natural pn on u.pernat_codigo = pn.pernat_codigo
where 	true
--		and u.usu_codigo in (1,2,3,7,8,9,10,11,15,18,20,24,32,33,34,35,36)
--		and u.usu_codigo in (39)
--		and u.usu_codigo in (36)
		and u.usu_codigo in (40)		
--		and ur.usurol_estado in (2)
order by u.usu_codigo desc;
--USUARIO ROL
--select 	ur.*
select 	ur.usurol_codigo, ur.usuario_registro, ur.rol_codigo, ur.usurol_estado,
		u.usu_codigo ,u.usu_estado,
		pn.pernat_codigo, pn.per_codigo, pn.pernat_nombres, pn.pernat_estado,
		r.rol_codigo, r.rol_nombre, r.rol_estado,
		tr.tiprol_codigo, tr.tiprol_nombre, tr.tiprol_estado
from 	autenticacion.usuario_rol ur
		left join autenticacion.usuario u on ur.usu_codigo = u.usu_codigo
		left join controleg_persona.persona_natural pn on u.pernat_codigo = pn.pernat_codigo
		left join autenticacion.rol r on ur.rol_codigo = r.rol_codigo
		left join parametricas.tipo_rol tr on r.tiprol_codigo = tr.tiprol_codigo 
where 	true 
		and u.usu_codigo in (40)
--		and ur.usurol_estado in (2)
order by ur.usurol_codigo desc;
--USUARIO ENTIDAD
select 	ue.*
--select 	ue.usuent_codigo, ue.ent_codigo, ue.usuent_estado,
--		u.usu_codigo ,u.usu_estado,
--		pn.pernat_codigo, pn.per_codigo, pn.pernat_nombres, pn.pernat_estado,
--		td.tipdoc_codigo ,td.tipdoc_nombre , td.tipdoc_estado 
from 	autenticacion.usuario_entidad ue 
		left join autenticacion.usuario u on ue.usu_codigo = u.usu_codigo
		left join controleg_persona.persona_natural pn on u.pernat_codigo = pn.pernat_codigo
		left join parametricas.tipo_documento td on pn.tipdoc_codigo = td.tipdoc_codigo 
where 	true 
		--and u.usu_codigo in (40)
order by ue.usuent_codigo desc;
--FLUJOS TABLAS SERVICES
--select 	*
--from 	control_estados.flujos_tablas ft
--where 	true 
--		and ft.tab_codigo in (64)
--order by ft.fta_codigo asc;
--######################## OTROS ###########################################
--TRAE USUARIOS SUSI--
WITH 	usuarios AS (
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
FROM 	autenticacion.usuario t
		LEFT JOIN parametricas.estados e ON e.est_codigo = t.usu_estado
		LEFT JOIN controleg_persona.persona_natural p ON t.pernat_codigo = p.pernat_codigo       
		JOIN (
			SELECT 	DISTINCT r.tiprol_codigo, ur.usu_codigo
			FROM 	autenticacion.usuario_rol ur
			JOIN 	autenticacion.rol r USING (rol_codigo)
			WHERE 	r.tiprol_codigo = 2
		) rol ON rol.usu_codigo = t.usu_codigo       
WHERE 	TRUE 
		and t.usu_estado in (0,1,2)
order by usu_codigo desc
limit 10
offset 0
),
roles 	AS (
SELECT
      	tabla_subconsulta.usu_codigo,
      	array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
FROM 	(
    	SELECT 	ur.usu_codigo, r.rol_nombre,  tr.tiprol_nombre  ,r.tiprol_codigo, r.rol_codigo
    	FROM 	autenticacion.usuario_rol ur
    			JOIN usuarios USING (usu_codigo)
    			JOIN autenticacion.rol r USING (rol_codigo)
    			LEFT JOIN parametricas.tipo_rol tr USING (tiprol_codigo)
    	where ur.usurol_estado > 0
  		) tabla_subconsulta
GROUP BY tabla_subconsulta.usu_codigo
),
entidades as (
SELECT
      	tabla_subconsulta.usu_codigo,
      	array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
FROM 	(
    	SELECT 	u.usu_codigo, ue.usuent_codigo, ue.ent_codigo, e.ent_descripcion
    	FROM 	autenticacion.usuario_entidad ue
    			JOIN usuarios u USING (usu_codigo)
    			LEFT JOIN public.entidad  e USING (ent_codigo)
		where ue.usuent_estado > 0
    	order by ue.usuent_codigo desc
  		) tabla_subconsulta
GROUP BY tabla_subconsulta.usu_codigo
)
SELECT 	u.*,
COALESCE (r.conjunto,'[]') AS roles_codigos,
COALESCE (e.conjunto, '[]') entidades
FROM 	usuarios u
		LEFT JOIN roles r USING (usu_codigo)
		LEFT JOIN entidades e USING (usu_codigo)
where 	true 
--		and u.usu_codigo in (40)
ORDER BY u.usu_codigo DESC
;
--#######
-- Definir la variable del código de entidad
WITH 	usuarios AS (
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
  		TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
        ue.ent_codigo AS ue_ent_codigo, -- Agregar alias para el código de entidad aquí
        ent.ent_descripcion -- Agregar la descripción de la entidad aquí
FROM 	autenticacion.usuario t
		LEFT JOIN parametricas.estados e ON e.est_codigo = t.usu_estado
		LEFT JOIN controleg_persona.persona_natural p ON t.pernat_codigo = p.pernat_codigo
        LEFT JOIN autenticacion.usuario_entidad ue ON ue.usu_codigo = t.usu_codigo AND ue.usuent_estado > 0
        LEFT JOIN public.entidad ent ON ue.ent_codigo = ent.ent_codigo -- Unir con la tabla de entidades
		JOIN (
			SELECT 	DISTINCT r.tiprol_codigo, ur.usu_codigo
			FROM 	autenticacion.usuario_rol ur
			JOIN 	autenticacion.rol r USING (rol_codigo)
			WHERE 	r.tiprol_codigo = 2
		) rol ON rol.usu_codigo = t.usu_codigo       
WHERE 	TRUE 
		AND t.usu_estado IN (0,1,2)
--        AND ue.ent_codigo IN (1) -- Filtro para ent_codigo
ORDER BY usu_codigo DESC
LIMIT 10
OFFSET 0
),
roles 	AS (
SELECT
      	tabla_subconsulta.usu_codigo,
      	array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
FROM 	(
    	SELECT 	ur.usu_codigo, r.rol_nombre,  tr.tiprol_nombre, r.tiprol_codigo, r.rol_codigo
    	FROM 	autenticacion.usuario_rol ur
    			JOIN usuarios USING (usu_codigo)
    			JOIN autenticacion.rol r USING (rol_codigo)
    			LEFT JOIN parametricas.tipo_rol tr USING (tiprol_codigo)
    	WHERE ur.usurol_estado > 0
  		) tabla_subconsulta
GROUP BY tabla_subconsulta.usu_codigo
),
entidades AS (
SELECT
      	tabla_subconsulta.usu_codigo,
      	array_to_json(array_agg(row_to_json(tabla_subconsulta))) conjunto
FROM 	(
    	SELECT 	u.usu_codigo, ue.usuent_codigo, ue.ent_codigo, e.ent_descripcion
    	FROM 	autenticacion.usuario_entidad ue
    			JOIN usuarios u USING (usu_codigo)
    			LEFT JOIN public.entidad e USING (ent_codigo)
		WHERE ue.usuent_estado > 0
    	ORDER BY ue.usuent_codigo DESC
  		) tabla_subconsulta
GROUP BY tabla_subconsulta.usu_codigo
)
SELECT 	u.*,
COALESCE (r.conjunto, '[]') AS roles_codigos,
COALESCE (e.conjunto, '[]') entidades
FROM 	usuarios u
		LEFT JOIN roles r USING (usu_codigo)
		LEFT JOIN entidades e USING (usu_codigo)
WHERE 	TRUE 
ORDER BY u.usu_codigo DESC;
--MENU ROL
select 	*
from 	autenticacion.menu_rol mr
where 	true 
		and mr.rol_codigo in (1)
order by mr.menrol_codigo desc;
--RECURSO
select 	*
from 	autenticacion.recurso r 
where 	true
		and r.rec_codigo in (24,25)
order by r.rec_codigo desc;
--ROL RECURSO OPERACION
--select 	rro.*
select	rro.rro_codigo, rro.rro_estado,
		r.rol_codigo, r.rol_nombre ,r.rol_estado,
		tr.tiprol_codigo, tr.tiprol_nombre, tr.tiprol_estado,
		r2.rec_codigo, r2.rec_nombre, r2.rec_estado,
		m.men_codigo, m.men_orden, m.men_nombre, m.men_icono, m.men_ruta, m.men_codigo_padre, m.men_estado 
from 	autenticacion.rol_recurso_operacion rro
		left join autenticacion.rol r on rro.rol_codigo = r.rol_codigo
		left join parametricas.tipo_rol tr on r.tiprol_codigo = tr.tiprol_codigo 
		left join autenticacion.recurso r2 on rro.rec_codigo = r2.rec_codigo
		left join autenticacion.menu m on r2.men_codigo = m.men_codigo 
		left join parametricas.operacion o on rro.ope_codigo = rro.ope_codigo 
where 	true
		and rro.rol_codigo in (1,7,4)
order by rro.rro_codigo desc;
--USUARIO ROL CODIGO
select 	*
from 	autenticacion.usuario_rol ur 
where 	true 
		and ur.usu_codigo in (54)
--		and ur.usurol_codigo in (172)
--		and ur.usurol_estado in (0)
--order by ur.usurol_codigo desc;
order by ur.fecha_registro desc;
--MENU USUARIO ROL
select 	*
from 	autenticacion.menu_usuario_rol mur 
where 	true 
--		and mur.mur_estado in (2)
		and mur.usurol_codigo in (186,187,188,189)
order by mur.mur_codigo desc;
--MENU USUARIO ROL OPERACION
select 	*
from 	autenticacion.menu_usuario_rol_operacion muro
where 	true
		and muro.mur_codigo in (320,321,325,326)
order by muro.muro_codigo desc;
--QUERY SUSY
select 	distinct mur.mur_codigo, mur.usurol_codigo, mur.mur_estado, 
		ur.rol_codigo,
		mr.men_codigo, mr.menrol_codigo,
		mro.ope_codigo,mro.mro_estado  
from 	autenticacion.menu_usuario_rol mur
		join autenticacion.usuario_rol ur using (usurol_codigo)
		join autenticacion.menu_rol mr on mr.rol_codigo = ur.rol_codigo and mr.men_codigo =mur.men_codigo  		
		join autenticacion.menu_rol_operacion mro using (menrol_codigo)
where 	true
		and mur.usurol_codigo in (215,216,217,218)
--		and mur.usurol_codigo in (219) 
--		and mur.usurol_codigo in (202,203) 
order by mur.usurol_codigo;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	





















	
	
	
	







     
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       