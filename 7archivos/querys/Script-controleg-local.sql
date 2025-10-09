--###  ---RELACION TIPO DE PROCESO n:n
select * from parametricas.tipo_proceso tp 
select * from parametricas.estado_tipo_proceso etp 
select * from parametricas.estado_proceso ep where ep.estpro_codigo in (55,56,57,58,59) order by ep.estpro_codigo asc
	--###  --- INSERT TABLA ESTADOS REGISTROS
ALTER TABLE parametricas.estado_tipo_proceso ADD CONSTRAINT estado_registro_fk FOREIGN KEY (esttippro_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL
	--###  --- INSERT TABLA INTERMEDIA
INSERT INTO parametricas.estado_tipo_proceso
(esttippro_codigo, tippro_codigo, estpro_codigo, esttippro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja)
VALUES(1, 1, 1, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(2, 1, 2, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(3, 1, 3, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(4, 1, 4, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(5, 1, 5, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(6, 1, 6, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(7, 1, 7, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone)
INSERT INTO parametricas.estado_tipo_proceso
(esttippro_codigo, tippro_codigo, estpro_codigo, esttippro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja)
VALUES(8, 18, 55, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(9, 18, 56, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(10, 18, 57, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(11, 18, 58, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(12, 18, 59, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone)
	--###  --- MUCHOS DATOS INSERT TABLA INTERMEDIA
INSERT INTO parametricas.estado_tipo_proceso
(esttippro_codigo, tippro_codigo, estpro_codigo, esttippro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja)
VALUES(1, 1, 1, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(2, 1, 2, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(3, 1, 3, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(4, 1, 4, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(5, 1, 5, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(6, 1, 6, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(7, 1, 7, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(8, 1, 8, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(9, 1, 9, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(10, 1, 10, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(11, 1, 11, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(12, 1, 12, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(13, 1, 13, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(14, 1, 14, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(15, 1, 15, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(16, 1, 16, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(17, 1, 17, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(18, 1, 18, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(19, 1, 19, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(20, 1, 20, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(21, 1, 21, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(22, 1, 22, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(23, 1, 23, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(24, 1, 24, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(25, 1, 25, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(26, 1, 26, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(27, 1, 27, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(28, 1, 28, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(29, 1, 29, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(30, 1, 30, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(31, 1, 31, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(32, 1, 32, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(33, 1, 33, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(34, 1, 34, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(35, 1, 35, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(36, 1, 36, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(37, 1, 37, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(38, 1, 38, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(39, 1, 39, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(40, 1, 40, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(41, 1, 41, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(42, 1, 42, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(43, 1, 43, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(44, 1, 44, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(45, 1, 45, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(46, 1, 46, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(47, 1, 47, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(48, 1, 48, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(49, 1, 49, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(50, 1, 50, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(51, 1, 51, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(52, 1, 52, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(53, 1, 53, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(54, 1, 54, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(55, 1, 55, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(56, 1, 56, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(57, 1, 57, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(58, 1, 58, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),(59, 1, 59, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone)
INSERT INTO parametricas.estado_tipo_proceso (esttippro_codigo, tippro_codigo, estpro_codigo, esttippro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) 
VALUES
(60, 18, 1, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(61, 18, 2, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(62, 18, 3, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(63, 18, 4, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(64, 18, 5, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(65, 18, 6, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(66, 18, 7, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(67, 18, 8, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(68, 18, 9, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(69, 18, 10, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(70, 18, 11, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(71, 18, 12, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(72, 18, 13, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(73, 18, 14, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(74, 18, 15, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(75, 18, 16, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(76, 18, 17, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(77, 18, 18, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(78, 18, 19, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(79, 18, 20, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(80, 18, 21, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(81, 18, 22, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(82, 18, 23, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(83, 18, 24, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(84, 18, 25, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(85, 18, 26, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(86, 18, 27, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(87, 18, 28, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(88, 18, 29, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(89, 18, 30, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(90, 18, 31, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(91, 18, 32, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(92, 18, 33, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(93, 18, 34, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(94, 18, 35, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(95, 18, 36, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(96, 18, 37, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(97, 18, 38, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(98, 18, 39, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(99, 18, 40, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(100, 18, 41, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(101, 18, 42, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(102, 18, 43, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(103, 18, 44, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(104, 18, 45, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(105, 18, 46, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(106, 18, 47, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(107, 18, 48, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(108, 18, 49, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(109, 18, 50, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(110, 18, 51, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(111, 18, 52, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(112, 18, 53, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(113, 18, 54, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(114, 18, 55, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(115, 18, 56, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(116, 18, 57, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(117, 18, 58, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone),
(118, 18, 59, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, CURRENT_TIMESTAMP::timestamp without time zone)
;
--###  ---TABLA FICTICIA CUATRIMESTRAL
CREATE TABLE controleg.cuatrimestral (
    cua_codigo SERIAL PRIMARY KEY,
    cua_estado NUMERIC NOT NULL,
    cua_nota VARCHAR(255) NOT NULL,
    cua_pliego VARCHAR(255) NOT NULL,
    cua_tipo VARCHAR(255) NOT NULL,
    cua_monto NUMERIC NOT NULL,
    cua_descripcion VARCHAR(255) NOT NULL,
    usuario_registro NUMERIC NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_modificacion NUMERIC NOT NULL,
    fecha_modificacion TIMESTAMP
)
	-- Insertar datos en la tabla cuatrimestral
INSERT INTO controleg.cuatrimestral (cua_estado, cua_nota, cua_pliego, cua_tipo, cua_monto, cua_descripcion, usuario_registro, usuario_modificacion)
VALUES
  (1, 'Nota 1', 'Pliego 1', 'Tipo 1', 100.50, 'Descripción 1', 1, 1),
  (1, 'Nota 2', 'Pliego 2', 'Tipo 2', 150.75, 'Descripción 2', 1, 1),
  (1, 'Nota 3', 'Pliego 3', 'Tipo 3', 200.00, 'Descripción 3', 1, 1),
  (1, 'Nota 4', 'Pliego 4', 'Tipo 4', 250.25, 'Descripción 4', 1, 1),
  (1, 'Nota 5', 'Pliego 5', 'Tipo 5', 300.50, 'Descripción 5', 1, 1),
  (1, 'Nota 6', 'Pliego 6', 'Tipo 6', 350.75, 'Descripción 6', 1, 1),
  (1, 'Nota 7', 'Pliego 7', 'Tipo 7', 400.00, 'Descripción 7', 1, 1),
  (1, 'Nota 8', 'Pliego 8', 'Tipo 8', 450.25, 'Descripción 8', 1, 1),
  (1, 'Nota 9', 'Pliego 9', 'Tipo 9', 500.50, 'Descripción 9', 1, 1),
  (1, 'Nota 10', 'Pliego 10', 'Tipo 10', 550.75, 'Descripción 10', 1, 1),
  (1, 'Nota 11', 'Pliego 11', 'Tipo 11', 600.00, 'Descripción 11', 1, 1),
  (1, 'Nota 12', 'Pliego 12', 'Tipo 12', 650.25, 'Descripción 12', 1, 1),
  (1, 'Nota 13', 'Pliego 13', 'Tipo 13', 700.50, 'Descripción 13', 1, 1),
  (1, 'Nota 14', 'Pliego 14', 'Tipo 14', 750.75, 'Descripción 14', 1, 1),
  (1, 'Nota 15', 'Pliego 15', 'Tipo 15', 800.00, 'Descripción 15', 1, 1),
  (1, 'Nota 16', 'Pliego 16', 'Tipo 16', 850.25, 'Descripción 16', 1, 1),
  (1, 'Nota 17', 'Pliego 17', 'Tipo 17', 900.50, 'Descripción 17', 1, 1),
  (1, 'Nota 18', 'Pliego 18', 'Tipo 18', 950.75, 'Descripción 18', 1, 1),
  (1, 'Nota 19', 'Pliego 19', 'Tipo 19', 1000.00, 'Descripción 19', 1, 1),
  (1, 'Nota 20', 'Pliego 20', 'Tipo 20', 1050.25, 'Descripción 20', 1, 1)
  ;
--###  ---TABLA DICTAMEN UAI
 select * from controleg.dictamen_uai du
;
--###  ---TABLA CUATRIMESTRAL
 select * from controleg.cuatrimestral c 
;
--###  ---TODOS LOS PROCESOS
select * from controleg.proceso
;
--###  ---TABLA DONDE ESTARAN TODOS LOS TIPOS DE PROCESOS
select * from parametricas.tipo_proceso_datos_adicionales tpda 
;
 
 
 
 
 
 
 
 
