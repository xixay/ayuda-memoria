PGDMP     ;        	            |            bd_cge_controleg_190223    13.11 (Debian 13.11-0+deb11u1)    13.14 (Debian 13.14-0+deb11u1) T   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    172446    bd_cge_controleg_190223    DATABASE     l   CREATE DATABASE bd_cge_controleg_190223 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
 '   DROP DATABASE bd_cge_controleg_190223;
                usr_controleg    false                        2615    174017    autenticacion    SCHEMA        CREATE SCHEMA autenticacion;
    DROP SCHEMA autenticacion;
                usr_controleg    false            �           0    0    SCHEMA autenticacion    COMMENT     a   COMMENT ON SCHEMA autenticacion IS 'Esquema para el control y administracion de autenticacion.';
                   usr_controleg    false    4            �           0    0    SCHEMA autenticacion    ACL     :   GRANT USAGE ON SCHEMA autenticacion TO usr_controleg_app;
                   usr_controleg    false    4                        2615    174014    controleg_dictamen    SCHEMA     "   CREATE SCHEMA controleg_dictamen;
     DROP SCHEMA controleg_dictamen;
                usr_controleg    false            �           0    0    SCHEMA controleg_dictamen    COMMENT     h   COMMENT ON SCHEMA controleg_dictamen IS 'Esquema para la administracion de dictamenes en el controleg';
                   usr_controleg    false    7            �           0    0    SCHEMA controleg_dictamen    ACL     ?   GRANT USAGE ON SCHEMA controleg_dictamen TO usr_controleg_app;
                   usr_controleg    false    7                        2615    174016    controleg_persona    SCHEMA     !   CREATE SCHEMA controleg_persona;
    DROP SCHEMA controleg_persona;
                usr_controleg    false            �           0    0    SCHEMA controleg_persona    COMMENT     �   COMMENT ON SCHEMA controleg_persona IS 'Esquema para la administracion de responsabilidad sobre persona (natural, juridica, empresa unipersonal) (demandado, involucrado) entre otras relaciones de persona.';
                   usr_controleg    false    6            �           0    0    SCHEMA controleg_persona    ACL     >   GRANT USAGE ON SCHEMA controleg_persona TO usr_controleg_app;
                   usr_controleg    false    6            
            2615    174012    controleg_proceso    SCHEMA     !   CREATE SCHEMA controleg_proceso;
    DROP SCHEMA controleg_proceso;
                usr_controleg    false            �           0    0    SCHEMA controleg_proceso    COMMENT     s   COMMENT ON SCHEMA controleg_proceso IS 'Esquema que administrara los procesos que estan registrados en controleg';
                   usr_controleg    false    10            �           0    0    SCHEMA controleg_proceso    ACL     >   GRANT USAGE ON SCHEMA controleg_proceso TO usr_controleg_app;
                   usr_controleg    false    10                        2615    174015    controleg_solvencia    SCHEMA     #   CREATE SCHEMA controleg_solvencia;
 !   DROP SCHEMA controleg_solvencia;
                usr_controleg    false            �           0    0    SCHEMA controleg_solvencia    ACL     @   GRANT USAGE ON SCHEMA controleg_solvencia TO usr_controleg_app;
                   usr_controleg    false    5                        2615    174013    dictamen    SCHEMA        CREATE SCHEMA dictamen;
    DROP SCHEMA dictamen;
                usr_controleg    false            �           0    0    SCHEMA dictamen    ACL     5   GRANT USAGE ON SCHEMA dictamen TO usr_controleg_app;
                   usr_controleg    false    8                        2615    174011    parametricas    SCHEMA        CREATE SCHEMA parametricas;
    DROP SCHEMA parametricas;
                usr_controleg    false            �           0    0    SCHEMA parametricas    ACL     9   GRANT USAGE ON SCHEMA parametricas TO usr_controleg_app;
                   usr_controleg    false    11                       1259    174792    menu    TABLE     S  CREATE TABLE autenticacion.menu (
    men_codigo integer NOT NULL,
    men_orden integer DEFAULT 1 NOT NULL,
    men_nombre character varying NOT NULL,
    men_icono character varying NOT NULL,
    men_ruta character varying NOT NULL,
    men_codigo_padre integer,
    men_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
    DROP TABLE autenticacion.menu;
       autenticacion         heap    usr_controleg    false    4            �           0    0 
   TABLE menu    COMMENT     X   COMMENT ON TABLE autenticacion.menu IS 'Tabla para el registro los menus del sistema.';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_codigo    COMMENT     M   COMMENT ON COLUMN autenticacion.menu.men_codigo IS 'Identificador del menu';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_orden    COMMENT     Y   COMMENT ON COLUMN autenticacion.menu.men_orden IS 'Orden en el que se mostrara el menu';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_nombre    COMMENT     F   COMMENT ON COLUMN autenticacion.menu.men_nombre IS 'Nombre del menu';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_icono    COMMENT     V   COMMENT ON COLUMN autenticacion.menu.men_icono IS 'Icono que se mostrara en el menu';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_ruta    COMMENT     p   COMMENT ON COLUMN autenticacion.menu.men_ruta IS 'Ruta a la que la aplicacion a la que el menu redireccionara';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_codigo_padre    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.men_codigo_padre IS 'Referencia al menu padre que agrupara a un conjunto de menus hijos.';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.men_estado    COMMENT     J   COMMENT ON COLUMN autenticacion.menu.men_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    264            �           0    0     COLUMN menu.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.fecha_registro    COMMENT     I   COMMENT ON COLUMN autenticacion.menu.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.fecha_modificacion    COMMENT     Q   COMMENT ON COLUMN autenticacion.menu.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    264            �           0    0    COLUMN menu.fecha_baja    COMMENT     A   COMMENT ON COLUMN autenticacion.menu.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    264            �           0    0 
   TABLE menu    ACL     M   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.menu TO usr_controleg_app;
          autenticacion          usr_controleg    false    264                       1259    174778    recurso    TABLE       CREATE TABLE autenticacion.recurso (
    rec_codigo integer NOT NULL,
    rec_nombre character varying NOT NULL,
    rec_descripcion character varying NOT NULL,
    men_codigo integer NOT NULL,
    rec_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 "   DROP TABLE autenticacion.recurso;
       autenticacion         heap    usr_controleg    false    4            �           0    0    TABLE recurso    COMMENT     ^   COMMENT ON TABLE autenticacion.recurso IS 'Tabla para el registro los recursos del sistema.';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.rec_codigo    COMMENT     S   COMMENT ON COLUMN autenticacion.recurso.rec_codigo IS 'Identificador del recurso';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.rec_nombre    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.rec_nombre IS 'El nombre del feature con el que se creo, tanto para el backend o frontend';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.rec_descripcion    COMMENT     a   COMMENT ON COLUMN autenticacion.recurso.rec_descripcion IS 'Descripcion o aclaraciones del rol';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.men_codigo    COMMENT     i   COMMENT ON COLUMN autenticacion.recurso.men_codigo IS 'Referencia al menu que agrupara a los recursos.';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.rec_estado    COMMENT     M   COMMENT ON COLUMN autenticacion.recurso.rec_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    263            �           0    0 #   COLUMN recurso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.fecha_registro    COMMENT     L   COMMENT ON COLUMN autenticacion.recurso.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    263            �           0    0 !   COLUMN recurso.fecha_modificacion    COMMENT     T   COMMENT ON COLUMN autenticacion.recurso.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    263            �           0    0    COLUMN recurso.fecha_baja    COMMENT     D   COMMENT ON COLUMN autenticacion.recurso.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    263            �           0    0    TABLE recurso    ACL     P   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.recurso TO usr_controleg_app;
          autenticacion          usr_controleg    false    263                       1259    174764    rol    TABLE       CREATE TABLE autenticacion.rol (
    rol_codigo integer NOT NULL,
    rol_nombre character varying NOT NULL,
    rol_descripcion character varying NOT NULL,
    tiprol_codigo integer NOT NULL,
    rol_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
    DROP TABLE autenticacion.rol;
       autenticacion         heap    usr_controleg    false    4            �           0    0 	   TABLE rol    COMMENT     J   COMMENT ON TABLE autenticacion.rol IS 'Tabla para el registro de roles.';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.rol_codigo    COMMENT     K   COMMENT ON COLUMN autenticacion.rol.rol_codigo IS 'Identificador del rol';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.rol_nombre    COMMENT     ^   COMMENT ON COLUMN autenticacion.rol.rol_nombre IS 'Nombre del rol, unico dentro del sistema';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.rol_descripcion    COMMENT     ]   COMMENT ON COLUMN autenticacion.rol.rol_descripcion IS 'Descripcion o aclaraciones del rol';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.tiprol_codigo    COMMENT     e   COMMENT ON COLUMN autenticacion.rol.tiprol_codigo IS 'Referencia al tipo de rol (INTERNO, EXTERNO)';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.rol_estado    COMMENT     I   COMMENT ON COLUMN autenticacion.rol.rol_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.rol.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.rol.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.rol.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.fecha_registro    COMMENT     H   COMMENT ON COLUMN autenticacion.rol.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.fecha_modificacion    COMMENT     P   COMMENT ON COLUMN autenticacion.rol.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    262            �           0    0    COLUMN rol.fecha_baja    COMMENT     @   COMMENT ON COLUMN autenticacion.rol.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    262            �           0    0 	   TABLE rol    ACL     L   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.rol TO usr_controleg_app;
          autenticacion          usr_controleg    false    262            	           1259    174807    rol_recurso_operacion    TABLE       CREATE TABLE autenticacion.rol_recurso_operacion (
    rro_codigo integer NOT NULL,
    rol_codigo integer NOT NULL,
    rec_codigo integer NOT NULL,
    acc_codigo integer NOT NULL,
    rro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 0   DROP TABLE autenticacion.rol_recurso_operacion;
       autenticacion         heap    usr_controleg    false    4            �           0    0    TABLE rol_recurso_operacion    COMMENT     �   COMMENT ON TABLE autenticacion.rol_recurso_operacion IS 'Tabla para el registro de los recursos y accesos que tendran los roles por defecto.';
          autenticacion          usr_controleg    false    265            �           0    0 '   COLUMN rol_recurso_operacion.rro_codigo    COMMENT     a   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rro_codigo IS 'Identificador de la tabla';
          autenticacion          usr_controleg    false    265            �           0    0 '   COLUMN rol_recurso_operacion.rol_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rol_codigo IS 'Referencia al rol, para asignarle recursos y accesos por defecto.';
          autenticacion          usr_controleg    false    265            �           0    0 '   COLUMN rol_recurso_operacion.rec_codigo    COMMENT     u   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rec_codigo IS 'Referencia al recurso que se asignara al rol.';
          autenticacion          usr_controleg    false    265            �           0    0 '   COLUMN rol_recurso_operacion.acc_codigo    COMMENT        COMMENT ON COLUMN autenticacion.rol_recurso_operacion.acc_codigo IS 'Accesos por defecto que se asignara al recurso del rol.';
          autenticacion          usr_controleg    false    265            �           0    0 '   COLUMN rol_recurso_operacion.rro_estado    COMMENT     [   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rro_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    265            �           0    0 -   COLUMN rol_recurso_operacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    265            �           0    0 1   COLUMN rol_recurso_operacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    265            �           0    0 )   COLUMN rol_recurso_operacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    265            �           0    0 +   COLUMN rol_recurso_operacion.fecha_registro    COMMENT     Z   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    265            �           0    0 /   COLUMN rol_recurso_operacion.fecha_modificacion    COMMENT     b   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    265            �           0    0 '   COLUMN rol_recurso_operacion.fecha_baja    COMMENT     R   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    265            �           0    0    TABLE rol_recurso_operacion    ACL     ^   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.rol_recurso_operacion TO usr_controleg_app;
          autenticacion          usr_controleg    false    265                       1259    174730    usuario    TABLE     ,  CREATE TABLE autenticacion.usuario (
    usu_codigo integer NOT NULL,
    usu_usuario character varying NOT NULL,
    usu_contrasenia character varying NOT NULL,
    usu_fecha_expiracion date,
    per_codigo integer NOT NULL,
    usu_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 "   DROP TABLE autenticacion.usuario;
       autenticacion         heap    usr_controleg    false    4            �           0    0    TABLE usuario    COMMENT     Q   COMMENT ON TABLE autenticacion.usuario IS 'Tabla para el registro de usuarios.';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.usu_codigo    COMMENT     S   COMMENT ON COLUMN autenticacion.usuario.usu_codigo IS 'Identificador del usuario';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.usu_usuario    COMMENT     f   COMMENT ON COLUMN autenticacion.usuario.usu_usuario IS 'Nombre de usuario, unico dentro del sistema';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.usu_contrasenia    COMMENT     l   COMMENT ON COLUMN autenticacion.usuario.usu_contrasenia IS 'Contraseña de seguridad cifrada del usuario.';
          autenticacion          usr_controleg    false    260            �           0    0 #   COLUMN usuario.usu_fecha_expiracion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usu_fecha_expiracion IS 'Fecha limite, hasta que se le permitira el acceso al sistema.';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.per_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.per_codigo IS 'Referencia  a la relacion de persona. identifica la relacion del persona con el usuario.';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.usu_estado    COMMENT     M   COMMENT ON COLUMN autenticacion.usuario.usu_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    260            �           0    0 #   COLUMN usuario.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.fecha_registro    COMMENT     L   COMMENT ON COLUMN autenticacion.usuario.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    260            �           0    0 !   COLUMN usuario.fecha_modificacion    COMMENT     T   COMMENT ON COLUMN autenticacion.usuario.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    260            �           0    0    COLUMN usuario.fecha_baja    COMMENT     D   COMMENT ON COLUMN autenticacion.usuario.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    260            �           0    0    TABLE usuario    ACL     P   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.usuario TO usr_controleg_app;
          autenticacion          usr_controleg    false    260                       1259    174748    usuario_entidad    TABLE     N  CREATE TABLE autenticacion.usuario_entidad (
    usuent_codigo integer NOT NULL,
    usuent_primer_ingreso timestamp without time zone,
    usuent_ultimo_ingreso timestamp without time zone,
    ent_codigo integer NOT NULL,
    usu_codigo integer NOT NULL,
    usuent_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE autenticacion.usuario_entidad;
       autenticacion         heap    usr_controleg    false    4            �           0    0    TABLE usuario_entidad    COMMENT     �   COMMENT ON TABLE autenticacion.usuario_entidad IS 'Relacion de una persona con una entidad, para referir a usuarios externos a la CGE';
          autenticacion          usr_controleg    false    261            �           0    0 $   COLUMN usuario_entidad.usuent_codigo    COMMENT     [   COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_codigo IS 'Identificador de tabla';
          autenticacion          usr_controleg    false    261            �           0    0 ,   COLUMN usuario_entidad.usuent_primer_ingreso    COMMENT        COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_primer_ingreso IS 'Fecha en la que el usuario ingreso por primera vez';
          autenticacion          usr_controleg    false    261            �           0    0 ,   COLUMN usuario_entidad.usuent_ultimo_ingreso    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_ultimo_ingreso IS 'Fecha de ultimo ingreso del usuario relacionado a la entidad.';
          autenticacion          usr_controleg    false    261            �           0    0 !   COLUMN usuario_entidad.ent_codigo    COMMENT     X   COMMENT ON COLUMN autenticacion.usuario_entidad.ent_codigo IS 'Referencia  al entidad';
          autenticacion          usr_controleg    false    261            �           0    0 !   COLUMN usuario_entidad.usu_codigo    COMMENT     Y   COMMENT ON COLUMN autenticacion.usuario_entidad.usu_codigo IS 'Referencia  al usuario.';
          autenticacion          usr_controleg    false    261            �           0    0 $   COLUMN usuario_entidad.usuent_estado    COMMENT     Y   COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_estado IS 'Estado del registro.';
          autenticacion          usr_controleg    false    261            �           0    0 '   COLUMN usuario_entidad.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    261                        0    0 +   COLUMN usuario_entidad.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    261                       0    0 #   COLUMN usuario_entidad.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    261                       0    0 %   COLUMN usuario_entidad.fecha_registro    COMMENT     T   COMMENT ON COLUMN autenticacion.usuario_entidad.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    261                       0    0 )   COLUMN usuario_entidad.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN autenticacion.usuario_entidad.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    261                       0    0 !   COLUMN usuario_entidad.fecha_baja    COMMENT     L   COMMENT ON COLUMN autenticacion.usuario_entidad.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    261                       0    0    TABLE usuario_entidad    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.usuario_entidad TO usr_controleg_app;
          autenticacion          usr_controleg    false    261            
           1259    174821    usuario_operacion    TABLE       CREATE TABLE autenticacion.usuario_operacion (
    usuope_codigo integer NOT NULL,
    usurol_codigo integer NOT NULL,
    rec_codigo integer NOT NULL,
    ope_codigo integer NOT NULL,
    usuope_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 ,   DROP TABLE autenticacion.usuario_operacion;
       autenticacion         heap    usr_controleg    false    4                       0    0    TABLE usuario_operacion    COMMENT     �   COMMENT ON TABLE autenticacion.usuario_operacion IS 'Tabla para el registro de operacion que tendra el usuario, por defecto se copial los accesos del rol.';
          autenticacion          usr_controleg    false    266                       0    0 &   COLUMN usuario_operacion.usuope_codigo    COMMENT     `   COMMENT ON COLUMN autenticacion.usuario_operacion.usuope_codigo IS 'Identificador de la tabla';
          autenticacion          usr_controleg    false    266                       0    0 &   COLUMN usuario_operacion.usurol_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usurol_codigo IS 'Referencia a la relacion de usuario rol, para este usuario de heredaran los permisos predeterminados en el rol.';
          autenticacion          usr_controleg    false    266            	           0    0 #   COLUMN usuario_operacion.rec_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.rec_codigo IS 'Referencia a los recursos del sistema. Durante la asignacion se copian los recursos del rol, posteriormente se iran agregando nuevos recursos';
          autenticacion          usr_controleg    false    266            
           0    0 #   COLUMN usuario_operacion.ope_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.ope_codigo IS 'Referencia a las operaciones que se le dara al recurso. Durante la asignacion se copian los accesos del recurso asociados al rol, posteriormente se iran agregando nuevos permisos';
          autenticacion          usr_controleg    false    266                       0    0 &   COLUMN usuario_operacion.usuope_estado    COMMENT     Z   COMMENT ON COLUMN autenticacion.usuario_operacion.usuope_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    266                       0    0 )   COLUMN usuario_operacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    266                       0    0 -   COLUMN usuario_operacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    266                       0    0 %   COLUMN usuario_operacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    266                       0    0 '   COLUMN usuario_operacion.fecha_registro    COMMENT     V   COMMENT ON COLUMN autenticacion.usuario_operacion.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    266                       0    0 +   COLUMN usuario_operacion.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN autenticacion.usuario_operacion.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    266                       0    0 #   COLUMN usuario_operacion.fecha_baja    COMMENT     N   COMMENT ON COLUMN autenticacion.usuario_operacion.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    266                       0    0    TABLE usuario_operacion    ACL     Z   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.usuario_operacion TO usr_controleg_app;
          autenticacion          usr_controleg    false    266                       1259    174835    usuario_rol    TABLE     �  CREATE TABLE autenticacion.usuario_rol (
    usurol_codigo integer NOT NULL,
    usu_codigo integer NOT NULL,
    rol_codigo integer NOT NULL,
    usurol_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE autenticacion.usuario_rol;
       autenticacion         heap    usr_controleg    false    4                       0    0    TABLE usuario_rol    COMMENT     ^   COMMENT ON TABLE autenticacion.usuario_rol IS 'Tabla para el registro de roles de usuarios.';
          autenticacion          usr_controleg    false    267                       0    0     COLUMN usuario_rol.usurol_codigo    COMMENT     Z   COMMENT ON COLUMN autenticacion.usuario_rol.usurol_codigo IS 'Identificador de la tabla';
          autenticacion          usr_controleg    false    267                       0    0    COLUMN usuario_rol.usu_codigo    COMMENT     S   COMMENT ON COLUMN autenticacion.usuario_rol.usu_codigo IS 'Referencia al usuario';
          autenticacion          usr_controleg    false    267                       0    0    COLUMN usuario_rol.rol_codigo    COMMENT     O   COMMENT ON COLUMN autenticacion.usuario_rol.rol_codigo IS 'Referencia al rol';
          autenticacion          usr_controleg    false    267                       0    0     COLUMN usuario_rol.usurol_estado    COMMENT     T   COMMENT ON COLUMN autenticacion.usuario_rol.usurol_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    267                       0    0 #   COLUMN usuario_rol.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_rol.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    267                       0    0 '   COLUMN usuario_rol.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_rol.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    267                       0    0    COLUMN usuario_rol.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_rol.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    267                       0    0 !   COLUMN usuario_rol.fecha_registro    COMMENT     P   COMMENT ON COLUMN autenticacion.usuario_rol.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    267                       0    0 %   COLUMN usuario_rol.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN autenticacion.usuario_rol.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    267                       0    0    COLUMN usuario_rol.fecha_baja    COMMENT     H   COMMENT ON COLUMN autenticacion.usuario_rol.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    267                       0    0    TABLE usuario_rol    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE autenticacion.usuario_rol TO usr_controleg_app;
          autenticacion          usr_controleg    false    267            �            1259    174588    cargo    TABLE       CREATE TABLE controleg_dictamen.cargo (
    car_codigo integer NOT NULL,
    car_monto numeric NOT NULL,
    car_numero integer NOT NULL,
    dic_codigo integer NOT NULL,
    mon_codigo integer,
    car_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 %   DROP TABLE controleg_dictamen.cargo;
       controleg_dictamen         heap    usr_controleg    false    7                       0    0    TABLE cargo    COMMENT     R   COMMENT ON TABLE controleg_dictamen.cargo IS 'Tabla para el registro de cargos.';
          controleg_dictamen          usr_controleg    false    250                        0    0    COLUMN cargo.car_codigo    COMMENT     W   COMMENT ON COLUMN controleg_dictamen.cargo.car_codigo IS 'llave primaria de la tabla';
          controleg_dictamen          usr_controleg    false    250            !           0    0    COLUMN cargo.car_monto    COMMENT     c   COMMENT ON COLUMN controleg_dictamen.cargo.car_monto IS 'monto del cargo que se esta registrando';
          controleg_dictamen          usr_controleg    false    250            "           0    0    COLUMN cargo.dic_codigo    COMMENT     a   COMMENT ON COLUMN controleg_dictamen.cargo.dic_codigo IS 'llave foranea a la tabla de dictamen';
          controleg_dictamen          usr_controleg    false    250            #           0    0    COLUMN cargo.mon_codigo    COMMENT     ~   COMMENT ON COLUMN controleg_dictamen.cargo.mon_codigo IS 'llave foranea a la tabla de moneda donde indica el tipo de moneda';
          controleg_dictamen          usr_controleg    false    250            $           0    0    COLUMN cargo.car_estado    COMMENT     P   COMMENT ON COLUMN controleg_dictamen.cargo.car_estado IS 'Estado del registro';
          controleg_dictamen          usr_controleg    false    250            %           0    0    COLUMN cargo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.cargo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    250            &           0    0 !   COLUMN cargo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.cargo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    250            '           0    0    COLUMN cargo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.cargo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    250            (           0    0    COLUMN cargo.fecha_registro    COMMENT     O   COMMENT ON COLUMN controleg_dictamen.cargo.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    250            )           0    0    COLUMN cargo.fecha_modificacion    COMMENT     W   COMMENT ON COLUMN controleg_dictamen.cargo.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    250            *           0    0    COLUMN cargo.fecha_baja    COMMENT     G   COMMENT ON COLUMN controleg_dictamen.cargo.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    250            +           0    0    TABLE cargo    ACL     S   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.cargo TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    250            �            1259    174660    dictamen_uai    TABLE     �  CREATE TABLE controleg_dictamen.dictamen_uai (
    dicuai_codigo integer NOT NULL,
    dicuai_gestion integer NOT NULL,
    dicuai_numero character varying NOT NULL,
    dicuai_fecha date NOT NULL,
    dicuai_numero_informe character varying,
    dicuai_fecha_informe date,
    tipaud_codigo integer,
    dicuai_nota_remision character varying,
    ent_codigo integer,
    dicuai_nombre_auditoria character varying,
    dicuai_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 ,   DROP TABLE controleg_dictamen.dictamen_uai;
       controleg_dictamen         heap    usr_controleg    false    7            ,           0    0 !   COLUMN dictamen_uai.dicuai_codigo    COMMENT     ^   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_codigo IS 'id de la llave primaria';
          controleg_dictamen          usr_controleg    false    255            -           0    0 "   COLUMN dictamen_uai.dicuai_gestion    COMMENT     \   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_gestion IS 'gestion del dictamen';
          controleg_dictamen          usr_controleg    false    255            .           0    0 !   COLUMN dictamen_uai.dicuai_numero    COMMENT     u   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_numero IS 'numero del dictamen emitido por la contraloria';
          controleg_dictamen          usr_controleg    false    255            /           0    0     COLUMN dictamen_uai.dicuai_fecha    COMMENT     s   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_fecha IS 'fecha del dictamen emitido por la contraloria';
          controleg_dictamen          usr_controleg    false    255            0           0    0 )   COLUMN dictamen_uai.dicuai_numero_informe    COMMENT     w   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_numero_informe IS 'numero del informe de la entidad externa';
          controleg_dictamen          usr_controleg    false    255            1           0    0 (   COLUMN dictamen_uai.dicuai_fecha_informe    COMMENT     }   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_fecha_informe IS 'fecha del informe de la auditoria de la entidad';
          controleg_dictamen          usr_controleg    false    255            2           0    0 !   COLUMN dictamen_uai.tipaud_codigo    COMMENT     b   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.tipaud_codigo IS 'Tipo de auditoria realizada';
          controleg_dictamen          usr_controleg    false    255            3           0    0 (   COLUMN dictamen_uai.dicuai_nota_remision    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_nota_remision IS 'numero de la nota de la entidad con la cual remitio los informes de auditoria';
          controleg_dictamen          usr_controleg    false    255            4           0    0    COLUMN dictamen_uai.ent_codigo    COMMENT     w   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.ent_codigo IS 'id de la entidad que remite el informe de auditoria';
          controleg_dictamen          usr_controleg    false    255            5           0    0 +   COLUMN dictamen_uai.dicuai_nombre_auditoria    COMMENT     q   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.dicuai_nombre_auditoria IS 'nombre de la auditoria realizada';
          controleg_dictamen          usr_controleg    false    255            6           0    0 $   COLUMN dictamen_uai.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    255            7           0    0 (   COLUMN dictamen_uai.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    255            8           0    0     COLUMN dictamen_uai.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    255            9           0    0 "   COLUMN dictamen_uai.fecha_registro    COMMENT     V   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    255            :           0    0 &   COLUMN dictamen_uai.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    255            ;           0    0    COLUMN dictamen_uai.fecha_baja    COMMENT     N   COMMENT ON COLUMN controleg_dictamen.dictamen_uai.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    255            <           0    0    TABLE dictamen_uai    ACL     Z   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.dictamen_uai TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    255                       1259    174702    involucrado    TABLE       CREATE TABLE controleg_dictamen.involucrado (
    inv_codigo integer NOT NULL,
    ent_codigo integer,
    car_codigo integer NOT NULL,
    perres_codigo integer NOT NULL,
    inftip_codigo integer,
    inv_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 +   DROP TABLE controleg_dictamen.involucrado;
       controleg_dictamen         heap    usr_controleg    false    7            =           0    0    COLUMN involucrado.inv_codigo    COMMENT     Z   COMMENT ON COLUMN controleg_dictamen.involucrado.inv_codigo IS 'id primario de la tabla';
          controleg_dictamen          usr_controleg    false    258            >           0    0    COLUMN involucrado.ent_codigo    COMMENT     n   COMMENT ON COLUMN controleg_dictamen.involucrado.ent_codigo IS 'campo donde se almacena el id de la entidad';
          controleg_dictamen          usr_controleg    false    258            ?           0    0    COLUMN involucrado.car_codigo    COMMENT     d   COMMENT ON COLUMN controleg_dictamen.involucrado.car_codigo IS 'llave foranea a la tabla de cargo';
          controleg_dictamen          usr_controleg    false    258            @           0    0     COLUMN involucrado.perres_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.perres_codigo IS 'Codigo de persona, que se constituye como responsable para el cargo.';
          controleg_dictamen          usr_controleg    false    258            A           0    0     COLUMN involucrado.inftip_codigo    COMMENT     q   COMMENT ON COLUMN controleg_dictamen.involucrado.inftip_codigo IS 'llave foranea a la tabla de infraccion Tipo';
          controleg_dictamen          usr_controleg    false    258            B           0    0    COLUMN involucrado.inv_estado    COMMENT     Y   COMMENT ON COLUMN controleg_dictamen.involucrado.inv_estado IS 'estado del involucrado';
          controleg_dictamen          usr_controleg    false    258            C           0    0 #   COLUMN involucrado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    258            D           0    0 '   COLUMN involucrado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    258            E           0    0    COLUMN involucrado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    258            F           0    0 !   COLUMN involucrado.fecha_registro    COMMENT     U   COMMENT ON COLUMN controleg_dictamen.involucrado.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    258            G           0    0 %   COLUMN involucrado.fecha_modificacion    COMMENT     ]   COMMENT ON COLUMN controleg_dictamen.involucrado.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    258            H           0    0    COLUMN involucrado.fecha_baja    COMMENT     M   COMMENT ON COLUMN controleg_dictamen.involucrado.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    258            I           0    0    TABLE involucrado    ACL     Y   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.involucrado TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    258                        1259    174674    registro_dictamen    TABLE     �  CREATE TABLE controleg_dictamen.registro_dictamen (
    dic_codigo integer NOT NULL,
    dic_procedencia integer NOT NULL,
    dic_llave integer NOT NULL,
    dic_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 1   DROP TABLE controleg_dictamen.registro_dictamen;
       controleg_dictamen         heap    usr_controleg    false    7            J           0    0    TABLE registro_dictamen    COMMENT     m   COMMENT ON TABLE controleg_dictamen.registro_dictamen IS 'Tabla para registrar o relacionar los dictamenes';
          controleg_dictamen          usr_controleg    false    256            K           0    0 #   COLUMN registro_dictamen.dic_codigo    COMMENT     W   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.dic_codigo IS 'id de la tabla';
          controleg_dictamen          usr_controleg    false    256            L           0    0 (   COLUMN registro_dictamen.dic_procedencia    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.dic_procedencia IS '1 o 2 (si es 1 la procedencia es conaud y si es 2 uai)';
          controleg_dictamen          usr_controleg    false    256            M           0    0 "   COLUMN registro_dictamen.dic_llave    COMMENT     e   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.dic_llave IS 'id de la tabla de procedencia';
          controleg_dictamen          usr_controleg    false    256            N           0    0 )   COLUMN registro_dictamen.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    256            O           0    0 -   COLUMN registro_dictamen.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    256            P           0    0 %   COLUMN registro_dictamen.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    256            Q           0    0 '   COLUMN registro_dictamen.fecha_registro    COMMENT     [   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    256            R           0    0 +   COLUMN registro_dictamen.fecha_modificacion    COMMENT     c   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    256            S           0    0 #   COLUMN registro_dictamen.fecha_baja    COMMENT     S   COMMENT ON COLUMN controleg_dictamen.registro_dictamen.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    256            T           0    0    TABLE registro_dictamen    ACL     _   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.registro_dictamen TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    256            �            1259    174630    seguimiento_cargo    TABLE     N  CREATE TABLE controleg_dictamen.seguimiento_cargo (
    segcar_codigo integer NOT NULL,
    segcar_fecha date NOT NULL,
    segcar_descripcion character varying,
    segcar_respaldo json,
    car_codigo integer NOT NULL,
    estcla_codigo integer NOT NULL,
    segcar_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 1   DROP TABLE controleg_dictamen.seguimiento_cargo;
       controleg_dictamen         heap    usr_controleg    false    7            U           0    0    TABLE seguimiento_cargo    COMMENT     u   COMMENT ON TABLE controleg_dictamen.seguimiento_cargo IS 'Tabla para controlar la asignacion de estados a un cargo';
          controleg_dictamen          usr_controleg    false    253            V           0    0 &   COLUMN seguimiento_cargo.segcar_codigo    COMMENT     f   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_codigo IS 'llave primaria de la tabla';
          controleg_dictamen          usr_controleg    false    253            W           0    0 %   COLUMN seguimiento_cargo.segcar_fecha    COMMENT     w   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_dictamen          usr_controleg    false    253            X           0    0 +   COLUMN seguimiento_cargo.segcar_descripcion    COMMENT        COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_dictamen          usr_controleg    false    253            Y           0    0 (   COLUMN seguimiento_cargo.segcar_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_dictamen          usr_controleg    false    253            Z           0    0 #   COLUMN seguimiento_cargo.car_codigo    COMMENT     q   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.car_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_dictamen          usr_controleg    false    253            [           0    0 &   COLUMN seguimiento_cargo.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_dictamen          usr_controleg    false    253            \           0    0 &   COLUMN seguimiento_cargo.segcar_estado    COMMENT     s   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_estado IS 'estado del registro en la base de datos';
          controleg_dictamen          usr_controleg    false    253            ]           0    0 )   COLUMN seguimiento_cargo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    253            ^           0    0 -   COLUMN seguimiento_cargo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    253            _           0    0 %   COLUMN seguimiento_cargo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    253            `           0    0 '   COLUMN seguimiento_cargo.fecha_registro    COMMENT     [   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    253            a           0    0 +   COLUMN seguimiento_cargo.fecha_modificacion    COMMENT     c   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    253            b           0    0 #   COLUMN seguimiento_cargo.fecha_baja    COMMENT     S   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    253            c           0    0    TABLE seguimiento_cargo    ACL     _   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.seguimiento_cargo TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    253                       1259    174688    seguimiento_dictamen    TABLE     Q  CREATE TABLE controleg_dictamen.seguimiento_dictamen (
    segdic_codigo integer NOT NULL,
    segdic_fecha date NOT NULL,
    segdic_descripcion character varying,
    segdic_respaldo json,
    dic_codigo integer NOT NULL,
    estcla_codigo integer NOT NULL,
    segdic_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 4   DROP TABLE controleg_dictamen.seguimiento_dictamen;
       controleg_dictamen         heap    usr_controleg    false    7            d           0    0    TABLE seguimiento_dictamen    COMMENT     {   COMMENT ON TABLE controleg_dictamen.seguimiento_dictamen IS 'Tabla para controlar la asignacion de estados a un dictamen';
          controleg_dictamen          usr_controleg    false    257            e           0    0 )   COLUMN seguimiento_dictamen.segdic_codigo    COMMENT     i   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.segdic_codigo IS 'llave primaria de la tabla';
          controleg_dictamen          usr_controleg    false    257            f           0    0 (   COLUMN seguimiento_dictamen.segdic_fecha    COMMENT     z   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.segdic_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_dictamen          usr_controleg    false    257            g           0    0 .   COLUMN seguimiento_dictamen.segdic_descripcion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.segdic_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_dictamen          usr_controleg    false    257            h           0    0 +   COLUMN seguimiento_dictamen.segdic_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.segdic_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_dictamen          usr_controleg    false    257            i           0    0 &   COLUMN seguimiento_dictamen.dic_codigo    COMMENT     t   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.dic_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_dictamen          usr_controleg    false    257            j           0    0 )   COLUMN seguimiento_dictamen.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_dictamen          usr_controleg    false    257            k           0    0 )   COLUMN seguimiento_dictamen.segdic_estado    COMMENT     v   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.segdic_estado IS 'estado del registro en la base de datos';
          controleg_dictamen          usr_controleg    false    257            l           0    0 ,   COLUMN seguimiento_dictamen.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    257            m           0    0 0   COLUMN seguimiento_dictamen.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    257            n           0    0 (   COLUMN seguimiento_dictamen.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    257            o           0    0 *   COLUMN seguimiento_dictamen.fecha_registro    COMMENT     ^   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    257            p           0    0 .   COLUMN seguimiento_dictamen.fecha_modificacion    COMMENT     f   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    257            q           0    0 &   COLUMN seguimiento_dictamen.fecha_baja    COMMENT     V   COMMENT ON COLUMN controleg_dictamen.seguimiento_dictamen.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    257            r           0    0    TABLE seguimiento_dictamen    ACL     b   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.seguimiento_dictamen TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    257            �            1259    174538    empresa_unipersonal    TABLE     �  CREATE TABLE controleg_persona.empresa_unipersonal (
    empuni_codigo integer NOT NULL,
    per_codigo integer NOT NULL,
    perjur_codigo integer NOT NULL,
    empuni_observacion character varying,
    empuni_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 2   DROP TABLE controleg_persona.empresa_unipersonal;
       controleg_persona         heap    usr_controleg    false    6            s           0    0 (   COLUMN empresa_unipersonal.empuni_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.empuni_codigo IS 'campo donde se almacenara el id de la persona juridica relacionada con persona que ingreso al sistema';
          controleg_persona          usr_controleg    false    246            t           0    0 %   COLUMN empresa_unipersonal.per_codigo    COMMENT     j   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.per_codigo IS 'llave foranea a la tabla persona';
          controleg_persona          usr_controleg    false    246            u           0    0 (   COLUMN empresa_unipersonal.perjur_codigo    COMMENT     v   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.perjur_codigo IS 'llave foranea a la tabla persona juridica';
          controleg_persona          usr_controleg    false    246            v           0    0 -   COLUMN empresa_unipersonal.empuni_observacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.empuni_observacion IS 'campo donde se almacenara alguna observacion si fuera necesario';
          controleg_persona          usr_controleg    false    246            w           0    0 (   COLUMN empresa_unipersonal.empuni_estado    COMMENT     i   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.empuni_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    246            x           0    0    TABLE empresa_unipersonal    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.empresa_unipersonal TO usr_controleg_app;
          controleg_persona          usr_controleg    false    246            �            1259    174550    entidad    TABLE     �  CREATE TABLE controleg_persona.entidad (
    ent_codigo integer NOT NULL,
    ent_nit integer NOT NULL,
    ent_correo_electronico character varying,
    ent_observacion character varying,
    ent_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE controleg_persona.entidad;
       controleg_persona         heap    usr_controleg    false    6            y           0    0    COLUMN entidad.ent_codigo    COMMENT     Y   COMMENT ON COLUMN controleg_persona.entidad.ent_codigo IS 'llave primararia de la taba';
          controleg_persona          usr_controleg    false    247            z           0    0    COLUMN entidad.ent_nit    COMMENT     W   COMMENT ON COLUMN controleg_persona.entidad.ent_nit IS 'nit de la entidad registrada';
          controleg_persona          usr_controleg    false    247            {           0    0 %   COLUMN entidad.ent_correo_electronico    COMMENT     q   COMMENT ON COLUMN controleg_persona.entidad.ent_correo_electronico IS 'correo con el cual ingresara la entidad';
          controleg_persona          usr_controleg    false    247            |           0    0    TABLE entidad    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.entidad TO usr_controleg_app;
          controleg_persona          usr_controleg    false    247            �            1259    174411    persona    TABLE     �  CREATE TABLE controleg_persona.persona (
    per_codigo integer NOT NULL,
    per_nombres character varying NOT NULL,
    per_apellido_paterno character varying NOT NULL,
    per_apellido_materno character varying,
    per_estado smallint DEFAULT 1 NOT NULL,
    per_fecha_nacimiento character varying NOT NULL,
    per_documento_identidad character varying,
    per_nacionalidad character varying NOT NULL,
    per_correo_electronico character varying,
    tipdoc_codigo integer NOT NULL,
    per_apellido_conyuge character varying,
    per_complemento_segip character varying,
    per_lugar_emision integer,
    per_genero integer NOT NULL,
    per_domicilio character varying,
    perext_codigo integer NOT NULL,
    per_telefono character varying,
    validado_segip bit(1),
    per_observacion character varying,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE controleg_persona.persona;
       controleg_persona         heap    usr_controleg    false    6            }           0    0    COLUMN persona.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_codigo IS 'campo donde se almacenara el id de la persona que ingreso al sistema';
          controleg_persona          usr_controleg    false    235            ~           0    0    COLUMN persona.per_nombres    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_nombres IS 'campo donde se almacenara los nombres de las personas que ingresaron al sistema';
          controleg_persona          usr_controleg    false    235                       0    0 #   COLUMN persona.per_apellido_paterno    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_apellido_paterno IS 'campo donde se almacenara el apellido paterno de la persona';
          controleg_persona          usr_controleg    false    235            �           0    0 #   COLUMN persona.per_apellido_materno    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_apellido_materno IS 'campo donde se almacenara el apellido maternod de la persona';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.per_estado    COMMENT     Z   COMMENT ON COLUMN controleg_persona.persona.per_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    235            �           0    0 #   COLUMN persona.per_fecha_nacimiento    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_fecha_nacimiento IS 'campo donde se almacena la fecha de nacimiento de la persona que ingreso al sistema';
          controleg_persona          usr_controleg    false    235            �           0    0 &   COLUMN persona.per_documento_identidad    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_documento_identidad IS 'campo donde se registra la cedula de identidad de la persona que ingresa al sistema';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.per_nacionalidad    COMMENT     y   COMMENT ON COLUMN controleg_persona.persona.per_nacionalidad IS 'campo donde se almacenara la naciolidad de la persona';
          controleg_persona          usr_controleg    false    235            �           0    0 %   COLUMN persona.per_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_correo_electronico IS 'campo donde se almacenara el dato del correo electronico de la persona';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.tipdoc_codigo    COMMENT     o   COMMENT ON COLUMN controleg_persona.persona.tipdoc_codigo IS 'campo donde se almacenara el tipo de documento';
          controleg_persona          usr_controleg    false    235            �           0    0 #   COLUMN persona.per_apellido_conyuge    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_apellido_conyuge IS 'campo donde se almacenara el apellido de onyuge paterno de la persona si corresponde';
          controleg_persona          usr_controleg    false    235            �           0    0 $   COLUMN persona.per_complemento_segip    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_complemento_segip IS 'campo donde se almacenara el complemento segip si corresponde';
          controleg_persona          usr_controleg    false    235            �           0    0     COLUMN persona.per_lugar_emision    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_lugar_emision IS 'campo donde se almacenara el lugar de emision del documento de identidad';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.per_genero    COMMENT     p   COMMENT ON COLUMN controleg_persona.persona.per_genero IS 'campo donde se almacenara el genero de una persona';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.per_domicilio    COMMENT     v   COMMENT ON COLUMN controleg_persona.persona.per_domicilio IS 'campo donde se almacenara el domicilio de una persona';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.perext_codigo    COMMENT     v   COMMENT ON COLUMN controleg_persona.persona.perext_codigo IS 'Campo que hace referencia a codigo de persona externa';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.per_telefono    COMMENT     y   COMMENT ON COLUMN controleg_persona.persona.per_telefono IS 'Campo que hace referencia a numero de telefono de persona';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.validado_segip    COMMENT     }   COMMENT ON COLUMN controleg_persona.persona.validado_segip IS 'Campo que hace referencia a validacion con segip de persona';
          controleg_persona          usr_controleg    false    235            �           0    0    COLUMN persona.per_observacion    COMMENT     ~   COMMENT ON COLUMN controleg_persona.persona.per_observacion IS 'campo donde se almacenara alguna observacion si corresponde';
          controleg_persona          usr_controleg    false    235            �           0    0    TABLE persona    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.persona TO usr_controleg_app;
          controleg_persona          usr_controleg    false    235            �            1259    174526    persona_juridica    TABLE     �  CREATE TABLE controleg_persona.persona_juridica (
    perjur_codigo integer NOT NULL,
    perjur_razon_social character varying NOT NULL,
    perjur_nit character varying(20),
    perjur_sigla character varying(10) NOT NULL,
    perjur_direccion character varying NOT NULL,
    perjur_telefono character varying,
    perjur_fax character varying,
    perjur_correo_electronico character varying,
    perjur_observacion character varying,
    perjur_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 /   DROP TABLE controleg_persona.persona_juridica;
       controleg_persona         heap    usr_controleg    false    6            �           0    0 %   COLUMN persona_juridica.perjur_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_codigo IS 'campo donde se almacenara el id de la persona juridica que ingreso al sistema';
          controleg_persona          usr_controleg    false    245            �           0    0 +   COLUMN persona_juridica.perjur_razon_social    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_razon_social IS 'campo donde se almacenara la razon social de persona juridica';
          controleg_persona          usr_controleg    false    245            �           0    0 "   COLUMN persona_juridica.perjur_nit    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_nit IS 'campo donde se registra el NIT de la persona juridica que ingresa al sistema';
          controleg_persona          usr_controleg    false    245            �           0    0 $   COLUMN persona_juridica.perjur_sigla    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_sigla IS 'campo donde se almacena la sigla de la entidad juridica si tuviera';
          controleg_persona          usr_controleg    false    245            �           0    0 (   COLUMN persona_juridica.perjur_direccion    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_direccion IS 'campo donde se almacenara la direccion de la persona juridica';
          controleg_persona          usr_controleg    false    245            �           0    0 '   COLUMN persona_juridica.perjur_telefono    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_telefono IS 'campo donde se almacenara el dato del telefono de la persona juridica';
          controleg_persona          usr_controleg    false    245            �           0    0 "   COLUMN persona_juridica.perjur_fax    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_fax IS 'campo donde se almacenara el fax de la persona juridica si tiene';
          controleg_persona          usr_controleg    false    245            �           0    0 1   COLUMN persona_juridica.perjur_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_correo_electronico IS 'campo donde se almacenara el correo electronico de la persona juridica';
          controleg_persona          usr_controleg    false    245            �           0    0 *   COLUMN persona_juridica.perjur_observacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_observacion IS 'campo donde se almacenara alguna observacion si corresponde';
          controleg_persona          usr_controleg    false    245            �           0    0 %   COLUMN persona_juridica.perjur_estado    COMMENT     f   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    245            �           0    0    TABLE persona_juridica    ACL     ]   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.persona_juridica TO usr_controleg_app;
          controleg_persona          usr_controleg    false    245                       1259    174716    persona_responsable    TABLE     ,  CREATE TABLE controleg_persona.persona_responsable (
    perres_codigo integer NOT NULL,
    per_codigo integer,
    per_codigo_natural integer,
    empuni_codigo integer,
    perjur_codigo integer,
    ent_codigo integer,
    perres_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 2   DROP TABLE controleg_persona.persona_responsable;
       controleg_persona         heap    usr_controleg    false    6            �           0    0    TABLE persona_responsable    COMMENT     �   COMMENT ON TABLE controleg_persona.persona_responsable IS 'Tabla para determinar la responsabilidad de una persona, esta responsabilidad pueder ser por demandado, involucrado, como natural, juridica o empresa';
          controleg_persona          usr_controleg    false    259            �           0    0 (   COLUMN persona_responsable.perres_codigo    COMMENT     c   COMMENT ON COLUMN controleg_persona.persona_responsable.perres_codigo IS 'Identificador de tabla';
          controleg_persona          usr_controleg    false    259            �           0    0 %   COLUMN persona_responsable.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.per_codigo IS 'Referencia a la persona que  tiene responsabilidad de realizar ciertas acciones o tareas, que pueden ser procesos o cargos.';
          controleg_persona          usr_controleg    false    259            �           0    0 -   COLUMN persona_responsable.per_codigo_natural    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.per_codigo_natural IS 'Referencia a la persona natural, de la que la persona se hara responsable. Para este caso, per_codigo y per_codigo_natural deben ser el mismo.';
          controleg_persona          usr_controleg    false    259            �           0    0 (   COLUMN persona_responsable.empuni_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.empuni_codigo IS 'Referencia a la empresa unipersonal, de la que la persona se hara responsable';
          controleg_persona          usr_controleg    false    259            �           0    0 (   COLUMN persona_responsable.perjur_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.perjur_codigo IS 'Referencia a la persona juridica, de la que la persona se hara responsable';
          controleg_persona          usr_controleg    false    259            �           0    0 %   COLUMN persona_responsable.ent_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.ent_codigo IS 'Referencia a la entidad, de la que la persona se hara responsable';
          controleg_persona          usr_controleg    false    259            �           0    0 (   COLUMN persona_responsable.perres_estado    COMMENT     `   COMMENT ON COLUMN controleg_persona.persona_responsable.perres_estado IS 'Estado del registro';
          controleg_persona          usr_controleg    false    259            �           0    0 +   COLUMN persona_responsable.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_persona          usr_controleg    false    259            �           0    0 /   COLUMN persona_responsable.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_persona          usr_controleg    false    259            �           0    0 '   COLUMN persona_responsable.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_persona          usr_controleg    false    259            �           0    0 )   COLUMN persona_responsable.fecha_registro    COMMENT     \   COMMENT ON COLUMN controleg_persona.persona_responsable.fecha_registro IS 'Fecha registro';
          controleg_persona          usr_controleg    false    259            �           0    0 -   COLUMN persona_responsable.fecha_modificacion    COMMENT     d   COMMENT ON COLUMN controleg_persona.persona_responsable.fecha_modificacion IS 'Fecha modificacion';
          controleg_persona          usr_controleg    false    259            �           0    0 %   COLUMN persona_responsable.fecha_baja    COMMENT     T   COMMENT ON COLUMN controleg_persona.persona_responsable.fecha_baja IS 'Fecha baja';
          controleg_persona          usr_controleg    false    259            �           0    0    TABLE persona_responsable    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.persona_responsable TO usr_controleg_app;
          controleg_persona          usr_controleg    false    259            �            1259    174562    representante_legal    TABLE     �  CREATE TABLE controleg_persona.representante_legal (
    repleg_codigo integer NOT NULL,
    per_codigo integer NOT NULL,
    perjur_codigo integer NOT NULL,
    repleg_respaldo character varying,
    repleg_observacion character varying,
    repleg_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 2   DROP TABLE controleg_persona.representante_legal;
       controleg_persona         heap    usr_controleg    false    6            �           0    0 (   COLUMN representante_legal.repleg_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_codigo IS 'campo donde se almacenara el identificador de representante legal';
          controleg_persona          usr_controleg    false    248            �           0    0 %   COLUMN representante_legal.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.per_codigo IS 'Referencia a la persona que representa legalmente a una persona juridica';
          controleg_persona          usr_controleg    false    248            �           0    0 (   COLUMN representante_legal.perjur_codigo    COMMENT     n   COMMENT ON COLUMN controleg_persona.representante_legal.perjur_codigo IS 'Referencia a la persona juridica.';
          controleg_persona          usr_controleg    false    248            �           0    0 *   COLUMN representante_legal.repleg_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_respaldo IS 'Numero de poder que respalde la representacion legal.';
          controleg_persona          usr_controleg    false    248            �           0    0 -   COLUMN representante_legal.repleg_observacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_observacion IS 'campo donde se almacenara alguna observacion si fuera necesario';
          controleg_persona          usr_controleg    false    248            �           0    0 (   COLUMN representante_legal.repleg_estado    COMMENT     i   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    248            �           0    0    TABLE representante_legal    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.representante_legal TO usr_controleg_app;
          controleg_persona          usr_controleg    false    248                       1259    174849    cargo_proceso    TABLE     �  CREATE TABLE controleg_proceso.cargo_proceso (
    carpro_codigo integer NOT NULL,
    pro_codigo integer NOT NULL,
    car_codigo integer NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 ,   DROP TABLE controleg_proceso.cargo_proceso;
       controleg_proceso         heap    usr_controleg    false    10            �           0    0    TABLE cargo_proceso    COMMENT     s   COMMENT ON TABLE controleg_proceso.cargo_proceso IS 'Tabla para definir las trasnferencias de cargos a procesos.';
          controleg_proceso          usr_controleg    false    268            �           0    0 "   COLUMN cargo_proceso.carpro_codigo    COMMENT     ]   COMMENT ON COLUMN controleg_proceso.cargo_proceso.carpro_codigo IS 'Identificador de tabla';
          controleg_proceso          usr_controleg    false    268            �           0    0    COLUMN cargo_proceso.pro_codigo    COMMENT     Z   COMMENT ON COLUMN controleg_proceso.cargo_proceso.pro_codigo IS 'Referencia al proceso.';
          controleg_proceso          usr_controleg    false    268            �           0    0    COLUMN cargo_proceso.car_codigo    COMMENT     W   COMMENT ON COLUMN controleg_proceso.cargo_proceso.car_codigo IS 'Referencia al cargo';
          controleg_proceso          usr_controleg    false    268            �           0    0 %   COLUMN cargo_proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.cargo_proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    268            �           0    0 )   COLUMN cargo_proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.cargo_proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    268            �           0    0 !   COLUMN cargo_proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.cargo_proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    268            �           0    0 #   COLUMN cargo_proceso.fecha_registro    COMMENT     V   COMMENT ON COLUMN controleg_proceso.cargo_proceso.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    268            �           0    0 '   COLUMN cargo_proceso.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN controleg_proceso.cargo_proceso.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    268            �           0    0    COLUMN cargo_proceso.fecha_baja    COMMENT     N   COMMENT ON COLUMN controleg_proceso.cargo_proceso.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    268            �           0    0    TABLE cargo_proceso    ACL     Z   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.cargo_proceso TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    268            �            1259    174644 	   demandado    TABLE     �  CREATE TABLE controleg_proceso.demandado (
    dem_codigo integer NOT NULL,
    dem_consolidado boolean DEFAULT false NOT NULL,
    dem_fecha_consolidado timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    ent_codigo integer,
    pro_codigo integer,
    perres_codigo integer NOT NULL,
    dem_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 (   DROP TABLE controleg_proceso.demandado;
       controleg_proceso         heap    usr_controleg    false    10            �           0    0    COLUMN demandado.dem_codigo    COMMENT     W   COMMENT ON COLUMN controleg_proceso.demandado.dem_codigo IS 'id primario de la tabla';
          controleg_proceso          usr_controleg    false    254            �           0    0     COLUMN demandado.dem_consolidado    COMMENT     w   COMMENT ON COLUMN controleg_proceso.demandado.dem_consolidado IS 'dato que representa la consolidacion del registro.';
          controleg_proceso          usr_controleg    false    254            �           0    0 &   COLUMN demandado.dem_fecha_consolidado    COMMENT     u   COMMENT ON COLUMN controleg_proceso.demandado.dem_fecha_consolidado IS 'Fecha en la que se consolido al demandado.';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.ent_codigo    COMMENT     o   COMMENT ON COLUMN controleg_proceso.demandado.ent_codigo IS 'campo donde se almacena el nombre de la entidad';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.pro_codigo    COMMENT     c   COMMENT ON COLUMN controleg_proceso.demandado.pro_codigo IS 'llave foranea a la tabla de proceso';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.perres_codigo    COMMENT     y   COMMENT ON COLUMN controleg_proceso.demandado.perres_codigo IS 'Referencia a la persona responsable que sera demandado';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.dem_estado    COMMENT     T   COMMENT ON COLUMN controleg_proceso.demandado.dem_estado IS 'estado del demandado';
          controleg_proceso          usr_controleg    false    254            �           0    0 !   COLUMN demandado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.demandado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    254            �           0    0 %   COLUMN demandado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.demandado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.demandado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.fecha_registro    COMMENT     R   COMMENT ON COLUMN controleg_proceso.demandado.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    254            �           0    0 #   COLUMN demandado.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN controleg_proceso.demandado.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    254            �           0    0    COLUMN demandado.fecha_baja    COMMENT     J   COMMENT ON COLUMN controleg_proceso.demandado.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    254            �           0    0    TABLE demandado    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.demandado TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    254            �            1259    174574    proceso    TABLE     <  CREATE TABLE controleg_proceso.proceso (
    pro_codigo integer NOT NULL,
    pro_gestion integer NOT NULL,
    pro_fecha_inicio date,
    pro_monto numeric,
    pro_codigo_fiscalia character varying,
    pro_juzgado character varying,
    pro_causa character varying,
    pro_datos_adicionales json,
    pro_observacion character varying,
    pro_codigo_anterior integer,
    ent_codigo integer NOT NULL,
    pro_abogado_codigo integer,
    tippro_codigo integer NOT NULL,
    mon_codigo integer,
    pro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE controleg_proceso.proceso;
       controleg_proceso         heap    usr_controleg    false    10            �           0    0    COLUMN proceso.pro_codigo    COMMENT     `   COMMENT ON COLUMN controleg_proceso.proceso.pro_codigo IS 'Llave primaria de la tabla proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.pro_gestion    COMMENT     h   COMMENT ON COLUMN controleg_proceso.proceso.pro_gestion IS 'Campo que almacena la gestion del proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.pro_fecha_inicio    COMMENT     w   COMMENT ON COLUMN controleg_proceso.proceso.pro_fecha_inicio IS 'Campo donde almacena la fecha de inicio del proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.pro_monto    COMMENT     i   COMMENT ON COLUMN controleg_proceso.proceso.pro_monto IS 'campo donde se almacena el monto del proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0 "   COLUMN proceso.pro_codigo_fiscalia    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.pro_codigo_fiscalia IS 'campo donde se puede escribir el codigo del proceso ejm el codigo de la fiscalia';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.pro_juzgado    COMMENT     {   COMMENT ON COLUMN controleg_proceso.proceso.pro_juzgado IS 'campo donde se almacena el juzgado donde se lleva el proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0 $   COLUMN proceso.pro_datos_adicionales    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.pro_datos_adicionales IS 'campos donde se registra un json donde se registra los datos adicionales del proceso segun el tipo de proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0 "   COLUMN proceso.pro_codigo_anterior    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.pro_codigo_anterior IS 'campo donde se llena el id del proceso que viene del proceso anterior';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.ent_codigo    COMMENT     t   COMMENT ON COLUMN controleg_proceso.proceso.ent_codigo IS 'campo donde se almacena el id de la entidad demandante';
          controleg_proceso          usr_controleg    false    249            �           0    0 !   COLUMN proceso.pro_abogado_codigo    COMMENT     p   COMMENT ON COLUMN controleg_proceso.proceso.pro_abogado_codigo IS 'Campo de almacenamiento del id del abagado';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.tippro_codigo    COMMENT     x   COMMENT ON COLUMN controleg_proceso.proceso.tippro_codigo IS 'Llave foranea a la tabla parametrica de Tipo de Proceso';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.mon_codigo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.mon_codigo IS 'llave foranea a la tabla moneda donde se almacena el tipo de moneda';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.pro_estado    COMMENT     Q   COMMENT ON COLUMN controleg_proceso.proceso.pro_estado IS 'Estado del Registro';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    249            �           0    0 #   COLUMN proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.fecha_registro    COMMENT     P   COMMENT ON COLUMN controleg_proceso.proceso.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    249            �           0    0 !   COLUMN proceso.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN controleg_proceso.proceso.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    249            �           0    0    COLUMN proceso.fecha_baja    COMMENT     H   COMMENT ON COLUMN controleg_proceso.proceso.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    249            �           0    0    TABLE proceso    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    249            �            1259    174602    proceso_cargo    TABLE     �  CREATE TABLE controleg_proceso.proceso_cargo (
    procar_codigo integer NOT NULL,
    pro_codigo integer,
    car_codigo integer,
    procar_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 ,   DROP TABLE controleg_proceso.proceso_cargo;
       controleg_proceso         heap    usr_controleg    false    10            �           0    0    TABLE proceso_cargo    COMMENT     �   COMMENT ON TABLE controleg_proceso.proceso_cargo IS 'Tabla para definir la relacion de un cargo cuando este pasa a ser proceso.';
          controleg_proceso          usr_controleg    false    251            �           0    0 "   COLUMN proceso_cargo.procar_codigo    COMMENT     ]   COMMENT ON COLUMN controleg_proceso.proceso_cargo.procar_codigo IS 'Identificador de tabla';
          controleg_proceso          usr_controleg    false    251            �           0    0    COLUMN proceso_cargo.pro_codigo    COMMENT     g   COMMENT ON COLUMN controleg_proceso.proceso_cargo.pro_codigo IS 'llave foranea a la tabla de proceso';
          controleg_proceso          usr_controleg    false    251            �           0    0    COLUMN proceso_cargo.car_codigo    COMMENT     W   COMMENT ON COLUMN controleg_proceso.proceso_cargo.car_codigo IS 'Referencia al cargo';
          controleg_proceso          usr_controleg    false    251            �           0    0 "   COLUMN proceso_cargo.procar_estado    COMMENT     [   COMMENT ON COLUMN controleg_proceso.proceso_cargo.procar_estado IS 'Estado del registro.';
          controleg_proceso          usr_controleg    false    251            �           0    0 %   COLUMN proceso_cargo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_cargo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    251            �           0    0 )   COLUMN proceso_cargo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_cargo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    251            �           0    0 !   COLUMN proceso_cargo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_cargo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    251            �           0    0 #   COLUMN proceso_cargo.fecha_registro    COMMENT     V   COMMENT ON COLUMN controleg_proceso.proceso_cargo.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    251            �           0    0 '   COLUMN proceso_cargo.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN controleg_proceso.proceso_cargo.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    251            �           0    0    COLUMN proceso_cargo.fecha_baja    COMMENT     N   COMMENT ON COLUMN controleg_proceso.proceso_cargo.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    251            �           0    0    TABLE proceso_cargo    ACL     Z   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso_cargo TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    251                       1259    174862    sancion    TABLE     �  CREATE TABLE controleg_proceso.sancion (
    san_codigo integer NOT NULL,
    dem_codigo integer NOT NULL,
    tipsan_codigo integer NOT NULL,
    san_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE controleg_proceso.sancion;
       controleg_proceso         heap    usr_controleg    false    10            �           0    0    TABLE sancion    COMMENT     �   COMMENT ON TABLE controleg_proceso.sancion IS 'Tabla para definir las sanciones que los demandados tendran cuando se traten de procesos administrativos diciplinarios.';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.san_codigo    COMMENT     T   COMMENT ON COLUMN controleg_proceso.sancion.san_codigo IS 'Identificador de tabla';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.dem_codigo    COMMENT     T   COMMENT ON COLUMN controleg_proceso.sancion.dem_codigo IS 'Referencia al proceso.';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.tipsan_codigo    COMMENT     ^   COMMENT ON COLUMN controleg_proceso.sancion.tipsan_codigo IS 'Referencia al tipo de sancion';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.san_estado    COMMENT     Q   COMMENT ON COLUMN controleg_proceso.sancion.san_estado IS 'Estado del registro';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.sancion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    269            �           0    0 #   COLUMN sancion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.sancion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.sancion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.fecha_registro    COMMENT     P   COMMENT ON COLUMN controleg_proceso.sancion.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    269            �           0    0 !   COLUMN sancion.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN controleg_proceso.sancion.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    269            �           0    0    COLUMN sancion.fecha_baja    COMMENT     H   COMMENT ON COLUMN controleg_proceso.sancion.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    269            �           0    0    TABLE sancion    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.sancion TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    269            �            1259    174616    seguimiento_proceso    TABLE     O  CREATE TABLE controleg_proceso.seguimiento_proceso (
    segpro_codigo integer NOT NULL,
    segpro_fecha date NOT NULL,
    segpro_descripcion character varying,
    segpro_respaldo json,
    pro_codigo integer NOT NULL,
    estcla_codigo integer NOT NULL,
    segpro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 2   DROP TABLE controleg_proceso.seguimiento_proceso;
       controleg_proceso         heap    usr_controleg    false    10            �           0    0    TABLE seguimiento_proceso    COMMENT     x   COMMENT ON TABLE controleg_proceso.seguimiento_proceso IS 'Tabla para controlar la asignacion de estados a un proceso';
          controleg_proceso          usr_controleg    false    252            �           0    0 (   COLUMN seguimiento_proceso.segpro_codigo    COMMENT     g   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_codigo IS 'llave primaria de la tabla';
          controleg_proceso          usr_controleg    false    252            �           0    0 '   COLUMN seguimiento_proceso.segpro_fecha    COMMENT     x   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_proceso          usr_controleg    false    252            �           0    0 -   COLUMN seguimiento_proceso.segpro_descripcion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_proceso          usr_controleg    false    252            �           0    0 *   COLUMN seguimiento_proceso.segpro_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_proceso          usr_controleg    false    252            �           0    0 %   COLUMN seguimiento_proceso.pro_codigo    COMMENT     r   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.pro_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_proceso          usr_controleg    false    252            �           0    0 (   COLUMN seguimiento_proceso.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_proceso          usr_controleg    false    252            �           0    0 (   COLUMN seguimiento_proceso.segpro_estado    COMMENT     t   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_estado IS 'estado del registro en la base de datos';
          controleg_proceso          usr_controleg    false    252            �           0    0 +   COLUMN seguimiento_proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    252                        0    0 /   COLUMN seguimiento_proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    252                       0    0 '   COLUMN seguimiento_proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    252                       0    0 )   COLUMN seguimiento_proceso.fecha_registro    COMMENT     \   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    252                       0    0 -   COLUMN seguimiento_proceso.fecha_modificacion    COMMENT     d   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    252                       0    0 %   COLUMN seguimiento_proceso.fecha_baja    COMMENT     T   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    252                       0    0    TABLE seguimiento_proceso    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.seguimiento_proceso TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    252                       1259    174876    seguimiento_sancion    TABLE     O  CREATE TABLE controleg_proceso.seguimiento_sancion (
    segsan_codigo integer NOT NULL,
    segsan_fecha date NOT NULL,
    segsan_descripcion character varying,
    segsan_respaldo json,
    san_codigo integer NOT NULL,
    estcla_codigo integer NOT NULL,
    segsan_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 2   DROP TABLE controleg_proceso.seguimiento_sancion;
       controleg_proceso         heap    usr_controleg    false    10                       0    0    TABLE seguimiento_sancion    COMMENT     y   COMMENT ON TABLE controleg_proceso.seguimiento_sancion IS 'Tabla para controlar la asignacion de estados a una sancion';
          controleg_proceso          usr_controleg    false    270                       0    0 (   COLUMN seguimiento_sancion.segsan_codigo    COMMENT     g   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_codigo IS 'llave primaria de la tabla';
          controleg_proceso          usr_controleg    false    270                       0    0 '   COLUMN seguimiento_sancion.segsan_fecha    COMMENT     x   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_proceso          usr_controleg    false    270            	           0    0 -   COLUMN seguimiento_sancion.segsan_descripcion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_proceso          usr_controleg    false    270            
           0    0 *   COLUMN seguimiento_sancion.segsan_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_proceso          usr_controleg    false    270                       0    0 %   COLUMN seguimiento_sancion.san_codigo    COMMENT     r   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.san_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_proceso          usr_controleg    false    270                       0    0 (   COLUMN seguimiento_sancion.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_proceso          usr_controleg    false    270                       0    0 (   COLUMN seguimiento_sancion.segsan_estado    COMMENT     t   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_estado IS 'estado del registro en la base de datos';
          controleg_proceso          usr_controleg    false    270                       0    0 +   COLUMN seguimiento_sancion.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    270                       0    0 /   COLUMN seguimiento_sancion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    270                       0    0 '   COLUMN seguimiento_sancion.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    270                       0    0 )   COLUMN seguimiento_sancion.fecha_registro    COMMENT     \   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    270                       0    0 -   COLUMN seguimiento_sancion.fecha_modificacion    COMMENT     d   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    270                       0    0 %   COLUMN seguimiento_sancion.fecha_baja    COMMENT     T   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    270                       0    0    TABLE seguimiento_sancion    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.seguimiento_sancion TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    270            �            1259    174361    solicitud_archivo_digital    TABLE     |  CREATE TABLE controleg_solvencia.solicitud_archivo_digital (
    sad_codigo integer NOT NULL,
    ssf_codigo integer,
    tipadj_codigo integer,
    arcdig_codigo character varying,
    arcdig_hash character varying,
    arcdig_nombre_archivo character varying,
    arcdig_peso integer,
    arcdig_formato character varying,
    sad_estado integer,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 :   DROP TABLE controleg_solvencia.solicitud_archivo_digital;
       controleg_solvencia         heap    usr_controleg    false    5                       0    0 +   COLUMN solicitud_archivo_digital.sad_codigo    COMMENT     l   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.sad_codigo IS 'llave primaria de la tabla';
          controleg_solvencia          usr_controleg    false    231                       0    0 +   COLUMN solicitud_archivo_digital.ssf_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.ssf_codigo IS 'llave foranea a la tabla de solicitud de solvencia digital';
          controleg_solvencia          usr_controleg    false    231                       0    0 .   COLUMN solicitud_archivo_digital.tipadj_codigo    COMMENT     }   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.tipadj_codigo IS 'llave foranea a la tabla de tipo adjunto';
          controleg_solvencia          usr_controleg    false    231                       0    0 .   COLUMN solicitud_archivo_digital.arcdig_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.arcdig_codigo IS 'llave foranea a la tabla de archivo digital';
          controleg_solvencia          usr_controleg    false    231                       0    0 1   COLUMN solicitud_archivo_digital.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_solvencia          usr_controleg    false    231                       0    0 5   COLUMN solicitud_archivo_digital.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_solvencia          usr_controleg    false    231                       0    0 -   COLUMN solicitud_archivo_digital.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_solvencia          usr_controleg    false    231                       0    0 /   COLUMN solicitud_archivo_digital.fecha_registro    COMMENT     d   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.fecha_registro IS 'Fecha registro';
          controleg_solvencia          usr_controleg    false    231                       0    0 3   COLUMN solicitud_archivo_digital.fecha_modificacion    COMMENT     l   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.fecha_modificacion IS 'Fecha modificacion';
          controleg_solvencia          usr_controleg    false    231                       0    0 +   COLUMN solicitud_archivo_digital.fecha_baja    COMMENT     \   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.fecha_baja IS 'Fecha baja';
          controleg_solvencia          usr_controleg    false    231                       0    0    TABLE solicitud_archivo_digital    ACL     h   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_solvencia.solicitud_archivo_digital TO usr_controleg_app;
          controleg_solvencia          usr_controleg    false    231            �            1259    174346    solicitud_solvencia_fiscal    TABLE     s  CREATE TABLE controleg_solvencia.solicitud_solvencia_fiscal (
    ssf_codigo integer NOT NULL,
    ssf_fecha_solicitud timestamp without time zone DEFAULT now(),
    ssf_correo_electronico character varying,
    ssf_objeto character varying,
    ssf_telefono integer,
    ssf_nro_documento character varying,
    ssf_notaria character varying,
    per_codigo integer,
    per_codigo_apoderado integer,
    tipsol_codigo integer,
    lug_codigo integer,
    motsol_codigo integer,
    ent_codigo integer,
    lug_codigo_apoderado integer,
    drt_codigo integer,
    ssf_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 ;   DROP TABLE controleg_solvencia.solicitud_solvencia_fiscal;
       controleg_solvencia         heap    usr_controleg    false    5                        0    0     TABLE solicitud_solvencia_fiscal    COMMENT     {   COMMENT ON TABLE controleg_solvencia.solicitud_solvencia_fiscal IS 'Tabla para el registro de solicitudes de solvencias.';
          controleg_solvencia          usr_controleg    false    230            !           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_codigo IS 'llave primaria de la tabla, la misma sera incremental (max +1)';
          controleg_solvencia          usr_controleg    false    230            "           0    0 8   COLUMN solicitud_solvencia_fiscal.ssf_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_correo_electronico IS 'correo electronico de la persona solicitante';
          controleg_solvencia          usr_controleg    false    230            #           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_objeto    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_objeto IS 'en este campo se almacenara el campo de objeto de la certificacion, la descripcion del motivo del tramite';
          controleg_solvencia          usr_controleg    false    230            $           0    0 .   COLUMN solicitud_solvencia_fiscal.ssf_telefono    COMMENT     w   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_telefono IS 'telefono de la persona solicitante';
          controleg_solvencia          usr_controleg    false    230            %           0    0 -   COLUMN solicitud_solvencia_fiscal.ssf_notaria    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_notaria IS 'nro de la notoria donde se realizo el tramite de apoderado';
          controleg_solvencia          usr_controleg    false    230            &           0    0 ,   COLUMN solicitud_solvencia_fiscal.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.per_codigo IS 'llave foranea al campo de persona, en este campo se almacenara el ID de la persona solicitante';
          controleg_solvencia          usr_controleg    false    230            '           0    0 6   COLUMN solicitud_solvencia_fiscal.per_codigo_apoderado    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.per_codigo_apoderado IS 'Id de la persona que es apoderado de la solicitud de solvencia fiscal';
          controleg_solvencia          usr_controleg    false    230            (           0    0 /   COLUMN solicitud_solvencia_fiscal.tipsol_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.tipsol_codigo IS 'llave foranea a la tabla de tipo solicitante';
          controleg_solvencia          usr_controleg    false    230            )           0    0 ,   COLUMN solicitud_solvencia_fiscal.lug_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.lug_codigo IS 'campo que relaciona la tabla con la tabla lugar';
          controleg_solvencia          usr_controleg    false    230            *           0    0 /   COLUMN solicitud_solvencia_fiscal.motsol_codigo    COMMENT     x   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.motsol_codigo IS 'llave foranea a la tabla de motivo';
          controleg_solvencia          usr_controleg    false    230            +           0    0 ,   COLUMN solicitud_solvencia_fiscal.ent_codigo    COMMENT     o   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ent_codigo IS 'Id de la entidad solicitante';
          controleg_solvencia          usr_controleg    false    230            ,           0    0 6   COLUMN solicitud_solvencia_fiscal.lug_codigo_apoderado    COMMENT     ~   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.lug_codigo_apoderado IS 'campo foranea a la tabla de lugar';
          controleg_solvencia          usr_controleg    false    230            -           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_estado    COMMENT     v   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_estado IS 'estado de la solicitud de solvencia';
          controleg_solvencia          usr_controleg    false    230            .           0    0 2   COLUMN solicitud_solvencia_fiscal.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_solvencia          usr_controleg    false    230            /           0    0 6   COLUMN solicitud_solvencia_fiscal.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_solvencia          usr_controleg    false    230            0           0    0 .   COLUMN solicitud_solvencia_fiscal.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_solvencia          usr_controleg    false    230            1           0    0 0   COLUMN solicitud_solvencia_fiscal.fecha_registro    COMMENT     e   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.fecha_registro IS 'Fecha registro';
          controleg_solvencia          usr_controleg    false    230            2           0    0 4   COLUMN solicitud_solvencia_fiscal.fecha_modificacion    COMMENT     m   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.fecha_modificacion IS 'Fecha modificacion';
          controleg_solvencia          usr_controleg    false    230            3           0    0 ,   COLUMN solicitud_solvencia_fiscal.fecha_baja    COMMENT     ]   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.fecha_baja IS 'Fecha baja';
          controleg_solvencia          usr_controleg    false    230            4           0    0     TABLE solicitud_solvencia_fiscal    ACL     i   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_solvencia.solicitud_solvencia_fiscal TO usr_controleg_app;
          controleg_solvencia          usr_controleg    false    230            �            1259    174434    acceso    TABLE     �  CREATE TABLE dictamen.acceso (
    acc_codigo integer NOT NULL,
    acc_plazo integer NOT NULL,
    acc_qr character varying,
    acc_cantidad_descargas smallint DEFAULT 0 NOT NULL,
    dic_codigo integer NOT NULL,
    acc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.acceso;
       dictamen         heap    usr_controleg    false    8            5           0    0    TABLE acceso    COMMENT     s   COMMENT ON TABLE dictamen.acceso IS 'tabla donde se almacenara la lista de los accesos permitidos a los archivos';
          dictamen          usr_controleg    false    237            6           0    0    COLUMN acceso.acc_codigo    COMMENT     i   COMMENT ON COLUMN dictamen.acceso.acc_codigo IS 'Campo donde se almacena la llave primaria de la tabla';
          dictamen          usr_controleg    false    237            7           0    0    COLUMN acceso.acc_plazo    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_plazo IS 'campo donde se almacenra el registro de la cantidad de dias que tiene plazo la persona para ingresar al url';
          dictamen          usr_controleg    false    237            8           0    0    COLUMN acceso.acc_qr    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_qr IS 'campo donde se almacenara la direccion generada para poder visualizar el archivo';
          dictamen          usr_controleg    false    237            9           0    0 $   COLUMN acceso.acc_cantidad_descargas    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_cantidad_descargas IS 'campo que almacenara la cantidad de descargas que se puede realizar para el archivo';
          dictamen          usr_controleg    false    237            :           0    0    COLUMN acceso.dic_codigo    COMMENT     V   COMMENT ON COLUMN dictamen.acceso.dic_codigo IS 'Llave foranea de la tabla dictamen';
          dictamen          usr_controleg    false    237            ;           0    0    COLUMN acceso.acc_estado    COMMENT     S   COMMENT ON COLUMN dictamen.acceso.acc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    237            <           0    0    TABLE acceso    ACL     J   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.acceso TO usr_controleg_app;
          dictamen          usr_controleg    false    237            �            1259    174386    catalogo_general    TABLE     4  CREATE TABLE dictamen.catalogo_general (
    catgen_codigo smallint NOT NULL,
    catgen_codigo_dominio smallint NOT NULL,
    catgen_descripcion_dominio character varying NOT NULL,
    catgen_codigo_valor integer NOT NULL,
    catgen_acronimo character varying NOT NULL,
    catgen_descripcion_valor character varying NOT NULL,
    catgen_estado smallint DEFAULT 1 NOT NULL,
    usuario_base_datos character varying DEFAULT SESSION_USER NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL
);
 &   DROP TABLE dictamen.catalogo_general;
       dictamen         heap    usr_controleg    false    8            =           0    0 %   COLUMN catalogo_general.catgen_estado    COMMENT     `   COMMENT ON COLUMN dictamen.catalogo_general.catgen_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    233            >           0    0    TABLE catalogo_general    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.catalogo_general TO usr_controleg_app;
          dictamen          usr_controleg    false    233            �            1259    174447    descarga    TABLE       CREATE TABLE dictamen.descarga (
    des_codigo integer NOT NULL,
    des_numero smallint NOT NULL,
    des_fecha timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    per_codigo integer NOT NULL,
    inf_codigo integer NOT NULL,
    acc_codigo integer NOT NULL,
    des_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.descarga;
       dictamen         heap    usr_controleg    false    8            ?           0    0    TABLE descarga    COMMENT     �   COMMENT ON TABLE dictamen.descarga IS 'tabla donde se almacenara un los registros de las descargas realizadas por los usuarios';
          dictamen          usr_controleg    false    238            @           0    0    COLUMN descarga.des_codigo    COMMENT     P   COMMENT ON COLUMN dictamen.descarga.des_codigo IS 'llave primaria de la tabla';
          dictamen          usr_controleg    false    238            A           0    0    COLUMN descarga.des_numero    COMMENT     k   COMMENT ON COLUMN dictamen.descarga.des_numero IS 'campo que almacena el numero de la descarga realizada';
          dictamen          usr_controleg    false    238            B           0    0    COLUMN descarga.des_fecha    COMMENT     d   COMMENT ON COLUMN dictamen.descarga.des_fecha IS 'campo donde se almacena la fecha de la descarga';
          dictamen          usr_controleg    false    238            C           0    0    COLUMN descarga.per_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.descarga.per_codigo IS 'llave foranea a la tabla de persona';
          dictamen          usr_controleg    false    238            D           0    0    COLUMN descarga.inf_codigo    COMMENT     V   COMMENT ON COLUMN dictamen.descarga.inf_codigo IS 'llave foranea a la tabla informe';
          dictamen          usr_controleg    false    238            E           0    0    COLUMN descarga.acc_codigo    COMMENT     X   COMMENT ON COLUMN dictamen.descarga.acc_codigo IS 'llave foranea a la tabla de acceso';
          dictamen          usr_controleg    false    238            F           0    0    COLUMN descarga.des_estado    COMMENT     U   COMMENT ON COLUMN dictamen.descarga.des_estado IS 'llave foranea a la tabal estado';
          dictamen          usr_controleg    false    238            G           0    0    TABLE descarga    ACL     L   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.descarga TO usr_controleg_app;
          dictamen          usr_controleg    false    238            �            1259    174374    dictamen    TABLE     �  CREATE TABLE dictamen.dictamen (
    dic_codigo integer NOT NULL,
    dic_gestion integer NOT NULL,
    dic_numero text NOT NULL,
    dic_nombre_auditoria text,
    dic_observacion character varying(500),
    ent_codigo integer NOT NULL,
    dic_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.dictamen;
       dictamen         heap    usr_controleg    false    8            H           0    0    TABLE dictamen    COMMENT     p   COMMENT ON TABLE dictamen.dictamen IS 'Tabla donde se almacenara los dictamenes registrados por el area legal';
          dictamen          usr_controleg    false    232            I           0    0    COLUMN dictamen.dic_codigo    COMMENT     W   COMMENT ON COLUMN dictamen.dictamen.dic_codigo IS 'identifcador de la tabla dictamen';
          dictamen          usr_controleg    false    232            J           0    0    COLUMN dictamen.dic_gestion    COMMENT     h   COMMENT ON COLUMN dictamen.dictamen.dic_gestion IS 'Campo donde se almacenara la gestion del dictamen';
          dictamen          usr_controleg    false    232            K           0    0    COLUMN dictamen.dic_numero    COMMENT     e   COMMENT ON COLUMN dictamen.dictamen.dic_numero IS 'campo donde se almancera el numero del dictamen';
          dictamen          usr_controleg    false    232            L           0    0 $   COLUMN dictamen.dic_nombre_auditoria    COMMENT     v   COMMENT ON COLUMN dictamen.dictamen.dic_nombre_auditoria IS 'campo donde se almacenera los nombre de las auditorias';
          dictamen          usr_controleg    false    232            M           0    0    COLUMN dictamen.dic_observacion    COMMENT     o   COMMENT ON COLUMN dictamen.dictamen.dic_observacion IS 'campo donde se almancena la observacion del registro';
          dictamen          usr_controleg    false    232            N           0    0    COLUMN dictamen.ent_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.ent_codigo IS 'campo donde se almacenara el Id de la Entidad a la cual pertenece el dictamen';
          dictamen          usr_controleg    false    232            O           0    0    COLUMN dictamen.dic_estado    COMMENT     X   COMMENT ON COLUMN dictamen.dictamen.dic_estado IS 'llave foranea a la tabla de estado';
          dictamen          usr_controleg    false    232            P           0    0     COLUMN dictamen.usuario_registro    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_registro IS 'campo donde se almacenara el  id del usuario que realizo el registro';
          dictamen          usr_controleg    false    232            Q           0    0    COLUMN dictamen.fecha_registro    COMMENT     r   COMMENT ON COLUMN dictamen.dictamen.fecha_registro IS 'Fecha de registro de la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    232            R           0    0 $   COLUMN dictamen.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_modificacion IS 'campo donde se almacera el id de usuario que realizo la modificacion del registro';
          dictamen          usr_controleg    false    232            S           0    0    COLUMN dictamen.usuario_baja    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_baja IS 'campo donde se almacera el id de usuario que realizo la eliminacion del registro';
          dictamen          usr_controleg    false    232            T           0    0    TABLE dictamen    ACL     L   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.dictamen TO usr_controleg_app;
          dictamen          usr_controleg    false    232            �            1259    174480    dictamen_archivo    TABLE       CREATE TABLE dictamen.dictamen_archivo (
    dicarc_codigo integer NOT NULL,
    dicarc_ruta character varying(500),
    dicarc_hash character varying NOT NULL,
    dicarc_nombre character varying NOT NULL,
    dicarc_mime character varying NOT NULL,
    dicarc_descripcion character varying,
    dic_codigo integer,
    dicarc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE dictamen.dictamen_archivo;
       dictamen         heap    usr_controleg    false    8            U           0    0    TABLE dictamen_archivo    COMMENT        COMMENT ON TABLE dictamen.dictamen_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados del dictamen';
          dictamen          usr_controleg    false    241            V           0    0 %   COLUMN dictamen_archivo.dicarc_codigo    COMMENT     [   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    241            W           0    0 #   COLUMN dictamen_archivo.dicarc_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    241            X           0    0 %   COLUMN dictamen_archivo.dicarc_nombre    COMMENT     p   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    241            Y           0    0 #   COLUMN dictamen_archivo.dicarc_mime    COMMENT     g   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    241            Z           0    0 *   COLUMN dictamen_archivo.dicarc_descripcion    COMMENT     {   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    241            [           0    0 "   COLUMN dictamen_archivo.dic_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen_archivo.dic_codigo IS 'Campo donde se almacenara el id del dictamen a cual esta relacionado el archivo';
          dictamen          usr_controleg    false    241            \           0    0 %   COLUMN dictamen_archivo.dicarc_estado    COMMENT     `   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    241            ]           0    0    TABLE dictamen_archivo    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.dictamen_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    241            �            1259    174423    informe    TABLE     �  CREATE TABLE dictamen.informe (
    inf_codigo integer NOT NULL,
    inf_gestion smallint NOT NULL,
    inf_numero character varying(100),
    inf_codigo_informe character varying(100),
    inf_dep_codigo integer,
    inf_unidad_codigo integer,
    dic_codigo integer,
    tipinf_dominio smallint DEFAULT 1 NOT NULL,
    tipinf_codigo integer NOT NULL,
    sti_dominio smallint DEFAULT 2 NOT NULL,
    sti_codigo integer NOT NULL,
    inf_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.informe;
       dictamen         heap    usr_controleg    false    8            ^           0    0    TABLE informe    COMMENT     M   COMMENT ON TABLE dictamen.informe IS 'Informes relacionados en un dictamen';
          dictamen          usr_controleg    false    236            _           0    0    COLUMN informe.inf_codigo    COMMENT     R   COMMENT ON COLUMN dictamen.informe.inf_codigo IS 'identificador único de tabla';
          dictamen          usr_controleg    false    236            `           0    0    COLUMN informe.inf_gestion    COMMENT     u   COMMENT ON COLUMN dictamen.informe.inf_gestion IS 'Campo donde se almacenara el registro de la gestion del informe';
          dictamen          usr_controleg    false    236            a           0    0    COLUMN informe.inf_numero    COMMENT     c   COMMENT ON COLUMN dictamen.informe.inf_numero IS 'campo donde se almacenara el numero de informe';
          dictamen          usr_controleg    false    236            b           0    0 !   COLUMN informe.inf_codigo_informe    COMMENT     f   COMMENT ON COLUMN dictamen.informe.inf_codigo_informe IS 'Esta campo almacena el codigo del informe';
          dictamen          usr_controleg    false    236            c           0    0    COLUMN informe.inf_dep_codigo    COMMENT     s   COMMENT ON COLUMN dictamen.informe.inf_dep_codigo IS 'departamento donde se realizo el registro del departamento';
          dictamen          usr_controleg    false    236            d           0    0     COLUMN informe.inf_unidad_codigo    COMMENT     k   COMMENT ON COLUMN dictamen.informe.inf_unidad_codigo IS 'unidad donde se realizo el registro del informe';
          dictamen          usr_controleg    false    236            e           0    0    COLUMN informe.dic_codigo    COMMENT     d   COMMENT ON COLUMN dictamen.informe.dic_codigo IS 'identificador secuancial de tabla dictamen - FK';
          dictamen          usr_controleg    false    236            f           0    0    COLUMN informe.tipinf_dominio    COMMENT     p   COMMENT ON COLUMN dictamen.informe.tipinf_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_controleg    false    236            g           0    0    COLUMN informe.tipinf_codigo    COMMENT     v   COMMENT ON COLUMN dictamen.informe.tipinf_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_controleg    false    236            h           0    0    COLUMN informe.sti_dominio    COMMENT     m   COMMENT ON COLUMN dictamen.informe.sti_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_controleg    false    236            i           0    0    COLUMN informe.sti_codigo    COMMENT     s   COMMENT ON COLUMN dictamen.informe.sti_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_controleg    false    236            j           0    0    COLUMN informe.inf_estado    COMMENT     T   COMMENT ON COLUMN dictamen.informe.inf_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    236            k           0    0    COLUMN informe.usuario_registro    COMMENT     ~   COMMENT ON COLUMN dictamen.informe.usuario_registro IS 'Codigo de usuario que actualiza la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    236            l           0    0    COLUMN informe.fecha_registro    COMMENT     q   COMMENT ON COLUMN dictamen.informe.fecha_registro IS 'Fecha de registro de la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    236            m           0    0 #   COLUMN informe.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.informe.usuario_modificacion IS 'Codigo de usuario que actualiza la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    236            n           0    0 !   COLUMN informe.fecha_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.informe.fecha_modificacion IS 'Fecha de actualizacion del registro de solicitud - columna de auditoria';
          dictamen          usr_controleg    false    236            o           0    0    COLUMN informe.usuario_baja    COMMENT     �   COMMENT ON COLUMN dictamen.informe.usuario_baja IS 'Codigo de usuario que hace la baja logica la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    236            p           0    0    COLUMN informe.fecha_baja    COMMENT     }   COMMENT ON COLUMN dictamen.informe.fecha_baja IS 'Fecha de la baja logica del registro de solicitud - columna de auditoria';
          dictamen          usr_controleg    false    236            q           0    0    TABLE informe    ACL     K   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.informe TO usr_controleg_app;
          dictamen          usr_controleg    false    236            �            1259    174399    informe_archivo    TABLE       CREATE TABLE dictamen.informe_archivo (
    infarc_codigo integer NOT NULL,
    infarc_ruta character varying(500),
    infarc_hash character varying NOT NULL,
    infarc_nombre character varying NOT NULL,
    infarc_mime character varying NOT NULL,
    infarc_descripcion character varying,
    inf_codigo integer,
    infarc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 %   DROP TABLE dictamen.informe_archivo;
       dictamen         heap    usr_controleg    false    8            r           0    0    TABLE informe_archivo    COMMENT     q   COMMENT ON TABLE dictamen.informe_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados';
          dictamen          usr_controleg    false    234            s           0    0 $   COLUMN informe_archivo.infarc_codigo    COMMENT     Z   COMMENT ON COLUMN dictamen.informe_archivo.infarc_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    234            t           0    0 "   COLUMN informe_archivo.infarc_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.informe_archivo.infarc_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    234            u           0    0 $   COLUMN informe_archivo.infarc_nombre    COMMENT     o   COMMENT ON COLUMN dictamen.informe_archivo.infarc_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    234            v           0    0 "   COLUMN informe_archivo.infarc_mime    COMMENT     f   COMMENT ON COLUMN dictamen.informe_archivo.infarc_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    234            w           0    0 )   COLUMN informe_archivo.infarc_descripcion    COMMENT     z   COMMENT ON COLUMN dictamen.informe_archivo.infarc_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    234            x           0    0 !   COLUMN informe_archivo.inf_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.informe_archivo.inf_codigo IS 'Campo donde se almacenara el id del dictamen a cual esta relacionado el archivo';
          dictamen          usr_controleg    false    234            y           0    0 $   COLUMN informe_archivo.infarc_estado    COMMENT     _   COMMENT ON COLUMN dictamen.informe_archivo.infarc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    234            z           0    0    TABLE informe_archivo    ACL     S   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.informe_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    234            �            1259    174457    notificacion    TABLE     f  CREATE TABLE dictamen.notificacion (
    not_codigo integer NOT NULL,
    acc_codigo integer NOT NULL,
    not_correo character varying NOT NULL,
    not_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 "   DROP TABLE dictamen.notificacion;
       dictamen         heap    usr_controleg    false    8            {           0    0    TABLE notificacion    COMMENT     �   COMMENT ON TABLE dictamen.notificacion IS 'Tabla donde se almacenara el registro de las notificaciones realizadas de un acceso';
          dictamen          usr_controleg    false    239            |           0    0    COLUMN notificacion.acc_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.notificacion.acc_codigo IS 'llave foranea a la tabla acceso';
          dictamen          usr_controleg    false    239            }           0    0    COLUMN notificacion.not_correo    COMMENT     �   COMMENT ON COLUMN dictamen.notificacion.not_correo IS 'campo donde se almacenara los correos a los cuales fueron notificados los accesos';
          dictamen          usr_controleg    false    239            ~           0    0    COLUMN notificacion.not_estado    COMMENT     Y   COMMENT ON COLUMN dictamen.notificacion.not_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    239                       0    0    TABLE notificacion    ACL     P   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.notificacion TO usr_controleg_app;
          dictamen          usr_controleg    false    239            �            1259    174469    persona_dictamen    TABLE     .  CREATE TABLE dictamen.persona_dictamen (
    perdic_codigo integer NOT NULL,
    perdic_notificacion boolean DEFAULT false,
    inf_codigo integer,
    tipinv_dominio smallint DEFAULT 3,
    tipinv_codigo integer,
    perres_codigo integer NOT NULL,
    per_codigo integer,
    perjur_codigo integer,
    empuni_codigo integer,
    ent_codigo integer,
    perdic_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE dictamen.persona_dictamen;
       dictamen         heap    usr_controleg    false    8            �           0    0 %   COLUMN persona_dictamen.perdic_codigo    COMMENT     [   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_codigo IS 'llave primaria de la tabla';
          dictamen          usr_controleg    false    240            �           0    0 +   COLUMN persona_dictamen.perdic_notificacion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_notificacion IS 'campo donde se almacenara la bandera en caso de que a una persona ya se le haya realizado la notificacion';
          dictamen          usr_controleg    false    240            �           0    0 "   COLUMN persona_dictamen.inf_codigo    COMMENT     u   COMMENT ON COLUMN dictamen.persona_dictamen.inf_codigo IS 'codigo del informe al cual esta asociado el involucrado';
          dictamen          usr_controleg    false    240            �           0    0 &   COLUMN persona_dictamen.tipinv_dominio    COMMENT     y   COMMENT ON COLUMN dictamen.persona_dictamen.tipinv_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_controleg    false    240            �           0    0 %   COLUMN persona_dictamen.tipinv_codigo    COMMENT        COMMENT ON COLUMN dictamen.persona_dictamen.tipinv_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_controleg    false    240            �           0    0 %   COLUMN persona_dictamen.perres_codigo    COMMENT     d   COMMENT ON COLUMN dictamen.persona_dictamen.perres_codigo IS 'Referencia a la persona responsable';
          dictamen          usr_controleg    false    240            �           0    0 "   COLUMN persona_dictamen.per_codigo    COMMENT     ^   COMMENT ON COLUMN dictamen.persona_dictamen.per_codigo IS 'llave foranea a la tabla persona';
          dictamen          usr_controleg    false    240            �           0    0 %   COLUMN persona_dictamen.perjur_codigo    COMMENT     h   COMMENT ON COLUMN dictamen.persona_dictamen.perjur_codigo IS 'llave fonaea a la tala persona juridica';
          dictamen          usr_controleg    false    240            �           0    0 %   COLUMN persona_dictamen.empuni_codigo    COMMENT     m   COMMENT ON COLUMN dictamen.persona_dictamen.empuni_codigo IS 'clave foranea a la tabla empresa unipersonal';
          dictamen          usr_controleg    false    240            �           0    0 %   COLUMN persona_dictamen.perdic_estado    COMMENT     S   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_estado IS 'estado de la tabla';
          dictamen          usr_controleg    false    240            �           0    0    TABLE persona_dictamen    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.persona_dictamen TO usr_controleg_app;
          dictamen          usr_controleg    false    240            �            1259    174492    persona_dictamen_archivo    TABLE     
  CREATE TABLE dictamen.persona_dictamen_archivo (
    pda_codigo integer NOT NULL,
    pda_ruta character varying(500),
    pda_hash character varying NOT NULL,
    pda_nombre character varying NOT NULL,
    pda_mime character varying NOT NULL,
    pda_descripcion character varying,
    perdic_codigo integer,
    pda_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 .   DROP TABLE dictamen.persona_dictamen_archivo;
       dictamen         heap    usr_controleg    false    8            �           0    0    TABLE persona_dictamen_archivo    COMMENT     q   COMMENT ON TABLE dictamen.persona_dictamen_archivo IS 'Tabla donde se almacenara archivos de persona diactamen';
          dictamen          usr_controleg    false    242            �           0    0 *   COLUMN persona_dictamen_archivo.pda_codigo    COMMENT     `   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    242            �           0    0 (   COLUMN persona_dictamen_archivo.pda_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_ruta IS 'Campo donde se almacenara la ruta del archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    242            �           0    0 (   COLUMN persona_dictamen_archivo.pda_hash    COMMENT     i   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_hash IS 'representacion unívoca de un archivo';
          dictamen          usr_controleg    false    242            �           0    0 *   COLUMN persona_dictamen_archivo.pda_nombre    COMMENT     u   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    242            �           0    0 (   COLUMN persona_dictamen_archivo.pda_mime    COMMENT     l   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    242            �           0    0 /   COLUMN persona_dictamen_archivo.pda_descripcion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    242            �           0    0 -   COLUMN persona_dictamen_archivo.perdic_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.perdic_codigo IS 'Campo donde se almacenara el id de persona_dictamen a cual esta relacionado el archivo';
          dictamen          usr_controleg    false    242            �           0    0 *   COLUMN persona_dictamen_archivo.pda_estado    COMMENT     e   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    242            �           0    0    TABLE persona_dictamen_archivo    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.persona_dictamen_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    242            �            1259    174504    proceso_entidad    TABLE       CREATE TABLE dictamen.proceso_entidad (
    proent_codigo integer NOT NULL,
    proent_fecha_remision timestamp without time zone,
    proent_inicio_accion boolean DEFAULT false,
    proent_fecha_accion timestamp without time zone,
    proent_dep integer,
    proent_observacion character varying(200),
    dic_codigo integer,
    proent_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 %   DROP TABLE dictamen.proceso_entidad;
       dictamen         heap    usr_controleg    false    8            �           0    0    TABLE proceso_entidad    COMMENT     �   COMMENT ON TABLE dictamen.proceso_entidad IS 'tabla donde se almacenara el registro de inicio de acciones remitida a una entidad';
          dictamen          usr_controleg    false    243            �           0    0 $   COLUMN proceso_entidad.proent_codigo    COMMENT     Z   COMMENT ON COLUMN dictamen.proceso_entidad.proent_codigo IS 'llave primaria de la tabla';
          dictamen          usr_controleg    false    243            �           0    0 ,   COLUMN proceso_entidad.proent_fecha_remision    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_fecha_remision IS 'fecha de cuando se realizo la remision de la nota de inicio de acciones';
          dictamen          usr_controleg    false    243            �           0    0 +   COLUMN proceso_entidad.proent_inicio_accion    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_inicio_accion IS 'bandera para señalar que la entidad realizo el inicio de acciones';
          dictamen          usr_controleg    false    243            �           0    0 *   COLUMN proceso_entidad.proent_fecha_accion    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_fecha_accion IS 'campo donde se almacena la fecha cuando se inicio las acciones';
          dictamen          usr_controleg    false    243            �           0    0 !   COLUMN proceso_entidad.proent_dep    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_dep IS 'campo donde se almacenara el campo del departamento donde se remitio la nota de inicio de acciones';
          dictamen          usr_controleg    false    243            �           0    0 )   COLUMN proceso_entidad.proent_observacion    COMMENT     g   COMMENT ON COLUMN dictamen.proceso_entidad.proent_observacion IS 'observacion del registro realizado';
          dictamen          usr_controleg    false    243            �           0    0 !   COLUMN proceso_entidad.dic_codigo    COMMENT     b   COMMENT ON COLUMN dictamen.proceso_entidad.dic_codigo IS 'llave foranea hacia la tabla dictamen';
          dictamen          usr_controleg    false    243            �           0    0    TABLE proceso_entidad    ACL     S   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.proceso_entidad TO usr_controleg_app;
          dictamen          usr_controleg    false    243            �            1259    174514    proceso_entidad_archivo    TABLE     	  CREATE TABLE dictamen.proceso_entidad_archivo (
    pea_codigo integer NOT NULL,
    pea_ruta character varying(500),
    pea_hash character varying NOT NULL,
    pea_nombre character varying NOT NULL,
    pea_mime character varying NOT NULL,
    pea_descripcion character varying,
    proent_codigo integer,
    pea_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 -   DROP TABLE dictamen.proceso_entidad_archivo;
       dictamen         heap    usr_controleg    false    8            �           0    0    TABLE proceso_entidad_archivo    COMMENT     y   COMMENT ON TABLE dictamen.proceso_entidad_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados';
          dictamen          usr_controleg    false    244            �           0    0 )   COLUMN proceso_entidad_archivo.pea_codigo    COMMENT     _   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    244            �           0    0 '   COLUMN proceso_entidad_archivo.pea_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    244            �           0    0 )   COLUMN proceso_entidad_archivo.pea_nombre    COMMENT     t   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    244            �           0    0 '   COLUMN proceso_entidad_archivo.pea_mime    COMMENT     k   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    244            �           0    0 .   COLUMN proceso_entidad_archivo.pea_descripcion    COMMENT        COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    244            �           0    0 ,   COLUMN proceso_entidad_archivo.proent_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.proent_codigo IS 'Campo donde se almacenara el id del proceso entidad registrado';
          dictamen          usr_controleg    false    244            �           0    0 )   COLUMN proceso_entidad_archivo.pea_estado    COMMENT     d   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    244            �           0    0    TABLE proceso_entidad_archivo    ACL     [   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.proceso_entidad_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    244            �            1259    174243    documento_representante_tipo    TABLE     �  CREATE TABLE parametricas.documento_representante_tipo (
    drt_codigo integer NOT NULL,
    drt_descripcion character varying,
    drt_observacion character varying,
    drt_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 6   DROP TABLE parametricas.documento_representante_tipo;
       parametricas         heap    usr_controleg    false    11            �           0    0 3   COLUMN documento_representante_tipo.drt_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.drt_descripcion IS 'descripcion del tipo de documento de representate';
          parametricas          usr_controleg    false    223            �           0    0 3   COLUMN documento_representante_tipo.drt_observacion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.drt_observacion IS 'observacion del registro de tipo de documento representante';
          parametricas          usr_controleg    false    223            �           0    0 4   COLUMN documento_representante_tipo.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    223            �           0    0 8   COLUMN documento_representante_tipo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    223            �           0    0 0   COLUMN documento_representante_tipo.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    223            �           0    0 2   COLUMN documento_representante_tipo.fecha_registro    COMMENT     `   COMMENT ON COLUMN parametricas.documento_representante_tipo.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    223            �           0    0 6   COLUMN documento_representante_tipo.fecha_modificacion    COMMENT     h   COMMENT ON COLUMN parametricas.documento_representante_tipo.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    223            �           0    0 .   COLUMN documento_representante_tipo.fecha_baja    COMMENT     X   COMMENT ON COLUMN parametricas.documento_representante_tipo.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    223            �           0    0 "   TABLE documento_representante_tipo    ACL     d   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.documento_representante_tipo TO usr_controleg_app;
          parametricas          usr_controleg    false    223            �            1259    174317    estado_clasificacion    TABLE     h  CREATE TABLE parametricas.estado_clasificacion (
    estcla_codigo integer NOT NULL,
    estcla_orden integer DEFAULT 1 NOT NULL,
    estcon_codigo integer NOT NULL,
    esteta_codigo integer NOT NULL,
    tippro_codigo integer,
    tipres_codigo integer,
    tipsan_codigo integer,
    estcla_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 .   DROP TABLE parametricas.estado_clasificacion;
       parametricas         heap    usr_controleg    false    11            �           0    0    TABLE estado_clasificacion    COMMENT     �   COMMENT ON TABLE parametricas.estado_clasificacion IS 'Tabla para clasificar las los estados por tipo de procesos, dictamenes y cargos y las etapas dentro de estos grupos.';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.estcla_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.estado_clasificacion.estcla_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    228            �           0    0 (   COLUMN estado_clasificacion.estcla_orden    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.estcla_orden IS 'Orden del estado, permitira ordenar los estados cuando se visualicen.';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.estcon_codigo    COMMENT     h   COMMENT ON COLUMN parametricas.estado_clasificacion.estcon_codigo IS 'Referencia al estado de control';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.esteta_codigo    COMMENT     j   COMMENT ON COLUMN parametricas.estado_clasificacion.esteta_codigo IS 'Referencia a la etapa del estado.';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.tippro_codigo    COMMENT     g   COMMENT ON COLUMN parametricas.estado_clasificacion.tippro_codigo IS 'Referencia al tipo de proceso.';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.tipres_codigo    COMMENT     z   COMMENT ON COLUMN parametricas.estado_clasificacion.tipres_codigo IS 'Referencia al tipo de responsabilidad del estado.';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.tipsan_codigo    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.tipsan_codigo IS 'Referencia al tipo de sancion con la que se agrupara al estado.';
          parametricas          usr_controleg    false    228            �           0    0 )   COLUMN estado_clasificacion.estcla_estado    COMMENT     \   COMMENT ON COLUMN parametricas.estado_clasificacion.estcla_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    228            �           0    0 ,   COLUMN estado_clasificacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    228            �           0    0 0   COLUMN estado_clasificacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    228            �           0    0 (   COLUMN estado_clasificacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    228            �           0    0 *   COLUMN estado_clasificacion.fecha_registro    COMMENT     X   COMMENT ON COLUMN parametricas.estado_clasificacion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    228            �           0    0 .   COLUMN estado_clasificacion.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN parametricas.estado_clasificacion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    228            �           0    0 &   COLUMN estado_clasificacion.fecha_baja    COMMENT     P   COMMENT ON COLUMN parametricas.estado_clasificacion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    228            �           0    0    TABLE estado_clasificacion    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estado_clasificacion TO usr_controleg_app;
          parametricas          usr_controleg    false    228            �            1259    174119    estado_control    TABLE     �  CREATE TABLE parametricas.estado_control (
    estcont_codigo integer NOT NULL,
    estcon_nombre character varying NOT NULL,
    estcon_descripcion character varying,
    estcon_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 (   DROP TABLE parametricas.estado_control;
       parametricas         heap    usr_controleg    false    11            �           0    0    TABLE estado_control    COMMENT     �   COMMENT ON TABLE parametricas.estado_control IS 'Tabla para registrar todos los estados que se usaran para controlar los procesos, dictamenes y cargos.';
          parametricas          usr_controleg    false    214            �           0    0 $   COLUMN estado_control.estcont_codigo    COMMENT     Z   COMMENT ON COLUMN parametricas.estado_control.estcont_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    214            �           0    0 #   COLUMN estado_control.estcon_nombre    COMMENT     T   COMMENT ON COLUMN parametricas.estado_control.estcon_nombre IS 'Nombre del estado';
          parametricas          usr_controleg    false    214            �           0    0 (   COLUMN estado_control.estcon_descripcion    COMMENT     ^   COMMENT ON COLUMN parametricas.estado_control.estcon_descripcion IS 'Descripcion del estado';
          parametricas          usr_controleg    false    214            �           0    0 #   COLUMN estado_control.estcon_estado    COMMENT     V   COMMENT ON COLUMN parametricas.estado_control.estcon_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    214            �           0    0 &   COLUMN estado_control.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estado_control.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    214            �           0    0 *   COLUMN estado_control.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_control.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    214            �           0    0 "   COLUMN estado_control.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estado_control.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    214            �           0    0 $   COLUMN estado_control.fecha_registro    COMMENT     R   COMMENT ON COLUMN parametricas.estado_control.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    214            �           0    0 (   COLUMN estado_control.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN parametricas.estado_control.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    214            �           0    0     COLUMN estado_control.fecha_baja    COMMENT     J   COMMENT ON COLUMN parametricas.estado_control.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    214            �           0    0    TABLE estado_control    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estado_control TO usr_controleg_app;
          parametricas          usr_controleg    false    214            �            1259    174301    estado_etapa    TABLE     T  CREATE TABLE parametricas.estado_etapa (
    esteta_codigo integer NOT NULL,
    esteta_orden integer DEFAULT 0 NOT NULL,
    esteta_nombre character varying NOT NULL,
    esteta_solvencia boolean DEFAULT false NOT NULL,
    esteta_descripcion character varying,
    esteta_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE parametricas.estado_etapa;
       parametricas         heap    usr_controleg    false    11            �           0    0    TABLE estado_etapa    COMMENT     g   COMMENT ON TABLE parametricas.estado_etapa IS 'Tabla para registrar todas las etapas de los estados.';
          parametricas          usr_controleg    false    227            �           0    0 !   COLUMN estado_etapa.esteta_codigo    COMMENT     W   COMMENT ON COLUMN parametricas.estado_etapa.esteta_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    227            �           0    0     COLUMN estado_etapa.esteta_orden    COMMENT     T   COMMENT ON COLUMN parametricas.estado_etapa.esteta_orden IS 'Orden de las etapas.';
          parametricas          usr_controleg    false    227            �           0    0 !   COLUMN estado_etapa.esteta_nombre    COMMENT     R   COMMENT ON COLUMN parametricas.estado_etapa.esteta_nombre IS 'Nombre del estado';
          parametricas          usr_controleg    false    227            �           0    0 $   COLUMN estado_etapa.esteta_solvencia    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.esteta_solvencia IS 'Determina si los registros dentro de la etapa se usara para mostrarlos en la solvencia.';
          parametricas          usr_controleg    false    227            �           0    0 &   COLUMN estado_etapa.esteta_descripcion    COMMENT     \   COMMENT ON COLUMN parametricas.estado_etapa.esteta_descripcion IS 'Descripcion del estado';
          parametricas          usr_controleg    false    227            �           0    0 !   COLUMN estado_etapa.esteta_estado    COMMENT     T   COMMENT ON COLUMN parametricas.estado_etapa.esteta_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    227            �           0    0 $   COLUMN estado_etapa.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    227            �           0    0 (   COLUMN estado_etapa.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    227            �           0    0     COLUMN estado_etapa.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    227            �           0    0 "   COLUMN estado_etapa.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.estado_etapa.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    227            �           0    0 &   COLUMN estado_etapa.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.estado_etapa.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN estado_etapa.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.estado_etapa.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    227            �           0    0    TABLE estado_etapa    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estado_etapa TO usr_controleg_app;
          parametricas          usr_controleg    false    227            �            1259    174032    estados    TABLE     #  CREATE TABLE parametricas.estados (
    est_codigo integer NOT NULL,
    est_nombre character varying NOT NULL,
    est_descripcion character varying,
    est_color character varying DEFAULT '#ffffff'::character varying NOT NULL,
    usuario_registro character varying DEFAULT ''::character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 !   DROP TABLE parametricas.estados;
       parametricas         heap    usr_controleg    false    11            �           0    0    COLUMN estados.est_codigo    COMMENT     O   COMMENT ON COLUMN parametricas.estados.est_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.est_nombre    COMMENT     n   COMMENT ON COLUMN parametricas.estados.est_nombre IS 'Nombre del estado, debe ser unico dentro del sistema.';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.est_descripcion    COMMENT     p   COMMENT ON COLUMN parametricas.estados.est_descripcion IS 'Campo que hace referencia a descripcion del estado';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.est_color    COMMENT     U   COMMENT ON COLUMN parametricas.estados.est_color IS 'Color hexadecimal del estado.';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estados.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    208            �           0    0 #   COLUMN estados.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estados.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estados.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.fecha_registro    COMMENT     K   COMMENT ON COLUMN parametricas.estados.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    208            �           0    0 !   COLUMN estados.fecha_modificacion    COMMENT     S   COMMENT ON COLUMN parametricas.estados.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.fecha_baja    COMMENT     C   COMMENT ON COLUMN parametricas.estados.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    208            �           0    0    TABLE estados    ACL     O   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estados TO usr_controleg_app;
          parametricas          usr_controleg    false    208            �            1259    174257    genero    TABLE     �  CREATE TABLE parametricas.genero (
    gen_codigo integer NOT NULL,
    gen_descripcion character varying,
    gen_abreviacion character varying,
    gen_mostrar bit(1),
    gen_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
     DROP TABLE parametricas.genero;
       parametricas         heap    usr_controleg    false    11            �           0    0    COLUMN genero.gen_descripcion    COMMENT     o   COMMENT ON COLUMN parametricas.genero.gen_descripcion IS 'Campo que hace referencia a descripcion del genero';
          parametricas          usr_controleg    false    224            �           0    0    COLUMN genero.gen_abreviacion    COMMENT     n   COMMENT ON COLUMN parametricas.genero.gen_abreviacion IS 'Campo que hace referencia a abreviacion de genero';
          parametricas          usr_controleg    false    224            �           0    0    COLUMN genero.gen_mostrar    COMMENT     f   COMMENT ON COLUMN parametricas.genero.gen_mostrar IS 'Campo que hace referencia a mostrar el genero';
          parametricas          usr_controleg    false    224            �           0    0    COLUMN genero.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.genero.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    224            �           0    0 "   COLUMN genero.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.genero.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    224            �           0    0    COLUMN genero.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.genero.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    224            �           0    0    COLUMN genero.fecha_registro    COMMENT     J   COMMENT ON COLUMN parametricas.genero.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    224            �           0    0     COLUMN genero.fecha_modificacion    COMMENT     R   COMMENT ON COLUMN parametricas.genero.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    224            �           0    0    COLUMN genero.fecha_baja    COMMENT     B   COMMENT ON COLUMN parametricas.genero.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    224            �           0    0    TABLE genero    ACL     N   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.genero TO usr_controleg_app;
          parametricas          usr_controleg    false    224            �            1259    174091    infraccion_tipo    TABLE       CREATE TABLE parametricas.infraccion_tipo (
    inftip_codigo integer NOT NULL,
    inftip_nombre character varying NOT NULL,
    inftip_descripcion character varying,
    tipres_codigo integer NOT NULL,
    inftip_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 )   DROP TABLE parametricas.infraccion_tipo;
       parametricas         heap    usr_controleg    false    11            �           0    0    TABLE infraccion_tipo    COMMENT     b   COMMENT ON TABLE parametricas.infraccion_tipo IS 'Tabla para registrar los tipos de infraccion.';
          parametricas          usr_controleg    false    212            �           0    0 $   COLUMN infraccion_tipo.inftip_nombre    COMMENT     b   COMMENT ON COLUMN parametricas.infraccion_tipo.inftip_nombre IS 'Nombre del tipo de infraccion.';
          parametricas          usr_controleg    false    212            �           0    0 )   COLUMN infraccion_tipo.inftip_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.infraccion_tipo.inftip_descripcion IS 'Campo que hace referencia a la descripcion de infraccion_tipo';
          parametricas          usr_controleg    false    212            �           0    0 $   COLUMN infraccion_tipo.tipres_codigo    COMMENT     i   COMMENT ON COLUMN parametricas.infraccion_tipo.tipres_codigo IS 'Referencia al tipo de responsabilidad';
          parametricas          usr_controleg    false    212            �           0    0 '   COLUMN infraccion_tipo.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.infraccion_tipo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    212            �           0    0 +   COLUMN infraccion_tipo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.infraccion_tipo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    212            �           0    0 #   COLUMN infraccion_tipo.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.infraccion_tipo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    212            �           0    0 %   COLUMN infraccion_tipo.fecha_registro    COMMENT     S   COMMENT ON COLUMN parametricas.infraccion_tipo.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    212            �           0    0 )   COLUMN infraccion_tipo.fecha_modificacion    COMMENT     [   COMMENT ON COLUMN parametricas.infraccion_tipo.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    212            �           0    0 !   COLUMN infraccion_tipo.fecha_baja    COMMENT     K   COMMENT ON COLUMN parametricas.infraccion_tipo.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    212            �           0    0    TABLE infraccion_tipo    ACL     W   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.infraccion_tipo TO usr_controleg_app;
          parametricas          usr_controleg    false    212            �            1259    174147    juzgado    TABLE     �  CREATE TABLE parametricas.juzgado (
    juz_codigo integer NOT NULL,
    juz_descripcion character varying,
    tippro_codigo integer NOT NULL,
    juz_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 !   DROP TABLE parametricas.juzgado;
       parametricas         heap    usr_controleg    false    11            �           0    0    COLUMN juzgado.juz_descripcion    COMMENT     s   COMMENT ON COLUMN parametricas.juzgado.juz_descripcion IS 'Campo que hace referencia a la descripcion de juzgado';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN juzgado.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.juzgado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    216            �           0    0 #   COLUMN juzgado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.juzgado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN juzgado.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.juzgado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN juzgado.fecha_registro    COMMENT     K   COMMENT ON COLUMN parametricas.juzgado.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    216            �           0    0 !   COLUMN juzgado.fecha_modificacion    COMMENT     S   COMMENT ON COLUMN parametricas.juzgado.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    216                        0    0    COLUMN juzgado.fecha_baja    COMMENT     C   COMMENT ON COLUMN parametricas.juzgado.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    216                       0    0    TABLE juzgado    ACL     O   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.juzgado TO usr_controleg_app;
          parametricas          usr_controleg    false    216            �            1259    174161    lugar    TABLE     ?  CREATE TABLE parametricas.lugar (
    lug_codigo integer NOT NULL,
    lug_nombre character varying NOT NULL,
    lug_descripcion character varying,
    lug_abreviacion character varying NOT NULL,
    lug_nacional boolean DEFAULT true NOT NULL,
    lug_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
    DROP TABLE parametricas.lugar;
       parametricas         heap    usr_controleg    false    11                       0    0    COLUMN lugar.lug_nombre    COMMENT     G   COMMENT ON COLUMN parametricas.lugar.lug_nombre IS 'Nombre del lugar';
          parametricas          usr_controleg    false    217                       0    0    COLUMN lugar.lug_descripcion    COMMENT     l   COMMENT ON COLUMN parametricas.lugar.lug_descripcion IS 'Campo que hace referencia a descripcion de lugar';
          parametricas          usr_controleg    false    217                       0    0    COLUMN lugar.lug_abreviacion    COMMENT     l   COMMENT ON COLUMN parametricas.lugar.lug_abreviacion IS 'Campo que hace referencia a abreviacion de lugar';
          parametricas          usr_controleg    false    217                       0    0    COLUMN lugar.lug_nacional    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.lug_nacional IS 'Bandera que determina si el lugar definido es nacional o internacional.';
          parametricas          usr_controleg    false    217                       0    0    COLUMN lugar.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    217                       0    0 !   COLUMN lugar.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    217                       0    0    COLUMN lugar.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    217            	           0    0    COLUMN lugar.fecha_registro    COMMENT     I   COMMENT ON COLUMN parametricas.lugar.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    217            
           0    0    COLUMN lugar.fecha_modificacion    COMMENT     Q   COMMENT ON COLUMN parametricas.lugar.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    217                       0    0    COLUMN lugar.fecha_baja    COMMENT     A   COMMENT ON COLUMN parametricas.lugar.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    217                       0    0    TABLE lugar    ACL     M   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.lugar TO usr_controleg_app;
          parametricas          usr_controleg    false    217            �            1259    174176    moneda    TABLE     �  CREATE TABLE parametricas.moneda (
    mon_codigo integer NOT NULL,
    mon_descripcion character varying,
    mon_abreviacion character varying,
    mon_mostrar bit(1),
    mon_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
     DROP TABLE parametricas.moneda;
       parametricas         heap    usr_controleg    false    11                       0    0    COLUMN moneda.mon_descripcion    COMMENT     n   COMMENT ON COLUMN parametricas.moneda.mon_descripcion IS 'Campo que hace referencia a descripcion de moneda';
          parametricas          usr_controleg    false    218                       0    0    COLUMN moneda.mon_abreviacion    COMMENT     n   COMMENT ON COLUMN parametricas.moneda.mon_abreviacion IS 'Campo que hace referencia a abreviacion de moneda';
          parametricas          usr_controleg    false    218                       0    0    COLUMN moneda.mon_mostrar    COMMENT     c   COMMENT ON COLUMN parametricas.moneda.mon_mostrar IS 'Campo que hace referencia a mostrar moneda';
          parametricas          usr_controleg    false    218                       0    0    COLUMN moneda.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.moneda.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    218                       0    0 "   COLUMN moneda.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.moneda.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    218                       0    0    COLUMN moneda.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.moneda.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    218                       0    0    COLUMN moneda.fecha_registro    COMMENT     J   COMMENT ON COLUMN parametricas.moneda.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    218                       0    0     COLUMN moneda.fecha_modificacion    COMMENT     R   COMMENT ON COLUMN parametricas.moneda.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    218                       0    0    COLUMN moneda.fecha_baja    COMMENT     B   COMMENT ON COLUMN parametricas.moneda.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    218                       0    0    TABLE moneda    ACL     N   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.moneda TO usr_controleg_app;
          parametricas          usr_controleg    false    218            �            1259    174217    motivo_solvencia    TABLE     �  CREATE TABLE parametricas.motivo_solvencia (
    motsol_codigo integer NOT NULL,
    motsol_descripcion character varying,
    motsol_observacion character varying,
    motsol_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE parametricas.motivo_solvencia;
       parametricas         heap    usr_controleg    false    11                       0    0 %   COLUMN motivo_solvencia.motsol_codigo    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_codigo IS 'tabla donde se almacenara los motivos de la solicitud de solvencia';
          parametricas          usr_controleg    false    221                       0    0 *   COLUMN motivo_solvencia.motsol_descripcion    COMMENT     n   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_descripcion IS 'despcripcion del motivo de solicitud';
          parametricas          usr_controleg    false    221                       0    0 *   COLUMN motivo_solvencia.motsol_observacion    COMMENT     x   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_observacion IS 'observacion al registro de motivo de solicitud';
          parametricas          usr_controleg    false    221                       0    0 %   COLUMN motivo_solvencia.motsol_estado    COMMENT     d   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_estado IS 'estado del registro de la tabla';
          parametricas          usr_controleg    false    221                       0    0 (   COLUMN motivo_solvencia.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    221                       0    0 ,   COLUMN motivo_solvencia.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    221                       0    0 $   COLUMN motivo_solvencia.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    221                       0    0 &   COLUMN motivo_solvencia.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.motivo_solvencia.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    221                       0    0 *   COLUMN motivo_solvencia.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.motivo_solvencia.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    221                        0    0 "   COLUMN motivo_solvencia.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.motivo_solvencia.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    221            !           0    0    TABLE motivo_solvencia    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.motivo_solvencia TO usr_controleg_app;
          parametricas          usr_controleg    false    221            �            1259    174332 	   operacion    TABLE       CREATE TABLE parametricas.operacion (
    ope_codigo integer NOT NULL,
    ope_sigla character varying NOT NULL,
    ope_nombre character varying NOT NULL,
    ope_descripcion character varying,
    ope_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 #   DROP TABLE parametricas.operacion;
       parametricas         heap    usr_controleg    false    11            "           0    0    TABLE operacion    COMMENT     �   COMMENT ON TABLE parametricas.operacion IS 'Tabla para registrar los tipos de operaciones permitidos en el sistema de autenticacion. [Create, Read, Updte, Delete]';
          parametricas          usr_controleg    false    229            #           0    0    COLUMN operacion.ope_codigo    COMMENT     Q   COMMENT ON COLUMN parametricas.operacion.ope_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    229            $           0    0    COLUMN operacion.ope_sigla    COMMENT     Y   COMMENT ON COLUMN parametricas.operacion.ope_sigla IS 'Sigla identificadora del acceso';
          parametricas          usr_controleg    false    229            %           0    0    COLUMN operacion.ope_nombre    COMMENT     L   COMMENT ON COLUMN parametricas.operacion.ope_nombre IS 'Nombre del acceso';
          parametricas          usr_controleg    false    229            &           0    0     COLUMN operacion.ope_descripcion    COMMENT     d   COMMENT ON COLUMN parametricas.operacion.ope_descripcion IS 'Descripcion o aclaracion del acceso.';
          parametricas          usr_controleg    false    229            '           0    0    COLUMN operacion.ope_estado    COMMENT     N   COMMENT ON COLUMN parametricas.operacion.ope_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    229            (           0    0 !   COLUMN operacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.operacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    229            )           0    0 %   COLUMN operacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.operacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    229            *           0    0    COLUMN operacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.operacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    229            +           0    0    COLUMN operacion.fecha_registro    COMMENT     M   COMMENT ON COLUMN parametricas.operacion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    229            ,           0    0 #   COLUMN operacion.fecha_modificacion    COMMENT     U   COMMENT ON COLUMN parametricas.operacion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    229            -           0    0    COLUMN operacion.fecha_baja    COMMENT     E   COMMENT ON COLUMN parametricas.operacion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    229            .           0    0    TABLE operacion    ACL     Q   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.operacion TO usr_controleg_app;
          parametricas          usr_controleg    false    229            �            1259    174077    sub_tipo_informe    TABLE     �  CREATE TABLE parametricas.sub_tipo_informe (
    sti_codigo integer NOT NULL,
    sti_nombre character varying NOT NULL,
    sti_descripcion character varying,
    sti_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE parametricas.sub_tipo_informe;
       parametricas         heap    usr_controleg    false    11            /           0    0 "   COLUMN sub_tipo_informe.sti_nombre    COMMENT     T   COMMENT ON COLUMN parametricas.sub_tipo_informe.sti_nombre IS 'Nombre del informe';
          parametricas          usr_controleg    false    211            0           0    0 '   COLUMN sub_tipo_informe.sti_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.sti_descripcion IS 'Campo que hace referencia a descripcion del sub tipo informe';
          parametricas          usr_controleg    false    211            1           0    0 (   COLUMN sub_tipo_informe.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    211            2           0    0 ,   COLUMN sub_tipo_informe.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    211            3           0    0 $   COLUMN sub_tipo_informe.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    211            4           0    0 &   COLUMN sub_tipo_informe.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.sub_tipo_informe.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    211            5           0    0 *   COLUMN sub_tipo_informe.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.sub_tipo_informe.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    211            6           0    0 "   COLUMN sub_tipo_informe.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.sub_tipo_informe.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    211            7           0    0    TABLE sub_tipo_informe    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.sub_tipo_informe TO usr_controleg_app;
          parametricas          usr_controleg    false    211            �            1259    174204    tipo_adjunto    TABLE       CREATE TABLE parametricas.tipo_adjunto (
    tipadj_codigo integer NOT NULL,
    tipadj_descripcion character varying,
    tipadj_tramite integer,
    tipadj_observacion character varying,
    tipadj_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE parametricas.tipo_adjunto;
       parametricas         heap    usr_controleg    false    11            8           0    0 !   COLUMN tipo_adjunto.tipadj_codigo    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_codigo IS 'llave primaria de la tabla';
          parametricas          usr_controleg    false    220            9           0    0 &   COLUMN tipo_adjunto.tipadj_descripcion    COMMENT     e   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_descripcion IS 'descripcion del tipo de adjunto';
          parametricas          usr_controleg    false    220            :           0    0 "   COLUMN tipo_adjunto.tipadj_tramite    COMMENT     w   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_tramite IS 'codigo del tramite del cual podra ser el tipo adjunto';
          parametricas          usr_controleg    false    220            ;           0    0 &   COLUMN tipo_adjunto.tipadj_observacion    COMMENT     q   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_observacion IS 'observacion al registro del tipo de adjunto';
          parametricas          usr_controleg    false    220            <           0    0 $   COLUMN tipo_adjunto.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_adjunto.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    220            =           0    0 (   COLUMN tipo_adjunto.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_adjunto.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    220            >           0    0     COLUMN tipo_adjunto.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_adjunto.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    220            ?           0    0 "   COLUMN tipo_adjunto.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_adjunto.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    220            @           0    0 &   COLUMN tipo_adjunto.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_adjunto.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    220            A           0    0    COLUMN tipo_adjunto.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.tipo_adjunto.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    220            B           0    0    TABLE tipo_adjunto    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_adjunto TO usr_controleg_app;
          parametricas          usr_controleg    false    220            �            1259    174018    tipo_documento    TABLE     �  CREATE TABLE parametricas.tipo_documento (
    tipdoc_codigo integer NOT NULL,
    tipdoc_descripcion character varying,
    tipdoc_abreviacion character varying,
    tipdoc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 (   DROP TABLE parametricas.tipo_documento;
       parametricas         heap    usr_controleg    false    11            C           0    0 (   COLUMN tipo_documento.tipdoc_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_descripcion IS 'Campo que hace referencia a descripcion de tipo_documento';
          parametricas          usr_controleg    false    207            D           0    0 (   COLUMN tipo_documento.tipdoc_abreviacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_abreviacion IS 'Campo que hace referencia a abreviacion de tipo_documento';
          parametricas          usr_controleg    false    207            E           0    0 &   COLUMN tipo_documento.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    207            F           0    0 *   COLUMN tipo_documento.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    207            G           0    0 "   COLUMN tipo_documento.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    207            H           0    0 $   COLUMN tipo_documento.fecha_registro    COMMENT     R   COMMENT ON COLUMN parametricas.tipo_documento.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    207            I           0    0 (   COLUMN tipo_documento.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN parametricas.tipo_documento.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    207            J           0    0     COLUMN tipo_documento.fecha_baja    COMMENT     J   COMMENT ON COLUMN parametricas.tipo_documento.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    207            K           0    0    TABLE tipo_documento    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_documento TO usr_controleg_app;
          parametricas          usr_controleg    false    207            �            1259    174190    tipo_documento_remision    TABLE     �  CREATE TABLE parametricas.tipo_documento_remision (
    tdr_codigo integer NOT NULL,
    tdr_descripcion character varying,
    tdr_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 1   DROP TABLE parametricas.tipo_documento_remision;
       parametricas         heap    usr_controleg    false    11            L           0    0 .   COLUMN tipo_documento_remision.tdr_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.tdr_descripcion IS 'Campo que hace referencia a descripcion de tipo_documento_remision';
          parametricas          usr_controleg    false    219            M           0    0 /   COLUMN tipo_documento_remision.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    219            N           0    0 3   COLUMN tipo_documento_remision.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    219            O           0    0 +   COLUMN tipo_documento_remision.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    219            P           0    0 -   COLUMN tipo_documento_remision.fecha_registro    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_documento_remision.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    219            Q           0    0 1   COLUMN tipo_documento_remision.fecha_modificacion    COMMENT     c   COMMENT ON COLUMN parametricas.tipo_documento_remision.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    219            R           0    0 )   COLUMN tipo_documento_remision.fecha_baja    COMMENT     S   COMMENT ON COLUMN parametricas.tipo_documento_remision.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    219            S           0    0    TABLE tipo_documento_remision    ACL     _   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_documento_remision TO usr_controleg_app;
          parametricas          usr_controleg    false    219            �            1259    174105    tipo_involucrado    TABLE       CREATE TABLE parametricas.tipo_involucrado (
    tipinv_codigo integer NOT NULL,
    tipinv_descripcion character varying,
    tipinv_abreviacion character varying,
    tipinv_mostrar bit(1),
    tipinv_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE parametricas.tipo_involucrado;
       parametricas         heap    usr_controleg    false    11            T           0    0 *   COLUMN tipo_involucrado.tipinv_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_descripcion IS 'Campo que hace referencia a descripcion del tipo de involucrado';
          parametricas          usr_controleg    false    213            U           0    0 *   COLUMN tipo_involucrado.tipinv_abreviacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_abreviacion IS 'Campo que hace referencia a abreviacion del tipo de involucrado';
          parametricas          usr_controleg    false    213            V           0    0 &   COLUMN tipo_involucrado.tipinv_mostrar    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_mostrar IS 'Campo que hace referencia a mostrar el tipo de involucrado';
          parametricas          usr_controleg    false    213            W           0    0 (   COLUMN tipo_involucrado.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    213            X           0    0 ,   COLUMN tipo_involucrado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    213            Y           0    0 $   COLUMN tipo_involucrado.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    213            Z           0    0 &   COLUMN tipo_involucrado.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_involucrado.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    213            [           0    0 *   COLUMN tipo_involucrado.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.tipo_involucrado.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    213            \           0    0 "   COLUMN tipo_involucrado.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.tipo_involucrado.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    213            ]           0    0    TABLE tipo_involucrado    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_involucrado TO usr_controleg_app;
          parametricas          usr_controleg    false    213            �            1259    174049    tipo_proceso    TABLE     �  CREATE TABLE parametricas.tipo_proceso (
    tippro_codigo integer NOT NULL,
    tippro_descripcion character varying,
    tippro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE parametricas.tipo_proceso;
       parametricas         heap    usr_controleg    false    11            ^           0    0 &   COLUMN tipo_proceso.tippro_descripcion    COMMENT     }   COMMENT ON COLUMN parametricas.tipo_proceso.tippro_descripcion IS 'Campo que hace referencia a descripcion de tipo_proceso';
          parametricas          usr_controleg    false    209            _           0    0 $   COLUMN tipo_proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    209            `           0    0 (   COLUMN tipo_proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    209            a           0    0     COLUMN tipo_proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    209            b           0    0 "   COLUMN tipo_proceso.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_proceso.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    209            c           0    0 &   COLUMN tipo_proceso.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_proceso.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    209            d           0    0    COLUMN tipo_proceso.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.tipo_proceso.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    209            e           0    0    TABLE tipo_proceso    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_proceso TO usr_controleg_app;
          parametricas          usr_controleg    false    209            �            1259    174271    tipo_proceso_datos_adicionales    TABLE     '  CREATE TABLE parametricas.tipo_proceso_datos_adicionales (
    tpda_codigo integer NOT NULL,
    tpda_descripcion character varying,
    tpda_clave character varying NOT NULL,
    tpda_texto character varying NOT NULL,
    tpda_requerido boolean DEFAULT false NOT NULL,
    tpda_tipo_dato character varying DEFAULT 'string'::character varying NOT NULL,
    tpda_servicio_recurso character varying,
    tda_servicio_clave character varying,
    tippro_codigo integer NOT NULL,
    tpda_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 8   DROP TABLE parametricas.tipo_proceso_datos_adicionales;
       parametricas         heap    usr_controleg    false    11            f           0    0 $   TABLE tipo_proceso_datos_adicionales    COMMENT     �   COMMENT ON TABLE parametricas.tipo_proceso_datos_adicionales IS 'Tabla para conformar la estructura de los datos adicionales de un proceso.';
          parametricas          usr_controleg    false    225            g           0    0 0   COLUMN tipo_proceso_datos_adicionales.tpda_clave    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_clave IS 'clave del objeto JSON con el que se asignara el valor del campo';
          parametricas          usr_controleg    false    225            h           0    0 0   COLUMN tipo_proceso_datos_adicionales.tpda_texto    COMMENT     |   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_texto IS 'Texto que se mostrara en el campo de llenado';
          parametricas          usr_controleg    false    225            i           0    0 4   COLUMN tipo_proceso_datos_adicionales.tpda_requerido    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_requerido IS 'Determina si el texto solicitado es requerido.';
          parametricas          usr_controleg    false    225            j           0    0 4   COLUMN tipo_proceso_datos_adicionales.tpda_tipo_dato    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_tipo_dato IS 'define el tipo de dato del campo, solamente se consideran los siguientes tipos: fecha, texto, numero, seleccionable';
          parametricas          usr_controleg    false    225            k           0    0 ;   COLUMN tipo_proceso_datos_adicionales.tpda_servicio_recurso    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_servicio_recurso IS 'Define el recurso del servicio desde donde se obtendra los valores seleccionables.';
          parametricas          usr_controleg    false    225            l           0    0 8   COLUMN tipo_proceso_datos_adicionales.tda_servicio_clave    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tda_servicio_clave IS 'Se usa para identificar la clave del objeto json que se obtiene desde el recurso definido para el servicio.';
          parametricas          usr_controleg    false    225            m           0    0 3   COLUMN tipo_proceso_datos_adicionales.tippro_codigo    COMMENT     |   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tippro_codigo IS 'Referencia a la tabla de tipo de proceso.';
          parametricas          usr_controleg    false    225            n           0    0 1   COLUMN tipo_proceso_datos_adicionales.tpda_estado    COMMENT     d   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_estado IS 'Estado del Registro';
          parametricas          usr_controleg    false    225            o           0    0 6   COLUMN tipo_proceso_datos_adicionales.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    225            p           0    0 :   COLUMN tipo_proceso_datos_adicionales.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    225            q           0    0 2   COLUMN tipo_proceso_datos_adicionales.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    225            r           0    0 4   COLUMN tipo_proceso_datos_adicionales.fecha_registro    COMMENT     b   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    225            s           0    0 8   COLUMN tipo_proceso_datos_adicionales.fecha_modificacion    COMMENT     j   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    225            t           0    0 0   COLUMN tipo_proceso_datos_adicionales.fecha_baja    COMMENT     Z   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    225            u           0    0 $   TABLE tipo_proceso_datos_adicionales    ACL     f   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_proceso_datos_adicionales TO usr_controleg_app;
          parametricas          usr_controleg    false    225            �            1259    174063    tipo_responsabilidad    TABLE     �  CREATE TABLE parametricas.tipo_responsabilidad (
    tipres_codigo integer NOT NULL,
    tipres_nombre character varying NOT NULL,
    tipres_descripcion character varying,
    tipres_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 .   DROP TABLE parametricas.tipo_responsabilidad;
       parametricas         heap    usr_controleg    false    11            v           0    0    TABLE tipo_responsabilidad    COMMENT     �   COMMENT ON TABLE parametricas.tipo_responsabilidad IS 'Tabla para registrar los tipos de responsablididad como civil, administrativa... de los dictamenes.';
          parametricas          usr_controleg    false    210            w           0    0 )   COLUMN tipo_responsabilidad.tipres_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.tipo_responsabilidad.tipres_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    210            x           0    0 )   COLUMN tipo_responsabilidad.tipres_nombre    COMMENT     k   COMMENT ON COLUMN parametricas.tipo_responsabilidad.tipres_nombre IS 'Nombre del tipo de responsabilidad';
          parametricas          usr_controleg    false    210            y           0    0 .   COLUMN tipo_responsabilidad.tipres_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.tipres_descripcion IS 'Campo que hace referencia a descripcion del tipo de responsabilidad';
          parametricas          usr_controleg    false    210            z           0    0 ,   COLUMN tipo_responsabilidad.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    210            {           0    0 0   COLUMN tipo_responsabilidad.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    210            |           0    0 (   COLUMN tipo_responsabilidad.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    210            }           0    0 *   COLUMN tipo_responsabilidad.fecha_registro    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_responsabilidad.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    210            ~           0    0 .   COLUMN tipo_responsabilidad.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN parametricas.tipo_responsabilidad.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    210                       0    0 &   COLUMN tipo_responsabilidad.fecha_baja    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_responsabilidad.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    210            �           0    0    TABLE tipo_responsabilidad    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_responsabilidad TO usr_controleg_app;
          parametricas          usr_controleg    false    210            �            1259    174287    tipo_rol    TABLE     �  CREATE TABLE parametricas.tipo_rol (
    tiprol_codigo integer NOT NULL,
    tipusu_nombre character varying,
    tipusu_descripcion character varying,
    tipusu_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 "   DROP TABLE parametricas.tipo_rol;
       parametricas         heap    usr_controleg    false    11            �           0    0    TABLE tipo_rol    COMMENT     a   COMMENT ON TABLE parametricas.tipo_rol IS 'Tabla para contral el tipo de rol, INTERNO, EXTERNO';
          parametricas          usr_controleg    false    226            �           0    0    COLUMN tipo_rol.tiprol_codigo    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_rol.tiprol_codigo IS 'Identificador de tabla.';
          parametricas          usr_controleg    false    226            �           0    0    COLUMN tipo_rol.tipusu_nombre    COMMENT     W   COMMENT ON COLUMN parametricas.tipo_rol.tipusu_nombre IS 'Nombre del tipo de usuario';
          parametricas          usr_controleg    false    226            �           0    0 "   COLUMN tipo_rol.tipusu_descripcion    COMMENT     o   COMMENT ON COLUMN parametricas.tipo_rol.tipusu_descripcion IS 'Descripcion o aclaracion del tipo de usuario.';
          parametricas          usr_controleg    false    226            �           0    0     COLUMN tipo_rol.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_rol.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    226            �           0    0 $   COLUMN tipo_rol.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_rol.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    226            �           0    0    COLUMN tipo_rol.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_rol.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    226            �           0    0    COLUMN tipo_rol.fecha_registro    COMMENT     L   COMMENT ON COLUMN parametricas.tipo_rol.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    226            �           0    0 "   COLUMN tipo_rol.fecha_modificacion    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_rol.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    226            �           0    0    COLUMN tipo_rol.fecha_baja    COMMENT     D   COMMENT ON COLUMN parametricas.tipo_rol.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    226            �           0    0    TABLE tipo_rol    ACL     P   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_rol TO usr_controleg_app;
          parametricas          usr_controleg    false    226            �            1259    174133    tipo_sancion    TABLE     �  CREATE TABLE parametricas.tipo_sancion (
    tipsan_codigo integer NOT NULL,
    tipsan_nombre character varying NOT NULL,
    tipsan_descripcion character varying,
    tipsan_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE parametricas.tipo_sancion;
       parametricas         heap    usr_controleg    false    11            �           0    0    TABLE tipo_sancion    COMMENT     �   COMMENT ON TABLE parametricas.tipo_sancion IS 'Tabla para definir que tipo de sanciones se tienen en el sistema, para usarlos en contra de los demandados, inicialmente de procesos administrativos diciplinarios.';
          parametricas          usr_controleg    false    215            �           0    0 !   COLUMN tipo_sancion.tipsan_codigo    COMMENT     W   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_codigo IS 'Idnetificador de tabla';
          parametricas          usr_controleg    false    215            �           0    0 !   COLUMN tipo_sancion.tipsan_nombre    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_nombre IS 'Nombre del tipo de sancion';
          parametricas          usr_controleg    false    215            �           0    0 &   COLUMN tipo_sancion.tipsan_descripcion    COMMENT     p   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_descripcion IS 'Descripcion o claracion de tipo de accion.';
          parametricas          usr_controleg    false    215            �           0    0 !   COLUMN tipo_sancion.tipsan_estado    COMMENT     U   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_estado IS 'Estado del Registro.';
          parametricas          usr_controleg    false    215            �           0    0 $   COLUMN tipo_sancion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_sancion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    215            �           0    0 (   COLUMN tipo_sancion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_sancion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    215            �           0    0     COLUMN tipo_sancion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_sancion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    215            �           0    0 "   COLUMN tipo_sancion.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_sancion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    215            �           0    0 &   COLUMN tipo_sancion.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_sancion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    215            �           0    0    COLUMN tipo_sancion.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.tipo_sancion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    215            �           0    0    TABLE tipo_sancion    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_sancion TO usr_controleg_app;
          parametricas          usr_controleg    false    215            �            1259    174230    tipo_solicitante    TABLE     �  CREATE TABLE parametricas.tipo_solicitante (
    tipsol_codigo integer NOT NULL,
    tipsol_descripcion character varying,
    tipsol_observacion character varying,
    tipsol_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE parametricas.tipo_solicitante;
       parametricas         heap    usr_controleg    false    11            �           0    0 %   COLUMN tipo_solicitante.tipsol_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_codigo IS 'llave primaria de la tabla';
          parametricas          usr_controleg    false    222            �           0    0 *   COLUMN tipo_solicitante.tipsol_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_descripcion IS 'campo donde se almancena la descripcion del tipo de solicitante';
          parametricas          usr_controleg    false    222            �           0    0 *   COLUMN tipo_solicitante.tipsol_observacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_observacion IS 'en este campo se almacena alguna observacion al registro del tipo de solicitante';
          parametricas          usr_controleg    false    222            �           0    0 %   COLUMN tipo_solicitante.tipsol_estado    COMMENT     u   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_estado IS 'estado del registro de la tabla tipo solicitante';
          parametricas          usr_controleg    false    222            �           0    0 (   COLUMN tipo_solicitante.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    222            �           0    0 ,   COLUMN tipo_solicitante.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    222            �           0    0 $   COLUMN tipo_solicitante.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    222            �           0    0 &   COLUMN tipo_solicitante.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_solicitante.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    222            �           0    0 *   COLUMN tipo_solicitante.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.tipo_solicitante.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    222            �           0    0 "   COLUMN tipo_solicitante.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.tipo_solicitante.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    222            �           0    0    TABLE tipo_solicitante    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_solicitante TO usr_controleg_app;
          parametricas          usr_controleg    false    222            �          0    174792    menu 
   TABLE DATA           �   COPY autenticacion.menu (men_codigo, men_orden, men_nombre, men_icono, men_ruta, men_codigo_padre, men_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    264   U      �          0    174778    recurso 
   TABLE DATA           �   COPY autenticacion.recurso (rec_codigo, rec_nombre, rec_descripcion, men_codigo, rec_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    263   r      �          0    174764    rol 
   TABLE DATA           �   COPY autenticacion.rol (rol_codigo, rol_nombre, rol_descripcion, tiprol_codigo, rol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    262   �      �          0    174807    rol_recurso_operacion 
   TABLE DATA           �   COPY autenticacion.rol_recurso_operacion (rro_codigo, rol_codigo, rec_codigo, acc_codigo, rro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    265   �      �          0    174730    usuario 
   TABLE DATA           �   COPY autenticacion.usuario (usu_codigo, usu_usuario, usu_contrasenia, usu_fecha_expiracion, per_codigo, usu_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    260   �      �          0    174748    usuario_entidad 
   TABLE DATA           �   COPY autenticacion.usuario_entidad (usuent_codigo, usuent_primer_ingreso, usuent_ultimo_ingreso, ent_codigo, usu_codigo, usuent_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    261   ?      �          0    174821    usuario_operacion 
   TABLE DATA           �   COPY autenticacion.usuario_operacion (usuope_codigo, usurol_codigo, rec_codigo, ope_codigo, usuope_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    266   �      �          0    174835    usuario_rol 
   TABLE DATA           �   COPY autenticacion.usuario_rol (usurol_codigo, usu_codigo, rol_codigo, usurol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    267   �      �          0    174588    cargo 
   TABLE DATA           �   COPY controleg_dictamen.cargo (car_codigo, car_monto, car_numero, dic_codigo, mon_codigo, car_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    250   �      �          0    174660    dictamen_uai 
   TABLE DATA           Z  COPY controleg_dictamen.dictamen_uai (dicuai_codigo, dicuai_gestion, dicuai_numero, dicuai_fecha, dicuai_numero_informe, dicuai_fecha_informe, tipaud_codigo, dicuai_nota_remision, ent_codigo, dicuai_nombre_auditoria, dicuai_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    255   �      �          0    174702    involucrado 
   TABLE DATA           �   COPY controleg_dictamen.involucrado (inv_codigo, ent_codigo, car_codigo, perres_codigo, inftip_codigo, inv_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    258         �          0    174674    registro_dictamen 
   TABLE DATA           �   COPY controleg_dictamen.registro_dictamen (dic_codigo, dic_procedencia, dic_llave, dic_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    256   *      �          0    174630    seguimiento_cargo 
   TABLE DATA           	  COPY controleg_dictamen.seguimiento_cargo (segcar_codigo, segcar_fecha, segcar_descripcion, segcar_respaldo, car_codigo, estcla_codigo, segcar_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    253   G      �          0    174688    seguimiento_dictamen 
   TABLE DATA             COPY controleg_dictamen.seguimiento_dictamen (segdic_codigo, segdic_fecha, segdic_descripcion, segdic_respaldo, dic_codigo, estcla_codigo, segdic_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    257   d      �          0    174538    empresa_unipersonal 
   TABLE DATA           �   COPY controleg_persona.empresa_unipersonal (empuni_codigo, per_codigo, perjur_codigo, empuni_observacion, empuni_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    246   �      �          0    174550    entidad 
   TABLE DATA           �   COPY controleg_persona.entidad (ent_codigo, ent_nit, ent_correo_electronico, ent_observacion, ent_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    247   �                0    174411    persona 
   TABLE DATA           �  COPY controleg_persona.persona (per_codigo, per_nombres, per_apellido_paterno, per_apellido_materno, per_estado, per_fecha_nacimiento, per_documento_identidad, per_nacionalidad, per_correo_electronico, tipdoc_codigo, per_apellido_conyuge, per_complemento_segip, per_lugar_emision, per_genero, per_domicilio, perext_codigo, per_telefono, validado_segip, per_observacion, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    235   �      �          0    174526    persona_juridica 
   TABLE DATA           F  COPY controleg_persona.persona_juridica (perjur_codigo, perjur_razon_social, perjur_nit, perjur_sigla, perjur_direccion, perjur_telefono, perjur_fax, perjur_correo_electronico, perjur_observacion, perjur_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    245   1      �          0    174716    persona_responsable 
   TABLE DATA             COPY controleg_persona.persona_responsable (perres_codigo, per_codigo, per_codigo_natural, empuni_codigo, perjur_codigo, ent_codigo, perres_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    259   N      �          0    174562    representante_legal 
   TABLE DATA           �   COPY controleg_persona.representante_legal (repleg_codigo, per_codigo, perjur_codigo, repleg_respaldo, repleg_observacion, repleg_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    248   k      �          0    174849    cargo_proceso 
   TABLE DATA           �   COPY controleg_proceso.cargo_proceso (carpro_codigo, pro_codigo, car_codigo, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    268   �      �          0    174644 	   demandado 
   TABLE DATA           �   COPY controleg_proceso.demandado (dem_codigo, dem_consolidado, dem_fecha_consolidado, ent_codigo, pro_codigo, perres_codigo, dem_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    254   �      �          0    174574    proceso 
   TABLE DATA           y  COPY controleg_proceso.proceso (pro_codigo, pro_gestion, pro_fecha_inicio, pro_monto, pro_codigo_fiscalia, pro_juzgado, pro_causa, pro_datos_adicionales, pro_observacion, pro_codigo_anterior, ent_codigo, pro_abogado_codigo, tippro_codigo, mon_codigo, pro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    249   �      �          0    174602    proceso_cargo 
   TABLE DATA           �   COPY controleg_proceso.proceso_cargo (procar_codigo, pro_codigo, car_codigo, procar_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    251   �      �          0    174862    sancion 
   TABLE DATA           �   COPY controleg_proceso.sancion (san_codigo, dem_codigo, tipsan_codigo, san_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    269   �      �          0    174616    seguimiento_proceso 
   TABLE DATA           
  COPY controleg_proceso.seguimiento_proceso (segpro_codigo, segpro_fecha, segpro_descripcion, segpro_respaldo, pro_codigo, estcla_codigo, segpro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    252         �          0    174876    seguimiento_sancion 
   TABLE DATA           
  COPY controleg_proceso.seguimiento_sancion (segsan_codigo, segsan_fecha, segsan_descripcion, segsan_respaldo, san_codigo, estcla_codigo, segsan_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    270   6      {          0    174361    solicitud_archivo_digital 
   TABLE DATA           )  COPY controleg_solvencia.solicitud_archivo_digital (sad_codigo, ssf_codigo, tipadj_codigo, arcdig_codigo, arcdig_hash, arcdig_nombre_archivo, arcdig_peso, arcdig_formato, sad_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_solvencia          usr_controleg    false    231   S      z          0    174346    solicitud_solvencia_fiscal 
   TABLE DATA           �  COPY controleg_solvencia.solicitud_solvencia_fiscal (ssf_codigo, ssf_fecha_solicitud, ssf_correo_electronico, ssf_objeto, ssf_telefono, ssf_nro_documento, ssf_notaria, per_codigo, per_codigo_apoderado, tipsol_codigo, lug_codigo, motsol_codigo, ent_codigo, lug_codigo_apoderado, drt_codigo, ssf_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_solvencia          usr_controleg    false    230   p      �          0    174434    acceso 
   TABLE DATA           �   COPY dictamen.acceso (acc_codigo, acc_plazo, acc_qr, acc_cantidad_descargas, dic_codigo, acc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    237   �      }          0    174386    catalogo_general 
   TABLE DATA           �   COPY dictamen.catalogo_general (catgen_codigo, catgen_codigo_dominio, catgen_descripcion_dominio, catgen_codigo_valor, catgen_acronimo, catgen_descripcion_valor, catgen_estado, usuario_base_datos, fecha_registro) FROM stdin;
    dictamen          usr_controleg    false    233   �      �          0    174447    descarga 
   TABLE DATA           �   COPY dictamen.descarga (des_codigo, des_numero, des_fecha, per_codigo, inf_codigo, acc_codigo, des_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    238   �      |          0    174374    dictamen 
   TABLE DATA           �   COPY dictamen.dictamen (dic_codigo, dic_gestion, dic_numero, dic_nombre_auditoria, dic_observacion, ent_codigo, dic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    232   �      �          0    174480    dictamen_archivo 
   TABLE DATA             COPY dictamen.dictamen_archivo (dicarc_codigo, dicarc_ruta, dicarc_hash, dicarc_nombre, dicarc_mime, dicarc_descripcion, dic_codigo, dicarc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    241         �          0    174423    informe 
   TABLE DATA           5  COPY dictamen.informe (inf_codigo, inf_gestion, inf_numero, inf_codigo_informe, inf_dep_codigo, inf_unidad_codigo, dic_codigo, tipinf_dominio, tipinf_codigo, sti_dominio, sti_codigo, inf_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    236         ~          0    174399    informe_archivo 
   TABLE DATA             COPY dictamen.informe_archivo (infarc_codigo, infarc_ruta, infarc_hash, infarc_nombre, infarc_mime, infarc_descripcion, inf_codigo, infarc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    234   ;      �          0    174457    notificacion 
   TABLE DATA           �   COPY dictamen.notificacion (not_codigo, acc_codigo, not_correo, not_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    239   X      �          0    174469    persona_dictamen 
   TABLE DATA           5  COPY dictamen.persona_dictamen (perdic_codigo, perdic_notificacion, inf_codigo, tipinv_dominio, tipinv_codigo, perres_codigo, per_codigo, perjur_codigo, empuni_codigo, ent_codigo, perdic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    240   u      �          0    174492    persona_dictamen_archivo 
   TABLE DATA           �   COPY dictamen.persona_dictamen_archivo (pda_codigo, pda_ruta, pda_hash, pda_nombre, pda_mime, pda_descripcion, perdic_codigo, pda_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    242   �      �          0    174504    proceso_entidad 
   TABLE DATA             COPY dictamen.proceso_entidad (proent_codigo, proent_fecha_remision, proent_inicio_accion, proent_fecha_accion, proent_dep, proent_observacion, dic_codigo, proent_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    243   �      �          0    174514    proceso_entidad_archivo 
   TABLE DATA           �   COPY dictamen.proceso_entidad_archivo (pea_codigo, pea_ruta, pea_hash, pea_nombre, pea_mime, pea_descripcion, proent_codigo, pea_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    244   �      s          0    174243    documento_representante_tipo 
   TABLE DATA           �   COPY parametricas.documento_representante_tipo (drt_codigo, drt_descripcion, drt_observacion, drt_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    223   �      x          0    174317    estado_clasificacion 
   TABLE DATA             COPY parametricas.estado_clasificacion (estcla_codigo, estcla_orden, estcon_codigo, esteta_codigo, tippro_codigo, tipres_codigo, tipsan_codigo, estcla_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    228   }      j          0    174119    estado_control 
   TABLE DATA           �   COPY parametricas.estado_control (estcont_codigo, estcon_nombre, estcon_descripcion, estcon_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    214   z      w          0    174301    estado_etapa 
   TABLE DATA           �   COPY parametricas.estado_etapa (esteta_codigo, esteta_orden, esteta_nombre, esteta_solvencia, esteta_descripcion, esteta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    227   b      d          0    174032    estados 
   TABLE DATA           �   COPY parametricas.estados (est_codigo, est_nombre, est_descripcion, est_color, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    208   �      t          0    174257    genero 
   TABLE DATA           �   COPY parametricas.genero (gen_codigo, gen_descripcion, gen_abreviacion, gen_mostrar, gen_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    224   &      h          0    174091    infraccion_tipo 
   TABLE DATA           �   COPY parametricas.infraccion_tipo (inftip_codigo, inftip_nombre, inftip_descripcion, tipres_codigo, inftip_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    212         l          0    174147    juzgado 
   TABLE DATA           �   COPY parametricas.juzgado (juz_codigo, juz_descripcion, tippro_codigo, juz_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    216   ;      m          0    174161    lugar 
   TABLE DATA           �   COPY parametricas.lugar (lug_codigo, lug_nombre, lug_descripcion, lug_abreviacion, lug_nacional, lug_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    217   X      n          0    174176    moneda 
   TABLE DATA           �   COPY parametricas.moneda (mon_codigo, mon_descripcion, mon_abreviacion, mon_mostrar, mon_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    218   �      q          0    174217    motivo_solvencia 
   TABLE DATA           �   COPY parametricas.motivo_solvencia (motsol_codigo, motsol_descripcion, motsol_observacion, motsol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    221   �      y          0    174332 	   operacion 
   TABLE DATA           �   COPY parametricas.operacion (ope_codigo, ope_sigla, ope_nombre, ope_descripcion, ope_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    229         g          0    174077    sub_tipo_informe 
   TABLE DATA           �   COPY parametricas.sub_tipo_informe (sti_codigo, sti_nombre, sti_descripcion, sti_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    211   �      p          0    174204    tipo_adjunto 
   TABLE DATA           �   COPY parametricas.tipo_adjunto (tipadj_codigo, tipadj_descripcion, tipadj_tramite, tipadj_observacion, tipadj_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    220   Z      c          0    174018    tipo_documento 
   TABLE DATA           �   COPY parametricas.tipo_documento (tipdoc_codigo, tipdoc_descripcion, tipdoc_abreviacion, tipdoc_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    207   �      o          0    174190    tipo_documento_remision 
   TABLE DATA           �   COPY parametricas.tipo_documento_remision (tdr_codigo, tdr_descripcion, tdr_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    219   �      i          0    174105    tipo_involucrado 
   TABLE DATA           �   COPY parametricas.tipo_involucrado (tipinv_codigo, tipinv_descripcion, tipinv_abreviacion, tipinv_mostrar, tipinv_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    213         e          0    174049    tipo_proceso 
   TABLE DATA           �   COPY parametricas.tipo_proceso (tippro_codigo, tippro_descripcion, tippro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    209   �      u          0    174271    tipo_proceso_datos_adicionales 
   TABLE DATA           B  COPY parametricas.tipo_proceso_datos_adicionales (tpda_codigo, tpda_descripcion, tpda_clave, tpda_texto, tpda_requerido, tpda_tipo_dato, tpda_servicio_recurso, tda_servicio_clave, tippro_codigo, tpda_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    225   �      f          0    174063    tipo_responsabilidad 
   TABLE DATA           �   COPY parametricas.tipo_responsabilidad (tipres_codigo, tipres_nombre, tipres_descripcion, tipres_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    210          v          0    174287    tipo_rol 
   TABLE DATA           �   COPY parametricas.tipo_rol (tiprol_codigo, tipusu_nombre, tipusu_descripcion, tipusu_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    226   �       k          0    174133    tipo_sancion 
   TABLE DATA           �   COPY parametricas.tipo_sancion (tipsan_codigo, tipsan_nombre, tipsan_descripcion, tipsan_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    215   !      r          0    174230    tipo_solicitante 
   TABLE DATA           �   COPY parametricas.tipo_solicitante (tipsol_codigo, tipsol_descripcion, tipsol_observacion, tipsol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    222   t!      P           2606    174834 )   usuario_operacion lista_control_acceso_pk 
   CONSTRAINT     y   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT lista_control_acceso_pk PRIMARY KEY (usuope_codigo);
 Z   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT lista_control_acceso_pk;
       autenticacion            usr_controleg    false    266            L           2606    174806    menu menu_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY autenticacion.menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (men_codigo);
 =   ALTER TABLE ONLY autenticacion.menu DROP CONSTRAINT menu_pk;
       autenticacion            usr_controleg    false    264            D           2606    174761 "   usuario_entidad persona_entidad_pk 
   CONSTRAINT     r   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT persona_entidad_pk PRIMARY KEY (usuent_codigo);
 S   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT persona_entidad_pk;
       autenticacion            usr_controleg    false    261            F           2606    174763 "   usuario_entidad persona_entidad_uq 
   CONSTRAINT     v   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT persona_entidad_uq UNIQUE (ent_codigo, usu_codigo);
 S   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT persona_entidad_uq;
       autenticacion            usr_controleg    false    261    261            >           2606    174745    usuario persona_uq 
   CONSTRAINT     Z   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT persona_uq UNIQUE (per_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT persona_uq;
       autenticacion            usr_controleg    false    260            J           2606    174791    recurso recurso_pk 
   CONSTRAINT     _   ALTER TABLE ONLY autenticacion.recurso
    ADD CONSTRAINT recurso_pk PRIMARY KEY (rec_codigo);
 C   ALTER TABLE ONLY autenticacion.recurso DROP CONSTRAINT recurso_pk;
       autenticacion            usr_controleg    false    263            H           2606    174777 
   rol rol_pk 
   CONSTRAINT     W   ALTER TABLE ONLY autenticacion.rol
    ADD CONSTRAINT rol_pk PRIMARY KEY (rol_codigo);
 ;   ALTER TABLE ONLY autenticacion.rol DROP CONSTRAINT rol_pk;
       autenticacion            usr_controleg    false    262            N           2606    174820 +   rol_recurso_operacion rol_recurso_acceso_pk 
   CONSTRAINT     x   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT rol_recurso_acceso_pk PRIMARY KEY (rro_codigo);
 \   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT rol_recurso_acceso_pk;
       autenticacion            usr_controleg    false    265            @           2606    174743    usuario usuario_pk 
   CONSTRAINT     _   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (usu_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT usuario_pk;
       autenticacion            usr_controleg    false    260            R           2606    174848    usuario_rol usuario_rol_pk 
   CONSTRAINT     j   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT usuario_rol_pk PRIMARY KEY (usurol_codigo);
 K   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT usuario_rol_pk;
       autenticacion            usr_controleg    false    267            B           2606    174747    usuario usuario_uq 
   CONSTRAINT     [   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT usuario_uq UNIQUE (usu_usuario);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT usuario_uq;
       autenticacion            usr_controleg    false    260            *           2606    174601    cargo cargo_pk 
   CONSTRAINT     `   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT cargo_pk PRIMARY KEY (car_codigo);
 D   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT cargo_pk;
       controleg_dictamen            usr_controleg    false    250            6           2606    174687    registro_dictamen dictamen_pk 
   CONSTRAINT     o   ALTER TABLE ONLY controleg_dictamen.registro_dictamen
    ADD CONSTRAINT dictamen_pk PRIMARY KEY (dic_codigo);
 S   ALTER TABLE ONLY controleg_dictamen.registro_dictamen DROP CONSTRAINT dictamen_pk;
       controleg_dictamen            usr_controleg    false    256            4           2606    174673    dictamen_uai dictamen_uai_pk 
   CONSTRAINT     q   ALTER TABLE ONLY controleg_dictamen.dictamen_uai
    ADD CONSTRAINT dictamen_uai_pk PRIMARY KEY (dicuai_codigo);
 R   ALTER TABLE ONLY controleg_dictamen.dictamen_uai DROP CONSTRAINT dictamen_uai_pk;
       controleg_dictamen            usr_controleg    false    255            :           2606    174715    involucrado involucrado_pk 
   CONSTRAINT     l   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT involucrado_pk PRIMARY KEY (inv_codigo);
 P   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT involucrado_pk;
       controleg_dictamen            usr_controleg    false    258            0           2606    174643 &   seguimiento_cargo seguimiento_cargo_pk 
   CONSTRAINT     {   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT seguimiento_cargo_pk PRIMARY KEY (segcar_codigo);
 \   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT seguimiento_cargo_pk;
       controleg_dictamen            usr_controleg    false    253            8           2606    174701 ,   seguimiento_dictamen seguimiento_dictamen_pk 
   CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen
    ADD CONSTRAINT seguimiento_dictamen_pk PRIMARY KEY (segdic_codigo);
 b   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen DROP CONSTRAINT seguimiento_dictamen_pk;
       controleg_dictamen            usr_controleg    false    257            "           2606    174549 *   empresa_unipersonal empresa_unipersonal_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT empresa_unipersonal_pk PRIMARY KEY (empuni_codigo);
 _   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT empresa_unipersonal_pk;
       controleg_persona            usr_controleg    false    246            $           2606    174561    entidad entidad_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg_persona.entidad
    ADD CONSTRAINT entidad_pk PRIMARY KEY (ent_codigo);
 G   ALTER TABLE ONLY controleg_persona.entidad DROP CONSTRAINT entidad_pk;
       controleg_persona            usr_controleg    false    247                        2606    174537 $   persona_juridica persona_juridica_pk 
   CONSTRAINT     x   ALTER TABLE ONLY controleg_persona.persona_juridica
    ADD CONSTRAINT persona_juridica_pk PRIMARY KEY (perjur_codigo);
 Y   ALTER TABLE ONLY controleg_persona.persona_juridica DROP CONSTRAINT persona_juridica_pk;
       controleg_persona            usr_controleg    false    245                       2606    174422    persona persona_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT persona_pk PRIMARY KEY (per_codigo);
 G   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT persona_pk;
       controleg_persona            usr_controleg    false    235            <           2606    174729 *   persona_responsable persona_responsable_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_responsable_pk PRIMARY KEY (perres_codigo);
 _   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_responsable_pk;
       controleg_persona            usr_controleg    false    259            &           2606    174573 *   representante_legal representante_legal_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT representante_legal_pk PRIMARY KEY (repleg_codigo);
 _   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT representante_legal_pk;
       controleg_persona            usr_controleg    false    248            T           2606    174861    cargo_proceso cargo_proceso_pk 
   CONSTRAINT     r   ALTER TABLE ONLY controleg_proceso.cargo_proceso
    ADD CONSTRAINT cargo_proceso_pk PRIMARY KEY (carpro_codigo);
 S   ALTER TABLE ONLY controleg_proceso.cargo_proceso DROP CONSTRAINT cargo_proceso_pk;
       controleg_proceso            usr_controleg    false    268            2           2606    174659    demandado demandado_pk 
   CONSTRAINT     g   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT demandado_pk PRIMARY KEY (dem_codigo);
 K   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT demandado_pk;
       controleg_proceso            usr_controleg    false    254            V           2606    174875    sancion demandado_sancion_pk 
   CONSTRAINT     m   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT demandado_sancion_pk PRIMARY KEY (san_codigo);
 Q   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT demandado_sancion_pk;
       controleg_proceso            usr_controleg    false    269            ,           2606    174615    proceso_cargo proceso_cargo_pk 
   CONSTRAINT     r   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT proceso_cargo_pk PRIMARY KEY (procar_codigo);
 S   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT proceso_cargo_pk;
       controleg_proceso            usr_controleg    false    251            (           2606    174587    proceso proceso_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT proceso_pk PRIMARY KEY (pro_codigo);
 G   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT proceso_pk;
       controleg_proceso            usr_controleg    false    249            .           2606    174629 *   seguimiento_proceso seguimiento_proceso_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT seguimiento_proceso_pk PRIMARY KEY (segpro_codigo);
 _   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT seguimiento_proceso_pk;
       controleg_proceso            usr_controleg    false    252            X           2606    174889 *   seguimiento_sancion seguimiento_sancion_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT seguimiento_sancion_pk PRIMARY KEY (segsan_codigo);
 _   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT seguimiento_sancion_pk;
       controleg_proceso            usr_controleg    false    270                       2606    174373 6   solicitud_archivo_digital solicitud_archivo_digital_pk 
   CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital
    ADD CONSTRAINT solicitud_archivo_digital_pk PRIMARY KEY (sad_codigo);
 m   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital DROP CONSTRAINT solicitud_archivo_digital_pk;
       controleg_solvencia            usr_controleg    false    231                        2606    174360 8   solicitud_solvencia_fiscal solicitud_solvencia_fiscal_pk 
   CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT solicitud_solvencia_fiscal_pk PRIMARY KEY (ssf_codigo);
 o   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT solicitud_solvencia_fiscal_pk;
       controleg_solvencia            usr_controleg    false    230                       2606    174446    acceso acceso_pk 
   CONSTRAINT     X   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT acceso_pk PRIMARY KEY (acc_codigo);
 <   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT acceso_pk;
       dictamen            usr_controleg    false    237                       2606    174396 $   catalogo_general catalogo_general_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT catalogo_general_pk PRIMARY KEY (catgen_codigo);
 P   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT catalogo_general_pk;
       dictamen            usr_controleg    false    233                       2606    174398 $   catalogo_general catalogo_general_uk 
   CONSTRAINT     �   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT catalogo_general_uk UNIQUE (catgen_codigo_dominio, catgen_codigo_valor);
 P   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT catalogo_general_uk;
       dictamen            usr_controleg    false    233    233                       2606    174456    descarga descarga_pk 
   CONSTRAINT     \   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT descarga_pk PRIMARY KEY (des_codigo);
 @   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT descarga_pk;
       dictamen            usr_controleg    false    238                       2606    174491 $   dictamen_archivo dictamen_archivo_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT dictamen_archivo_pk PRIMARY KEY (dicarc_codigo);
 P   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT dictamen_archivo_pk;
       dictamen            usr_controleg    false    241                       2606    174385    dictamen dictamen_pk 
   CONSTRAINT     \   ALTER TABLE ONLY dictamen.dictamen
    ADD CONSTRAINT dictamen_pk PRIMARY KEY (dic_codigo);
 @   ALTER TABLE ONLY dictamen.dictamen DROP CONSTRAINT dictamen_pk;
       dictamen            usr_controleg    false    232            
           2606    174410 "   informe_archivo informe_archivo_pk 
   CONSTRAINT     m   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT informe_archivo_pk PRIMARY KEY (infarc_codigo);
 N   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT informe_archivo_pk;
       dictamen            usr_controleg    false    234                       2606    174433    informe informe_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT informe_pk PRIMARY KEY (inf_codigo);
 >   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT informe_pk;
       dictamen            usr_controleg    false    236                       2606    174468    notificacion notificacion_pk 
   CONSTRAINT     d   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT notificacion_pk PRIMARY KEY (not_codigo);
 H   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT notificacion_pk;
       dictamen            usr_controleg    false    239                       2606    174503 4   persona_dictamen_archivo persona_dictamen_archivo_pk 
   CONSTRAINT     |   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT persona_dictamen_archivo_pk PRIMARY KEY (pda_codigo);
 `   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT persona_dictamen_archivo_pk;
       dictamen            usr_controleg    false    242                       2606    174479 $   persona_dictamen persona_dictamen_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_dictamen_pk PRIMARY KEY (perdic_codigo);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_dictamen_pk;
       dictamen            usr_controleg    false    240                       2606    174525 2   proceso_entidad_archivo proceso_entidad_archivo_pk 
   CONSTRAINT     z   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT proceso_entidad_archivo_pk PRIMARY KEY (pea_codigo);
 ^   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT proceso_entidad_archivo_pk;
       dictamen            usr_controleg    false    244                       2606    174513 "   proceso_entidad proceso_entidad_pk 
   CONSTRAINT     m   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT proceso_entidad_pk PRIMARY KEY (proent_codigo);
 N   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT proceso_entidad_pk;
       dictamen            usr_controleg    false    243            �           2606    174345    operacion acceso_pk 
   CONSTRAINT     _   ALTER TABLE ONLY parametricas.operacion
    ADD CONSTRAINT acceso_pk PRIMARY KEY (ope_codigo);
 C   ALTER TABLE ONLY parametricas.operacion DROP CONSTRAINT acceso_pk;
       parametricas            usr_controleg    false    229            �           2606    174256 <   documento_representante_tipo documento_representante_tipo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.documento_representante_tipo
    ADD CONSTRAINT documento_representante_tipo_pk PRIMARY KEY (drt_codigo);
 l   ALTER TABLE ONLY parametricas.documento_representante_tipo DROP CONSTRAINT documento_representante_tipo_pk;
       parametricas            usr_controleg    false    223            �           2606    174331 ,   estado_clasificacion estado_clasificacion_pk 
   CONSTRAINT     {   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_clasificacion_pk PRIMARY KEY (estcla_codigo);
 \   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_clasificacion_pk;
       parametricas            usr_controleg    false    228            �           2606    174132     estado_control estado_control_pk 
   CONSTRAINT     p   ALTER TABLE ONLY parametricas.estado_control
    ADD CONSTRAINT estado_control_pk PRIMARY KEY (estcont_codigo);
 P   ALTER TABLE ONLY parametricas.estado_control DROP CONSTRAINT estado_control_pk;
       parametricas            usr_controleg    false    214            �           2606    174316    estado_etapa estado_etapa_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.estado_etapa
    ADD CONSTRAINT estado_etapa_pk PRIMARY KEY (esteta_codigo);
 L   ALTER TABLE ONLY parametricas.estado_etapa DROP CONSTRAINT estado_etapa_pk;
       parametricas            usr_controleg    false    227            �           2606    174046    estados estado_registro_pk 
   CONSTRAINT     f   ALTER TABLE ONLY parametricas.estados
    ADD CONSTRAINT estado_registro_pk PRIMARY KEY (est_codigo);
 J   ALTER TABLE ONLY parametricas.estados DROP CONSTRAINT estado_registro_pk;
       parametricas            usr_controleg    false    208            �           2606    174270    genero genero_pk 
   CONSTRAINT     \   ALTER TABLE ONLY parametricas.genero
    ADD CONSTRAINT genero_pk PRIMARY KEY (gen_codigo);
 @   ALTER TABLE ONLY parametricas.genero DROP CONSTRAINT genero_pk;
       parametricas            usr_controleg    false    224            �           2606    174104 "   infraccion_tipo infraccion_tipo_pk 
   CONSTRAINT     q   ALTER TABLE ONLY parametricas.infraccion_tipo
    ADD CONSTRAINT infraccion_tipo_pk PRIMARY KEY (inftip_codigo);
 R   ALTER TABLE ONLY parametricas.infraccion_tipo DROP CONSTRAINT infraccion_tipo_pk;
       parametricas            usr_controleg    false    212            �           2606    174160    juzgado juzgado_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY parametricas.juzgado
    ADD CONSTRAINT juzgado_pk PRIMARY KEY (juz_codigo);
 B   ALTER TABLE ONLY parametricas.juzgado DROP CONSTRAINT juzgado_pk;
       parametricas            usr_controleg    false    216            �           2606    174175    lugar lugar_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY parametricas.lugar
    ADD CONSTRAINT lugar_pk PRIMARY KEY (lug_codigo);
 >   ALTER TABLE ONLY parametricas.lugar DROP CONSTRAINT lugar_pk;
       parametricas            usr_controleg    false    217            �           2606    174189    moneda moneda_pk 
   CONSTRAINT     \   ALTER TABLE ONLY parametricas.moneda
    ADD CONSTRAINT moneda_pk PRIMARY KEY (mon_codigo);
 @   ALTER TABLE ONLY parametricas.moneda DROP CONSTRAINT moneda_pk;
       parametricas            usr_controleg    false    218            �           2606    174229 $   motivo_solvencia motivo_solvencia_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.motivo_solvencia
    ADD CONSTRAINT motivo_solvencia_pk PRIMARY KEY (motsol_codigo);
 T   ALTER TABLE ONLY parametricas.motivo_solvencia DROP CONSTRAINT motivo_solvencia_pk;
       parametricas            usr_controleg    false    221            �           2606    174048    estados nombre_uq 
   CONSTRAINT     X   ALTER TABLE ONLY parametricas.estados
    ADD CONSTRAINT nombre_uq UNIQUE (est_nombre);
 A   ALTER TABLE ONLY parametricas.estados DROP CONSTRAINT nombre_uq;
       parametricas            usr_controleg    false    208            �           2606    174090 $   sub_tipo_informe sub_tipo_informe_pk 
   CONSTRAINT     p   ALTER TABLE ONLY parametricas.sub_tipo_informe
    ADD CONSTRAINT sub_tipo_informe_pk PRIMARY KEY (sti_codigo);
 T   ALTER TABLE ONLY parametricas.sub_tipo_informe DROP CONSTRAINT sub_tipo_informe_pk;
       parametricas            usr_controleg    false    211            �           2606    174146    tipo_sancion tipo_accion_pk 
   CONSTRAINT     j   ALTER TABLE ONLY parametricas.tipo_sancion
    ADD CONSTRAINT tipo_accion_pk PRIMARY KEY (tipsan_codigo);
 K   ALTER TABLE ONLY parametricas.tipo_sancion DROP CONSTRAINT tipo_accion_pk;
       parametricas            usr_controleg    false    215            �           2606    174216    tipo_adjunto tipo_adjunto_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_adjunto
    ADD CONSTRAINT tipo_adjunto_pk PRIMARY KEY (tipadj_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_adjunto DROP CONSTRAINT tipo_adjunto_pk;
       parametricas            usr_controleg    false    220            �           2606    174031     tipo_documento tipo_documento_pk 
   CONSTRAINT     o   ALTER TABLE ONLY parametricas.tipo_documento
    ADD CONSTRAINT tipo_documento_pk PRIMARY KEY (tipdoc_codigo);
 P   ALTER TABLE ONLY parametricas.tipo_documento DROP CONSTRAINT tipo_documento_pk;
       parametricas            usr_controleg    false    207            �           2606    174203 2   tipo_documento_remision tipo_documento_remision_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY parametricas.tipo_documento_remision
    ADD CONSTRAINT tipo_documento_remision_pk PRIMARY KEY (tdr_codigo);
 b   ALTER TABLE ONLY parametricas.tipo_documento_remision DROP CONSTRAINT tipo_documento_remision_pk;
       parametricas            usr_controleg    false    219            �           2606    174118 $   tipo_involucrado tipo_involucrado_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.tipo_involucrado
    ADD CONSTRAINT tipo_involucrado_pk PRIMARY KEY (tipinv_codigo);
 T   ALTER TABLE ONLY parametricas.tipo_involucrado DROP CONSTRAINT tipo_involucrado_pk;
       parametricas            usr_controleg    false    213            �           2606    174286 @   tipo_proceso_datos_adicionales tipo_proceso_datos_adicionales_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT tipo_proceso_datos_adicionales_pk PRIMARY KEY (tpda_codigo);
 p   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT tipo_proceso_datos_adicionales_pk;
       parametricas            usr_controleg    false    225            �           2606    174062    tipo_proceso tipo_proceso_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_proceso
    ADD CONSTRAINT tipo_proceso_pk PRIMARY KEY (tippro_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_proceso DROP CONSTRAINT tipo_proceso_pk;
       parametricas            usr_controleg    false    209            �           2606    174076 ,   tipo_responsabilidad tipo_responsabilidad_pk 
   CONSTRAINT     {   ALTER TABLE ONLY parametricas.tipo_responsabilidad
    ADD CONSTRAINT tipo_responsabilidad_pk PRIMARY KEY (tipres_codigo);
 \   ALTER TABLE ONLY parametricas.tipo_responsabilidad DROP CONSTRAINT tipo_responsabilidad_pk;
       parametricas            usr_controleg    false    210            �           2606    174242 $   tipo_solicitante tipo_solicitante_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.tipo_solicitante
    ADD CONSTRAINT tipo_solicitante_pk PRIMARY KEY (tipsol_codigo);
 T   ALTER TABLE ONLY parametricas.tipo_solicitante DROP CONSTRAINT tipo_solicitante_pk;
       parametricas            usr_controleg    false    222            �           2606    174300    tipo_rol tipo_usuario_pk 
   CONSTRAINT     g   ALTER TABLE ONLY parametricas.tipo_rol
    ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY (tiprol_codigo);
 H   ALTER TABLE ONLY parametricas.tipo_rol DROP CONSTRAINT tipo_usuario_pk;
       parametricas            usr_controleg    false    226            �           2606    175490    rol_recurso_operacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES parametricas.operacion(ope_codigo);
 P   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT acceso_fk;
       autenticacion          usr_controleg    false    3582    265    229            �           2606    175515    usuario_operacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (ope_codigo) REFERENCES parametricas.operacion(ope_codigo);
 L   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT acceso_fk;
       autenticacion          usr_controleg    false    229    266    3582            �           2606    175440    usuario estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT estado_fk FOREIGN KEY (usu_estado) REFERENCES parametricas.estados(est_codigo);
 B   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    208    3538    260            �           2606    175450    usuario_entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (usuent_estado) REFERENCES parametricas.estados(est_codigo);
 J   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    3538    208    261            �           2606    175470    recurso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.recurso
    ADD CONSTRAINT estado_fk FOREIGN KEY (rec_estado) REFERENCES parametricas.estados(est_codigo);
 B   ALTER TABLE ONLY autenticacion.recurso DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    3538    208    263            �           2606    175475    menu estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.menu
    ADD CONSTRAINT estado_fk FOREIGN KEY (men_estado) REFERENCES parametricas.estados(est_codigo);
 ?   ALTER TABLE ONLY autenticacion.menu DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    264    208    3538            �           2606    175485    rol_recurso_operacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (rro_estado) REFERENCES parametricas.estados(est_codigo);
 P   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    3538    265    208            �           2606    175520    usuario_rol estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT estado_fk FOREIGN KEY (usurol_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    208    3538    267            �           2606    175465    recurso menu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.recurso
    ADD CONSTRAINT menu_fk FOREIGN KEY (men_codigo) REFERENCES autenticacion.menu(men_codigo);
 @   ALTER TABLE ONLY autenticacion.recurso DROP CONSTRAINT menu_fk;
       autenticacion          usr_controleg    false    263    264    3660            �           2606    175480    menu menu_menu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.menu
    ADD CONSTRAINT menu_menu_fk FOREIGN KEY (men_codigo_padre) REFERENCES autenticacion.menu(men_codigo);
 B   ALTER TABLE ONLY autenticacion.menu DROP CONSTRAINT menu_menu_fk;
       autenticacion          usr_controleg    false    3660    264    264            �           2606    175445    usuario persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT persona_fk;
       autenticacion          usr_controleg    false    3596    235    260            �           2606    175500     rol_recurso_operacion recurso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT recurso_fk FOREIGN KEY (rec_codigo) REFERENCES autenticacion.recurso(rec_codigo);
 Q   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT recurso_fk;
       autenticacion          usr_controleg    false    3658    265    263            �           2606    175510    usuario_operacion recurso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT recurso_fk FOREIGN KEY (rec_codigo) REFERENCES autenticacion.recurso(rec_codigo);
 M   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT recurso_fk;
       autenticacion          usr_controleg    false    263    266    3658            �           2606    175495     rol_recurso_operacion rol_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT rol_codigo FOREIGN KEY (rol_codigo) REFERENCES autenticacion.rol(rol_codigo);
 Q   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT rol_codigo;
       autenticacion          usr_controleg    false    262    3656    265            �           2606    175525    usuario_rol rol_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT rol_fk FOREIGN KEY (rol_codigo) REFERENCES autenticacion.rol(rol_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT rol_fk;
       autenticacion          usr_controleg    false    262    267    3656            �           2606    175460    rol tipo_rol_usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol
    ADD CONSTRAINT tipo_rol_usuario_fk FOREIGN KEY (tiprol_codigo) REFERENCES parametricas.tipo_rol(tiprol_codigo);
 H   ALTER TABLE ONLY autenticacion.rol DROP CONSTRAINT tipo_rol_usuario_fk;
       autenticacion          usr_controleg    false    226    3576    262            �           2606    175455    usuario_entidad usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usu_codigo) REFERENCES autenticacion.usuario(usu_codigo);
 K   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT usuario_fk;
       autenticacion          usr_controleg    false    261    3648    260            �           2606    175530    usuario_rol usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usu_codigo) REFERENCES autenticacion.usuario(usu_codigo);
 G   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT usuario_fk;
       autenticacion          usr_controleg    false    267    260    3648            �           2606    175505     usuario_operacion usuario_rol_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY (usurol_codigo) REFERENCES autenticacion.usuario_rol(usurol_codigo);
 Q   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT usuario_rol_fk;
       autenticacion          usr_controleg    false    3666    267    266            �           2606    175345    seguimiento_cargo cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 P   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT cargo_fk;
       controleg_dictamen          usr_controleg    false    250    3626    253            �           2606    175390    involucrado cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 J   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT cargo_fk;
       controleg_dictamen          usr_controleg    false    3626    250    258            �           2606    175300    cargo dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES controleg_dictamen.registro_dictamen(dic_codigo);
 G   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT dictamen_fk;
       controleg_dictamen          usr_controleg    false    256    250    3638            �           2606    175375     seguimiento_dictamen dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES controleg_dictamen.registro_dictamen(dic_codigo);
 V   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen DROP CONSTRAINT dictamen_fk;
       controleg_dictamen          usr_controleg    false    3638    257    256            �           2606    175350 )   seguimiento_cargo estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 _   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT estado_clasificacion_fk;
       controleg_dictamen          usr_controleg    false    228    253    3580            �           2606    175380 ,   seguimiento_dictamen estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 b   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen DROP CONSTRAINT estado_clasificacion_fk;
       controleg_dictamen          usr_controleg    false    228    257    3580            �           2606    175310    cargo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT estado_fk FOREIGN KEY (car_estado) REFERENCES parametricas.estados(est_codigo);
 E   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    3538    208    250            �           2606    175355    seguimiento_cargo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT estado_fk FOREIGN KEY (segcar_estado) REFERENCES parametricas.estados(est_codigo);
 Q   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    208    253    3538            �           2606    175385    seguimiento_dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (segdic_estado) REFERENCES parametricas.estados(est_codigo);
 T   ALTER TABLE ONLY controleg_dictamen.seguimiento_dictamen DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    208    3538    257            �           2606    175400    involucrado estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT estado_fk FOREIGN KEY (inv_estado) REFERENCES parametricas.estados(est_codigo);
 K   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    258    3538    208            �           2606    175405    involucrado infraccion_tipo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT infraccion_tipo_fk FOREIGN KEY (inftip_codigo) REFERENCES parametricas.infraccion_tipo(inftip_codigo);
 T   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT infraccion_tipo_fk;
       controleg_dictamen          usr_controleg    false    3548    258    212            �           2606    175305    cargo mon_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT mon_codigo FOREIGN KEY (mon_codigo) REFERENCES parametricas.moneda(mon_codigo);
 F   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT mon_codigo;
       controleg_dictamen          usr_controleg    false    250    3560    218            �           0    0    CONSTRAINT mon_codigo ON cargo    COMMENT     `   COMMENT ON CONSTRAINT mon_codigo ON controleg_dictamen.cargo IS 'Referencia al tipo de moneda';
          controleg_dictamen          usr_controleg    false    3756            �           2606    175395 "   involucrado persona_responsable_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT persona_responsable_fk FOREIGN KEY (perres_codigo) REFERENCES controleg_persona.persona_responsable(perres_codigo);
 X   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT persona_responsable_fk;
       controleg_dictamen          usr_controleg    false    259    3644    258            �           2606    175425 *   persona_responsable empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES controleg_persona.empresa_unipersonal(empuni_codigo);
 _   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT empresa_unipersonal_fk;
       controleg_persona          usr_controleg    false    3618    259    246            �           2606    175435    persona_responsable entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT entidad_fk FOREIGN KEY (ent_codigo) REFERENCES controleg_persona.entidad(ent_codigo);
 S   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT entidad_fk;
       controleg_persona          usr_controleg    false    259    247    3620            �           2606    175090    persona estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT estado_fk FOREIGN KEY (per_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    235    208    3538            �           2606    175245    persona_juridica estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_juridica
    ADD CONSTRAINT estado_fk FOREIGN KEY (perjur_estado) REFERENCES parametricas.estados(est_codigo);
 O   ALTER TABLE ONLY controleg_persona.persona_juridica DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    208    245    3538            �           2606    175250    empresa_unipersonal estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT estado_fk FOREIGN KEY (empuni_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    3538    208    246            �           2606    175265    entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (ent_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY controleg_persona.entidad DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    247    3538    208            �           2606    175430    persona_responsable estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT estado_fk FOREIGN KEY (perres_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    259    3538    208            �           2606    175100    persona genero_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT genero_fk FOREIGN KEY (per_genero) REFERENCES parametricas.genero(gen_codigo);
 F   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT genero_fk;
       controleg_persona          usr_controleg    false    235    224    3572            �           2606    175095    persona lugar_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT lugar_fk FOREIGN KEY (per_lugar_emision) REFERENCES parametricas.lugar(lug_codigo);
 E   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT lugar_fk;
       controleg_persona          usr_controleg    false    3558    217    235            �           2606    175255    empresa_unipersonal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 S   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT persona_fk;
       controleg_persona          usr_controleg    false    3596    246    235            �           2606    175270    representante_legal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 S   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT persona_fk;
       controleg_persona          usr_controleg    false    235    3596    248            �           2606    175410    persona_responsable persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 S   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_fk;
       controleg_persona          usr_controleg    false    3596    235    259            �           2606    175260 '   empresa_unipersonal persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 \   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT persona_juridica_fk;
       controleg_persona          usr_controleg    false    3616    245    246            �           2606    175275 '   representante_legal persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 \   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT persona_juridica_fk;
       controleg_persona          usr_controleg    false    245    3616    248            �           2606    175420 '   persona_responsable persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 \   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_juridica_fk;
       controleg_persona          usr_controleg    false    259    245    3616            �           2606    175415 &   persona_responsable persona_natural_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_natural_fk FOREIGN KEY (per_codigo_natural) REFERENCES controleg_persona.persona(per_codigo);
 [   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_natural_fk;
       controleg_persona          usr_controleg    false    3596    259    235            �           2606    175280    proceso abogado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT abogado_fk FOREIGN KEY (pro_abogado_codigo) REFERENCES controleg_persona.persona(per_codigo);
 G   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT abogado_fk;
       controleg_proceso          usr_controleg    false    249    3596    235            �           2606    175320    proceso_cargo cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 K   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT cargo_fk;
       controleg_proceso          usr_controleg    false    3626    250    251            �           2606    175540    cargo_proceso cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.cargo_proceso
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 K   ALTER TABLE ONLY controleg_proceso.cargo_proceso DROP CONSTRAINT cargo_fk;
       controleg_proceso          usr_controleg    false    250    3626    268            �           2606    175555    sancion demandado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT demandado_fk FOREIGN KEY (dem_codigo) REFERENCES controleg_proceso.demandado(dem_codigo);
 I   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT demandado_fk;
       controleg_proceso          usr_controleg    false    269    254    3634            �           2606    175335 +   seguimiento_proceso estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 `   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT estado_clasificacion_fk;
       controleg_proceso          usr_controleg    false    3580    228    252            �           2606    175565 +   seguimiento_sancion estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 `   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT estado_clasificacion_fk;
       controleg_proceso          usr_controleg    false    3580    228    270            �           2606    175295    proceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (pro_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    3538    249    208            �           2606    175315    proceso_cargo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT estado_fk FOREIGN KEY (procar_estado) REFERENCES parametricas.estados(est_codigo);
 L   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    3538    208    251            �           2606    175340    seguimiento_proceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (segpro_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    3538    208    252            �           2606    175370    demandado estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT estado_fk FOREIGN KEY (dem_estado) REFERENCES parametricas.estados(est_codigo);
 H   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    208    3538    254            �           2606    175550    sancion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT estado_fk FOREIGN KEY (san_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    3538    208    269            �           2606    175285    proceso moneda_codigo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT moneda_codigo_fk FOREIGN KEY (mon_codigo) REFERENCES parametricas.moneda(mon_codigo);
 M   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT moneda_codigo_fk;
       controleg_proceso          usr_controleg    false    3560    249    218            �           2606    175365     demandado persona_responsable_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT persona_responsable_fk FOREIGN KEY (perres_codigo) REFERENCES controleg_persona.persona_responsable(perres_codigo);
 U   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT persona_responsable_fk;
       controleg_proceso          usr_controleg    false    259    3644    254            �           2606    175325    proceso_cargo proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 M   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    3624    251    249            �           2606    175330    seguimiento_proceso proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 S   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    252    249    3624            �           2606    175360    demandado proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 I   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    254    249    3624            �           2606    175535    cargo_proceso proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.cargo_proceso
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 M   ALTER TABLE ONLY controleg_proceso.cargo_proceso DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    249    3624    268            �           2606    175560    seguimiento_sancion sancion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT sancion_fk FOREIGN KEY (san_codigo) REFERENCES controleg_proceso.sancion(san_codigo);
 S   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT sancion_fk;
       controleg_proceso          usr_controleg    false    269    270    3670            �           2606    175290    proceso tipo_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT tipo_proceso_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 L   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT tipo_proceso_fk;
       controleg_proceso          usr_controleg    false    3542    209    249            �           2606    175545    sancion tipo_sancion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT tipo_sancion_fk FOREIGN KEY (tipsan_codigo) REFERENCES parametricas.tipo_sancion(tipsan_codigo);
 L   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT tipo_sancion_fk;
       controleg_proceso          usr_controleg    false    3554    269    215            x           2606    175045 :   solicitud_solvencia_fiscal documento_representante_tipo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT documento_representante_tipo_fk FOREIGN KEY (drt_codigo) REFERENCES parametricas.documento_representante_tipo(drt_codigo);
 q   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT documento_representante_tipo_fk;
       controleg_solvencia          usr_controleg    false    230    223    3570            v           2606    175035 .   solicitud_solvencia_fiscal motivo_solvencia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT motivo_solvencia_fk FOREIGN KEY (motsol_codigo) REFERENCES parametricas.motivo_solvencia(motsol_codigo);
 e   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT motivo_solvencia_fk;
       controleg_solvencia          usr_controleg    false    230    3566    221            z           2606    175055 /   solicitud_solvencia_fiscal persona_apoderado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT persona_apoderado_fk FOREIGN KEY (per_codigo_apoderado) REFERENCES controleg_persona.persona(per_codigo);
 f   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT persona_apoderado_fk;
       controleg_solvencia          usr_controleg    false    230    3596    235            y           2606    175050 %   solicitud_solvencia_fiscal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 \   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT persona_fk;
       controleg_solvencia          usr_controleg    false    235    230    3596            {           2606    175060 7   solicitud_archivo_digital solicitud_solvencia_fiscal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital
    ADD CONSTRAINT solicitud_solvencia_fiscal_fk FOREIGN KEY (ssf_codigo) REFERENCES controleg_solvencia.solicitud_solvencia_fiscal(ssf_codigo);
 n   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital DROP CONSTRAINT solicitud_solvencia_fiscal_fk;
       controleg_solvencia          usr_controleg    false    3584    230    231            |           2606    175065 )   solicitud_archivo_digital tipo_adjunto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital
    ADD CONSTRAINT tipo_adjunto_fk FOREIGN KEY (tipadj_codigo) REFERENCES parametricas.tipo_adjunto(tipadj_codigo);
 `   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital DROP CONSTRAINT tipo_adjunto_fk;
       controleg_solvencia          usr_controleg    false    3564    220    231            w           2606    175040 .   solicitud_solvencia_fiscal tipo_solicitante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT tipo_solicitante_fk FOREIGN KEY (tipsol_codigo) REFERENCES parametricas.tipo_solicitante(tipsol_codigo);
 e   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT tipo_solicitante_fk;
       controleg_solvencia          usr_controleg    false    222    3568    230            �           2606    175145    descarga acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES dictamen.acceso(acc_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT acceso_fk;
       dictamen          usr_controleg    false    3600    237    238            �           2606    175155    notificacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES dictamen.acceso(acc_codigo) MATCH FULL;
 B   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT acceso_fk;
       dictamen          usr_controleg    false    237    3600    239            �           2606    175105    informe dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    236    232    3588            �           2606    175130    acceso dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    237    3588    232            �           2606    175205    dictamen_archivo dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 H   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    3588    241    232            �           2606    175225    proceso_entidad dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    3588    232    243            �           2606    175185 '   persona_dictamen empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES controleg_persona.empresa_unipersonal(empuni_codigo);
 S   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT empresa_unipersonal_fk;
       dictamen          usr_controleg    false    3618    246    240            �           2606    175200    persona_dictamen entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT entidad_fk FOREIGN KEY (ent_codigo) REFERENCES controleg_persona.entidad(ent_codigo);
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT entidad_fk;
       dictamen          usr_controleg    false    247    3620    240            }           2606    175070    dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (dic_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    208    232            ~           2606    175075    catalogo_general estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT estado_fk FOREIGN KEY (catgen_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    208    233            �           2606    175085    informe_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (infarc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 E   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    234    208            �           2606    175110    informe estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT estado_fk FOREIGN KEY (inf_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 =   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    236    208            �           2606    175125    acceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (acc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 <   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    237    3538            �           2606    175140    descarga estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT estado_fk FOREIGN KEY (des_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    238    3538    208            �           2606    175160    notificacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (not_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 B   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    239    3538            �           2606    175170    persona_dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (perdic_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    208    240            �           2606    175210    dictamen_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (dicarc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    208    241            �           2606    175220 "   persona_dictamen_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (pda_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 N   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    242    3538            �           2606    175230    proceso_entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (proent_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 E   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    208    243            �           2606    175240 !   proceso_entidad_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (pea_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 M   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3538    244    208                       2606    175080    informe_archivo informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT informe_fk;
       dictamen          usr_controleg    false    234    236    3598            �           2606    175150    descarga informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT informe_fk;
       dictamen          usr_controleg    false    236    3598    238            �           2606    175175    persona_dictamen informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT informe_fk;
       dictamen          usr_controleg    false    240    236    3598            �           2606    175215 ,   persona_dictamen_archivo persona_dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT persona_dictamen_fk FOREIGN KEY (perdic_codigo) REFERENCES dictamen.persona_dictamen(perdic_codigo) MATCH FULL;
 X   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT persona_dictamen_fk;
       dictamen          usr_controleg    false    3606    240    242            �           2606    175135    descarga persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT persona_fk;
       dictamen          usr_controleg    false    238    3596    235            �           2606    175165    persona_dictamen persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_fk;
       dictamen          usr_controleg    false    235    3596    240            �           2606    175180 $   persona_dictamen persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_juridica_fk;
       dictamen          usr_controleg    false    245    3616    240            �           2606    175195 )   persona_dictamen persona_responsable_2_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_responsable_2_fk FOREIGN KEY (perres_codigo) REFERENCES controleg_persona.persona_responsable(perres_codigo);
 U   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_responsable_2_fk;
       dictamen          usr_controleg    false    240    259    3644            �           2606    175235 *   proceso_entidad_archivo proceso_entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT proceso_entidad_fk FOREIGN KEY (proent_codigo) REFERENCES dictamen.proceso_entidad(proent_codigo) MATCH FULL;
 V   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT proceso_entidad_fk;
       dictamen          usr_controleg    false    244    243    3612            �           2606    175120    informe subtipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT subtipo_informe_fk FOREIGN KEY (sti_dominio, sti_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT subtipo_informe_fk;
       dictamen          usr_controleg    false    3592    236    233    236    233            �           2606    175115    informe tipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT tipo_informe_fk FOREIGN KEY (tipinf_dominio, tipinf_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor) MATCH FULL;
 C   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT tipo_informe_fk;
       dictamen          usr_controleg    false    233    236    236    3592    233            �           2606    175190 $   persona_dictamen tipo_involucrado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT tipo_involucrado_fk FOREIGN KEY (tipinv_dominio, tipinv_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT tipo_involucrado_fk;
       dictamen          usr_controleg    false    3592    233    240    240    233            o           2606    175000 &   estado_clasificacion estado_control_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_control_fk FOREIGN KEY (estcon_codigo) REFERENCES parametricas.estado_control(estcont_codigo);
 V   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_control_fk;
       parametricas          usr_controleg    false    214    228    3552            p           2606    175005 $   estado_clasificacion estado_etapa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_etapa_fk FOREIGN KEY (esteta_codigo) REFERENCES parametricas.estado_etapa(esteta_codigo);
 T   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_etapa_fk;
       parametricas          usr_controleg    false    3578    228    227            \           2606    174905    sub_tipo_informe estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.sub_tipo_informe
    ADD CONSTRAINT estado_fk FOREIGN KEY (sti_estado) REFERENCES parametricas.estados(est_codigo);
 J   ALTER TABLE ONLY parametricas.sub_tipo_informe DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3538    208    211            `           2606    174925    estado_control estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_control
    ADD CONSTRAINT estado_fk FOREIGN KEY (estcon_estado) REFERENCES parametricas.estados(est_codigo);
 H   ALTER TABLE ONLY parametricas.estado_control DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    214    208    3538            a           2606    174930    tipo_sancion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_sancion
    ADD CONSTRAINT estado_fk FOREIGN KEY (tipsan_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY parametricas.tipo_sancion DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3538    215    208            m           2606    174990 (   tipo_proceso_datos_adicionales estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT estado_fk FOREIGN KEY (tpda_estado) REFERENCES parametricas.estados(est_codigo);
 X   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3538    225    208            �           0    0 6   CONSTRAINT estado_fk ON tipo_proceso_datos_adicionales    COMMENT     i   COMMENT ON CONSTRAINT estado_fk ON parametricas.tipo_proceso_datos_adicionales IS 'Estado del Registro';
          parametricas          usr_controleg    false    3693            n           2606    174995    tipo_rol estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_rol
    ADD CONSTRAINT estado_fk FOREIGN KEY (tipusu_estado) REFERENCES parametricas.estados(est_codigo);
 B   ALTER TABLE ONLY parametricas.tipo_rol DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3538    208    226            r           2606    175015    estado_clasificacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (estcla_estado) REFERENCES parametricas.estados(est_codigo);
 N   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    228    208    3538            u           2606    175030    operacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.operacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (ope_estado) REFERENCES parametricas.estados(est_codigo);
 C   ALTER TABLE ONLY parametricas.operacion DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    229    3538    208            Y           2606    174890 !   tipo_documento estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_documento
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipdoc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 Q   ALTER TABLE ONLY parametricas.tipo_documento DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    207    3538    208            Z           2606    174895    tipo_proceso estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tippro_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.tipo_proceso DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    209    3538    208            [           2606    174900 '   tipo_responsabilidad estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_responsabilidad
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipres_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 W   ALTER TABLE ONLY parametricas.tipo_responsabilidad DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    210    3538            ^           2606    174915 "   infraccion_tipo estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.infraccion_tipo
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (inftip_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 R   ALTER TABLE ONLY parametricas.infraccion_tipo DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    3538    212            _           2606    174920 #   tipo_involucrado estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_involucrado
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipinv_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 S   ALTER TABLE ONLY parametricas.tipo_involucrado DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    3538    213            c           2606    174940    juzgado estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.juzgado
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (juz_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 J   ALTER TABLE ONLY parametricas.juzgado DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    216    3538    208            d           2606    174945    lugar estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.lugar
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (lug_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 H   ALTER TABLE ONLY parametricas.lugar DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    217    3538    208            e           2606    174950    moneda estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.moneda
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (mon_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 I   ALTER TABLE ONLY parametricas.moneda DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    218    208    3538            f           2606    174955 *   tipo_documento_remision estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_documento_remision
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tdr_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 Z   ALTER TABLE ONLY parametricas.tipo_documento_remision DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    219    3538    208            g           2606    174960    tipo_adjunto estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_adjunto
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipadj_estado) REFERENCES parametricas.estados(est_codigo);
 O   ALTER TABLE ONLY parametricas.tipo_adjunto DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    220    3538    208            h           2606    174965 #   motivo_solvencia estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.motivo_solvencia
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (motsol_estado) REFERENCES parametricas.estados(est_codigo);
 S   ALTER TABLE ONLY parametricas.motivo_solvencia DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    3538    221            i           2606    174970 #   tipo_solicitante estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_solicitante
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipsol_estado) REFERENCES parametricas.estados(est_codigo);
 S   ALTER TABLE ONLY parametricas.tipo_solicitante DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    3538    222            j           2606    174975 /   documento_representante_tipo estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.documento_representante_tipo
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (drt_estado) REFERENCES parametricas.estados(est_codigo);
 _   ALTER TABLE ONLY parametricas.documento_representante_tipo DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    223    3538            k           2606    174980    genero estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.genero
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (gen_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 I   ALTER TABLE ONLY parametricas.genero DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    224    3538    208            l           2606    174985 @   tipo_proceso_datos_adicionales tipo_proceso_datos_adicionales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT tipo_proceso_datos_adicionales_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 p   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT tipo_proceso_datos_adicionales_fk;
       parametricas          usr_controleg    false    225    209    3542            b           2606    174935    juzgado tipo_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.juzgado
    ADD CONSTRAINT tipo_proceso_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo) MATCH FULL;
 G   ALTER TABLE ONLY parametricas.juzgado DROP CONSTRAINT tipo_proceso_fk;
       parametricas          usr_controleg    false    209    3542    216            s           2606    175020 $   estado_clasificacion tipo_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT tipo_proceso_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 T   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT tipo_proceso_fk;
       parametricas          usr_controleg    false    228    209    3542            ]           2606    174910 '   infraccion_tipo tipo_responsabilidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.infraccion_tipo
    ADD CONSTRAINT tipo_responsabilidad_fk FOREIGN KEY (tipres_codigo) REFERENCES parametricas.tipo_responsabilidad(tipres_codigo) MATCH FULL;
 W   ALTER TABLE ONLY parametricas.infraccion_tipo DROP CONSTRAINT tipo_responsabilidad_fk;
       parametricas          usr_controleg    false    212    210    3544            t           2606    175025 ,   estado_clasificacion tipo_responsabilidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT tipo_responsabilidad_fk FOREIGN KEY (tipres_codigo) REFERENCES parametricas.tipo_responsabilidad(tipres_codigo);
 \   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT tipo_responsabilidad_fk;
       parametricas          usr_controleg    false    3544    228    210            q           2606    175010 $   estado_clasificacion tipo_sancion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT tipo_sancion_fk FOREIGN KEY (tipsan_codigo) REFERENCES parametricas.tipo_sancion(tipsan_codigo);
 T   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT tipo_sancion_fk;
       parametricas          usr_controleg    false    3554    228    215            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   f   x�3�,-.M,����I��wɮ�uI6��6��ʌr	5�4202�50�52�4A#cNN������������������	�������!)X�61�=... �z      �   J   x�]���0�a�.��Q	Cd��?G��Z��sF�� ��3�������q��(�����Pd5�����
P����P�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �         f   x�3�tq�t����qv���4�4��4�50"Nc3##N���̲�ļ|�
 A`��Ș����D��H��@��������L�������<I�=... t�#>      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      {      x������ � �      z      x������ � �      �      x������ � �      }      x������ � �      �      x������ � �      |      x������ � �      �      x������ � �      �      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      s   �   x�]�1�0k���Xw�	$BG�+\Ď��	��f��R��a�aX%��Li|�K�,K�u�C,%,	©W�������GE��k�P�l+����y��j��9�'��Ƶ���7����w��~ >)-      x   �   x���ۉ�0�o��i BOKJ[��_�*��ca��8��e����I�!���q!_L/������B����+��&�ƃ�2j��m)M�4l#!Ejۺ�M7
��"�m۝�mB�E&�N��aj�m/Mk�m6`6�նc�-G[�r`���}7l���M�\��ιV�p�̥qSO�~��_��[��?�$������?�I�ɷ�R��}��ɪ��z��7�9�Y�x      j   �   x����j�0���S�Rd�i�܄�Aj'�����N��zt�����_�5!B�Y���E�1�����kt�C@�٦�~�zߴ�X�X������*gR�ei�λ�钉���"�~�6�xE�	�p�!���z��Q�mI�C��Ԙ�ä�P�CQ�����S9��:e�@���9�g���*��T9�ω_E���E"͚�`�Dߍ��~�T|�UU� �z��      w   u   x�3�4����L���,�������D��H��@��������R�����Ԑ����@��������gHQbnfI*5�5�4�t��K�ɬJL��L���&�&H&+8��R��=... ��E�      d   /  x��һj�0�Y~���(���Bņ$d�"�'�J*����#��*wMI7K���?�DTivǚn���^Z	���8PZ�����5�&�bΪ�k򀒱��"%+�"
�o�x�5�<f!	9�+��n~νY�"��� z�Y�1"8�~�5`�i=�%6�%"Y]��g���m/8�y�n:u���ht0C.W��$qJ�ǅ41)*8;Q�,����߆z����
ԓ2 aB{%BwˋcN�r!^B����U��5L��N~�ˉ7](��'�?�;�ݍ}�������|�ž�� �֐̀      t   �   x����j�0���S�b$[�#��ha�t���.YF.MH�>��t��lc�I:����/P�U��<l��Za�\�
X���>�=�y�,�QUw����o������ؽ6�f�vf�S������i�Ҝ�~P��p�b�d�A�ⓥ�F�}j>Qj���%!��J�p�J�HB�Lx�G	A�m����Ƕ9����~��\�y���6�e�x��hK��|:����~�qy      h      x������ � �      l      x������ � �      m   m   x�3�-HI,IUHIU(N-*�L��W�)MO,�3�J8�8�B�%����&f������D��H��H�������L-LM̐���MAR����z��\1z\\\ X 
      n   �   x�����@�뻧��{?�^�!A1�l�w�5`���^�0FKg�l1�� ���97աcu�0]�e2P��P;$i��M9d�	�6~y\�]�V'��l�l��qb	�G��Y��)�Q��� ⴲ���ɋ�{�*�CLH����#"g�Ӆ,�������_$��	�>.      q   s   x�e���0 g�+�D����C;v)��RK����E�Tu�����k����.Z�Um��le[�:��N�� ��� !�I'�3Q�u��~R�$��u��)�蜹[c���!8      y   �   x�����0�g�)������n��b��"�%e��	l�̵n���g�)X�z7��V�J
x��h�pD��	��{Ly9����,W� �&ݔ�KMH�Su�L�S�
�!*Ie!Q�ֿ[�a����"q�p���߳���݃�`h��~�_���l]x�pq�����=�ǟ>�tr!;����a�cU�:��L      g   o   x�3���wqU.MR(�,�W��K�/�M�*��*��e&g�c(P���4�4413��FF&�F�FF
��V��V��zf��F(2V��V�FzF�X���L�b���� ��$}      p   u   x�]�1�@ ��+�n�\<4��Phi�@�Q���C�����t������\�Q���y)���>cw�� ��� B�I%��-��Fe��SjS��Qh�瓘b�}�����!@      c      x������ � �      o      x������ � �      i   p   x�3�pqqUHIU(N-*�L��W(�,�W��+��)M.JL��B8B9A���Bp���)ZX�Z��HYY��Ya70�34������� C�      e   ;  x��TAn� <�W���Nb�6�X[9��)R����MZ��T�8 �fؙ�5��G�gO��B��Ѧ.�)��vXu��T�j]j������]Q��y��j5�`]
`������oeٙ�z#Ar���R�,X�^E����v~^�&�*9(��첖�z+�||jt�d5i�^��<S�E�Ea����H[�dQx�s��g��%�(AV��_�|1�%ի��K�W+��H6����n����%9�{����%��G����^���1�?M�C�ɦ4��V:�N[��@� >�#�ú3�k�X�튢xATQm      u      x������ � �      f   w   x���;
�0@g�����4���:vA�8��o�1�7��1��k�6:����}V�qL-V���= �A�x�}$��yɜҲ2p"�ćH���5�MN�[��h���i���+8�~X8p      v   w   x�3���q���H,JT(��I-VH��S(�,�WHIUHLNN-�WH�(I-���4�##]#]#K+Cc+CK=SKKcSCNCK]C R00�#lb\F���؛�G]{c����  D:J      k   U   x�3�tq�	u�����4�##]#]#K+Cc+CK=SKKcSCNCK]C R00�#lb\F���>!��30F��� ��      r   u   x�3�,-HI,IUHIU(N-*�L��W(�,�W(��rJ󀒙~!���y
�I 5����&f������D��H��H��������P�����E�������@��C��B��̘+F��� �+#X     