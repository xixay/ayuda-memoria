CREATE SCHEMA IF NOT EXISTS core;
CREATE SCHEMA IF NOT EXISTS portafolio;
-- Creación de la tabla de usuarios
CREATE TABLE IF NOT EXISTS core.usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000),
    fecha_reg TIMESTAMP DEFAULT NOW()
);

-- Creación de la tabla de habilidades
CREATE TABLE IF NOT EXISTS portafolio.habilidades (
    id_habilidad SERIAL PRIMARY KEY,
    icono VARCHAR(2000),
    nombre VARCHAR(2000),
    descripcion TEXT
);
-- Creación de la tabla intermedia para la relación n:n entre usuarios y habilidades
CREATE TABLE IF NOT EXISTS core.usuarios_habilidades (
    id_usuario_habilidad SERIAL PRIMARY KEY,
    id_usuario INTEGER,
    id_habilidad INTEGER,
    CONSTRAINT fk_usuario_habilidad_usuario FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario),
    CONSTRAINT fk_usuario_habilidad_habilidad FOREIGN KEY (id_habilidad) REFERENCES portafolio.habilidades(id_habilidad)
);
-- Creación de la tabla de proyectos
CREATE TABLE IF NOT EXISTS core.proyectos (
    id_proyecto SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    descripcion TEXT,
    link VARCHAR(2000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_proyecto FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Creación de la tabla de redes sociales
CREATE TABLE IF NOT EXISTS core.redes_sociales (
    id_red_social SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_red_social FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);


-- Creación de la tabla de tecnologías
CREATE TABLE IF NOT EXISTS portafolio.tecnologias (
    id_tecnologia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_tecnologia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Creación de la tabla de experiencias
CREATE TABLE IF NOT EXISTS portafolio.experiencias (
    id_experiencia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    descripcion text,
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_experiencia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Inserción de datos en la tabla core.usuarios
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto, fecha_reg) 
VALUES 
('Sakura Haruno', 123456789, 'sakura@example.com', 'Ninja médica de Konoha', 'Ninja', '1995-03-28', 'sakura.jpg', NOW()),
('Asuka Langley Soryu', 987654321, 'asuka@example.com', 'Piloto del Evangelion Unidad-02', 'Piloto de Eva', '2001-12-04', 'asuka.jpg', NOW()),
('Inuyasha', 555555555, 'inuyasha@example.com', 'Mitad humano, mitad demonio', 'Hanyo', '1988-07-29', 'inuyasha.jpg', NOW()),
('Bulma Brief', 111111111, 'bulma@example.com', 'Científica e inventora', 'Inventora', '1980-08-18', 'bulma.jpg', NOW()),
('Nami', 222222222, 'nami@example.com', 'Navegante de los Piratas del Sombrero de Paja', 'Navegante', '1990-07-03', 'nami.jpg', NOW()),
('Mikasa Ackerman', 333333333, 'mikasa@example.com', 'Soldado de la Legión de reconocimiento', 'Soldado', '1995-02-10', 'mikasa.jpg', NOW()),
('Erza Scarlet', 444444444, 'erza@example.com', 'Titania, la Reina de las Hadas', 'Maga', '1992-04-30', 'erza.jpg', NOW()),
('Zero Two', 666666666, 'zero@example.com', 'Piloto de FranXX', 'Piloto', '2002-01-21', 'zero_two.jpg', NOW()),
('Hinata Hyuga', 777777777, 'hinata@example.com', 'Ninja de la Aldea Oculta de la Hoja', 'Ninja', '1995-12-27', 'hinata.jpg', NOW()),
('Kagome Higurashi', 888888888, 'kagome@example.com', 'Viajera en el tiempo', 'Estudiante', '1987-11-30', 'kagome.jpg', NOW()),
('Lucy Heartfilia', 999999999, 'lucy@example.com', 'Maga celestial de Fairy Tail', 'Maga', '1998-07-01', 'lucy.jpg', NOW()),
('Riza Hawkeye', 123123123, 'riza@example.com', 'Teniente y tiradora experta', 'Militar', '1989-01-10', 'riza.jpg', NOW()),
('Rei Ayanami', 456456456, 'rei@example.com', 'Piloto del Evangelion Unidad-00', 'Piloto de Eva', '2001-03-30', 'rei.jpg', NOW()),
('Winry Rockbell', 789789789, 'winry@example.com', 'Mecánica y ingeniera', 'Ingeniera', '1990-05-03', 'winry.jpg', NOW()),
('Yoruichi Shihouin', 135135135, 'yoruichi@example.com', 'Ex-capitana del Gotei 13', 'Ex-capitana', '1971-01-01', 'yoruichi.jpg', NOW()),
('Rukia Kuchiki', 246246246, 'rukia@example.com', 'Shinigami y ex-teniente', 'Shinigami', '1986-01-14', 'rukia.jpg', NOW()),
('Tsunade Senju', 357357357, 'tsunade@example.com', 'Quinta Hokage de Konoha', 'Hokage', '1960-08-02', 'tsunade.jpg', NOW()),
('Android 18', 468468468, 'android18@example.com', 'Androide y luchadora', 'Androide', '2010-02-18', 'android18.jpg', NOW()),
('Yuno Gasai', 579579579, 'yuno@example.com', 'Portadora del Diario de Yuki', 'Estudiante', '1993-02-14', 'yuno.jpg', NOW()),
('Homura Akemi', 681681681, 'homura@example.com', 'Magical Girl y viajera en el tiempo', 'Magical Girl', '1995-12-03', 'homura.jpg', NOW());

-- Inserción de datos en la tabla core.proyectos
INSERT INTO core.proyectos (nombre, foto, descripcion, link, id_usuario) 
VALUES 
('Proyecto de Sakura', 'proyecto_sakura.jpg', 'Desarrollo de técnicas médicas ninja', 'https://github.com/sakura/proyecto', 1),
('Proyecto de Asuka', 'proyecto_asuka.jpg', 'Defensa contra los Ángeles', 'https://github.com/asuka/proyecto', 2),
('Proyecto de Inuyasha', 'proyecto_inuyasha.jpg', 'Aventuras en la era feudal', 'https://github.com/inuyasha/proyecto', 3),
('Proyecto de Bulma', 'proyecto_bulma.jpg', 'Inventos revolucionarios', '...', 4), -- Agrega el enlace correspondiente
('Proyecto de Nami', 'proyecto_nami.jpg', 'Navegación en Grand Line', 'https://github.com/nami/proyecto', 5),
('Proyecto de Mikasa', 'proyecto_mikasa.jpg', 'Desarrollo de estrategias de combate', '...', 6),
('Proyecto de Erza', 'proyecto_erza.jpg', 'Aventuras mágicas', '...', 7),
('Proyecto de Zero Two', 'proyecto_zero_two.jpg', 'Investigación sobre FranXX', '...', 8),
('Proyecto de Hinata', 'proyecto_hinata.jpg', 'Desarrollo de técnicas de ninjutsu', '...', 9),
('Proyecto de Kagome', 'proyecto_kagome.jpg', 'Estudio de viajes en el tiempo', '...', 10),
('Proyecto de Lucy', 'proyecto_lucy.jpg', 'Investigación sobre magia celestial', '...', 11),
('Proyecto de Riza', 'proyecto_riza.jpg', 'Mejora de habilidades de tirador', '...', 12),
('Proyecto de Rei', 'proyecto_rei.jpg', 'Desarrollo del Evangelion Unidad-00', '...', 13),
('Proyecto de Winry', 'proyecto_winry.jpg', 'Innovaciones en ingeniería mecánica', '...', 14),
('Proyecto de Yoruichi', 'proyecto_yoruichi.jpg', 'Investigación sobre habilidades shinigami', '...', 15),
('Proyecto de Rukia', 'proyecto_rukia.jpg', 'Estudio de técnicas de shinigami', '...', 16),
('Proyecto de Tsunade', 'proyecto_tsunade.jpg', 'Mejora de técnicas médicas', '...', 17),
('Proyecto de Android 18', 'proyecto_android18.jpg', 'Desarrollo de habilidades de combate', '...', 18),
('Proyecto de Yuno', 'proyecto_yuno.jpg', 'Estudio del Diario de Yuki', '...', 19),
('Proyecto de Homura', 'proyecto_homura.jpg', 'Investigación sobre viajes en el tiempo', '...', 20);

-- Inserción de datos en la tabla core.redes_sociales
INSERT INTO core.redes_sociales (nombre, foto, id_usuario) 
VALUES 
('Twitter', 'twitter_icon.jpg', 1),
('Webex', 'webex_icon.jpg', 1),
('Instagram', 'instagram_icon.jpg', 2),
('Facebook', 'facebook_icon.jpg', 3),
('LinkedIn', 'linkedin_icon.jpg', 4),
('Pinterest', 'pinterest_icon.jpg', 5),
('Tumblr', 'tumblr_icon.jpg', 6),
('Snapchat', 'snapchat_icon.jpg', 7),
('WhatsApp', 'whatsapp_icon.jpg', 8),
('Telegram', 'telegram_icon.jpg', 9),
('Discord', 'discord_icon.jpg', 10),
('Reddit', 'reddit_icon.jpg', 11),
('YouTube', 'youtube_icon.jpg', 12),
('Twitch', 'twitch_icon.jpg', 13),
('GitHub', 'github_icon.jpg', 14),
('GitLab', 'gitlab_icon.jpg', 15),
('Bitbucket', 'bitbucket_icon.jpg', 16),
('Slack', 'slack_icon.jpg', 17),
('Skype', 'skype_icon.jpg', 18),
('Zoom', 'zoom_icon.jpg', 19),
('Vkontakte', 'vkontakte_icon.jpg', 20);

-- Inserción de datos en la tabla portafolio.habilidades
INSERT INTO portafolio.habilidades (icono, nombre, descripcion) 
VALUES 
('habilidad_icon_1.jpg', 'Jutsu Médico', 'Máxima habilidad en técnicas médicas ninja, especializada en jutsu de curación.'),
('habilidad_icon_2.jpg', 'Piloto de Evangelion', 'Habilidad excepcional como piloto de la Unidad-02 en la lucha contra los Ángeles.'),
('habilidad_icon_3.jpg', 'Control de Energía Youkai', 'Capacidad para controlar y utilizar la energía youkai de manera efectiva.'),
('habilidad_icon_4.jpg', 'Inventora Genial', 'Habilidad para inventar dispositivos y tecnologías avanzadas.'),
('habilidad_icon_5.jpg', 'Navegación en Grand Line', 'Experiencia en la navegación por los peligrosos mares de Grand Line.'),
('habilidad_icon_6.jpg', 'Lanzamiento de Cuchillos', 'Habilidad sobresaliente en el lanzamiento preciso de cuchillos.'),
('habilidad_icon_7.jpg', 'Transformación Youkai', 'Capacidad para transformarse en una forma más poderosa como youkai.'),
('habilidad_icon_8.jpg', 'Tecnología Avanzada', 'Destreza en el desarrollo y uso de tecnología avanzada para diversos propósitos.'),
('habilidad_icon_9.jpg', 'Magia Celestial', 'Maestría en el uso de la magia celestial para invocar espíritus celestiales.'),
('habilidad_icon_10.jpg', 'Artes Marciales Ninja', 'Habilidad excepcional en las artes marciales ninja, incluyendo taijutsu y ninjutsu.'),
('habilidad_icon_11.jpg', 'Control del Tiempo', 'Capacidad para manipular el tiempo en situaciones específicas.'),
('habilidad_icon_12.jpg', 'Alquimia', 'Conocimiento profundo y habilidad en la práctica de la alquimia.'),
('habilidad_icon_13.jpg', 'Poderes Psíquicos', 'Habilidad para utilizar poderes psíquicos como la telequinesis y la telepatía.'),
('habilidad_icon_14.jpg', 'Transformación de Evangelion', 'Capacidad para transformarse en una forma más poderosa como piloto de Evangelion.'),
('habilidad_icon_15.jpg', 'Ninja de Combate', 'Excelencia en las técnicas de combate ninja y el uso de armas tradicionales.'),
('habilidad_icon_16.jpg', 'Canto Mágico', 'Poderosa voz utilizada en conjunción con la magia para efectos diversos.'),
('habilidad_icon_17.jpg', 'Técnica de Sello', 'Dominio en el uso de sellos mágicos para diversas aplicaciones.'),
('habilidad_icon_18.jpg', 'Control de Elementos', 'Capacidad para controlar y manipular diferentes elementos como fuego, agua y tierra.'),
('habilidad_icon_19.jpg', 'Arte de la Espada', 'Maestría en el manejo de la espada y técnicas de esgrima.'),
('habilidad_icon_20.jpg', 'Teletransportación', 'Habilidad para moverse instantáneamente de un lugar a otro.');

-- Inserción de datos en la tabla portafolio.tecnologias
INSERT INTO portafolio.tecnologias (nombre, foto, id_usuario) 
VALUES 
('Jutsu Médico', 'tecnologia_jutsu_medico.jpg', 1),
('Piloto de Evangelion', 'tecnologia_piloto_evangelion.jpg', 2),
('Control de Energía Youkai', 'tecnologia_control_energia_youkai.jpg', 3),
('Inventora Genial', 'tecnologia_inventora_genial.jpg', 4),
('Navegación en Grand Line', 'tecnologia_navegacion_grand_line.jpg', 5),
('Lanzamiento de Cuchillos', 'tecnologia_lanzamiento_cuchillos.jpg', 6),
('Transformación Youkai', 'tecnologia_transformacion_youkai.jpg', 7),
('Tecnología Avanzada', 'tecnologia_tecnologia_avanzada.jpg', 8),
('Magia Celestial', 'tecnologia_magia_celestial.jpg', 9),
('Artes Marciales Ninja', 'tecnologia_artes_marciales_ninja.jpg', 10),
('Control del Tiempo', 'tecnologia_control_tiempo.jpg', 11),
('Alquimia', 'tecnologia_alquimia.jpg', 12),
('Poderes Psíquicos', 'tecnologia_poderes_psiquicos.jpg', 13),
('Transformación de Evangelion', 'tecnologia_transformacion_evangelion.jpg', 14),
('Ninja de Combate', 'tecnologia_ninja_combate.jpg', 15),
('Canto Mágico', 'tecnologia_canto_magico.jpg', 16),
('Técnica de Sello', 'tecnologia_tecnica_sello.jpg', 17),
('Control de Elementos', 'tecnologia_control_elementos.jpg', 18),
('Arte de la Espada', 'tecnologia_arte_espada.jpg', 19),
('Teletransportación', 'tecnologia_teletransportacion.jpg', 20);

-- Inserción de datos en la tabla portafolio.experiencias
INSERT INTO portafolio.experiencias (nombre, descripcion, id_usuario) 
VALUES 
('Misión de Protección en Konoha', 'Participación en misiones como ninja médica para proteger la aldea de Konoha.', 1),
('Defensa contra los Ángeles', 'Piloto de la Unidad-02 en la lucha contra los Ángeles para proteger la humanidad.', 2),
('Aventuras en la Era Feudal', 'Viajes y enfrentamientos en la era feudal como mitad humano, mitad demonio.', 3),
('Inventora en la Patrulla del Tiempo', 'Contribuciones como inventora genial en la patrulla del tiempo.', 4),
('Navegante en los Mares Peligrosos', 'Viajes como navegante en los peligrosos mares de Grand Line.', 5),
('Combate en la Legión de reconocimiento', 'Participación en combates como soldado de la Legión de reconocimiento.', 6),
('Aventuras como Titania', 'Aventuras mágicas y misiones como Titania, la Reina de las Hadas.', 7),
('Piloto de FranXX', 'Participación en misiones como piloto de FranXX para proteger la humanidad.', 8),
('Misiones Ninja de la Aldea Oculta de la Hoja', 'Participación en misiones como ninja de la Aldea Oculta de la Hoja.', 9),
('Viajes en el Tiempo', 'Aventuras y descubrimientos en viajes en el tiempo.', 10),
('Magia Celestial en Fairy Tail', 'Aventuras y misiones como maga celestial en el gremio Fairy Tail.', 11),
('Teniente y Tiradora Experta', 'Servicio como teniente y tiradora experta en el ejército.', 12),
('Piloto del Evangelion Unidad-00', 'Participación como piloto del Evangelion Unidad-00 en la defensa contra los Ángeles.', 13),
('Innovaciones en Ingeniería Mecánica', 'Contribuciones como mecánica e ingeniera en innovaciones mecánicas.', 14),
('Ex-Capitana del Gotei 13', 'Servicio como ex-capitana del Gotei 13 en el mundo de los shinigami.', 15),
('Shinigami y Ex-Teniente', 'Experiencia como shinigami y ex-teniente en la Sociedad de Almas.', 16),
('Quinta Hokage de Konoha', 'Servicio como Quinta Hokage para proteger y liderar la aldea de Konoha.', 17),
('Luchadora y Androide', 'Participación en combates como androide y luchadora.', 18),
('Portadora del Diario de Yuki', 'Aventuras y desafíos como portadora del Diario de Yuki.', 19),
('Magical Girl y Viajera en el Tiempo', 'Aventuras como Magical Girl y viajera en el tiempo.', 20);

-- Inserción de datos en la tabla core.usuarios_habilidades (relación n:n)
INSERT INTO core.usuarios_habilidades (id_usuario, id_habilidad)
VALUES (1, 1),(1, 2),(2, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(10, 10),(11, 11),(12, 12),(13, 13),(14, 14),(15, 15),(16, 16),(17, 17),(18, 18),(19, 19),(20, 20);
-- Ver datos en una tabla
SELECT * FROM core.usuarios;
-- Eliminar el jutsu medico de Sakura de la tabla tecnologias
DELETE FROM portafolio.tecnologias WHERE nombre = 'Jutsu Médico';
SELECT * FROM portafolio.tecnologias;
-- Agregar una nueva columna vacia
ALTER TABLE portafolio.tecnologias ADD COLUMN herramienta VARCHAR(50);
--eliminar herramienta
ALTER TABLE portafolio.tecnologias DROP herramienta;
--actualizar foto
UPDATE portafolio.tecnologias SET foto = 'tecnologia_eva01.jpg' WHERE nombre = 'Piloto de Evangelion';
--relacion 1:1
SELECT u.id_usuario, u.nombre as nombre_usuario,u.telefono,u.email,u.descripcion,u.ocupacion,u.fecha_nac,u.foto as foto_usuario,u.fecha_reg,t.id_tecnologia,t.nombre as nombre_tecnologia,t.foto as foto_tecnologia 
FROM core.usuarios u, portafolio.tecnologias t
WHERE u.id_usuario=t.id_usuario AND u.id_usuario =1;
--relacion 1:N
SELECT u.id_usuario ,u.nombre as nombre_usuario,rs.nombre as nombre_red_social, rs.foto as foto_red_social 
FROM core.usuarios u ,core.redes_sociales rs 
WHERE u.id_usuario=rs.id_usuario AND u.id_usuario =1 ;
--relacion N:N
SELECT u.id_usuario,u.nombre as nombre_usuario,h.id_habilidad ,h.nombre as habilidad
FROM core.usuarios u,portafolio.habilidades h ,core.usuarios_habilidades uh
WHERE u.id_usuario=uh.id_usuario AND h.id_habilidad=uh.id_habilidad  AND (u.id_usuario =1 OR u.id_usuario=2) ;
--INNER JOIN:
--Recupera las habilidades de los usuarios que tienen habilidades registradas.
SELECT 	u.id_usuario, u.nombre as nombre_usuario,
		h.nombre AS habilidad_nombre
FROM 	core.usuarios u
		INNER JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
		INNER JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
order by u.id_usuario ;
--LEFT JOIN
--Obtener todos los usuarios y sus proyectos (si tienen alguno)
SELECT u.*, p.nombre AS proyecto_nombre
FROM core.usuarios u
LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario;
--A-B
SELECT
    u.*,
    t.id_tecnologia,
    t.nombre AS tecnologia_nombre,
    t.foto AS tecnologia_foto
FROM core.usuarios u
LEFT JOIN portafolio.tecnologias t ON u.id_usuario = t.id_usuario
WHERE t.id_usuario IS NULL;
--RIGHT JOIN
-- Obtener todos los proyectos y sus usuarios (incluso si no tienen un usuario asociado)
SELECT p.*, u.nombre AS usuario_nombre
FROM core.proyectos p
RIGHT JOIN core.usuarios u ON p.id_usuario = u.id_usuario;
--B-A
SELECT p.*,
       u.nombre AS usuario_nombre
FROM core.proyectos p
RIGHT JOIN core.usuarios u ON p.id_usuario = u.id_usuario
WHERE p.id_proyecto IS NULL;
--View
-- Crear una vista que muestre la información del usuario y sus habilidades
CREATE VIEW vw_usuario_habilidades AS
SELECT u.*, h.nombre AS habilidad_nombre
FROM core.usuarios u
INNER JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
INNER JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad;
-- Seleccionar todos los datos de la vista vw_usuario_habilidades
SELECT * FROM vw_usuario_habilidades;
--temporal
-- Crear una tabla temporal para almacenar usuarios con proyectos
CREATE TEMPORARY TABLE temp_usuarios_proyectos AS
SELECT u.*, p.nombre AS proyecto_nombre
FROM core.usuarios u
LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario;
-- Seleccionar todos los datos de la tabla temporal temp_usuarios_proyectos
SELECT * FROM temp_usuarios_proyectos;
--Funcion
-- Crear una función que calcule la edad a partir de la fecha de nacimiento
CREATE OR REPLACE FUNCTION calcular_edad(fecha_nac DATE) RETURNS INTEGER AS $$
    SELECT EXTRACT(YEAR FROM age(CURRENT_DATE, fecha_nac));
$$ LANGUAGE SQL;
-- Llamada a la función para obtener la edad de un usuario
SELECT u.nombre as nombre_usuario, calcular_edad(fecha_nac) AS edad FROM core.usuarios u;
--TRIGGER
-- Crear un trigger que actualice la fecha de registro cada vez que se inserta un nuevo usuario
CREATE OR REPLACE FUNCTION actualizar_fecha_registro()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_reg := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_actualizar_fecha_registro
BEFORE INSERT ON core.usuarios
FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_registro();
-- Insertar un nuevo usuario (el trigger actualizará la fecha de registro)
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto)
VALUES ('Nuevo Usuario', 123456789, 'nuevo@usuario.com', 'Descripción', 'Ocupación', '2000-01-01', 'foto.jpg');
--PARTITION
-- Calcular la cantidad de proyectos por usuario utilizando PARTITION
SELECT p.id_usuario, COUNT(*) OVER (PARTITION BY p.id_usuario) AS cantidad_proyectos
FROM core.proyectos p;
--PROCEDIMIENTO
-- Crear un procedimiento almacenado que inserte un nuevo usuario
CREATE OR REPLACE PROCEDURE insertar_usuario(
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000)
)
AS $$
BEGIN
    INSERT INTO core.usuarios(nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto)
    VALUES (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto);
END;
$$ LANGUAGE plpgsql;

-- Llamada al procedimiento para insertar un nuevo usuario
CALL insertar_usuario('Nuevo Usuario2', 987654321, 'nuevo2@usuario.com', 'Descripción', 'Ocupación', '2000-01-01', 'foto2.jpg');

--SUMA
-- Calcular la suma de los id_usuario agrupada por usuario que tiene mas de una red social
SELECT rs.id_usuario, SUM(rs.id_usuario) AS suma_id_usuarios
FROM core.redes_sociales rs
where rs.id_usuario =1
GROUP BY rs.id_usuario;
-- Calcular la suma de los id_usuario agrupada por usuario que tiene más de una red social
SELECT rs.id_usuario, SUM(rs.id_usuario) AS suma_id_usuarios
FROM core.redes_sociales rs
GROUP BY rs.id_usuario
HAVING COUNT(rs.id_red_social) > 1;
--COUNT
-- Contar la cantidad de usuarios agrupada por nombre
SELECT nombre, COUNT(*) AS cantidad_usuarios
FROM core.usuarios
GROUP BY nombre;
-- Calcular la cantidad de habilidades por usuario
SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
FROM core.usuarios u
LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
GROUP BY u.id_usuario
order by u.id_usuario ;
--WITH
-- Ejemplo simple de uso de WITH para contar usuarios
WITH usuarios_cte AS (
     SELECT COUNT(*) AS cantidad_usuarios
     FROM core.usuarios
)
SELECT cantidad_usuarios
FROM usuarios_cte;
-- Ejemplo de uso de WITH para contar habilidades por usuario
WITH habilidades_por_usuario AS (
    SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
    FROM core.usuarios u
    LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
    LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
    GROUP BY u.id_usuario
)
SELECT id_usuario, cantidad_habilidades
FROM habilidades_por_usuario
ORDER BY id_usuario;
-- Ejemplo complejo de uso de WITH para obtener detalles de usuarios
WITH proyectos_cte AS (
    SELECT u.id_usuario, p.id_proyecto, p.nombre AS nombre_proyecto
    FROM core.usuarios u
    LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario
),
habilidades_cte AS (
    SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
    FROM core.usuarios u
    LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
    LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
    GROUP BY u.id_usuario
),
redes_sociales_cte AS (
    SELECT u.id_usuario, COUNT(rs.id_red_social) AS cantidad_redes_sociales
    FROM core.usuarios u
    LEFT JOIN core.redes_sociales rs ON u.id_usuario = rs.id_usuario
    GROUP BY u.id_usuario
)
SELECT u.id_usuario, u.nombre, p.nombre_proyecto, h.cantidad_habilidades, r.cantidad_redes_sociales
FROM core.usuarios u
LEFT JOIN proyectos_cte p ON u.id_usuario = p.id_usuario
LEFT JOIN habilidades_cte h ON u.id_usuario = h.id_usuario
LEFT JOIN redes_sociales_cte r ON u.id_usuario = r.id_usuario
ORDER BY u.id_usuario;









