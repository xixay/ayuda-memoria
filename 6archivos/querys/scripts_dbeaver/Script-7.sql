select * from core.usuarios;
select * from core.redes_sociales;

SELECT nombre from core.usuarios;
SELECT nombre as nombre_usuarios from core.usuarios;
-- Consiulta aplicando distinct
SELECT DISTINCT nombre from core.redes_sociales; 
-- where
SELECT * from core.usuarios where id_usuario=1;

SELECT * from core.usuarios where ocupacion = 'Desarrollador';
SELECT * from core.usuarios where ocupacion like 'Desarrollador';

-- ordenar la lista order by de manera descendente
SELECT * from core.usuarios order by id_usuario DESC;
SELECT * from core.usuarios order by telefono, id_usuario ASC;
-- Busca los que empiezan con J    Juan, Javier
SELECT * FROM core.usuarios where nombre like 'J%'
-- Nombres que empiezen con J y son Desarrolladores
SELECT * FROM core.usuarios where ocupacion = 'Desarrollador' or nombre like 'J%';
-- Todos diferentes a LinkedIn de Laura
SELECT * FROM core.redes_sociales where not nombre ='LinkedIn de Laura'

SELECT * FROM core.redes_sociales where nombre IS null;
SELECT * FROM core.redes_sociales where nombre IS not null;
-- actualiza
UPDATE core.usuarios SET nombre='Pedro Sosa' where id_usuario=1;

DELETE FROM core.redes_sociales where id_rede_social=1;

SELECT MIN (id_usuario) FROM core.usuarios;
SELECT MAX (id_usuario) FROM core.usuarios;
SELECT COUNT (id_usuario) FROM core.usuarios;
SELECT SUM (id_usuario) FROM core.usuarios;

-- IN 
select * from core.usuarios where ocupacion = 'Desarrollador' or ocupacion = 'Estudiante';
select * from core.usuarios where ocupacion in ('Desarrollador','Estudiante');

-- between rango
SELECT * from core.usuarios where id_usuario BETWEEN 4 AND 10;
--Alias
SELECT nombre as nombre_usuarios, telefono FROM core.usuarios;
--INEER JOINS la interseccion de ambos(se duplica el nombre puede q tengan n redes sociales)  De usuarios va obtener todos los datos
select u.* as nombre_usuario, r.nombre as nombre_red_soc from core.usuarios as u 
INNER JOIN core.redes_sociales as r ON u.id_usuario=r.id_usuario;
--LEFT JOIN  Devuelve todos los datos de la izquierda, ose los que no estan en la interseccion(devuelve todos los valores aunquye en redes sosciales sea null)
select * from core.usuarios as u
LEFT JOIN core.redes_sociales as r ON u.id_usuario = r.id_usuario;
--RIGHT JOIN  Por ser de 1 a N no va haber valores null
select * from core.usuarios as u
RIGHT JOIN core.redes_sociales as r ON u.id_usuario = r.id_usuario;
--FULL OUTER JOIN muestra completamente todos los datos
select * from core.usuarios as u
FULL OUTER JOIN core.redes_sociales as r ON u.id_usuario = r.id_usuario;
-- Cambia el tipo
ALTER TABLE core.usuarios ALTER COLUMN telefono TYPE VARCHAR;

select * from core.usuarios u ;
select * from core.redes_sociales rs ;
select * from core.proyectos p ;
select * from portafolio.experiencias e ;

-- 1. Obtener lista de usuarios que cuentan con redes sociales mostrar ¡ nombre_usuario ¡ nombre_red_social ¡
select u.nombre as nombre_usuario,  rs.nombre as nombre_red_social from core.usuarios u, core.redes_sociales rs 
where u.id_usuario =rs.id_usuario ;
--2. Obtener lista de usuarios que cuentan con proyectos mostrar ¡ todos los datos y añadir alias a las columnas que repitan nombre¡
select
	u.id_usuario ,
	u.nombre as nombre_usuario,
	u.telefono ,
	u.email,
	u.descripcion as usuario_descripcion,
	u.ocupacion ,
	u.fecha_nac ,
	u.foto as foto_usuario,
	u.fecha_reg ,
	p.id_proyecto ,
	p.nombre as nombre_proyecto,
	p.foto as foto_proyecto,
	p.descripcion as descripcion_proyecto
from
	core.usuarios u ,
	core.proyectos p
where
	u.id_usuario = p.id_usuario ;
--3. Obtener los usuarios que nacieron entre el año 1992 y 1989 ¡todos los datos y añadir alias a los nombres que se repitan¡
select u.nombre as nombre_usuario, u.fecha_nac  from core.usuarios u
where u.fecha_nac between '1989-01-01' and '1992-12-31' order by u.fecha_nac asc; 
--4. Obtener los Experiencias laborales de los usuarios ¡todos los datos y añadir alias a los nombres que se repitan¡
SELECT 
    u.id_usuario,
    u.nombre AS nombre_usuario,
    u.telefono,
    u.email,
    u.descripcion AS usuario_descripcion,
    u.ocupacion,
    u.fecha_nac,
    u.foto AS foto_usuario,
    u.fecha_reg,
    e.id_experiencia,
    e.nombre AS nombre_experiencia,
    e.descripcion AS experiencia_descripcion
FROM 
    core.usuarios u
INNER JOIN 
    portafolio.experiencias e ON u.id_usuario = e.id_usuario;
--5. Obtener los usuarios que sean QA y Dev ¡todos los datos y añadir alias a los nombres que se repitan¡
SELECT 
    u.id_usuario,
    u.nombre AS nombre_usuario,
    u.telefono,
    u.email,
    u.descripcion AS usuario_descripcion,
    u.ocupacion,
    u.fecha_nac,
    u.foto AS foto_usuario,
    u.fecha_reg
FROM 
    core.usuarios u
where
    u.ocupacion in ('QA','Dev');
/*
	
	
	
	*/
   
   
   
   
   