PGDMP                         |            bd_cge_controleg_210223    13.14 (Debian 13.14-0+deb11u1)    13.14 (Debian 13.14-0+deb11u1) �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16386    bd_cge_controleg_210223    DATABASE     l   CREATE DATABASE bd_cge_controleg_210223 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_BO.UTF-8';
 '   DROP DATABASE bd_cge_controleg_210223;
                usr_controleg    false                       0    0     DATABASE bd_cge_controleg_210223    ACL     �   REVOKE CONNECT,TEMPORARY ON DATABASE bd_cge_controleg_210223 FROM PUBLIC;
GRANT CONNECT ON DATABASE bd_cge_controleg_210223 TO usr_controleg_app;
                   usr_controleg    false    4110                        2615    16393    autenticacion    SCHEMA        CREATE SCHEMA autenticacion;
    DROP SCHEMA autenticacion;
                usr_controleg    false                       0    0    SCHEMA autenticacion    COMMENT     a   COMMENT ON SCHEMA autenticacion IS 'Esquema para el control y administracion de autenticacion.';
                   usr_controleg    false    7                       0    0    SCHEMA autenticacion    ACL     :   GRANT USAGE ON SCHEMA autenticacion TO usr_controleg_app;
                   usr_controleg    false    7                        2615    16390    controleg_dictamen    SCHEMA     "   CREATE SCHEMA controleg_dictamen;
     DROP SCHEMA controleg_dictamen;
                usr_controleg    false                       0    0    SCHEMA controleg_dictamen    COMMENT     h   COMMENT ON SCHEMA controleg_dictamen IS 'Esquema para la administracion de dictamenes en el controleg';
                   usr_controleg    false    12                       0    0    SCHEMA controleg_dictamen    ACL     ?   GRANT USAGE ON SCHEMA controleg_dictamen TO usr_controleg_app;
                   usr_controleg    false    12                        2615    16392    controleg_persona    SCHEMA     !   CREATE SCHEMA controleg_persona;
    DROP SCHEMA controleg_persona;
                usr_controleg    false                       0    0    SCHEMA controleg_persona    COMMENT     �   COMMENT ON SCHEMA controleg_persona IS 'Esquema para la administracion de responsabilidad sobre persona (natural, juridica, empresa unipersonal) (demandado, involucrado) entre otras relaciones de persona.';
                   usr_controleg    false    6                       0    0    SCHEMA controleg_persona    ACL     >   GRANT USAGE ON SCHEMA controleg_persona TO usr_controleg_app;
                   usr_controleg    false    6                        2615    16388    controleg_proceso    SCHEMA     !   CREATE SCHEMA controleg_proceso;
    DROP SCHEMA controleg_proceso;
                usr_controleg    false                       0    0    SCHEMA controleg_proceso    COMMENT     s   COMMENT ON SCHEMA controleg_proceso IS 'Esquema que administrara los procesos que estan registrados en controleg';
                   usr_controleg    false    8                       0    0    SCHEMA controleg_proceso    ACL     >   GRANT USAGE ON SCHEMA controleg_proceso TO usr_controleg_app;
                   usr_controleg    false    8                        2615    16391    controleg_solvencia    SCHEMA     #   CREATE SCHEMA controleg_solvencia;
 !   DROP SCHEMA controleg_solvencia;
                usr_controleg    false                       0    0    SCHEMA controleg_solvencia    ACL     @   GRANT USAGE ON SCHEMA controleg_solvencia TO usr_controleg_app;
                   usr_controleg    false    11                        2615    16394    controleg_ubicacion    SCHEMA     #   CREATE SCHEMA controleg_ubicacion;
 !   DROP SCHEMA controleg_ubicacion;
                usr_controleg    false                       0    0    SCHEMA controleg_ubicacion    COMMENT     �   COMMENT ON SCHEMA controleg_ubicacion IS 'Esquema para administrar las ubicaciones que tendran los actores dentro del sistema.';
                   usr_controleg    false    5                       0    0    SCHEMA controleg_ubicacion    ACL     @   GRANT USAGE ON SCHEMA controleg_ubicacion TO usr_controleg_app;
                   usr_controleg    false    5                        2615    16389    dictamen    SCHEMA        CREATE SCHEMA dictamen;
    DROP SCHEMA dictamen;
                usr_controleg    false                       0    0    SCHEMA dictamen    ACL     5   GRANT USAGE ON SCHEMA dictamen TO usr_controleg_app;
                   usr_controleg    false    4            	            2615    16387    parametricas    SCHEMA        CREATE SCHEMA parametricas;
    DROP SCHEMA parametricas;
                usr_controleg    false                       0    0    SCHEMA parametricas    ACL     9   GRANT USAGE ON SCHEMA parametricas TO usr_controleg_app;
                   usr_controleg    false    9                       1259    17199    menu    TABLE     S  CREATE TABLE autenticacion.menu (
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
       autenticacion         heap    usr_controleg    false    7                       0    0 
   TABLE menu    COMMENT     X   COMMENT ON TABLE autenticacion.menu IS 'Tabla para el registro los menus del sistema.';
          autenticacion          usr_controleg    false    262                       0    0    COLUMN menu.men_codigo    COMMENT     M   COMMENT ON COLUMN autenticacion.menu.men_codigo IS 'Identificador del menu';
          autenticacion          usr_controleg    false    262                       0    0    COLUMN menu.men_orden    COMMENT     Y   COMMENT ON COLUMN autenticacion.menu.men_orden IS 'Orden en el que se mostrara el menu';
          autenticacion          usr_controleg    false    262                        0    0    COLUMN menu.men_nombre    COMMENT     F   COMMENT ON COLUMN autenticacion.menu.men_nombre IS 'Nombre del menu';
          autenticacion          usr_controleg    false    262            !           0    0    COLUMN menu.men_icono    COMMENT     V   COMMENT ON COLUMN autenticacion.menu.men_icono IS 'Icono que se mostrara en el menu';
          autenticacion          usr_controleg    false    262            "           0    0    COLUMN menu.men_ruta    COMMENT     p   COMMENT ON COLUMN autenticacion.menu.men_ruta IS 'Ruta a la que la aplicacion a la que el menu redireccionara';
          autenticacion          usr_controleg    false    262            #           0    0    COLUMN menu.men_codigo_padre    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.men_codigo_padre IS 'Referencia al menu padre que agrupara a un conjunto de menus hijos.';
          autenticacion          usr_controleg    false    262            $           0    0    COLUMN menu.men_estado    COMMENT     J   COMMENT ON COLUMN autenticacion.menu.men_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    262            %           0    0    COLUMN menu.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    262            &           0    0     COLUMN menu.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    262            '           0    0    COLUMN menu.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.menu.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    262            (           0    0    COLUMN menu.fecha_registro    COMMENT     I   COMMENT ON COLUMN autenticacion.menu.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    262            )           0    0    COLUMN menu.fecha_modificacion    COMMENT     Q   COMMENT ON COLUMN autenticacion.menu.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    262            *           0    0    COLUMN menu.fecha_baja    COMMENT     A   COMMENT ON COLUMN autenticacion.menu.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    262                       1259    17185    recurso    TABLE       CREATE TABLE autenticacion.recurso (
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
       autenticacion         heap    usr_controleg    false    7            +           0    0    TABLE recurso    COMMENT     ^   COMMENT ON TABLE autenticacion.recurso IS 'Tabla para el registro los recursos del sistema.';
          autenticacion          usr_controleg    false    261            ,           0    0    COLUMN recurso.rec_codigo    COMMENT     S   COMMENT ON COLUMN autenticacion.recurso.rec_codigo IS 'Identificador del recurso';
          autenticacion          usr_controleg    false    261            -           0    0    COLUMN recurso.rec_nombre    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.rec_nombre IS 'El nombre del feature con el que se creo, tanto para el backend o frontend';
          autenticacion          usr_controleg    false    261            .           0    0    COLUMN recurso.rec_descripcion    COMMENT     a   COMMENT ON COLUMN autenticacion.recurso.rec_descripcion IS 'Descripcion o aclaraciones del rol';
          autenticacion          usr_controleg    false    261            /           0    0    COLUMN recurso.men_codigo    COMMENT     i   COMMENT ON COLUMN autenticacion.recurso.men_codigo IS 'Referencia al menu que agrupara a los recursos.';
          autenticacion          usr_controleg    false    261            0           0    0    COLUMN recurso.rec_estado    COMMENT     M   COMMENT ON COLUMN autenticacion.recurso.rec_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    261            1           0    0    COLUMN recurso.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    261            2           0    0 #   COLUMN recurso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    261            3           0    0    COLUMN recurso.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.recurso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    261            4           0    0    COLUMN recurso.fecha_registro    COMMENT     L   COMMENT ON COLUMN autenticacion.recurso.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    261            5           0    0 !   COLUMN recurso.fecha_modificacion    COMMENT     T   COMMENT ON COLUMN autenticacion.recurso.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    261            6           0    0    COLUMN recurso.fecha_baja    COMMENT     D   COMMENT ON COLUMN autenticacion.recurso.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    261                       1259    17171    rol    TABLE       CREATE TABLE autenticacion.rol (
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
       autenticacion         heap    usr_controleg    false    7            7           0    0 	   TABLE rol    COMMENT     J   COMMENT ON TABLE autenticacion.rol IS 'Tabla para el registro de roles.';
          autenticacion          usr_controleg    false    260            8           0    0    COLUMN rol.rol_codigo    COMMENT     K   COMMENT ON COLUMN autenticacion.rol.rol_codigo IS 'Identificador del rol';
          autenticacion          usr_controleg    false    260            9           0    0    COLUMN rol.rol_nombre    COMMENT     ^   COMMENT ON COLUMN autenticacion.rol.rol_nombre IS 'Nombre del rol, unico dentro del sistema';
          autenticacion          usr_controleg    false    260            :           0    0    COLUMN rol.rol_descripcion    COMMENT     ]   COMMENT ON COLUMN autenticacion.rol.rol_descripcion IS 'Descripcion o aclaraciones del rol';
          autenticacion          usr_controleg    false    260            ;           0    0    COLUMN rol.tiprol_codigo    COMMENT     e   COMMENT ON COLUMN autenticacion.rol.tiprol_codigo IS 'Referencia al tipo de rol (INTERNO, EXTERNO)';
          autenticacion          usr_controleg    false    260            <           0    0    COLUMN rol.rol_estado    COMMENT     I   COMMENT ON COLUMN autenticacion.rol.rol_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    260            =           0    0    COLUMN rol.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.rol.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    260            >           0    0    COLUMN rol.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.rol.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    260            ?           0    0    COLUMN rol.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.rol.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    260            @           0    0    COLUMN rol.fecha_registro    COMMENT     H   COMMENT ON COLUMN autenticacion.rol.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    260            A           0    0    COLUMN rol.fecha_modificacion    COMMENT     P   COMMENT ON COLUMN autenticacion.rol.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    260            B           0    0    COLUMN rol.fecha_baja    COMMENT     @   COMMENT ON COLUMN autenticacion.rol.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    260                       1259    17214    rol_recurso_operacion    TABLE       CREATE TABLE autenticacion.rol_recurso_operacion (
    rro_codigo integer NOT NULL,
    rol_codigo integer NOT NULL,
    rec_codigo integer NOT NULL,
    ope_codigo integer NOT NULL,
    rro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 0   DROP TABLE autenticacion.rol_recurso_operacion;
       autenticacion         heap    usr_controleg    false    7            C           0    0    TABLE rol_recurso_operacion    COMMENT     �   COMMENT ON TABLE autenticacion.rol_recurso_operacion IS 'Tabla para el registro de los recursos y accesos que tendran los roles por defecto.';
          autenticacion          usr_controleg    false    263            D           0    0 '   COLUMN rol_recurso_operacion.rro_codigo    COMMENT     a   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rro_codigo IS 'Identificador de la tabla';
          autenticacion          usr_controleg    false    263            E           0    0 '   COLUMN rol_recurso_operacion.rol_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rol_codigo IS 'Referencia al rol, para asignarle recursos y accesos por defecto.';
          autenticacion          usr_controleg    false    263            F           0    0 '   COLUMN rol_recurso_operacion.rec_codigo    COMMENT     u   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rec_codigo IS 'Referencia al recurso que se asignara al rol.';
          autenticacion          usr_controleg    false    263            G           0    0 '   COLUMN rol_recurso_operacion.ope_codigo    COMMENT        COMMENT ON COLUMN autenticacion.rol_recurso_operacion.ope_codigo IS 'Accesos por defecto que se asignara al recurso del rol.';
          autenticacion          usr_controleg    false    263            H           0    0 '   COLUMN rol_recurso_operacion.rro_estado    COMMENT     [   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.rro_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    263            I           0    0 -   COLUMN rol_recurso_operacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    263            J           0    0 1   COLUMN rol_recurso_operacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    263            K           0    0 )   COLUMN rol_recurso_operacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    263            L           0    0 +   COLUMN rol_recurso_operacion.fecha_registro    COMMENT     Z   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    263            M           0    0 /   COLUMN rol_recurso_operacion.fecha_modificacion    COMMENT     b   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    263            N           0    0 '   COLUMN rol_recurso_operacion.fecha_baja    COMMENT     R   COMMENT ON COLUMN autenticacion.rol_recurso_operacion.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    263                       1259    17137    usuario    TABLE     ,  CREATE TABLE autenticacion.usuario (
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
       autenticacion         heap    usr_controleg    false    7            O           0    0    TABLE usuario    COMMENT     Q   COMMENT ON TABLE autenticacion.usuario IS 'Tabla para el registro de usuarios.';
          autenticacion          usr_controleg    false    258            P           0    0    COLUMN usuario.usu_codigo    COMMENT     S   COMMENT ON COLUMN autenticacion.usuario.usu_codigo IS 'Identificador del usuario';
          autenticacion          usr_controleg    false    258            Q           0    0    COLUMN usuario.usu_usuario    COMMENT     f   COMMENT ON COLUMN autenticacion.usuario.usu_usuario IS 'Nombre de usuario, unico dentro del sistema';
          autenticacion          usr_controleg    false    258            R           0    0    COLUMN usuario.usu_contrasenia    COMMENT     l   COMMENT ON COLUMN autenticacion.usuario.usu_contrasenia IS 'Contraseña de seguridad cifrada del usuario.';
          autenticacion          usr_controleg    false    258            S           0    0 #   COLUMN usuario.usu_fecha_expiracion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usu_fecha_expiracion IS 'Fecha limite, hasta que se le permitira el acceso al sistema.';
          autenticacion          usr_controleg    false    258            T           0    0    COLUMN usuario.per_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.per_codigo IS 'Referencia  a la relacion de persona. identifica la relacion del persona con el usuario.';
          autenticacion          usr_controleg    false    258            U           0    0    COLUMN usuario.usu_estado    COMMENT     M   COMMENT ON COLUMN autenticacion.usuario.usu_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    258            V           0    0    COLUMN usuario.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    258            W           0    0 #   COLUMN usuario.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    258            X           0    0    COLUMN usuario.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    258            Y           0    0    COLUMN usuario.fecha_registro    COMMENT     L   COMMENT ON COLUMN autenticacion.usuario.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    258            Z           0    0 !   COLUMN usuario.fecha_modificacion    COMMENT     T   COMMENT ON COLUMN autenticacion.usuario.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    258            [           0    0    COLUMN usuario.fecha_baja    COMMENT     D   COMMENT ON COLUMN autenticacion.usuario.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    258                       1259    17155    usuario_entidad    TABLE     N  CREATE TABLE autenticacion.usuario_entidad (
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
       autenticacion         heap    usr_controleg    false    7            \           0    0    TABLE usuario_entidad    COMMENT     �   COMMENT ON TABLE autenticacion.usuario_entidad IS 'Relacion de una persona con una entidad, para referir a usuarios externos a la CGE';
          autenticacion          usr_controleg    false    259            ]           0    0 $   COLUMN usuario_entidad.usuent_codigo    COMMENT     [   COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_codigo IS 'Identificador de tabla';
          autenticacion          usr_controleg    false    259            ^           0    0 ,   COLUMN usuario_entidad.usuent_primer_ingreso    COMMENT        COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_primer_ingreso IS 'Fecha en la que el usuario ingreso por primera vez';
          autenticacion          usr_controleg    false    259            _           0    0 ,   COLUMN usuario_entidad.usuent_ultimo_ingreso    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_ultimo_ingreso IS 'Fecha de ultimo ingreso del usuario relacionado a la entidad.';
          autenticacion          usr_controleg    false    259            `           0    0 !   COLUMN usuario_entidad.ent_codigo    COMMENT     X   COMMENT ON COLUMN autenticacion.usuario_entidad.ent_codigo IS 'Referencia  al entidad';
          autenticacion          usr_controleg    false    259            a           0    0 !   COLUMN usuario_entidad.usu_codigo    COMMENT     Y   COMMENT ON COLUMN autenticacion.usuario_entidad.usu_codigo IS 'Referencia  al usuario.';
          autenticacion          usr_controleg    false    259            b           0    0 $   COLUMN usuario_entidad.usuent_estado    COMMENT     Y   COMMENT ON COLUMN autenticacion.usuario_entidad.usuent_estado IS 'Estado del registro.';
          autenticacion          usr_controleg    false    259            c           0    0 '   COLUMN usuario_entidad.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    259            d           0    0 +   COLUMN usuario_entidad.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    259            e           0    0 #   COLUMN usuario_entidad.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_entidad.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    259            f           0    0 %   COLUMN usuario_entidad.fecha_registro    COMMENT     T   COMMENT ON COLUMN autenticacion.usuario_entidad.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    259            g           0    0 )   COLUMN usuario_entidad.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN autenticacion.usuario_entidad.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    259            h           0    0 !   COLUMN usuario_entidad.fecha_baja    COMMENT     L   COMMENT ON COLUMN autenticacion.usuario_entidad.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    259                       1259    17228    usuario_operacion    TABLE       CREATE TABLE autenticacion.usuario_operacion (
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
       autenticacion         heap    usr_controleg    false    7            i           0    0    TABLE usuario_operacion    COMMENT     �   COMMENT ON TABLE autenticacion.usuario_operacion IS 'Tabla para el registro de operacion que tendra el usuario, por defecto se copial los accesos del rol.';
          autenticacion          usr_controleg    false    264            j           0    0 &   COLUMN usuario_operacion.usuope_codigo    COMMENT     `   COMMENT ON COLUMN autenticacion.usuario_operacion.usuope_codigo IS 'Identificador de la tabla';
          autenticacion          usr_controleg    false    264            k           0    0 &   COLUMN usuario_operacion.usurol_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usurol_codigo IS 'Referencia a la relacion de usuario rol, para este usuario de heredaran los permisos predeterminados en el rol.';
          autenticacion          usr_controleg    false    264            l           0    0 #   COLUMN usuario_operacion.rec_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.rec_codigo IS 'Referencia a los recursos del sistema. Durante la asignacion se copian los recursos del rol, posteriormente se iran agregando nuevos recursos';
          autenticacion          usr_controleg    false    264            m           0    0 #   COLUMN usuario_operacion.ope_codigo    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.ope_codigo IS 'Referencia a las operaciones que se le dara al recurso. Durante la asignacion se copian los accesos del recurso asociados al rol, posteriormente se iran agregando nuevos permisos';
          autenticacion          usr_controleg    false    264            n           0    0 &   COLUMN usuario_operacion.usuope_estado    COMMENT     Z   COMMENT ON COLUMN autenticacion.usuario_operacion.usuope_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    264            o           0    0 )   COLUMN usuario_operacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    264            p           0    0 -   COLUMN usuario_operacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    264            q           0    0 %   COLUMN usuario_operacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_operacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    264            r           0    0 '   COLUMN usuario_operacion.fecha_registro    COMMENT     V   COMMENT ON COLUMN autenticacion.usuario_operacion.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    264            s           0    0 +   COLUMN usuario_operacion.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN autenticacion.usuario_operacion.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    264            t           0    0 #   COLUMN usuario_operacion.fecha_baja    COMMENT     N   COMMENT ON COLUMN autenticacion.usuario_operacion.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    264            	           1259    17242    usuario_rol    TABLE     �  CREATE TABLE autenticacion.usuario_rol (
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
       autenticacion         heap    usr_controleg    false    7            u           0    0    TABLE usuario_rol    COMMENT     ^   COMMENT ON TABLE autenticacion.usuario_rol IS 'Tabla para el registro de roles de usuarios.';
          autenticacion          usr_controleg    false    265            v           0    0     COLUMN usuario_rol.usurol_codigo    COMMENT     Z   COMMENT ON COLUMN autenticacion.usuario_rol.usurol_codigo IS 'Identificador de la tabla';
          autenticacion          usr_controleg    false    265            w           0    0    COLUMN usuario_rol.usu_codigo    COMMENT     S   COMMENT ON COLUMN autenticacion.usuario_rol.usu_codigo IS 'Referencia al usuario';
          autenticacion          usr_controleg    false    265            x           0    0    COLUMN usuario_rol.rol_codigo    COMMENT     O   COMMENT ON COLUMN autenticacion.usuario_rol.rol_codigo IS 'Referencia al rol';
          autenticacion          usr_controleg    false    265            y           0    0     COLUMN usuario_rol.usurol_estado    COMMENT     T   COMMENT ON COLUMN autenticacion.usuario_rol.usurol_estado IS 'Estado del registro';
          autenticacion          usr_controleg    false    265            z           0    0 #   COLUMN usuario_rol.usuario_registro    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_rol.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          autenticacion          usr_controleg    false    265            {           0    0 '   COLUMN usuario_rol.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_rol.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          autenticacion          usr_controleg    false    265            |           0    0    COLUMN usuario_rol.usuario_baja    COMMENT     �   COMMENT ON COLUMN autenticacion.usuario_rol.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          autenticacion          usr_controleg    false    265            }           0    0 !   COLUMN usuario_rol.fecha_registro    COMMENT     P   COMMENT ON COLUMN autenticacion.usuario_rol.fecha_registro IS 'Fecha registro';
          autenticacion          usr_controleg    false    265            ~           0    0 %   COLUMN usuario_rol.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN autenticacion.usuario_rol.fecha_modificacion IS 'Fecha modificacion';
          autenticacion          usr_controleg    false    265                       0    0    COLUMN usuario_rol.fecha_baja    COMMENT     H   COMMENT ON COLUMN autenticacion.usuario_rol.fecha_baja IS 'Fecha baja';
          autenticacion          usr_controleg    false    265            �            1259    16997    cargo    TABLE       CREATE TABLE controleg_dictamen.cargo (
    car_codigo integer NOT NULL,
    car_numero integer NOT NULL,
    car_monto numeric NOT NULL,
    dicent_codigo integer NOT NULL,
    mon_codigo integer NOT NULL,
    car_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 %   DROP TABLE controleg_dictamen.cargo;
       controleg_dictamen         heap    usr_controleg    false    12            �           0    0    TABLE cargo    COMMENT     R   COMMENT ON TABLE controleg_dictamen.cargo IS 'Tabla para el registro de cargos.';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.car_codigo    COMMENT     W   COMMENT ON COLUMN controleg_dictamen.cargo.car_codigo IS 'llave primaria de la tabla';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.car_numero    COMMENT     q   COMMENT ON COLUMN controleg_dictamen.cargo.car_numero IS 'Numero de cargo correlativo en relacion al dictamen.';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.car_monto    COMMENT     c   COMMENT ON COLUMN controleg_dictamen.cargo.car_monto IS 'monto del cargo que se esta registrando';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.dicent_codigo    COMMENT     d   COMMENT ON COLUMN controleg_dictamen.cargo.dicent_codigo IS 'llave foranea a la tabla de dictamen';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.mon_codigo    COMMENT     ~   COMMENT ON COLUMN controleg_dictamen.cargo.mon_codigo IS 'llave foranea a la tabla de moneda donde indica el tipo de moneda';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.car_estado    COMMENT     P   COMMENT ON COLUMN controleg_dictamen.cargo.car_estado IS 'Estado del registro';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.cargo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    248            �           0    0 !   COLUMN cargo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.cargo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.cargo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.fecha_registro    COMMENT     O   COMMENT ON COLUMN controleg_dictamen.cargo.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.fecha_modificacion    COMMENT     W   COMMENT ON COLUMN controleg_dictamen.cargo.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    248            �           0    0    COLUMN cargo.fecha_baja    COMMENT     G   COMMENT ON COLUMN controleg_dictamen.cargo.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    248            �           0    0    TABLE cargo    ACL     S   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.cargo TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    248            �            1259    17095    dictamen_cge    TABLE     I  CREATE TABLE controleg_dictamen.dictamen_cge (
    diccge_codigo integer NOT NULL,
    diccge_fecha date NOT NULL,
    diccge_descripcion character varying,
    diccge_respaldo json,
    dic_codigo integer NOT NULL,
    dicent_codigo integer NOT NULL,
    diccge_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 ,   DROP TABLE controleg_dictamen.dictamen_cge;
       controleg_dictamen         heap    usr_controleg    false    12            �           0    0    TABLE dictamen_cge    COMMENT     �   COMMENT ON TABLE controleg_dictamen.dictamen_cge IS 'Tabla para registrar los dictamenes emitidos producto de una auditoria de la CGE';
          controleg_dictamen          usr_controleg    false    255            �           0    0 !   COLUMN dictamen_cge.diccge_codigo    COMMENT     ]   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.diccge_codigo IS 'Identificador de tabla';
          controleg_dictamen          usr_controleg    false    255            �           0    0     COLUMN dictamen_cge.diccge_fecha    COMMENT     r   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.diccge_fecha IS 'Feha del actuado que se encuentra realizando';
          controleg_dictamen          usr_controleg    false    255            �           0    0 &   COLUMN dictamen_cge.diccge_descripcion    COMMENT     z   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.diccge_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_dictamen          usr_controleg    false    255            �           0    0 #   COLUMN dictamen_cge.diccge_respaldo    COMMENT     {   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.diccge_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_dictamen          usr_controleg    false    255            �           0    0    COLUMN dictamen_cge.dic_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.dic_codigo IS 'Referencia al dictamen notificado del sistema de dictmamens.';
          controleg_dictamen          usr_controleg    false    255            �           0    0 !   COLUMN dictamen_cge.dicent_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.dicent_codigo IS 'Referencia a la entidad para la que se registro el dictamen.';
          controleg_dictamen          usr_controleg    false    255            �           0    0 !   COLUMN dictamen_cge.diccge_estado    COMMENT     Z   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.diccge_estado IS 'Estado del registro';
          controleg_dictamen          usr_controleg    false    255            �           0    0 $   COLUMN dictamen_cge.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    255            �           0    0 (   COLUMN dictamen_cge.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    255            �           0    0     COLUMN dictamen_cge.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    255            �           0    0 "   COLUMN dictamen_cge.fecha_registro    COMMENT     V   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    255            �           0    0 &   COLUMN dictamen_cge.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    255            �           0    0    COLUMN dictamen_cge.fecha_baja    COMMENT     N   COMMENT ON COLUMN controleg_dictamen.dictamen_cge.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    255            �           0    0    TABLE dictamen_cge    ACL     Z   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.dictamen_cge TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    255            �            1259    17081    dictamen_entidad    TABLE       CREATE TABLE controleg_dictamen.dictamen_entidad (
    dicent_codigo integer NOT NULL,
    dicent_gestion integer NOT NULL,
    ent_codigo integer NOT NULL,
    tipres_codigo integer NOT NULL,
    dicent_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 0   DROP TABLE controleg_dictamen.dictamen_entidad;
       controleg_dictamen         heap    usr_controleg    false    12            �           0    0    TABLE dictamen_entidad    COMMENT     �   COMMENT ON TABLE controleg_dictamen.dictamen_entidad IS 'Tabla para registrar los dictamenes emitidos por la CGE relacionados a las entidades.';
          controleg_dictamen          usr_controleg    false    254            �           0    0 %   COLUMN dictamen_entidad.dicent_codigo    COMMENT     a   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.dicent_codigo IS 'Identificador de tabla';
          controleg_dictamen          usr_controleg    false    254            �           0    0 &   COLUMN dictamen_entidad.dicent_gestion    COMMENT     `   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.dicent_gestion IS 'Gestion del dictamen';
          controleg_dictamen          usr_controleg    false    254            �           0    0 "   COLUMN dictamen_entidad.ent_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.ent_codigo IS 'Referencia a la entidad, a la que se relaciono el dictamen.';
          controleg_dictamen          usr_controleg    false    254            �           0    0 %   COLUMN dictamen_entidad.tipres_codigo    COMMENT     q   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.tipres_codigo IS 'Referencia al tipo de responsabilidad.';
          controleg_dictamen          usr_controleg    false    254            �           0    0 %   COLUMN dictamen_entidad.dicent_estado    COMMENT     ^   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.dicent_estado IS 'Estado del registro';
          controleg_dictamen          usr_controleg    false    254            �           0    0 (   COLUMN dictamen_entidad.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    254            �           0    0 ,   COLUMN dictamen_entidad.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    254            �           0    0 $   COLUMN dictamen_entidad.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    254            �           0    0 &   COLUMN dictamen_entidad.fecha_registro    COMMENT     Z   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    254            �           0    0 *   COLUMN dictamen_entidad.fecha_modificacion    COMMENT     b   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    254            �           0    0 "   COLUMN dictamen_entidad.fecha_baja    COMMENT     R   COMMENT ON COLUMN controleg_dictamen.dictamen_entidad.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    254            �           0    0    TABLE dictamen_entidad    ACL     ^   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.dictamen_entidad TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    254            �            1259    17067    informe_uai    TABLE     �  CREATE TABLE controleg_dictamen.informe_uai (
    infuai_codigo integer NOT NULL,
    infuai_gestion integer NOT NULL,
    infuai_numero character varying NOT NULL,
    infuai_fecha date NOT NULL,
    dicuai_numero_informe character varying,
    dicuai_fecha_informe date,
    tipaud_codigo integer,
    dicuai_nota_remision character varying,
    infuai_nombre_auditoria character varying NOT NULL,
    dicent_codigo integer NOT NULL,
    infuai_estado integer DEFAULT 1,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 +   DROP TABLE controleg_dictamen.informe_uai;
       controleg_dictamen         heap    usr_controleg    false    12            �           0    0    TABLE informe_uai    COMMENT     �   COMMENT ON TABLE controleg_dictamen.informe_uai IS 'Tabla para registrar los informes UAI remitidos por las Unidades de Auditoria interna a la CGE, para que se emita un dictamen.';
          controleg_dictamen          usr_controleg    false    253            �           0    0     COLUMN informe_uai.infuai_codigo    COMMENT     _   COMMENT ON COLUMN controleg_dictamen.informe_uai.infuai_codigo IS 'Identificador de la tabla';
          controleg_dictamen          usr_controleg    false    253            �           0    0 !   COLUMN informe_uai.infuai_gestion    COMMENT     ^   COMMENT ON COLUMN controleg_dictamen.informe_uai.infuai_gestion IS 'Gestion del informe UAI';
          controleg_dictamen          usr_controleg    false    253            �           0    0     COLUMN informe_uai.infuai_numero    COMMENT     t   COMMENT ON COLUMN controleg_dictamen.informe_uai.infuai_numero IS 'Numero del dictamen emitido por la contraloria';
          controleg_dictamen          usr_controleg    false    253            �           0    0    COLUMN informe_uai.infuai_fecha    COMMENT     r   COMMENT ON COLUMN controleg_dictamen.informe_uai.infuai_fecha IS 'Fecha del dictamen emitido por la contraloria';
          controleg_dictamen          usr_controleg    false    253            �           0    0 (   COLUMN informe_uai.dicuai_numero_informe    COMMENT     v   COMMENT ON COLUMN controleg_dictamen.informe_uai.dicuai_numero_informe IS 'numero del informe de la entidad externa';
          controleg_dictamen          usr_controleg    false    253            �           0    0 '   COLUMN informe_uai.dicuai_fecha_informe    COMMENT     |   COMMENT ON COLUMN controleg_dictamen.informe_uai.dicuai_fecha_informe IS 'fecha del informe de la auditoria de la entidad';
          controleg_dictamen          usr_controleg    false    253            �           0    0     COLUMN informe_uai.tipaud_codigo    COMMENT     a   COMMENT ON COLUMN controleg_dictamen.informe_uai.tipaud_codigo IS 'Tipo de auditoria realizada';
          controleg_dictamen          usr_controleg    false    253            �           0    0 '   COLUMN informe_uai.dicuai_nota_remision    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.informe_uai.dicuai_nota_remision IS 'Numero de la nota de la entidad con la cual remitio los informes de auditoria';
          controleg_dictamen          usr_controleg    false    253            �           0    0 *   COLUMN informe_uai.infuai_nombre_auditoria    COMMENT     p   COMMENT ON COLUMN controleg_dictamen.informe_uai.infuai_nombre_auditoria IS 'Nombre de la auditoria realizada';
          controleg_dictamen          usr_controleg    false    253            �           0    0     COLUMN informe_uai.dicent_codigo    COMMENT     ~   COMMENT ON COLUMN controleg_dictamen.informe_uai.dicent_codigo IS 'Referencia a la pertenencia del dictamen con la entidad.';
          controleg_dictamen          usr_controleg    false    253            �           0    0     COLUMN informe_uai.infuai_estado    COMMENT     Z   COMMENT ON COLUMN controleg_dictamen.informe_uai.infuai_estado IS 'Estado del Registro.';
          controleg_dictamen          usr_controleg    false    253            �           0    0 #   COLUMN informe_uai.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.informe_uai.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    253            �           0    0 '   COLUMN informe_uai.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.informe_uai.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    253            �           0    0    COLUMN informe_uai.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.informe_uai.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    253            �           0    0 !   COLUMN informe_uai.fecha_registro    COMMENT     U   COMMENT ON COLUMN controleg_dictamen.informe_uai.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    253            �           0    0 %   COLUMN informe_uai.fecha_modificacion    COMMENT     ]   COMMENT ON COLUMN controleg_dictamen.informe_uai.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    253            �           0    0    COLUMN informe_uai.fecha_baja    COMMENT     M   COMMENT ON COLUMN controleg_dictamen.informe_uai.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    253            �           0    0    TABLE informe_uai    ACL     Y   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.informe_uai TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    253                        1259    17109    involucrado    TABLE       CREATE TABLE controleg_dictamen.involucrado (
    inv_codigo integer NOT NULL,
    car_codigo integer NOT NULL,
    perres_codigo integer NOT NULL,
    tipinf_codigo integer NOT NULL,
    inv_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 +   DROP TABLE controleg_dictamen.involucrado;
       controleg_dictamen         heap    usr_controleg    false    12            �           0    0    COLUMN involucrado.inv_codigo    COMMENT     Z   COMMENT ON COLUMN controleg_dictamen.involucrado.inv_codigo IS 'id primario de la tabla';
          controleg_dictamen          usr_controleg    false    256            �           0    0    COLUMN involucrado.car_codigo    COMMENT     d   COMMENT ON COLUMN controleg_dictamen.involucrado.car_codigo IS 'llave foranea a la tabla de cargo';
          controleg_dictamen          usr_controleg    false    256            �           0    0     COLUMN involucrado.perres_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.perres_codigo IS 'Codigo de persona, que se constituye como responsable para el cargo.';
          controleg_dictamen          usr_controleg    false    256            �           0    0     COLUMN involucrado.tipinf_codigo    COMMENT     g   COMMENT ON COLUMN controleg_dictamen.involucrado.tipinf_codigo IS 'Referencia al tipo de infraccion.';
          controleg_dictamen          usr_controleg    false    256            �           0    0    COLUMN involucrado.inv_estado    COMMENT     Y   COMMENT ON COLUMN controleg_dictamen.involucrado.inv_estado IS 'estado del involucrado';
          controleg_dictamen          usr_controleg    false    256            �           0    0 #   COLUMN involucrado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    256            �           0    0 '   COLUMN involucrado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    256            �           0    0    COLUMN involucrado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.involucrado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    256            �           0    0 !   COLUMN involucrado.fecha_registro    COMMENT     U   COMMENT ON COLUMN controleg_dictamen.involucrado.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    256            �           0    0 %   COLUMN involucrado.fecha_modificacion    COMMENT     ]   COMMENT ON COLUMN controleg_dictamen.involucrado.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    256            �           0    0    COLUMN involucrado.fecha_baja    COMMENT     M   COMMENT ON COLUMN controleg_dictamen.involucrado.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    256            �           0    0    TABLE involucrado    ACL     Y   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.involucrado TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    256            �            1259    17039    seguimiento_cargo    TABLE     N  CREATE TABLE controleg_dictamen.seguimiento_cargo (
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
       controleg_dictamen         heap    usr_controleg    false    12            �           0    0    TABLE seguimiento_cargo    COMMENT     u   COMMENT ON TABLE controleg_dictamen.seguimiento_cargo IS 'Tabla para controlar la asignacion de estados a un cargo';
          controleg_dictamen          usr_controleg    false    251            �           0    0 &   COLUMN seguimiento_cargo.segcar_codigo    COMMENT     f   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_codigo IS 'llave primaria de la tabla';
          controleg_dictamen          usr_controleg    false    251            �           0    0 %   COLUMN seguimiento_cargo.segcar_fecha    COMMENT     w   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_dictamen          usr_controleg    false    251            �           0    0 +   COLUMN seguimiento_cargo.segcar_descripcion    COMMENT        COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_dictamen          usr_controleg    false    251            �           0    0 (   COLUMN seguimiento_cargo.segcar_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_dictamen          usr_controleg    false    251            �           0    0 #   COLUMN seguimiento_cargo.car_codigo    COMMENT     q   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.car_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_dictamen          usr_controleg    false    251            �           0    0 &   COLUMN seguimiento_cargo.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_dictamen          usr_controleg    false    251            �           0    0 &   COLUMN seguimiento_cargo.segcar_estado    COMMENT     s   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.segcar_estado IS 'estado del registro en la base de datos';
          controleg_dictamen          usr_controleg    false    251            �           0    0 )   COLUMN seguimiento_cargo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_dictamen          usr_controleg    false    251            �           0    0 -   COLUMN seguimiento_cargo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_dictamen          usr_controleg    false    251            �           0    0 %   COLUMN seguimiento_cargo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_dictamen          usr_controleg    false    251            �           0    0 '   COLUMN seguimiento_cargo.fecha_registro    COMMENT     [   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.fecha_registro IS 'Fecha registro';
          controleg_dictamen          usr_controleg    false    251            �           0    0 +   COLUMN seguimiento_cargo.fecha_modificacion    COMMENT     c   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.fecha_modificacion IS 'Fecha modificacion';
          controleg_dictamen          usr_controleg    false    251            �           0    0 #   COLUMN seguimiento_cargo.fecha_baja    COMMENT     S   COMMENT ON COLUMN controleg_dictamen.seguimiento_cargo.fecha_baja IS 'Fecha baja';
          controleg_dictamen          usr_controleg    false    251            �           0    0    TABLE seguimiento_cargo    ACL     _   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_dictamen.seguimiento_cargo TO usr_controleg_app;
          controleg_dictamen          usr_controleg    false    251            �            1259    16919    empresa_unipersonal    TABLE     �  CREATE TABLE controleg_persona.empresa_unipersonal (
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
       controleg_persona         heap    usr_controleg    false    6            �           0    0 (   COLUMN empresa_unipersonal.empuni_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.empuni_codigo IS 'campo donde se almacenara el id de la persona juridica relacionada con persona que ingreso al sistema';
          controleg_persona          usr_controleg    false    243            �           0    0 %   COLUMN empresa_unipersonal.per_codigo    COMMENT     j   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.per_codigo IS 'llave foranea a la tabla persona';
          controleg_persona          usr_controleg    false    243            �           0    0 (   COLUMN empresa_unipersonal.perjur_codigo    COMMENT     v   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.perjur_codigo IS 'llave foranea a la tabla persona juridica';
          controleg_persona          usr_controleg    false    243            �           0    0 -   COLUMN empresa_unipersonal.empuni_observacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.empuni_observacion IS 'campo donde se almacenara alguna observacion si fuera necesario';
          controleg_persona          usr_controleg    false    243            �           0    0 (   COLUMN empresa_unipersonal.empuni_estado    COMMENT     i   COMMENT ON COLUMN controleg_persona.empresa_unipersonal.empuni_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    243            �           0    0    TABLE empresa_unipersonal    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.empresa_unipersonal TO usr_controleg_app;
          controleg_persona          usr_controleg    false    243                       1259    18956    entidad    TABLE     �  CREATE TABLE controleg_persona.entidad (
    ent_codigo integer NOT NULL,
    ent_descripcion character varying NOT NULL,
    ent_nit integer NOT NULL,
    ent_correo_electronico character varying,
    ent_observacion character varying,
    ent_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    ent_sigla character varying DEFAULT 'NA'::character varying NOT NULL,
    ent_codigo_presupuestario character varying DEFAULT ''::character varying NOT NULL,
    ent_codigo_padre integer,
    ent_descripcion_padre character varying
);
 &   DROP TABLE controleg_persona.entidad;
       controleg_persona         heap    usr_controleg    false    6            �           0    0    COLUMN entidad.ent_codigo    COMMENT     Y   COMMENT ON COLUMN controleg_persona.entidad.ent_codigo IS 'llave primararia de la taba';
          controleg_persona          usr_controleg    false    275            �           0    0    COLUMN entidad.ent_descripcion    COMMENT     W   COMMENT ON COLUMN controleg_persona.entidad.ent_descripcion IS 'Nombre de la entidad';
          controleg_persona          usr_controleg    false    275            �           0    0    COLUMN entidad.ent_nit    COMMENT     W   COMMENT ON COLUMN controleg_persona.entidad.ent_nit IS 'nit de la entidad registrada';
          controleg_persona          usr_controleg    false    275            �           0    0 %   COLUMN entidad.ent_correo_electronico    COMMENT     q   COMMENT ON COLUMN controleg_persona.entidad.ent_correo_electronico IS 'correo con el cual ingresara la entidad';
          controleg_persona          usr_controleg    false    275            �           0    0    COLUMN entidad.ent_sigla    COMMENT     `   COMMENT ON COLUMN controleg_persona.entidad.ent_sigla IS 'Codigo Presupuestario de la entidad';
          controleg_persona          usr_controleg    false    275            �           0    0 (   COLUMN entidad.ent_codigo_presupuestario    COMMENT     p   COMMENT ON COLUMN controleg_persona.entidad.ent_codigo_presupuestario IS 'Codigo Presupuestario de la entidad';
          controleg_persona          usr_controleg    false    275            �           0    0    COLUMN entidad.ent_codigo_padre    COMMENT     �   COMMENT ON COLUMN controleg_persona.entidad.ent_codigo_padre IS 'Codigo de entidad Padre (Obtenido del servicio de entidades)';
          controleg_persona          usr_controleg    false    275            �           0    0 $   COLUMN entidad.ent_descripcion_padre    COMMENT     �   COMMENT ON COLUMN controleg_persona.entidad.ent_descripcion_padre IS 'Nombre de la entidad padre definida en el servicio de entidades.';
          controleg_persona          usr_controleg    false    275            �           0    0    TABLE entidad    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.entidad TO usr_controleg_app;
          controleg_persona          usr_controleg    false    275                       1259    18944    persona    TABLE     �  CREATE TABLE controleg_persona.persona (
    per_codigo integer NOT NULL,
    per_nombres character varying NOT NULL,
    per_apellido_paterno character varying NOT NULL,
    per_apellido_materno character varying,
    per_apellido_conyuge character varying,
    per_documento_identidad character varying NOT NULL,
    per_complemento_segip character varying,
    per_fecha_nacimiento character varying NOT NULL,
    per_nacionalidad character varying NOT NULL,
    per_correo_electronico character varying,
    per_domicilio character varying,
    per_telefono character varying,
    per_observacion character varying,
    validado_segip bit(1),
    tipdoc_codigo integer NOT NULL,
    per_genero integer NOT NULL,
    per_lugar_emision integer,
    per_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE controleg_persona.persona;
       controleg_persona         heap    usr_controleg    false    6            �           0    0    COLUMN persona.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_codigo IS 'campo donde se almacenara el id de la persona que ingreso al sistema';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_nombres    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_nombres IS 'campo donde se almacenara los nombres de las personas que ingresaron al sistema';
          controleg_persona          usr_controleg    false    274            �           0    0 #   COLUMN persona.per_apellido_paterno    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_apellido_paterno IS 'campo donde se almacenara el apellido paterno de la persona';
          controleg_persona          usr_controleg    false    274            �           0    0 #   COLUMN persona.per_apellido_materno    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_apellido_materno IS 'campo donde se almacenara el apellido maternod de la persona';
          controleg_persona          usr_controleg    false    274            �           0    0 #   COLUMN persona.per_apellido_conyuge    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_apellido_conyuge IS 'campo donde se almacenara el apellido de onyuge paterno de la persona si corresponde';
          controleg_persona          usr_controleg    false    274            �           0    0 &   COLUMN persona.per_documento_identidad    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_documento_identidad IS 'campo donde se registra la cedula de identidad de la persona que ingresa al sistema';
          controleg_persona          usr_controleg    false    274            �           0    0 $   COLUMN persona.per_complemento_segip    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_complemento_segip IS 'campo donde se almacenara el complemento segip si corresponde';
          controleg_persona          usr_controleg    false    274            �           0    0 #   COLUMN persona.per_fecha_nacimiento    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_fecha_nacimiento IS 'campo donde se almacena la fecha de nacimiento de la persona que ingreso al sistema';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_nacionalidad    COMMENT     y   COMMENT ON COLUMN controleg_persona.persona.per_nacionalidad IS 'campo donde se almacenara la naciolidad de la persona';
          controleg_persona          usr_controleg    false    274            �           0    0 %   COLUMN persona.per_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_correo_electronico IS 'campo donde se almacenara el dato del correo electronico de la persona';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_domicilio    COMMENT     v   COMMENT ON COLUMN controleg_persona.persona.per_domicilio IS 'campo donde se almacenara el domicilio de una persona';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_telefono    COMMENT     y   COMMENT ON COLUMN controleg_persona.persona.per_telefono IS 'Campo que hace referencia a numero de telefono de persona';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_observacion    COMMENT     ~   COMMENT ON COLUMN controleg_persona.persona.per_observacion IS 'campo donde se almacenara alguna observacion si corresponde';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.validado_segip    COMMENT     }   COMMENT ON COLUMN controleg_persona.persona.validado_segip IS 'Campo que hace referencia a validacion con segip de persona';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.tipdoc_codigo    COMMENT     o   COMMENT ON COLUMN controleg_persona.persona.tipdoc_codigo IS 'campo donde se almacenara el tipo de documento';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_genero    COMMENT     p   COMMENT ON COLUMN controleg_persona.persona.per_genero IS 'campo donde se almacenara el genero de una persona';
          controleg_persona          usr_controleg    false    274            �           0    0     COLUMN persona.per_lugar_emision    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona.per_lugar_emision IS 'campo donde se almacenara el lugar de emision del documento de identidad';
          controleg_persona          usr_controleg    false    274            �           0    0    COLUMN persona.per_estado    COMMENT     Z   COMMENT ON COLUMN controleg_persona.persona.per_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    274            �           0    0    TABLE persona    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.persona TO usr_controleg_app;
          controleg_persona          usr_controleg    false    274            �            1259    16907    persona_juridica    TABLE     �  CREATE TABLE controleg_persona.persona_juridica (
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
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    perjur_codigo_seprec character varying
);
 /   DROP TABLE controleg_persona.persona_juridica;
       controleg_persona         heap    usr_controleg    false    6            �           0    0 %   COLUMN persona_juridica.perjur_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_codigo IS 'campo donde se almacenara el id de la persona juridica que ingreso al sistema';
          controleg_persona          usr_controleg    false    242            �           0    0 +   COLUMN persona_juridica.perjur_razon_social    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_razon_social IS 'campo donde se almacenara la razon social de persona juridica';
          controleg_persona          usr_controleg    false    242            �           0    0 "   COLUMN persona_juridica.perjur_nit    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_nit IS 'campo donde se registra el NIT de la persona juridica que ingresa al sistema';
          controleg_persona          usr_controleg    false    242            �           0    0 $   COLUMN persona_juridica.perjur_sigla    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_sigla IS 'campo donde se almacena la sigla de la entidad juridica si tuviera';
          controleg_persona          usr_controleg    false    242            �           0    0 (   COLUMN persona_juridica.perjur_direccion    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_direccion IS 'campo donde se almacenara la direccion de la persona juridica';
          controleg_persona          usr_controleg    false    242            �           0    0 '   COLUMN persona_juridica.perjur_telefono    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_telefono IS 'campo donde se almacenara el dato del telefono de la persona juridica';
          controleg_persona          usr_controleg    false    242                        0    0 "   COLUMN persona_juridica.perjur_fax    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_fax IS 'campo donde se almacenara el fax de la persona juridica si tiene';
          controleg_persona          usr_controleg    false    242                       0    0 1   COLUMN persona_juridica.perjur_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_correo_electronico IS 'campo donde se almacenara el correo electronico de la persona juridica';
          controleg_persona          usr_controleg    false    242                       0    0 *   COLUMN persona_juridica.perjur_observacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_observacion IS 'campo donde se almacenara alguna observacion si corresponde';
          controleg_persona          usr_controleg    false    242                       0    0 %   COLUMN persona_juridica.perjur_estado    COMMENT     f   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    242                       0    0 ,   COLUMN persona_juridica.perjur_codigo_seprec    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_juridica.perjur_codigo_seprec IS 'Columna para registrar algun identificador obtenido del servicio de SEPREC';
          controleg_persona          usr_controleg    false    242                       0    0    TABLE persona_juridica    ACL     ]   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.persona_juridica TO usr_controleg_app;
          controleg_persona          usr_controleg    false    242                       1259    17123    persona_responsable    TABLE     ,  CREATE TABLE controleg_persona.persona_responsable (
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
       controleg_persona         heap    usr_controleg    false    6                       0    0    TABLE persona_responsable    COMMENT     �   COMMENT ON TABLE controleg_persona.persona_responsable IS 'Tabla para determinar la responsabilidad de una persona, esta responsabilidad pueder ser por demandado, involucrado, como natural, juridica o empresa';
          controleg_persona          usr_controleg    false    257                       0    0 (   COLUMN persona_responsable.perres_codigo    COMMENT     c   COMMENT ON COLUMN controleg_persona.persona_responsable.perres_codigo IS 'Identificador de tabla';
          controleg_persona          usr_controleg    false    257                       0    0 %   COLUMN persona_responsable.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.per_codigo IS 'Referencia a la persona que  tiene responsabilidad de realizar ciertas acciones o tareas, que pueden ser procesos o cargos.';
          controleg_persona          usr_controleg    false    257            	           0    0 -   COLUMN persona_responsable.per_codigo_natural    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.per_codigo_natural IS 'Referencia a la persona natural, de la que la persona se hara responsable. Para este caso, per_codigo y per_codigo_natural deben ser el mismo.';
          controleg_persona          usr_controleg    false    257            
           0    0 (   COLUMN persona_responsable.empuni_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.empuni_codigo IS 'Referencia a la empresa unipersonal, de la que la persona se hara responsable';
          controleg_persona          usr_controleg    false    257                       0    0 (   COLUMN persona_responsable.perjur_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.perjur_codigo IS 'Referencia a la persona juridica, de la que la persona se hara responsable';
          controleg_persona          usr_controleg    false    257                       0    0 %   COLUMN persona_responsable.ent_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.ent_codigo IS 'Referencia a la entidad, de la que la persona se hara responsable';
          controleg_persona          usr_controleg    false    257                       0    0 (   COLUMN persona_responsable.perres_estado    COMMENT     `   COMMENT ON COLUMN controleg_persona.persona_responsable.perres_estado IS 'Estado del registro';
          controleg_persona          usr_controleg    false    257                       0    0 +   COLUMN persona_responsable.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_persona          usr_controleg    false    257                       0    0 /   COLUMN persona_responsable.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_persona          usr_controleg    false    257                       0    0 '   COLUMN persona_responsable.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_persona.persona_responsable.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_persona          usr_controleg    false    257                       0    0 )   COLUMN persona_responsable.fecha_registro    COMMENT     \   COMMENT ON COLUMN controleg_persona.persona_responsable.fecha_registro IS 'Fecha registro';
          controleg_persona          usr_controleg    false    257                       0    0 -   COLUMN persona_responsable.fecha_modificacion    COMMENT     d   COMMENT ON COLUMN controleg_persona.persona_responsable.fecha_modificacion IS 'Fecha modificacion';
          controleg_persona          usr_controleg    false    257                       0    0 %   COLUMN persona_responsable.fecha_baja    COMMENT     T   COMMENT ON COLUMN controleg_persona.persona_responsable.fecha_baja IS 'Fecha baja';
          controleg_persona          usr_controleg    false    257                       0    0    TABLE persona_responsable    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.persona_responsable TO usr_controleg_app;
          controleg_persona          usr_controleg    false    257            �            1259    16943    representante_legal    TABLE     �  CREATE TABLE controleg_persona.representante_legal (
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
       controleg_persona         heap    usr_controleg    false    6                       0    0 (   COLUMN representante_legal.repleg_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_codigo IS 'campo donde se almacenara el identificador de representante legal';
          controleg_persona          usr_controleg    false    244                       0    0 %   COLUMN representante_legal.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.per_codigo IS 'Referencia a la persona que representa legalmente a una persona juridica';
          controleg_persona          usr_controleg    false    244                       0    0 (   COLUMN representante_legal.perjur_codigo    COMMENT     n   COMMENT ON COLUMN controleg_persona.representante_legal.perjur_codigo IS 'Referencia a la persona juridica.';
          controleg_persona          usr_controleg    false    244                       0    0 *   COLUMN representante_legal.repleg_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_respaldo IS 'Numero de poder que respalde la representacion legal.';
          controleg_persona          usr_controleg    false    244                       0    0 -   COLUMN representante_legal.repleg_observacion    COMMENT     �   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_observacion IS 'campo donde se almacenara alguna observacion si fuera necesario';
          controleg_persona          usr_controleg    false    244                       0    0 (   COLUMN representante_legal.repleg_estado    COMMENT     i   COMMENT ON COLUMN controleg_persona.representante_legal.repleg_estado IS 'llave forenea a tabla estado';
          controleg_persona          usr_controleg    false    244                       0    0    TABLE representante_legal    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_persona.representante_legal TO usr_controleg_app;
          controleg_persona          usr_controleg    false    244            �            1259    17053 	   demandado    TABLE     �  CREATE TABLE controleg_proceso.demandado (
    dem_codigo integer NOT NULL,
    pro_codigo integer NOT NULL,
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
       controleg_proceso         heap    usr_controleg    false    8                       0    0    COLUMN demandado.dem_codigo    COMMENT     W   COMMENT ON COLUMN controleg_proceso.demandado.dem_codigo IS 'id primario de la tabla';
          controleg_proceso          usr_controleg    false    252                       0    0    COLUMN demandado.pro_codigo    COMMENT     u   COMMENT ON COLUMN controleg_proceso.demandado.pro_codigo IS 'Referencia al proceso del cual es parte el demandado.';
          controleg_proceso          usr_controleg    false    252                       0    0    COLUMN demandado.perres_codigo    COMMENT     y   COMMENT ON COLUMN controleg_proceso.demandado.perres_codigo IS 'Referencia a la persona responsable que sera demandado';
          controleg_proceso          usr_controleg    false    252                       0    0    COLUMN demandado.dem_estado    COMMENT     T   COMMENT ON COLUMN controleg_proceso.demandado.dem_estado IS 'estado del demandado';
          controleg_proceso          usr_controleg    false    252                        0    0 !   COLUMN demandado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.demandado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    252            !           0    0 %   COLUMN demandado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.demandado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    252            "           0    0    COLUMN demandado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.demandado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    252            #           0    0    COLUMN demandado.fecha_registro    COMMENT     R   COMMENT ON COLUMN controleg_proceso.demandado.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    252            $           0    0 #   COLUMN demandado.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN controleg_proceso.demandado.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    252            %           0    0    COLUMN demandado.fecha_baja    COMMENT     J   COMMENT ON COLUMN controleg_proceso.demandado.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    252            &           0    0    TABLE demandado    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.demandado TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    252            �            1259    16955    proceso    TABLE     �  CREATE TABLE controleg_proceso.proceso (
    pro_codigo integer NOT NULL,
    pro_gestion integer NOT NULL,
    pro_fecha_inicio date,
    pro_monto numeric,
    pro_codigo_fiscalia character varying,
    pro_causa character varying,
    pro_datos_adicionales character varying,
    pro_observacion character varying,
    ent_codigo integer NOT NULL,
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
       controleg_proceso         heap    usr_controleg    false    8            '           0    0    COLUMN proceso.pro_codigo    COMMENT     `   COMMENT ON COLUMN controleg_proceso.proceso.pro_codigo IS 'Llave primaria de la tabla proceso';
          controleg_proceso          usr_controleg    false    245            (           0    0    COLUMN proceso.pro_gestion    COMMENT     h   COMMENT ON COLUMN controleg_proceso.proceso.pro_gestion IS 'Campo que almacena la gestion del proceso';
          controleg_proceso          usr_controleg    false    245            )           0    0    COLUMN proceso.pro_fecha_inicio    COMMENT     w   COMMENT ON COLUMN controleg_proceso.proceso.pro_fecha_inicio IS 'Campo donde almacena la fecha de inicio del proceso';
          controleg_proceso          usr_controleg    false    245            *           0    0    COLUMN proceso.pro_monto    COMMENT     i   COMMENT ON COLUMN controleg_proceso.proceso.pro_monto IS 'campo donde se almacena el monto del proceso';
          controleg_proceso          usr_controleg    false    245            +           0    0 "   COLUMN proceso.pro_codigo_fiscalia    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.pro_codigo_fiscalia IS 'campo donde se puede escribir el codigo del proceso ejm el codigo de la fiscalia';
          controleg_proceso          usr_controleg    false    245            ,           0    0 $   COLUMN proceso.pro_datos_adicionales    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.pro_datos_adicionales IS 'campos donde se registra un json donde se registra los datos adicionales del proceso segun el tipo de proceso';
          controleg_proceso          usr_controleg    false    245            -           0    0    COLUMN proceso.ent_codigo    COMMENT     t   COMMENT ON COLUMN controleg_proceso.proceso.ent_codigo IS 'campo donde se almacena el id de la entidad demandante';
          controleg_proceso          usr_controleg    false    245            .           0    0    COLUMN proceso.tippro_codigo    COMMENT     x   COMMENT ON COLUMN controleg_proceso.proceso.tippro_codigo IS 'Llave foranea a la tabla parametrica de Tipo de Proceso';
          controleg_proceso          usr_controleg    false    245            /           0    0    COLUMN proceso.mon_codigo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.mon_codigo IS 'llave foranea a la tabla moneda donde se almacena el tipo de moneda';
          controleg_proceso          usr_controleg    false    245            0           0    0    COLUMN proceso.pro_estado    COMMENT     Q   COMMENT ON COLUMN controleg_proceso.proceso.pro_estado IS 'Estado del Registro';
          controleg_proceso          usr_controleg    false    245            1           0    0    COLUMN proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    245            2           0    0 #   COLUMN proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    245            3           0    0    COLUMN proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    245            4           0    0    COLUMN proceso.fecha_registro    COMMENT     P   COMMENT ON COLUMN controleg_proceso.proceso.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    245            5           0    0 !   COLUMN proceso.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN controleg_proceso.proceso.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    245            6           0    0    COLUMN proceso.fecha_baja    COMMENT     H   COMMENT ON COLUMN controleg_proceso.proceso.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    245            7           0    0    TABLE proceso    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    245            �            1259    16983    proceso_abogado    TABLE     �  CREATE TABLE controleg_proceso.proceso_abogado (
    proabo_codigo integer NOT NULL,
    pro_codigo integer NOT NULL,
    per_codigo integer NOT NULL,
    proabo_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 .   DROP TABLE controleg_proceso.proceso_abogado;
       controleg_proceso         heap    usr_controleg    false    8            8           0    0    TABLE proceso_abogado    COMMENT     �   COMMENT ON TABLE controleg_proceso.proceso_abogado IS 'Tabla para registrar los abogados que se hicieron cargo de un proceso.';
          controleg_proceso          usr_controleg    false    247            9           0    0 !   COLUMN proceso_abogado.pro_codigo    COMMENT     \   COMMENT ON COLUMN controleg_proceso.proceso_abogado.pro_codigo IS 'Referencia al proceso.';
          controleg_proceso          usr_controleg    false    247            :           0    0 !   COLUMN proceso_abogado.per_codigo    COMMENT     y   COMMENT ON COLUMN controleg_proceso.proceso_abogado.per_codigo IS 'Referencia a la persona que es abogado del proceso.';
          controleg_proceso          usr_controleg    false    247            ;           0    0 '   COLUMN proceso_abogado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_abogado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    247            <           0    0 +   COLUMN proceso_abogado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_abogado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    247            =           0    0 #   COLUMN proceso_abogado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_abogado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    247            >           0    0 %   COLUMN proceso_abogado.fecha_registro    COMMENT     X   COMMENT ON COLUMN controleg_proceso.proceso_abogado.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    247            ?           0    0 )   COLUMN proceso_abogado.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN controleg_proceso.proceso_abogado.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    247            @           0    0 !   COLUMN proceso_abogado.fecha_baja    COMMENT     P   COMMENT ON COLUMN controleg_proceso.proceso_abogado.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    247            A           0    0    TABLE proceso_abogado    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso_abogado TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    247                       1259    19217    proceso_archivo    TABLE     J  CREATE TABLE controleg_proceso.proceso_archivo (
    proarc_codigo integer NOT NULL,
    pro_codigo integer,
    proarc_id_archivo character varying NOT NULL,
    proarc_hash_archivo character varying NOT NULL,
    proarc_observacion character varying,
    proarc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 .   DROP TABLE controleg_proceso.proceso_archivo;
       controleg_proceso         heap    usr_controleg    false    8            B           0    0    TABLE proceso_archivo    COMMENT     �   COMMENT ON TABLE controleg_proceso.proceso_archivo IS 'Tabla para registrar los archivos que los procesos tendran relacionados.';
          controleg_proceso          usr_controleg    false    276            C           0    0 $   COLUMN proceso_archivo.proarc_codigo    COMMENT     _   COMMENT ON COLUMN controleg_proceso.proceso_archivo.proarc_codigo IS 'Identificador de tabla';
          controleg_proceso          usr_controleg    false    276            D           0    0 !   COLUMN proceso_archivo.pro_codigo    COMMENT     i   COMMENT ON COLUMN controleg_proceso.proceso_archivo.pro_codigo IS 'llave foranea a la tabla de proceso';
          controleg_proceso          usr_controleg    false    276            E           0    0 (   COLUMN proceso_archivo.proarc_id_archivo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_archivo.proarc_id_archivo IS 'Referencia al id de archivo digital del documento almacenado';
          controleg_proceso          usr_controleg    false    276            F           0    0 *   COLUMN proceso_archivo.proarc_hash_archivo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_archivo.proarc_hash_archivo IS 'Referencia al hash de archivo digital del documento almacenado';
          controleg_proceso          usr_controleg    false    276            G           0    0 )   COLUMN proceso_archivo.proarc_observacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_archivo.proarc_observacion IS 'Observacion, o comentario del documento que se esta almacenando.';
          controleg_proceso          usr_controleg    false    276            H           0    0 $   COLUMN proceso_archivo.proarc_estado    COMMENT     ]   COMMENT ON COLUMN controleg_proceso.proceso_archivo.proarc_estado IS 'Estado del registro.';
          controleg_proceso          usr_controleg    false    276            I           0    0 '   COLUMN proceso_archivo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_archivo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    276            J           0    0 +   COLUMN proceso_archivo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_archivo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    276            K           0    0 #   COLUMN proceso_archivo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_archivo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    276            L           0    0 %   COLUMN proceso_archivo.fecha_registro    COMMENT     X   COMMENT ON COLUMN controleg_proceso.proceso_archivo.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    276            M           0    0 )   COLUMN proceso_archivo.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN controleg_proceso.proceso_archivo.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    276            N           0    0 !   COLUMN proceso_archivo.fecha_baja    COMMENT     P   COMMENT ON COLUMN controleg_proceso.proceso_archivo.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    276            O           0    0    TABLE proceso_archivo    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso_archivo TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    276            �            1259    17011    proceso_cargo    TABLE     �  CREATE TABLE controleg_proceso.proceso_cargo (
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
       controleg_proceso         heap    usr_controleg    false    8            P           0    0    TABLE proceso_cargo    COMMENT     �   COMMENT ON TABLE controleg_proceso.proceso_cargo IS 'Tabla para definir la relacion de un cargo cuando este pasa a ser proceso.';
          controleg_proceso          usr_controleg    false    249            Q           0    0 "   COLUMN proceso_cargo.procar_codigo    COMMENT     ]   COMMENT ON COLUMN controleg_proceso.proceso_cargo.procar_codigo IS 'Identificador de tabla';
          controleg_proceso          usr_controleg    false    249            R           0    0    COLUMN proceso_cargo.pro_codigo    COMMENT     g   COMMENT ON COLUMN controleg_proceso.proceso_cargo.pro_codigo IS 'llave foranea a la tabla de proceso';
          controleg_proceso          usr_controleg    false    249            S           0    0    COLUMN proceso_cargo.car_codigo    COMMENT     W   COMMENT ON COLUMN controleg_proceso.proceso_cargo.car_codigo IS 'Referencia al cargo';
          controleg_proceso          usr_controleg    false    249            T           0    0 "   COLUMN proceso_cargo.procar_estado    COMMENT     [   COMMENT ON COLUMN controleg_proceso.proceso_cargo.procar_estado IS 'Estado del registro.';
          controleg_proceso          usr_controleg    false    249            U           0    0 %   COLUMN proceso_cargo.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_cargo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    249            V           0    0 )   COLUMN proceso_cargo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_cargo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    249            W           0    0 !   COLUMN proceso_cargo.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_cargo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    249            X           0    0 #   COLUMN proceso_cargo.fecha_registro    COMMENT     V   COMMENT ON COLUMN controleg_proceso.proceso_cargo.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    249            Y           0    0 '   COLUMN proceso_cargo.fecha_modificacion    COMMENT     ^   COMMENT ON COLUMN controleg_proceso.proceso_cargo.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    249            Z           0    0    COLUMN proceso_cargo.fecha_baja    COMMENT     N   COMMENT ON COLUMN controleg_proceso.proceso_cargo.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    249            [           0    0    TABLE proceso_cargo    ACL     Z   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso_cargo TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    249            �            1259    16969    proceso_juzgado    TABLE     �  CREATE TABLE controleg_proceso.proceso_juzgado (
    projuz_codigo integer NOT NULL,
    pro_codigo integer NOT NULL,
    juz_codigo integer NOT NULL,
    projuz_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 .   DROP TABLE controleg_proceso.proceso_juzgado;
       controleg_proceso         heap    usr_controleg    false    8            \           0    0    TABLE proceso_juzgado    COMMENT     x   COMMENT ON TABLE controleg_proceso.proceso_juzgado IS 'Tabla para registrar los guzgados por los que paso un proceso.';
          controleg_proceso          usr_controleg    false    246            ]           0    0 !   COLUMN proceso_juzgado.pro_codigo    COMMENT     \   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.pro_codigo IS 'Referencia al proceso.';
          controleg_proceso          usr_controleg    false    246            ^           0    0 !   COLUMN proceso_juzgado.juz_codigo    COMMENT     x   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.juz_codigo IS 'Referencia al juzgado al que pertenece el juzgado.';
          controleg_proceso          usr_controleg    false    246            _           0    0 '   COLUMN proceso_juzgado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    246            `           0    0 +   COLUMN proceso_juzgado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    246            a           0    0 #   COLUMN proceso_juzgado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    246            b           0    0 %   COLUMN proceso_juzgado.fecha_registro    COMMENT     X   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    246            c           0    0 )   COLUMN proceso_juzgado.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    246            d           0    0 !   COLUMN proceso_juzgado.fecha_baja    COMMENT     P   COMMENT ON COLUMN controleg_proceso.proceso_juzgado.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    246            e           0    0    TABLE proceso_juzgado    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.proceso_juzgado TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    246            
           1259    17256    sancion    TABLE     �  CREATE TABLE controleg_proceso.sancion (
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
       controleg_proceso         heap    usr_controleg    false    8            f           0    0    TABLE sancion    COMMENT     �   COMMENT ON TABLE controleg_proceso.sancion IS 'Tabla para definir las sanciones que los demandados tendran cuando se traten de procesos administrativos diciplinarios.';
          controleg_proceso          usr_controleg    false    266            g           0    0    COLUMN sancion.san_codigo    COMMENT     T   COMMENT ON COLUMN controleg_proceso.sancion.san_codigo IS 'Identificador de tabla';
          controleg_proceso          usr_controleg    false    266            h           0    0    COLUMN sancion.dem_codigo    COMMENT     T   COMMENT ON COLUMN controleg_proceso.sancion.dem_codigo IS 'Referencia al proceso.';
          controleg_proceso          usr_controleg    false    266            i           0    0    COLUMN sancion.tipsan_codigo    COMMENT     ^   COMMENT ON COLUMN controleg_proceso.sancion.tipsan_codigo IS 'Referencia al tipo de sancion';
          controleg_proceso          usr_controleg    false    266            j           0    0    COLUMN sancion.san_estado    COMMENT     Q   COMMENT ON COLUMN controleg_proceso.sancion.san_estado IS 'Estado del registro';
          controleg_proceso          usr_controleg    false    266            k           0    0    COLUMN sancion.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.sancion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    266            l           0    0 #   COLUMN sancion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.sancion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    266            m           0    0    COLUMN sancion.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.sancion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    266            n           0    0    COLUMN sancion.fecha_registro    COMMENT     P   COMMENT ON COLUMN controleg_proceso.sancion.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    266            o           0    0 !   COLUMN sancion.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN controleg_proceso.sancion.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    266            p           0    0    COLUMN sancion.fecha_baja    COMMENT     H   COMMENT ON COLUMN controleg_proceso.sancion.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    266            q           0    0    TABLE sancion    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.sancion TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    266            �            1259    17025    seguimiento_proceso    TABLE     O  CREATE TABLE controleg_proceso.seguimiento_proceso (
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
       controleg_proceso         heap    usr_controleg    false    8            r           0    0    TABLE seguimiento_proceso    COMMENT     x   COMMENT ON TABLE controleg_proceso.seguimiento_proceso IS 'Tabla para controlar la asignacion de estados a un proceso';
          controleg_proceso          usr_controleg    false    250            s           0    0 (   COLUMN seguimiento_proceso.segpro_codigo    COMMENT     g   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_codigo IS 'llave primaria de la tabla';
          controleg_proceso          usr_controleg    false    250            t           0    0 '   COLUMN seguimiento_proceso.segpro_fecha    COMMENT     x   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_proceso          usr_controleg    false    250            u           0    0 -   COLUMN seguimiento_proceso.segpro_descripcion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_proceso          usr_controleg    false    250            v           0    0 *   COLUMN seguimiento_proceso.segpro_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_proceso          usr_controleg    false    250            w           0    0 %   COLUMN seguimiento_proceso.pro_codigo    COMMENT     r   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.pro_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_proceso          usr_controleg    false    250            x           0    0 (   COLUMN seguimiento_proceso.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_proceso          usr_controleg    false    250            y           0    0 (   COLUMN seguimiento_proceso.segpro_estado    COMMENT     t   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.segpro_estado IS 'estado del registro en la base de datos';
          controleg_proceso          usr_controleg    false    250            z           0    0 +   COLUMN seguimiento_proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    250            {           0    0 /   COLUMN seguimiento_proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    250            |           0    0 '   COLUMN seguimiento_proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    250            }           0    0 )   COLUMN seguimiento_proceso.fecha_registro    COMMENT     \   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    250            ~           0    0 -   COLUMN seguimiento_proceso.fecha_modificacion    COMMENT     d   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    250                       0    0 %   COLUMN seguimiento_proceso.fecha_baja    COMMENT     T   COMMENT ON COLUMN controleg_proceso.seguimiento_proceso.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    250            �           0    0    TABLE seguimiento_proceso    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.seguimiento_proceso TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    250                       1259    17270    seguimiento_sancion    TABLE     O  CREATE TABLE controleg_proceso.seguimiento_sancion (
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
       controleg_proceso         heap    usr_controleg    false    8            �           0    0    TABLE seguimiento_sancion    COMMENT     y   COMMENT ON TABLE controleg_proceso.seguimiento_sancion IS 'Tabla para controlar la asignacion de estados a una sancion';
          controleg_proceso          usr_controleg    false    267            �           0    0 (   COLUMN seguimiento_sancion.segsan_codigo    COMMENT     g   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_codigo IS 'llave primaria de la tabla';
          controleg_proceso          usr_controleg    false    267            �           0    0 '   COLUMN seguimiento_sancion.segsan_fecha    COMMENT     x   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_fecha IS 'feha del actuado que se encuentra realizando';
          controleg_proceso          usr_controleg    false    267            �           0    0 -   COLUMN seguimiento_sancion.segsan_descripcion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_descripcion IS 'Descripcion del actuado que se esta realizando';
          controleg_proceso          usr_controleg    false    267            �           0    0 *   COLUMN seguimiento_sancion.segsan_respaldo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_respaldo IS 'resapaldo del actuado que se encuentra registrando';
          controleg_proceso          usr_controleg    false    267            �           0    0 %   COLUMN seguimiento_sancion.san_codigo    COMMENT     r   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.san_codigo IS 'llave foranea al campo de proceso codigo';
          controleg_proceso          usr_controleg    false    267            �           0    0 (   COLUMN seguimiento_sancion.estcla_codigo    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.estcla_codigo IS 'llave foranea a la tabla de estado cladificacion, este campo indica el estado del proceso segun el tipo de accion.';
          controleg_proceso          usr_controleg    false    267            �           0    0 (   COLUMN seguimiento_sancion.segsan_estado    COMMENT     t   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.segsan_estado IS 'estado del registro en la base de datos';
          controleg_proceso          usr_controleg    false    267            �           0    0 +   COLUMN seguimiento_sancion.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_proceso          usr_controleg    false    267            �           0    0 /   COLUMN seguimiento_sancion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_proceso          usr_controleg    false    267            �           0    0 '   COLUMN seguimiento_sancion.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_proceso          usr_controleg    false    267            �           0    0 )   COLUMN seguimiento_sancion.fecha_registro    COMMENT     \   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.fecha_registro IS 'Fecha registro';
          controleg_proceso          usr_controleg    false    267            �           0    0 -   COLUMN seguimiento_sancion.fecha_modificacion    COMMENT     d   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.fecha_modificacion IS 'Fecha modificacion';
          controleg_proceso          usr_controleg    false    267            �           0    0 %   COLUMN seguimiento_sancion.fecha_baja    COMMENT     T   COMMENT ON COLUMN controleg_proceso.seguimiento_sancion.fecha_baja IS 'Fecha baja';
          controleg_proceso          usr_controleg    false    267            �           0    0    TABLE seguimiento_sancion    ACL     `   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_proceso.seguimiento_sancion TO usr_controleg_app;
          controleg_proceso          usr_controleg    false    267            �            1259    16742    solicitud_archivo_digital    TABLE     |  CREATE TABLE controleg_solvencia.solicitud_archivo_digital (
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
       controleg_solvencia         heap    usr_controleg    false    11            �           0    0 +   COLUMN solicitud_archivo_digital.sad_codigo    COMMENT     l   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.sad_codigo IS 'llave primaria de la tabla';
          controleg_solvencia          usr_controleg    false    229            �           0    0 +   COLUMN solicitud_archivo_digital.ssf_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.ssf_codigo IS 'llave foranea a la tabla de solicitud de solvencia digital';
          controleg_solvencia          usr_controleg    false    229            �           0    0 .   COLUMN solicitud_archivo_digital.tipadj_codigo    COMMENT     }   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.tipadj_codigo IS 'llave foranea a la tabla de tipo adjunto';
          controleg_solvencia          usr_controleg    false    229            �           0    0 .   COLUMN solicitud_archivo_digital.arcdig_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.arcdig_codigo IS 'llave foranea a la tabla de archivo digital';
          controleg_solvencia          usr_controleg    false    229            �           0    0 1   COLUMN solicitud_archivo_digital.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_solvencia          usr_controleg    false    229            �           0    0 5   COLUMN solicitud_archivo_digital.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_solvencia          usr_controleg    false    229            �           0    0 -   COLUMN solicitud_archivo_digital.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_solvencia          usr_controleg    false    229            �           0    0 /   COLUMN solicitud_archivo_digital.fecha_registro    COMMENT     d   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.fecha_registro IS 'Fecha registro';
          controleg_solvencia          usr_controleg    false    229            �           0    0 3   COLUMN solicitud_archivo_digital.fecha_modificacion    COMMENT     l   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.fecha_modificacion IS 'Fecha modificacion';
          controleg_solvencia          usr_controleg    false    229            �           0    0 +   COLUMN solicitud_archivo_digital.fecha_baja    COMMENT     \   COMMENT ON COLUMN controleg_solvencia.solicitud_archivo_digital.fecha_baja IS 'Fecha baja';
          controleg_solvencia          usr_controleg    false    229            �           0    0    TABLE solicitud_archivo_digital    ACL     h   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_solvencia.solicitud_archivo_digital TO usr_controleg_app;
          controleg_solvencia          usr_controleg    false    229            �            1259    16727    solicitud_solvencia_fiscal    TABLE     s  CREATE TABLE controleg_solvencia.solicitud_solvencia_fiscal (
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
       controleg_solvencia         heap    usr_controleg    false    11            �           0    0     TABLE solicitud_solvencia_fiscal    COMMENT     {   COMMENT ON TABLE controleg_solvencia.solicitud_solvencia_fiscal IS 'Tabla para el registro de solicitudes de solvencias.';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_codigo IS 'llave primaria de la tabla, la misma sera incremental (max +1)';
          controleg_solvencia          usr_controleg    false    228            �           0    0 8   COLUMN solicitud_solvencia_fiscal.ssf_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_correo_electronico IS 'correo electronico de la persona solicitante';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_objeto    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_objeto IS 'en este campo se almacenara el campo de objeto de la certificacion, la descripcion del motivo del tramite';
          controleg_solvencia          usr_controleg    false    228            �           0    0 .   COLUMN solicitud_solvencia_fiscal.ssf_telefono    COMMENT     w   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_telefono IS 'telefono de la persona solicitante';
          controleg_solvencia          usr_controleg    false    228            �           0    0 -   COLUMN solicitud_solvencia_fiscal.ssf_notaria    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_notaria IS 'nro de la notoria donde se realizo el tramite de apoderado';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.per_codigo IS 'llave foranea al campo de persona, en este campo se almacenara el ID de la persona solicitante';
          controleg_solvencia          usr_controleg    false    228            �           0    0 6   COLUMN solicitud_solvencia_fiscal.per_codigo_apoderado    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.per_codigo_apoderado IS 'Id de la persona que es apoderado de la solicitud de solvencia fiscal';
          controleg_solvencia          usr_controleg    false    228            �           0    0 /   COLUMN solicitud_solvencia_fiscal.tipsol_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.tipsol_codigo IS 'llave foranea a la tabla de tipo solicitante';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.lug_codigo    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.lug_codigo IS 'campo que relaciona la tabla con la tabla lugar';
          controleg_solvencia          usr_controleg    false    228            �           0    0 /   COLUMN solicitud_solvencia_fiscal.motsol_codigo    COMMENT     x   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.motsol_codigo IS 'llave foranea a la tabla de motivo';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ent_codigo    COMMENT     o   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ent_codigo IS 'Id de la entidad solicitante';
          controleg_solvencia          usr_controleg    false    228            �           0    0 6   COLUMN solicitud_solvencia_fiscal.lug_codigo_apoderado    COMMENT     ~   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.lug_codigo_apoderado IS 'campo foranea a la tabla de lugar';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_estado    COMMENT     v   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.ssf_estado IS 'estado de la solicitud de solvencia';
          controleg_solvencia          usr_controleg    false    228            �           0    0 2   COLUMN solicitud_solvencia_fiscal.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_solvencia          usr_controleg    false    228            �           0    0 6   COLUMN solicitud_solvencia_fiscal.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_solvencia          usr_controleg    false    228            �           0    0 .   COLUMN solicitud_solvencia_fiscal.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_solvencia          usr_controleg    false    228            �           0    0 0   COLUMN solicitud_solvencia_fiscal.fecha_registro    COMMENT     e   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.fecha_registro IS 'Fecha registro';
          controleg_solvencia          usr_controleg    false    228            �           0    0 4   COLUMN solicitud_solvencia_fiscal.fecha_modificacion    COMMENT     m   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.fecha_modificacion IS 'Fecha modificacion';
          controleg_solvencia          usr_controleg    false    228            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.fecha_baja    COMMENT     ]   COMMENT ON COLUMN controleg_solvencia.solicitud_solvencia_fiscal.fecha_baja IS 'Fecha baja';
          controleg_solvencia          usr_controleg    false    228            �           0    0     TABLE solicitud_solvencia_fiscal    ACL     i   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_solvencia.solicitud_solvencia_fiscal TO usr_controleg_app;
          controleg_solvencia          usr_controleg    false    228                       1259    17284    departamento    TABLE     l  CREATE TABLE controleg_ubicacion.departamento (
    dep_codigo integer NOT NULL,
    dep_codigo_ine character varying NOT NULL,
    dep_orden integer NOT NULL,
    dep_abreviacion character varying NOT NULL,
    dep_nombre character varying NOT NULL,
    dep_descripcion character varying,
    dep_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 -   DROP TABLE controleg_ubicacion.departamento;
       controleg_ubicacion         heap    usr_controleg    false    5            �           0    0    TABLE departamento    COMMENT     �   COMMENT ON TABLE controleg_ubicacion.departamento IS 'Tabla para el registro de departamentos, la delimitacion administrativa politica esta basada en datos del INE https://www.ine.gob.bo/index.php/bolivia/aspectos-politicos-y-administrativos/';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 "   COLUMN departamento.dep_codigo_ine    COMMENT        COMMENT ON COLUMN controleg_ubicacion.departamento.dep_codigo_ine IS 'Identificador otorgado por el INE para el departamento';
          controleg_ubicacion          usr_controleg    false    268            �           0    0    COLUMN departamento.dep_orden    COMMENT     ^   COMMENT ON COLUMN controleg_ubicacion.departamento.dep_orden IS 'Ordenador del departamento';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 #   COLUMN departamento.dep_abreviacion    COMMENT     g   COMMENT ON COLUMN controleg_ubicacion.departamento.dep_abreviacion IS 'Abreviacion del departamento.';
          controleg_ubicacion          usr_controleg    false    268            �           0    0    COLUMN departamento.dep_nombre    COMMENT     \   COMMENT ON COLUMN controleg_ubicacion.departamento.dep_nombre IS 'Nombre del departamento';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 #   COLUMN departamento.dep_descripcion    COMMENT     g   COMMENT ON COLUMN controleg_ubicacion.departamento.dep_descripcion IS 'Descripcion del departamento.';
          controleg_ubicacion          usr_controleg    false    268            �           0    0    COLUMN departamento.dep_estado    COMMENT     Y   COMMENT ON COLUMN controleg_ubicacion.departamento.dep_estado IS 'Estado del registro.';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 $   COLUMN departamento.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.departamento.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 (   COLUMN departamento.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.departamento.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_ubicacion          usr_controleg    false    268            �           0    0     COLUMN departamento.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.departamento.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 "   COLUMN departamento.fecha_registro    COMMENT     W   COMMENT ON COLUMN controleg_ubicacion.departamento.fecha_registro IS 'Fecha registro';
          controleg_ubicacion          usr_controleg    false    268            �           0    0 &   COLUMN departamento.fecha_modificacion    COMMENT     _   COMMENT ON COLUMN controleg_ubicacion.departamento.fecha_modificacion IS 'Fecha modificacion';
          controleg_ubicacion          usr_controleg    false    268            �           0    0    COLUMN departamento.fecha_baja    COMMENT     O   COMMENT ON COLUMN controleg_ubicacion.departamento.fecha_baja IS 'Fecha baja';
          controleg_ubicacion          usr_controleg    false    268            �           0    0    TABLE departamento    ACL     [   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_ubicacion.departamento TO usr_controleg_app;
          controleg_ubicacion          usr_controleg    false    268                       1259    18913    juzgado    TABLE     0  CREATE TABLE controleg_ubicacion.juzgado (
    juz_codigo integer NOT NULL,
    juz_nombre character varying NOT NULL,
    juz_descripcion character varying,
    dep_codigo integer,
    pro_codigo integer,
    mun_codigo integer,
    juz_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 (   DROP TABLE controleg_ubicacion.juzgado;
       controleg_ubicacion         heap    usr_controleg    false    5            �           0    0    TABLE juzgado    COMMENT     �   COMMENT ON TABLE controleg_ubicacion.juzgado IS 'Tabla para registrar los guzgados que se tienen registrados para los procesos.';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.juz_nombre    COMMENT     R   COMMENT ON COLUMN controleg_ubicacion.juzgado.juz_nombre IS 'Nombre del juzgado';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.juz_descripcion    COMMENT     z   COMMENT ON COLUMN controleg_ubicacion.juzgado.juz_descripcion IS 'Campo que hace referencia a la descripcion de juzgado';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.dep_codigo    COMMENT     y   COMMENT ON COLUMN controleg_ubicacion.juzgado.dep_codigo IS 'Referencia al departamento en que el juzgado se encuentra';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.pro_codigo    COMMENT     {   COMMENT ON COLUMN controleg_ubicacion.juzgado.pro_codigo IS 'Referencia a la provincia en la que el juzgado se encuentra';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.mun_codigo    COMMENT     v   COMMENT ON COLUMN controleg_ubicacion.juzgado.mun_codigo IS 'Referencia al municipio donde esta ubicado el juzgado.';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.juzgado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_ubicacion          usr_controleg    false    272            �           0    0 #   COLUMN juzgado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.juzgado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.juzgado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.fecha_registro    COMMENT     R   COMMENT ON COLUMN controleg_ubicacion.juzgado.fecha_registro IS 'Fecha registro';
          controleg_ubicacion          usr_controleg    false    272            �           0    0 !   COLUMN juzgado.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN controleg_ubicacion.juzgado.fecha_modificacion IS 'Fecha modificacion';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    COLUMN juzgado.fecha_baja    COMMENT     J   COMMENT ON COLUMN controleg_ubicacion.juzgado.fecha_baja IS 'Fecha baja';
          controleg_ubicacion          usr_controleg    false    272            �           0    0    TABLE juzgado    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_ubicacion.juzgado TO usr_controleg_app;
          controleg_ubicacion          usr_controleg    false    272                       1259    17316 	   municipio    TABLE     �  CREATE TABLE controleg_ubicacion.municipio (
    mun_codigo integer NOT NULL,
    mun_codigo_ine character varying NOT NULL,
    mun_orden integer NOT NULL,
    mun_abreviacion character varying NOT NULL,
    mun_nombre character varying NOT NULL,
    mun_nombre_complementario character varying,
    mun_seccion character varying,
    mun_descripcion character varying,
    dep_codigo integer NOT NULL,
    pro_codigo integer NOT NULL,
    mun_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE controleg_ubicacion.municipio;
       controleg_ubicacion         heap    usr_controleg    false    5            �           0    0    TABLE municipio    COMMENT     �   COMMENT ON TABLE controleg_ubicacion.municipio IS 'Tabla para el registro de municipios, la delimitacion administrativa politica esta basada en datos del INE https://www.ine.gob.bo/index.php/bolivia/aspectos-politicos-y-administrativos/';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.mun_codigo_ine    COMMENT     y   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_codigo_ine IS 'Identificador otorgado por el INE para la municipio';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.mun_orden    COMMENT     V   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_orden IS 'Ordenador de la tabla';
          controleg_ubicacion          usr_controleg    false    270            �           0    0     COLUMN municipio.mun_abreviacion    COMMENT     a   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_abreviacion IS 'Abreviacion del municipio.';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.mun_nombre    COMMENT     Y   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_nombre IS 'Nombre del departamento';
          controleg_ubicacion          usr_controleg    false    270            �           0    0 *   COLUMN municipio.mun_nombre_complementario    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_nombre_complementario IS 'Nombre adicional o complementario al nombre del municipio';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.mun_seccion    COMMENT     y   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_seccion IS 'Nombre de la seccion a la que pertenecese el minicipio';
          controleg_ubicacion          usr_controleg    false    270            �           0    0     COLUMN municipio.mun_descripcion    COMMENT     d   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_descripcion IS 'Descripcion del departamento.';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.dep_codigo    COMMENT     |   COMMENT ON COLUMN controleg_ubicacion.municipio.dep_codigo IS 'Referencia la departamento donde esta ubicado el municipio';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.pro_codigo    COMMENT     {   COMMENT ON COLUMN controleg_ubicacion.municipio.pro_codigo IS 'Referencia a la provincia a la que pertenece el municipio';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.mun_estado    COMMENT     V   COMMENT ON COLUMN controleg_ubicacion.municipio.mun_estado IS 'Estado del registro.';
          controleg_ubicacion          usr_controleg    false    270            �           0    0 !   COLUMN municipio.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.municipio.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_ubicacion          usr_controleg    false    270            �           0    0 %   COLUMN municipio.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.municipio.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.municipio.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.fecha_registro    COMMENT     T   COMMENT ON COLUMN controleg_ubicacion.municipio.fecha_registro IS 'Fecha registro';
          controleg_ubicacion          usr_controleg    false    270            �           0    0 #   COLUMN municipio.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN controleg_ubicacion.municipio.fecha_modificacion IS 'Fecha modificacion';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    COLUMN municipio.fecha_baja    COMMENT     L   COMMENT ON COLUMN controleg_ubicacion.municipio.fecha_baja IS 'Fecha baja';
          controleg_ubicacion          usr_controleg    false    270            �           0    0    TABLE municipio    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_ubicacion.municipio TO usr_controleg_app;
          controleg_ubicacion          usr_controleg    false    270                       1259    17300 	   provincia    TABLE     �  CREATE TABLE controleg_ubicacion.provincia (
    pro_codigo integer NOT NULL,
    pro_codigo_ine character varying NOT NULL,
    pro_orden integer NOT NULL,
    pro_abreviacion character varying NOT NULL,
    pro_nombre character varying NOT NULL,
    pro_descripcion character varying,
    dep_codigo integer NOT NULL,
    pro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE controleg_ubicacion.provincia;
       controleg_ubicacion         heap    usr_controleg    false    5            �           0    0    TABLE provincia    COMMENT     �   COMMENT ON TABLE controleg_ubicacion.provincia IS 'Tabla para el registro de provincias, la delimitacion administrativa politica esta basada en datos del INE https://www.ine.gob.bo/index.php/bolivia/aspectos-politicos-y-administrativos/';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.pro_codigo_ine    COMMENT     y   COMMENT ON COLUMN controleg_ubicacion.provincia.pro_codigo_ine IS 'Identificador otorgado por el INE para la provincia';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.pro_orden    COMMENT     V   COMMENT ON COLUMN controleg_ubicacion.provincia.pro_orden IS 'Ordenador de la tabla';
          controleg_ubicacion          usr_controleg    false    269            �           0    0     COLUMN provincia.pro_abreviacion    COMMENT     c   COMMENT ON COLUMN controleg_ubicacion.provincia.pro_abreviacion IS 'Abreviacion de la provincia.';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.pro_nombre    COMMENT     Y   COMMENT ON COLUMN controleg_ubicacion.provincia.pro_nombre IS 'Nombre del departamento';
          controleg_ubicacion          usr_controleg    false    269            �           0    0     COLUMN provincia.pro_descripcion    COMMENT     a   COMMENT ON COLUMN controleg_ubicacion.provincia.pro_descripcion IS 'Descripcion del municipio.';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.dep_codigo    COMMENT     {   COMMENT ON COLUMN controleg_ubicacion.provincia.dep_codigo IS 'Referencia al departamento al que pertenece la provincia.';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.pro_estado    COMMENT     V   COMMENT ON COLUMN controleg_ubicacion.provincia.pro_estado IS 'Estado del registro.';
          controleg_ubicacion          usr_controleg    false    269            �           0    0 !   COLUMN provincia.usuario_registro    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.provincia.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          controleg_ubicacion          usr_controleg    false    269            �           0    0 %   COLUMN provincia.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.provincia.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.usuario_baja    COMMENT     �   COMMENT ON COLUMN controleg_ubicacion.provincia.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.fecha_registro    COMMENT     T   COMMENT ON COLUMN controleg_ubicacion.provincia.fecha_registro IS 'Fecha registro';
          controleg_ubicacion          usr_controleg    false    269            �           0    0 #   COLUMN provincia.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN controleg_ubicacion.provincia.fecha_modificacion IS 'Fecha modificacion';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    COLUMN provincia.fecha_baja    COMMENT     L   COMMENT ON COLUMN controleg_ubicacion.provincia.fecha_baja IS 'Fecha baja';
          controleg_ubicacion          usr_controleg    false    269            �           0    0    TABLE provincia    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE controleg_ubicacion.provincia TO usr_controleg_app;
          controleg_ubicacion          usr_controleg    false    269            �            1259    16815    acceso    TABLE     �  CREATE TABLE dictamen.acceso (
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
       dictamen         heap    usr_controleg    false    4            �           0    0    TABLE acceso    COMMENT     s   COMMENT ON TABLE dictamen.acceso IS 'tabla donde se almacenara la lista de los accesos permitidos a los archivos';
          dictamen          usr_controleg    false    234            �           0    0    COLUMN acceso.acc_codigo    COMMENT     i   COMMENT ON COLUMN dictamen.acceso.acc_codigo IS 'Campo donde se almacena la llave primaria de la tabla';
          dictamen          usr_controleg    false    234            �           0    0    COLUMN acceso.acc_plazo    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_plazo IS 'campo donde se almacenra el registro de la cantidad de dias que tiene plazo la persona para ingresar al url';
          dictamen          usr_controleg    false    234            �           0    0    COLUMN acceso.acc_qr    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_qr IS 'campo donde se almacenara la direccion generada para poder visualizar el archivo';
          dictamen          usr_controleg    false    234            �           0    0 $   COLUMN acceso.acc_cantidad_descargas    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_cantidad_descargas IS 'campo que almacenara la cantidad de descargas que se puede realizar para el archivo';
          dictamen          usr_controleg    false    234            �           0    0    COLUMN acceso.dic_codigo    COMMENT     V   COMMENT ON COLUMN dictamen.acceso.dic_codigo IS 'Llave foranea de la tabla dictamen';
          dictamen          usr_controleg    false    234            �           0    0    COLUMN acceso.acc_estado    COMMENT     S   COMMENT ON COLUMN dictamen.acceso.acc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    234            �           0    0    TABLE acceso    ACL     J   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.acceso TO usr_controleg_app;
          dictamen          usr_controleg    false    234            �            1259    16767    catalogo_general    TABLE     4  CREATE TABLE dictamen.catalogo_general (
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
       dictamen         heap    usr_controleg    false    4            �           0    0 %   COLUMN catalogo_general.catgen_estado    COMMENT     `   COMMENT ON COLUMN dictamen.catalogo_general.catgen_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    231            �           0    0    TABLE catalogo_general    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.catalogo_general TO usr_controleg_app;
          dictamen          usr_controleg    false    231            �            1259    16828    descarga    TABLE       CREATE TABLE dictamen.descarga (
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
       dictamen         heap    usr_controleg    false    4            �           0    0    TABLE descarga    COMMENT     �   COMMENT ON TABLE dictamen.descarga IS 'tabla donde se almacenara un los registros de las descargas realizadas por los usuarios';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.des_codigo    COMMENT     P   COMMENT ON COLUMN dictamen.descarga.des_codigo IS 'llave primaria de la tabla';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.des_numero    COMMENT     k   COMMENT ON COLUMN dictamen.descarga.des_numero IS 'campo que almacena el numero de la descarga realizada';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.des_fecha    COMMENT     d   COMMENT ON COLUMN dictamen.descarga.des_fecha IS 'campo donde se almacena la fecha de la descarga';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.per_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.descarga.per_codigo IS 'llave foranea a la tabla de persona';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.inf_codigo    COMMENT     V   COMMENT ON COLUMN dictamen.descarga.inf_codigo IS 'llave foranea a la tabla informe';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.acc_codigo    COMMENT     X   COMMENT ON COLUMN dictamen.descarga.acc_codigo IS 'llave foranea a la tabla de acceso';
          dictamen          usr_controleg    false    235            �           0    0    COLUMN descarga.des_estado    COMMENT     U   COMMENT ON COLUMN dictamen.descarga.des_estado IS 'llave foranea a la tabal estado';
          dictamen          usr_controleg    false    235            �           0    0    TABLE descarga    ACL     L   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.descarga TO usr_controleg_app;
          dictamen          usr_controleg    false    235            �            1259    16755    dictamen    TABLE     �  CREATE TABLE dictamen.dictamen (
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
       dictamen         heap    usr_controleg    false    4            �           0    0    TABLE dictamen    COMMENT     p   COMMENT ON TABLE dictamen.dictamen IS 'Tabla donde se almacenara los dictamenes registrados por el area legal';
          dictamen          usr_controleg    false    230                        0    0    COLUMN dictamen.dic_codigo    COMMENT     W   COMMENT ON COLUMN dictamen.dictamen.dic_codigo IS 'identifcador de la tabla dictamen';
          dictamen          usr_controleg    false    230                       0    0    COLUMN dictamen.dic_gestion    COMMENT     h   COMMENT ON COLUMN dictamen.dictamen.dic_gestion IS 'Campo donde se almacenara la gestion del dictamen';
          dictamen          usr_controleg    false    230                       0    0    COLUMN dictamen.dic_numero    COMMENT     e   COMMENT ON COLUMN dictamen.dictamen.dic_numero IS 'campo donde se almancera el numero del dictamen';
          dictamen          usr_controleg    false    230                       0    0 $   COLUMN dictamen.dic_nombre_auditoria    COMMENT     v   COMMENT ON COLUMN dictamen.dictamen.dic_nombre_auditoria IS 'campo donde se almacenera los nombre de las auditorias';
          dictamen          usr_controleg    false    230                       0    0    COLUMN dictamen.dic_observacion    COMMENT     o   COMMENT ON COLUMN dictamen.dictamen.dic_observacion IS 'campo donde se almancena la observacion del registro';
          dictamen          usr_controleg    false    230                       0    0    COLUMN dictamen.ent_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.ent_codigo IS 'campo donde se almacenara el Id de la Entidad a la cual pertenece el dictamen';
          dictamen          usr_controleg    false    230                       0    0    COLUMN dictamen.dic_estado    COMMENT     X   COMMENT ON COLUMN dictamen.dictamen.dic_estado IS 'llave foranea a la tabla de estado';
          dictamen          usr_controleg    false    230                       0    0     COLUMN dictamen.usuario_registro    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_registro IS 'campo donde se almacenara el  id del usuario que realizo el registro';
          dictamen          usr_controleg    false    230                       0    0    COLUMN dictamen.fecha_registro    COMMENT     r   COMMENT ON COLUMN dictamen.dictamen.fecha_registro IS 'Fecha de registro de la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    230            	           0    0 $   COLUMN dictamen.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_modificacion IS 'campo donde se almacera el id de usuario que realizo la modificacion del registro';
          dictamen          usr_controleg    false    230            
           0    0    COLUMN dictamen.usuario_baja    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_baja IS 'campo donde se almacera el id de usuario que realizo la eliminacion del registro';
          dictamen          usr_controleg    false    230                       0    0    TABLE dictamen    ACL     L   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.dictamen TO usr_controleg_app;
          dictamen          usr_controleg    false    230            �            1259    16861    dictamen_archivo    TABLE       CREATE TABLE dictamen.dictamen_archivo (
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
       dictamen         heap    usr_controleg    false    4                       0    0    TABLE dictamen_archivo    COMMENT        COMMENT ON TABLE dictamen.dictamen_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados del dictamen';
          dictamen          usr_controleg    false    238                       0    0 %   COLUMN dictamen_archivo.dicarc_codigo    COMMENT     [   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    238                       0    0 #   COLUMN dictamen_archivo.dicarc_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    238                       0    0 %   COLUMN dictamen_archivo.dicarc_nombre    COMMENT     p   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    238                       0    0 #   COLUMN dictamen_archivo.dicarc_mime    COMMENT     g   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    238                       0    0 *   COLUMN dictamen_archivo.dicarc_descripcion    COMMENT     {   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    238                       0    0 "   COLUMN dictamen_archivo.dic_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen_archivo.dic_codigo IS 'Campo donde se almacenara el id del dictamen a cual esta relacionado el archivo';
          dictamen          usr_controleg    false    238                       0    0 %   COLUMN dictamen_archivo.dicarc_estado    COMMENT     `   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    238                       0    0    TABLE dictamen_archivo    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.dictamen_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    238            �            1259    16804    informe    TABLE     �  CREATE TABLE dictamen.informe (
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
       dictamen         heap    usr_controleg    false    4                       0    0    TABLE informe    COMMENT     M   COMMENT ON TABLE dictamen.informe IS 'Informes relacionados en un dictamen';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.inf_codigo    COMMENT     R   COMMENT ON COLUMN dictamen.informe.inf_codigo IS 'identificador único de tabla';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.inf_gestion    COMMENT     u   COMMENT ON COLUMN dictamen.informe.inf_gestion IS 'Campo donde se almacenara el registro de la gestion del informe';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.inf_numero    COMMENT     c   COMMENT ON COLUMN dictamen.informe.inf_numero IS 'campo donde se almacenara el numero de informe';
          dictamen          usr_controleg    false    233                       0    0 !   COLUMN informe.inf_codigo_informe    COMMENT     f   COMMENT ON COLUMN dictamen.informe.inf_codigo_informe IS 'Esta campo almacena el codigo del informe';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.inf_dep_codigo    COMMENT     s   COMMENT ON COLUMN dictamen.informe.inf_dep_codigo IS 'departamento donde se realizo el registro del departamento';
          dictamen          usr_controleg    false    233                       0    0     COLUMN informe.inf_unidad_codigo    COMMENT     k   COMMENT ON COLUMN dictamen.informe.inf_unidad_codigo IS 'unidad donde se realizo el registro del informe';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.dic_codigo    COMMENT     d   COMMENT ON COLUMN dictamen.informe.dic_codigo IS 'identificador secuancial de tabla dictamen - FK';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.tipinf_dominio    COMMENT     p   COMMENT ON COLUMN dictamen.informe.tipinf_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.tipinf_codigo    COMMENT     v   COMMENT ON COLUMN dictamen.informe.tipinf_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_controleg    false    233                       0    0    COLUMN informe.sti_dominio    COMMENT     m   COMMENT ON COLUMN dictamen.informe.sti_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_controleg    false    233                        0    0    COLUMN informe.sti_codigo    COMMENT     s   COMMENT ON COLUMN dictamen.informe.sti_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_controleg    false    233            !           0    0    COLUMN informe.inf_estado    COMMENT     T   COMMENT ON COLUMN dictamen.informe.inf_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    233            "           0    0    COLUMN informe.usuario_registro    COMMENT     ~   COMMENT ON COLUMN dictamen.informe.usuario_registro IS 'Codigo de usuario que actualiza la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    233            #           0    0    COLUMN informe.fecha_registro    COMMENT     q   COMMENT ON COLUMN dictamen.informe.fecha_registro IS 'Fecha de registro de la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    233            $           0    0 #   COLUMN informe.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.informe.usuario_modificacion IS 'Codigo de usuario que actualiza la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    233            %           0    0 !   COLUMN informe.fecha_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.informe.fecha_modificacion IS 'Fecha de actualizacion del registro de solicitud - columna de auditoria';
          dictamen          usr_controleg    false    233            &           0    0    COLUMN informe.usuario_baja    COMMENT     �   COMMENT ON COLUMN dictamen.informe.usuario_baja IS 'Codigo de usuario que hace la baja logica la solicitud - columna de auditoria';
          dictamen          usr_controleg    false    233            '           0    0    COLUMN informe.fecha_baja    COMMENT     }   COMMENT ON COLUMN dictamen.informe.fecha_baja IS 'Fecha de la baja logica del registro de solicitud - columna de auditoria';
          dictamen          usr_controleg    false    233            (           0    0    TABLE informe    ACL     K   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.informe TO usr_controleg_app;
          dictamen          usr_controleg    false    233            �            1259    16780    informe_archivo    TABLE       CREATE TABLE dictamen.informe_archivo (
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
       dictamen         heap    usr_controleg    false    4            )           0    0    TABLE informe_archivo    COMMENT     q   COMMENT ON TABLE dictamen.informe_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados';
          dictamen          usr_controleg    false    232            *           0    0 $   COLUMN informe_archivo.infarc_codigo    COMMENT     Z   COMMENT ON COLUMN dictamen.informe_archivo.infarc_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    232            +           0    0 "   COLUMN informe_archivo.infarc_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.informe_archivo.infarc_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    232            ,           0    0 $   COLUMN informe_archivo.infarc_nombre    COMMENT     o   COMMENT ON COLUMN dictamen.informe_archivo.infarc_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    232            -           0    0 "   COLUMN informe_archivo.infarc_mime    COMMENT     f   COMMENT ON COLUMN dictamen.informe_archivo.infarc_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    232            .           0    0 )   COLUMN informe_archivo.infarc_descripcion    COMMENT     z   COMMENT ON COLUMN dictamen.informe_archivo.infarc_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    232            /           0    0 !   COLUMN informe_archivo.inf_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.informe_archivo.inf_codigo IS 'Campo donde se almacenara el id del dictamen a cual esta relacionado el archivo';
          dictamen          usr_controleg    false    232            0           0    0 $   COLUMN informe_archivo.infarc_estado    COMMENT     _   COMMENT ON COLUMN dictamen.informe_archivo.infarc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    232            1           0    0    TABLE informe_archivo    ACL     S   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.informe_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    232            �            1259    16838    notificacion    TABLE     f  CREATE TABLE dictamen.notificacion (
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
       dictamen         heap    usr_controleg    false    4            2           0    0    TABLE notificacion    COMMENT     �   COMMENT ON TABLE dictamen.notificacion IS 'Tabla donde se almacenara el registro de las notificaciones realizadas de un acceso';
          dictamen          usr_controleg    false    236            3           0    0    COLUMN notificacion.acc_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.notificacion.acc_codigo IS 'llave foranea a la tabla acceso';
          dictamen          usr_controleg    false    236            4           0    0    COLUMN notificacion.not_correo    COMMENT     �   COMMENT ON COLUMN dictamen.notificacion.not_correo IS 'campo donde se almacenara los correos a los cuales fueron notificados los accesos';
          dictamen          usr_controleg    false    236            5           0    0    COLUMN notificacion.not_estado    COMMENT     Y   COMMENT ON COLUMN dictamen.notificacion.not_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    236            6           0    0    TABLE notificacion    ACL     P   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.notificacion TO usr_controleg_app;
          dictamen          usr_controleg    false    236            �            1259    16850    persona_dictamen    TABLE     .  CREATE TABLE dictamen.persona_dictamen (
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
       dictamen         heap    usr_controleg    false    4            7           0    0 %   COLUMN persona_dictamen.perdic_codigo    COMMENT     [   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_codigo IS 'llave primaria de la tabla';
          dictamen          usr_controleg    false    237            8           0    0 +   COLUMN persona_dictamen.perdic_notificacion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_notificacion IS 'campo donde se almacenara la bandera en caso de que a una persona ya se le haya realizado la notificacion';
          dictamen          usr_controleg    false    237            9           0    0 "   COLUMN persona_dictamen.inf_codigo    COMMENT     u   COMMENT ON COLUMN dictamen.persona_dictamen.inf_codigo IS 'codigo del informe al cual esta asociado el involucrado';
          dictamen          usr_controleg    false    237            :           0    0 &   COLUMN persona_dictamen.tipinv_dominio    COMMENT     y   COMMENT ON COLUMN dictamen.persona_dictamen.tipinv_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_controleg    false    237            ;           0    0 %   COLUMN persona_dictamen.tipinv_codigo    COMMENT        COMMENT ON COLUMN dictamen.persona_dictamen.tipinv_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_controleg    false    237            <           0    0 %   COLUMN persona_dictamen.perres_codigo    COMMENT     d   COMMENT ON COLUMN dictamen.persona_dictamen.perres_codigo IS 'Referencia a la persona responsable';
          dictamen          usr_controleg    false    237            =           0    0 "   COLUMN persona_dictamen.per_codigo    COMMENT     ^   COMMENT ON COLUMN dictamen.persona_dictamen.per_codigo IS 'llave foranea a la tabla persona';
          dictamen          usr_controleg    false    237            >           0    0 %   COLUMN persona_dictamen.perjur_codigo    COMMENT     h   COMMENT ON COLUMN dictamen.persona_dictamen.perjur_codigo IS 'llave fonaea a la tala persona juridica';
          dictamen          usr_controleg    false    237            ?           0    0 %   COLUMN persona_dictamen.empuni_codigo    COMMENT     m   COMMENT ON COLUMN dictamen.persona_dictamen.empuni_codigo IS 'clave foranea a la tabla empresa unipersonal';
          dictamen          usr_controleg    false    237            @           0    0 %   COLUMN persona_dictamen.perdic_estado    COMMENT     S   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_estado IS 'estado de la tabla';
          dictamen          usr_controleg    false    237            A           0    0    TABLE persona_dictamen    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.persona_dictamen TO usr_controleg_app;
          dictamen          usr_controleg    false    237            �            1259    16873    persona_dictamen_archivo    TABLE     
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
       dictamen         heap    usr_controleg    false    4            B           0    0    TABLE persona_dictamen_archivo    COMMENT     q   COMMENT ON TABLE dictamen.persona_dictamen_archivo IS 'Tabla donde se almacenara archivos de persona diactamen';
          dictamen          usr_controleg    false    239            C           0    0 *   COLUMN persona_dictamen_archivo.pda_codigo    COMMENT     `   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    239            D           0    0 (   COLUMN persona_dictamen_archivo.pda_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_ruta IS 'Campo donde se almacenara la ruta del archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    239            E           0    0 (   COLUMN persona_dictamen_archivo.pda_hash    COMMENT     i   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_hash IS 'representacion unívoca de un archivo';
          dictamen          usr_controleg    false    239            F           0    0 *   COLUMN persona_dictamen_archivo.pda_nombre    COMMENT     u   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    239            G           0    0 (   COLUMN persona_dictamen_archivo.pda_mime    COMMENT     l   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    239            H           0    0 /   COLUMN persona_dictamen_archivo.pda_descripcion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    239            I           0    0 -   COLUMN persona_dictamen_archivo.perdic_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.perdic_codigo IS 'Campo donde se almacenara el id de persona_dictamen a cual esta relacionado el archivo';
          dictamen          usr_controleg    false    239            J           0    0 *   COLUMN persona_dictamen_archivo.pda_estado    COMMENT     e   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    239            K           0    0    TABLE persona_dictamen_archivo    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.persona_dictamen_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    239            �            1259    16885    proceso_entidad    TABLE       CREATE TABLE dictamen.proceso_entidad (
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
       dictamen         heap    usr_controleg    false    4            L           0    0    TABLE proceso_entidad    COMMENT     �   COMMENT ON TABLE dictamen.proceso_entidad IS 'tabla donde se almacenara el registro de inicio de acciones remitida a una entidad';
          dictamen          usr_controleg    false    240            M           0    0 $   COLUMN proceso_entidad.proent_codigo    COMMENT     Z   COMMENT ON COLUMN dictamen.proceso_entidad.proent_codigo IS 'llave primaria de la tabla';
          dictamen          usr_controleg    false    240            N           0    0 ,   COLUMN proceso_entidad.proent_fecha_remision    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_fecha_remision IS 'fecha de cuando se realizo la remision de la nota de inicio de acciones';
          dictamen          usr_controleg    false    240            O           0    0 +   COLUMN proceso_entidad.proent_inicio_accion    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_inicio_accion IS 'bandera para señalar que la entidad realizo el inicio de acciones';
          dictamen          usr_controleg    false    240            P           0    0 *   COLUMN proceso_entidad.proent_fecha_accion    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_fecha_accion IS 'campo donde se almacena la fecha cuando se inicio las acciones';
          dictamen          usr_controleg    false    240            Q           0    0 !   COLUMN proceso_entidad.proent_dep    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_dep IS 'campo donde se almacenara el campo del departamento donde se remitio la nota de inicio de acciones';
          dictamen          usr_controleg    false    240            R           0    0 )   COLUMN proceso_entidad.proent_observacion    COMMENT     g   COMMENT ON COLUMN dictamen.proceso_entidad.proent_observacion IS 'observacion del registro realizado';
          dictamen          usr_controleg    false    240            S           0    0 !   COLUMN proceso_entidad.dic_codigo    COMMENT     b   COMMENT ON COLUMN dictamen.proceso_entidad.dic_codigo IS 'llave foranea hacia la tabla dictamen';
          dictamen          usr_controleg    false    240            T           0    0    TABLE proceso_entidad    ACL     S   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.proceso_entidad TO usr_controleg_app;
          dictamen          usr_controleg    false    240            �            1259    16895    proceso_entidad_archivo    TABLE     	  CREATE TABLE dictamen.proceso_entidad_archivo (
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
       dictamen         heap    usr_controleg    false    4            U           0    0    TABLE proceso_entidad_archivo    COMMENT     y   COMMENT ON TABLE dictamen.proceso_entidad_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados';
          dictamen          usr_controleg    false    241            V           0    0 )   COLUMN proceso_entidad_archivo.pea_codigo    COMMENT     _   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_controleg    false    241            W           0    0 '   COLUMN proceso_entidad_archivo.pea_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_controleg    false    241            X           0    0 )   COLUMN proceso_entidad_archivo.pea_nombre    COMMENT     t   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_controleg    false    241            Y           0    0 '   COLUMN proceso_entidad_archivo.pea_mime    COMMENT     k   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_controleg    false    241            Z           0    0 .   COLUMN proceso_entidad_archivo.pea_descripcion    COMMENT        COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_controleg    false    241            [           0    0 ,   COLUMN proceso_entidad_archivo.proent_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.proent_codigo IS 'Campo donde se almacenara el id del proceso entidad registrado';
          dictamen          usr_controleg    false    241            \           0    0 )   COLUMN proceso_entidad_archivo.pea_estado    COMMENT     d   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_controleg    false    241            ]           0    0    TABLE proceso_entidad_archivo    ACL     [   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.proceso_entidad_archivo TO usr_controleg_app;
          dictamen          usr_controleg    false    241            �            1259    16623    documento_representante_tipo    TABLE     �  CREATE TABLE parametricas.documento_representante_tipo (
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
       parametricas         heap    usr_controleg    false    9            ^           0    0 3   COLUMN documento_representante_tipo.drt_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.drt_descripcion IS 'descripcion del tipo de documento de representate';
          parametricas          usr_controleg    false    222            _           0    0 3   COLUMN documento_representante_tipo.drt_observacion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.drt_observacion IS 'observacion del registro de tipo de documento representante';
          parametricas          usr_controleg    false    222            `           0    0 4   COLUMN documento_representante_tipo.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    222            a           0    0 8   COLUMN documento_representante_tipo.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    222            b           0    0 0   COLUMN documento_representante_tipo.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    222            c           0    0 2   COLUMN documento_representante_tipo.fecha_registro    COMMENT     `   COMMENT ON COLUMN parametricas.documento_representante_tipo.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    222            d           0    0 6   COLUMN documento_representante_tipo.fecha_modificacion    COMMENT     h   COMMENT ON COLUMN parametricas.documento_representante_tipo.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    222            e           0    0 .   COLUMN documento_representante_tipo.fecha_baja    COMMENT     X   COMMENT ON COLUMN parametricas.documento_representante_tipo.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    222            f           0    0 "   TABLE documento_representante_tipo    ACL     d   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.documento_representante_tipo TO usr_controleg_app;
          parametricas          usr_controleg    false    222            �            1259    16698    estado_clasificacion    TABLE     h  CREATE TABLE parametricas.estado_clasificacion (
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
       parametricas         heap    usr_controleg    false    9            g           0    0    TABLE estado_clasificacion    COMMENT     �   COMMENT ON TABLE parametricas.estado_clasificacion IS 'Tabla para clasificar las los estados por tipo de procesos, dictamenes y cargos y las etapas dentro de estos grupos.';
          parametricas          usr_controleg    false    226            h           0    0 )   COLUMN estado_clasificacion.estcla_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.estado_clasificacion.estcla_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    226            i           0    0 (   COLUMN estado_clasificacion.estcla_orden    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.estcla_orden IS 'Orden del estado, permitira ordenar los estados cuando se visualicen.';
          parametricas          usr_controleg    false    226            j           0    0 )   COLUMN estado_clasificacion.estcon_codigo    COMMENT     h   COMMENT ON COLUMN parametricas.estado_clasificacion.estcon_codigo IS 'Referencia al estado de control';
          parametricas          usr_controleg    false    226            k           0    0 )   COLUMN estado_clasificacion.esteta_codigo    COMMENT     j   COMMENT ON COLUMN parametricas.estado_clasificacion.esteta_codigo IS 'Referencia a la etapa del estado.';
          parametricas          usr_controleg    false    226            l           0    0 )   COLUMN estado_clasificacion.tippro_codigo    COMMENT     g   COMMENT ON COLUMN parametricas.estado_clasificacion.tippro_codigo IS 'Referencia al tipo de proceso.';
          parametricas          usr_controleg    false    226            m           0    0 )   COLUMN estado_clasificacion.tipres_codigo    COMMENT     z   COMMENT ON COLUMN parametricas.estado_clasificacion.tipres_codigo IS 'Referencia al tipo de responsabilidad del estado.';
          parametricas          usr_controleg    false    226            n           0    0 )   COLUMN estado_clasificacion.tipsan_codigo    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.tipsan_codigo IS 'Referencia al tipo de sancion con la que se agrupara al estado.';
          parametricas          usr_controleg    false    226            o           0    0 )   COLUMN estado_clasificacion.estcla_estado    COMMENT     \   COMMENT ON COLUMN parametricas.estado_clasificacion.estcla_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    226            p           0    0 ,   COLUMN estado_clasificacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    226            q           0    0 0   COLUMN estado_clasificacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    226            r           0    0 (   COLUMN estado_clasificacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estado_clasificacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    226            s           0    0 *   COLUMN estado_clasificacion.fecha_registro    COMMENT     X   COMMENT ON COLUMN parametricas.estado_clasificacion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    226            t           0    0 .   COLUMN estado_clasificacion.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN parametricas.estado_clasificacion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    226            u           0    0 &   COLUMN estado_clasificacion.fecha_baja    COMMENT     P   COMMENT ON COLUMN parametricas.estado_clasificacion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    226            v           0    0    TABLE estado_clasificacion    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estado_clasificacion TO usr_controleg_app;
          parametricas          usr_controleg    false    226            �            1259    16496    estado_control    TABLE     �  CREATE TABLE parametricas.estado_control (
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
       parametricas         heap    usr_controleg    false    9            w           0    0    TABLE estado_control    COMMENT     �   COMMENT ON TABLE parametricas.estado_control IS 'Tabla para registrar todos los estados que se usaran para controlar los procesos, dictamenes y cargos.';
          parametricas          usr_controleg    false    214            x           0    0 $   COLUMN estado_control.estcont_codigo    COMMENT     Z   COMMENT ON COLUMN parametricas.estado_control.estcont_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    214            y           0    0 #   COLUMN estado_control.estcon_nombre    COMMENT     T   COMMENT ON COLUMN parametricas.estado_control.estcon_nombre IS 'Nombre del estado';
          parametricas          usr_controleg    false    214            z           0    0 (   COLUMN estado_control.estcon_descripcion    COMMENT     ^   COMMENT ON COLUMN parametricas.estado_control.estcon_descripcion IS 'Descripcion del estado';
          parametricas          usr_controleg    false    214            {           0    0 #   COLUMN estado_control.estcon_estado    COMMENT     V   COMMENT ON COLUMN parametricas.estado_control.estcon_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    214            |           0    0 &   COLUMN estado_control.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estado_control.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    214            }           0    0 *   COLUMN estado_control.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_control.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    214            ~           0    0 "   COLUMN estado_control.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estado_control.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    214                       0    0 $   COLUMN estado_control.fecha_registro    COMMENT     R   COMMENT ON COLUMN parametricas.estado_control.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    214            �           0    0 (   COLUMN estado_control.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN parametricas.estado_control.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    214            �           0    0     COLUMN estado_control.fecha_baja    COMMENT     J   COMMENT ON COLUMN parametricas.estado_control.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    214            �           0    0    TABLE estado_control    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estado_control TO usr_controleg_app;
          parametricas          usr_controleg    false    214            �            1259    16682    estado_etapa    TABLE     T  CREATE TABLE parametricas.estado_etapa (
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
       parametricas         heap    usr_controleg    false    9            �           0    0    TABLE estado_etapa    COMMENT     g   COMMENT ON TABLE parametricas.estado_etapa IS 'Tabla para registrar todas las etapas de los estados.';
          parametricas          usr_controleg    false    225            �           0    0 !   COLUMN estado_etapa.esteta_codigo    COMMENT     W   COMMENT ON COLUMN parametricas.estado_etapa.esteta_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    225            �           0    0     COLUMN estado_etapa.esteta_orden    COMMENT     T   COMMENT ON COLUMN parametricas.estado_etapa.esteta_orden IS 'Orden de las etapas.';
          parametricas          usr_controleg    false    225            �           0    0 !   COLUMN estado_etapa.esteta_nombre    COMMENT     R   COMMENT ON COLUMN parametricas.estado_etapa.esteta_nombre IS 'Nombre del estado';
          parametricas          usr_controleg    false    225            �           0    0 $   COLUMN estado_etapa.esteta_solvencia    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.esteta_solvencia IS 'Determina si los registros dentro de la etapa se usara para mostrarlos en la solvencia.';
          parametricas          usr_controleg    false    225            �           0    0 &   COLUMN estado_etapa.esteta_descripcion    COMMENT     \   COMMENT ON COLUMN parametricas.estado_etapa.esteta_descripcion IS 'Descripcion del estado';
          parametricas          usr_controleg    false    225            �           0    0 !   COLUMN estado_etapa.esteta_estado    COMMENT     T   COMMENT ON COLUMN parametricas.estado_etapa.esteta_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    225            �           0    0 $   COLUMN estado_etapa.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    225            �           0    0 (   COLUMN estado_etapa.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    225            �           0    0     COLUMN estado_etapa.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estado_etapa.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    225            �           0    0 "   COLUMN estado_etapa.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.estado_etapa.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    225            �           0    0 &   COLUMN estado_etapa.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.estado_etapa.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    225            �           0    0    COLUMN estado_etapa.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.estado_etapa.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    225            �           0    0    TABLE estado_etapa    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estado_etapa TO usr_controleg_app;
          parametricas          usr_controleg    false    225            �            1259    16409    estados    TABLE     #  CREATE TABLE parametricas.estados (
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
       parametricas         heap    usr_controleg    false    9            �           0    0    COLUMN estados.est_codigo    COMMENT     O   COMMENT ON COLUMN parametricas.estados.est_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.est_nombre    COMMENT     n   COMMENT ON COLUMN parametricas.estados.est_nombre IS 'Nombre del estado, debe ser unico dentro del sistema.';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.est_descripcion    COMMENT     p   COMMENT ON COLUMN parametricas.estados.est_descripcion IS 'Campo que hace referencia a descripcion del estado';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.est_color    COMMENT     U   COMMENT ON COLUMN parametricas.estados.est_color IS 'Color hexadecimal del estado.';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.estados.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    208            �           0    0 #   COLUMN estados.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.estados.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.estados.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.fecha_registro    COMMENT     K   COMMENT ON COLUMN parametricas.estados.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    208            �           0    0 !   COLUMN estados.fecha_modificacion    COMMENT     S   COMMENT ON COLUMN parametricas.estados.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    208            �           0    0    COLUMN estados.fecha_baja    COMMENT     C   COMMENT ON COLUMN parametricas.estados.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    208            �           0    0    TABLE estados    ACL     O   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.estados TO usr_controleg_app;
          parametricas          usr_controleg    false    208            �            1259    16638    genero    TABLE     �  CREATE TABLE parametricas.genero (
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
       parametricas         heap    usr_controleg    false    9            �           0    0    COLUMN genero.gen_descripcion    COMMENT     o   COMMENT ON COLUMN parametricas.genero.gen_descripcion IS 'Campo que hace referencia a descripcion del genero';
          parametricas          usr_controleg    false    223            �           0    0    COLUMN genero.gen_abreviacion    COMMENT     n   COMMENT ON COLUMN parametricas.genero.gen_abreviacion IS 'Campo que hace referencia a abreviacion de genero';
          parametricas          usr_controleg    false    223            �           0    0    COLUMN genero.gen_mostrar    COMMENT     f   COMMENT ON COLUMN parametricas.genero.gen_mostrar IS 'Campo que hace referencia a mostrar el genero';
          parametricas          usr_controleg    false    223            �           0    0    COLUMN genero.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.genero.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    223            �           0    0 "   COLUMN genero.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.genero.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    223            �           0    0    COLUMN genero.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.genero.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    223            �           0    0    COLUMN genero.fecha_registro    COMMENT     J   COMMENT ON COLUMN parametricas.genero.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    223            �           0    0     COLUMN genero.fecha_modificacion    COMMENT     R   COMMENT ON COLUMN parametricas.genero.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    223            �           0    0    COLUMN genero.fecha_baja    COMMENT     B   COMMENT ON COLUMN parametricas.genero.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    223            �           0    0    TABLE genero    ACL     N   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.genero TO usr_controleg_app;
          parametricas          usr_controleg    false    223            �            1259    16538    lugar    TABLE     ?  CREATE TABLE parametricas.lugar (
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
       parametricas         heap    usr_controleg    false    9            �           0    0    COLUMN lugar.lug_nombre    COMMENT     G   COMMENT ON COLUMN parametricas.lugar.lug_nombre IS 'Nombre del lugar';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.lug_descripcion    COMMENT     l   COMMENT ON COLUMN parametricas.lugar.lug_descripcion IS 'Campo que hace referencia a descripcion de lugar';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.lug_abreviacion    COMMENT     l   COMMENT ON COLUMN parametricas.lugar.lug_abreviacion IS 'Campo que hace referencia a abreviacion de lugar';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.lug_nacional    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.lug_nacional IS 'Bandera que determina si el lugar definido es nacional o internacional.';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    216            �           0    0 !   COLUMN lugar.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.lugar.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.fecha_registro    COMMENT     I   COMMENT ON COLUMN parametricas.lugar.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.fecha_modificacion    COMMENT     Q   COMMENT ON COLUMN parametricas.lugar.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    216            �           0    0    COLUMN lugar.fecha_baja    COMMENT     A   COMMENT ON COLUMN parametricas.lugar.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    216            �           0    0    TABLE lugar    ACL     M   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.lugar TO usr_controleg_app;
          parametricas          usr_controleg    false    216            �            1259    16553    moneda    TABLE     �  CREATE TABLE parametricas.moneda (
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
       parametricas         heap    usr_controleg    false    9            �           0    0    COLUMN moneda.mon_descripcion    COMMENT     n   COMMENT ON COLUMN parametricas.moneda.mon_descripcion IS 'Campo que hace referencia a descripcion de moneda';
          parametricas          usr_controleg    false    217            �           0    0    COLUMN moneda.mon_abreviacion    COMMENT     n   COMMENT ON COLUMN parametricas.moneda.mon_abreviacion IS 'Campo que hace referencia a abreviacion de moneda';
          parametricas          usr_controleg    false    217            �           0    0    COLUMN moneda.mon_mostrar    COMMENT     c   COMMENT ON COLUMN parametricas.moneda.mon_mostrar IS 'Campo que hace referencia a mostrar moneda';
          parametricas          usr_controleg    false    217            �           0    0    COLUMN moneda.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.moneda.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    217            �           0    0 "   COLUMN moneda.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.moneda.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    217            �           0    0    COLUMN moneda.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.moneda.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    217            �           0    0    COLUMN moneda.fecha_registro    COMMENT     J   COMMENT ON COLUMN parametricas.moneda.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    217            �           0    0     COLUMN moneda.fecha_modificacion    COMMENT     R   COMMENT ON COLUMN parametricas.moneda.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    217            �           0    0    COLUMN moneda.fecha_baja    COMMENT     B   COMMENT ON COLUMN parametricas.moneda.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    217            �           0    0    TABLE moneda    ACL     N   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.moneda TO usr_controleg_app;
          parametricas          usr_controleg    false    217            �            1259    16595    motivo_solvencia    TABLE     �  CREATE TABLE parametricas.motivo_solvencia (
    motsol_codigo integer NOT NULL,
    motsol_descripcion character varying,
    motsol_observacion character varying,
    motsol_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE parametricas.motivo_solvencia;
       parametricas         heap    usr_controleg    false    9            �           0    0 %   COLUMN motivo_solvencia.motsol_codigo    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_codigo IS 'tabla donde se almacenara los motivos de la solicitud de solvencia';
          parametricas          usr_controleg    false    220            �           0    0 *   COLUMN motivo_solvencia.motsol_descripcion    COMMENT     n   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_descripcion IS 'despcripcion del motivo de solicitud';
          parametricas          usr_controleg    false    220            �           0    0 *   COLUMN motivo_solvencia.motsol_observacion    COMMENT     x   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_observacion IS 'observacion al registro de motivo de solicitud';
          parametricas          usr_controleg    false    220            �           0    0 %   COLUMN motivo_solvencia.motsol_estado    COMMENT     d   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_estado IS 'estado del registro de la tabla';
          parametricas          usr_controleg    false    220            �           0    0 (   COLUMN motivo_solvencia.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    220            �           0    0 ,   COLUMN motivo_solvencia.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    220            �           0    0 $   COLUMN motivo_solvencia.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    220            �           0    0 &   COLUMN motivo_solvencia.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.motivo_solvencia.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    220            �           0    0 *   COLUMN motivo_solvencia.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.motivo_solvencia.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    220            �           0    0 "   COLUMN motivo_solvencia.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.motivo_solvencia.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    220            �           0    0    TABLE motivo_solvencia    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.motivo_solvencia TO usr_controleg_app;
          parametricas          usr_controleg    false    220            �            1259    16713 	   operacion    TABLE       CREATE TABLE parametricas.operacion (
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
       parametricas         heap    usr_controleg    false    9            �           0    0    TABLE operacion    COMMENT     �   COMMENT ON TABLE parametricas.operacion IS 'Tabla para registrar los tipos de operaciones permitidos en el sistema de autenticacion. [Create, Read, Updte, Delete]';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.ope_codigo    COMMENT     Q   COMMENT ON COLUMN parametricas.operacion.ope_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.ope_sigla    COMMENT     Y   COMMENT ON COLUMN parametricas.operacion.ope_sigla IS 'Sigla identificadora del acceso';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.ope_nombre    COMMENT     L   COMMENT ON COLUMN parametricas.operacion.ope_nombre IS 'Nombre del acceso';
          parametricas          usr_controleg    false    227            �           0    0     COLUMN operacion.ope_descripcion    COMMENT     d   COMMENT ON COLUMN parametricas.operacion.ope_descripcion IS 'Descripcion o aclaracion del acceso.';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.ope_estado    COMMENT     N   COMMENT ON COLUMN parametricas.operacion.ope_estado IS 'Estado del registro';
          parametricas          usr_controleg    false    227            �           0    0 !   COLUMN operacion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.operacion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    227            �           0    0 %   COLUMN operacion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.operacion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.operacion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.fecha_registro    COMMENT     M   COMMENT ON COLUMN parametricas.operacion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    227            �           0    0 #   COLUMN operacion.fecha_modificacion    COMMENT     U   COMMENT ON COLUMN parametricas.operacion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    227            �           0    0    COLUMN operacion.fecha_baja    COMMENT     E   COMMENT ON COLUMN parametricas.operacion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    227            �           0    0    TABLE operacion    ACL     Q   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.operacion TO usr_controleg_app;
          parametricas          usr_controleg    false    227            �            1259    16454    sub_tipo_informe    TABLE     �  CREATE TABLE parametricas.sub_tipo_informe (
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
       parametricas         heap    usr_controleg    false    9            �           0    0 "   COLUMN sub_tipo_informe.sti_nombre    COMMENT     T   COMMENT ON COLUMN parametricas.sub_tipo_informe.sti_nombre IS 'Nombre del informe';
          parametricas          usr_controleg    false    211            �           0    0 '   COLUMN sub_tipo_informe.sti_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.sti_descripcion IS 'Campo que hace referencia a descripcion del sub tipo informe';
          parametricas          usr_controleg    false    211            �           0    0 (   COLUMN sub_tipo_informe.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    211            �           0    0 ,   COLUMN sub_tipo_informe.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    211            �           0    0 $   COLUMN sub_tipo_informe.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.sub_tipo_informe.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    211            �           0    0 &   COLUMN sub_tipo_informe.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.sub_tipo_informe.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    211            �           0    0 *   COLUMN sub_tipo_informe.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.sub_tipo_informe.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    211            �           0    0 "   COLUMN sub_tipo_informe.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.sub_tipo_informe.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    211            �           0    0    TABLE sub_tipo_informe    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.sub_tipo_informe TO usr_controleg_app;
          parametricas          usr_controleg    false    211            �            1259    16581    tipo_adjunto    TABLE     
  CREATE TABLE parametricas.tipo_adjunto (
    tipadj_codigo integer NOT NULL,
    tipadj_descripcion character varying,
    tipadj_tramite integer,
    tipadj_observacion character varying,
    tipadj_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 &   DROP TABLE parametricas.tipo_adjunto;
       parametricas         heap    usr_controleg    false    9            �           0    0 !   COLUMN tipo_adjunto.tipadj_codigo    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_codigo IS 'llave primaria de la tabla';
          parametricas          usr_controleg    false    219            �           0    0 &   COLUMN tipo_adjunto.tipadj_descripcion    COMMENT     e   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_descripcion IS 'descripcion del tipo de adjunto';
          parametricas          usr_controleg    false    219            �           0    0 "   COLUMN tipo_adjunto.tipadj_tramite    COMMENT     w   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_tramite IS 'codigo del tramite del cual podra ser el tipo adjunto';
          parametricas          usr_controleg    false    219            �           0    0 &   COLUMN tipo_adjunto.tipadj_observacion    COMMENT     q   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_observacion IS 'observacion al registro del tipo de adjunto';
          parametricas          usr_controleg    false    219            �           0    0 $   COLUMN tipo_adjunto.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_adjunto.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    219            �           0    0 (   COLUMN tipo_adjunto.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_adjunto.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    219            �           0    0     COLUMN tipo_adjunto.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_adjunto.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    219            �           0    0 "   COLUMN tipo_adjunto.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_adjunto.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    219            �           0    0 &   COLUMN tipo_adjunto.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_adjunto.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    219            �           0    0    COLUMN tipo_adjunto.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.tipo_adjunto.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    219            �           0    0    TABLE tipo_adjunto    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_adjunto TO usr_controleg_app;
          parametricas          usr_controleg    false    219                       1259    18899    tipo_documento    TABLE     '  CREATE TABLE parametricas.tipo_documento (
    tipdoc_codigo integer NOT NULL,
    tipdoc_nombre character varying NOT NULL,
    tipdoc_abreviacion character varying NOT NULL,
    tipdoc_descripcion character varying,
    tipdoc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 (   DROP TABLE parametricas.tipo_documento;
       parametricas         heap    usr_controleg    false    9            �           0    0 #   COLUMN tipo_documento.tipdoc_nombre    COMMENT     `   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_nombre IS 'Nombre del tipo de documento.';
          parametricas          usr_controleg    false    271            �           0    0 (   COLUMN tipo_documento.tipdoc_abreviacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_abreviacion IS 'Campo que hace referencia a abreviacion de tipo_documento';
          parametricas          usr_controleg    false    271            �           0    0 (   COLUMN tipo_documento.tipdoc_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_descripcion IS 'Campo que hace referencia a descripcion de tipo_documento';
          parametricas          usr_controleg    false    271            �           0    0 #   COLUMN tipo_documento.tipdoc_estado    COMMENT     W   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_estado IS 'Estado del registro.';
          parametricas          usr_controleg    false    271            �           0    0 &   COLUMN tipo_documento.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    271            �           0    0 *   COLUMN tipo_documento.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    271            �           0    0 "   COLUMN tipo_documento.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    271            �           0    0 $   COLUMN tipo_documento.fecha_registro    COMMENT     R   COMMENT ON COLUMN parametricas.tipo_documento.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    271            �           0    0 (   COLUMN tipo_documento.fecha_modificacion    COMMENT     Z   COMMENT ON COLUMN parametricas.tipo_documento.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    271            �           0    0     COLUMN tipo_documento.fecha_baja    COMMENT     J   COMMENT ON COLUMN parametricas.tipo_documento.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    271            �           0    0    TABLE tipo_documento    ACL     V   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_documento TO usr_controleg_app;
          parametricas          usr_controleg    false    271            �            1259    16567    tipo_documento_remision    TABLE     �  CREATE TABLE parametricas.tipo_documento_remision (
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
       parametricas         heap    usr_controleg    false    9            �           0    0 .   COLUMN tipo_documento_remision.tdr_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.tdr_descripcion IS 'Campo que hace referencia a descripcion de tipo_documento_remision';
          parametricas          usr_controleg    false    218            �           0    0 /   COLUMN tipo_documento_remision.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    218            �           0    0 3   COLUMN tipo_documento_remision.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    218            �           0    0 +   COLUMN tipo_documento_remision.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    218            �           0    0 -   COLUMN tipo_documento_remision.fecha_registro    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_documento_remision.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    218            �           0    0 1   COLUMN tipo_documento_remision.fecha_modificacion    COMMENT     c   COMMENT ON COLUMN parametricas.tipo_documento_remision.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    218            �           0    0 )   COLUMN tipo_documento_remision.fecha_baja    COMMENT     S   COMMENT ON COLUMN parametricas.tipo_documento_remision.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    218            �           0    0    TABLE tipo_documento_remision    ACL     _   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_documento_remision TO usr_controleg_app;
          parametricas          usr_controleg    false    218            �            1259    16468    tipo_infraccion    TABLE       CREATE TABLE parametricas.tipo_infraccion (
    tipinf_codigo integer NOT NULL,
    tipinf_nombre character varying NOT NULL,
    tipinf_descripcion character varying,
    tipres_codigo integer NOT NULL,
    tipinf_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 )   DROP TABLE parametricas.tipo_infraccion;
       parametricas         heap    usr_controleg    false    9            �           0    0    TABLE tipo_infraccion    COMMENT     b   COMMENT ON TABLE parametricas.tipo_infraccion IS 'Tabla para registrar los tipos de infraccion.';
          parametricas          usr_controleg    false    212            �           0    0 $   COLUMN tipo_infraccion.tipinf_codigo    COMMENT     Z   COMMENT ON COLUMN parametricas.tipo_infraccion.tipinf_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    212            �           0    0 $   COLUMN tipo_infraccion.tipinf_nombre    COMMENT     b   COMMENT ON COLUMN parametricas.tipo_infraccion.tipinf_nombre IS 'Nombre del tipo de infraccion.';
          parametricas          usr_controleg    false    212            �           0    0 )   COLUMN tipo_infraccion.tipinf_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_infraccion.tipinf_descripcion IS 'Campo que hace referencia a la descripcion del tipo de infraccion';
          parametricas          usr_controleg    false    212            �           0    0 $   COLUMN tipo_infraccion.tipres_codigo    COMMENT     i   COMMENT ON COLUMN parametricas.tipo_infraccion.tipres_codigo IS 'Referencia al tipo de responsabilidad';
          parametricas          usr_controleg    false    212            �           0    0 $   COLUMN tipo_infraccion.tipinf_estado    COMMENT     V   COMMENT ON COLUMN parametricas.tipo_infraccion.tipinf_estado IS 'Estao del registro';
          parametricas          usr_controleg    false    212                        0    0 '   COLUMN tipo_infraccion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_infraccion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    212                       0    0 +   COLUMN tipo_infraccion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_infraccion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    212                       0    0 #   COLUMN tipo_infraccion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_infraccion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    212                       0    0 %   COLUMN tipo_infraccion.fecha_registro    COMMENT     S   COMMENT ON COLUMN parametricas.tipo_infraccion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    212                       0    0 )   COLUMN tipo_infraccion.fecha_modificacion    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_infraccion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    212                       0    0 !   COLUMN tipo_infraccion.fecha_baja    COMMENT     K   COMMENT ON COLUMN parametricas.tipo_infraccion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    212                       0    0    TABLE tipo_infraccion    ACL     W   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_infraccion TO usr_controleg_app;
          parametricas          usr_controleg    false    212            �            1259    16482    tipo_involucrado    TABLE       CREATE TABLE parametricas.tipo_involucrado (
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
       parametricas         heap    usr_controleg    false    9                       0    0 *   COLUMN tipo_involucrado.tipinv_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_descripcion IS 'Campo que hace referencia a descripcion del tipo de involucrado';
          parametricas          usr_controleg    false    213                       0    0 *   COLUMN tipo_involucrado.tipinv_abreviacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_abreviacion IS 'Campo que hace referencia a abreviacion del tipo de involucrado';
          parametricas          usr_controleg    false    213            	           0    0 &   COLUMN tipo_involucrado.tipinv_mostrar    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_mostrar IS 'Campo que hace referencia a mostrar el tipo de involucrado';
          parametricas          usr_controleg    false    213            
           0    0 (   COLUMN tipo_involucrado.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    213                       0    0 ,   COLUMN tipo_involucrado.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    213                       0    0 $   COLUMN tipo_involucrado.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    213                       0    0 &   COLUMN tipo_involucrado.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_involucrado.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    213                       0    0 *   COLUMN tipo_involucrado.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.tipo_involucrado.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    213                       0    0 "   COLUMN tipo_involucrado.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.tipo_involucrado.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    213                       0    0    TABLE tipo_involucrado    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_involucrado TO usr_controleg_app;
          parametricas          usr_controleg    false    213            �            1259    16426    tipo_proceso    TABLE     �  CREATE TABLE parametricas.tipo_proceso (
    tippro_codigo integer NOT NULL,
    tippro_nombre character varying NOT NULL,
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
       parametricas         heap    usr_controleg    false    9                       0    0 !   COLUMN tipo_proceso.tippro_nombre    COMMENT     \   COMMENT ON COLUMN parametricas.tipo_proceso.tippro_nombre IS 'Nombre del tipo de proceso.';
          parametricas          usr_controleg    false    209                       0    0 &   COLUMN tipo_proceso.tippro_descripcion    COMMENT     }   COMMENT ON COLUMN parametricas.tipo_proceso.tippro_descripcion IS 'Campo que hace referencia a descripcion de tipo_proceso';
          parametricas          usr_controleg    false    209                       0    0 $   COLUMN tipo_proceso.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    209                       0    0 (   COLUMN tipo_proceso.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    209                       0    0     COLUMN tipo_proceso.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    209                       0    0 "   COLUMN tipo_proceso.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_proceso.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    209                       0    0 &   COLUMN tipo_proceso.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_proceso.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    209                       0    0    COLUMN tipo_proceso.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.tipo_proceso.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    209                       0    0    TABLE tipo_proceso    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_proceso TO usr_controleg_app;
          parametricas          usr_controleg    false    209                       1259    18927    tipo_proceso_datos_adicionales    TABLE     �  CREATE TABLE parametricas.tipo_proceso_datos_adicionales (
    tpda_codigo integer NOT NULL,
    tpda_texto character varying NOT NULL,
    tpda_descripcion character varying,
    tpda_clave character varying NOT NULL,
    tpda_regla character varying,
    tpda_tipo_dato character varying DEFAULT 'Input'::character varying NOT NULL,
    tpda_col integer DEFAULT 6 NOT NULL,
    tpda_value character varying,
    tpda_disabled boolean DEFAULT true NOT NULL,
    tda_servicio character varying,
    tpda_servicio_recurso character varying,
    tpda_servicio_params character varying,
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
       parametricas         heap    usr_controleg    false    9                       0    0 $   TABLE tipo_proceso_datos_adicionales    COMMENT     �   COMMENT ON TABLE parametricas.tipo_proceso_datos_adicionales IS 'Tabla para conformar la estructura de los datos adicionales de un proceso.';
          parametricas          usr_controleg    false    273                       0    0 0   COLUMN tipo_proceso_datos_adicionales.tpda_texto    COMMENT     |   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_texto IS 'Texto que se mostrara en el campo de llenado';
          parametricas          usr_controleg    false    273                       0    0 6   COLUMN tipo_proceso_datos_adicionales.tpda_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_descripcion IS 'Descripcion o detalle del objetivo del campo';
          parametricas          usr_controleg    false    273                       0    0 0   COLUMN tipo_proceso_datos_adicionales.tpda_clave    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_clave IS 'clave del objeto JSON con el que se asignara el valor del campo';
          parametricas          usr_controleg    false    273                       0    0 0   COLUMN tipo_proceso_datos_adicionales.tpda_regla    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_regla IS 'Determina las reglas que tendra el campo solicitado.';
          parametricas          usr_controleg    false    273                       0    0 4   COLUMN tipo_proceso_datos_adicionales.tpda_tipo_dato    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_tipo_dato IS 'define el tipo de dato del campo, solamente se consideran los siguientes tipos: Input, Dropdown, Calendar,InputNumber';
          parametricas          usr_controleg    false    273                        0    0 .   COLUMN tipo_proceso_datos_adicionales.tpda_col    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_col IS 'Define las columnas (1-12) que ocupara el campo en el grid de la aplicacion.';
          parametricas          usr_controleg    false    273            !           0    0 0   COLUMN tipo_proceso_datos_adicionales.tpda_value    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_value IS 'Define el valor por defecto del campo que aparecera al mostrar el campo.';
          parametricas          usr_controleg    false    273            "           0    0 3   COLUMN tipo_proceso_datos_adicionales.tpda_disabled    COMMENT        COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_disabled IS 'Define si el campo estara activo o inactivo.';
          parametricas          usr_controleg    false    273            #           0    0 2   COLUMN tipo_proceso_datos_adicionales.tda_servicio    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tda_servicio IS 'Nombre del servicio que se usara para obtener los datos parametricos. ej: CONTROLEG';
          parametricas          usr_controleg    false    273            $           0    0 ;   COLUMN tipo_proceso_datos_adicionales.tpda_servicio_recurso    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_servicio_recurso IS 'Define el recurso del servicio desde donde se obtendra los valores seleccionables.';
          parametricas          usr_controleg    false    273            %           0    0 :   COLUMN tipo_proceso_datos_adicionales.tpda_servicio_params    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_servicio_params IS 'Son los parametros del recurso como query para filtrar datos.';
          parametricas          usr_controleg    false    273            &           0    0 8   COLUMN tipo_proceso_datos_adicionales.tda_servicio_clave    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tda_servicio_clave IS 'Se usa para identificar la clave del objeto json que se obtiene desde el recurso definido para el servicio.';
          parametricas          usr_controleg    false    273            '           0    0 3   COLUMN tipo_proceso_datos_adicionales.tippro_codigo    COMMENT     |   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tippro_codigo IS 'Referencia a la tabla de tipo de proceso.';
          parametricas          usr_controleg    false    273            (           0    0 1   COLUMN tipo_proceso_datos_adicionales.tpda_estado    COMMENT     d   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.tpda_estado IS 'Estado del Registro';
          parametricas          usr_controleg    false    273            )           0    0 6   COLUMN tipo_proceso_datos_adicionales.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    273            *           0    0 :   COLUMN tipo_proceso_datos_adicionales.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    273            +           0    0 2   COLUMN tipo_proceso_datos_adicionales.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    273            ,           0    0 4   COLUMN tipo_proceso_datos_adicionales.fecha_registro    COMMENT     b   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    273            -           0    0 8   COLUMN tipo_proceso_datos_adicionales.fecha_modificacion    COMMENT     j   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    273            .           0    0 0   COLUMN tipo_proceso_datos_adicionales.fecha_baja    COMMENT     Z   COMMENT ON COLUMN parametricas.tipo_proceso_datos_adicionales.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    273            /           0    0 $   TABLE tipo_proceso_datos_adicionales    ACL     f   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_proceso_datos_adicionales TO usr_controleg_app;
          parametricas          usr_controleg    false    273            �            1259    16440    tipo_responsabilidad    TABLE     �  CREATE TABLE parametricas.tipo_responsabilidad (
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
       parametricas         heap    usr_controleg    false    9            0           0    0    TABLE tipo_responsabilidad    COMMENT     �   COMMENT ON TABLE parametricas.tipo_responsabilidad IS 'Tabla para registrar los tipos de responsablididad como civil, administrativa... de los dictamenes.';
          parametricas          usr_controleg    false    210            1           0    0 )   COLUMN tipo_responsabilidad.tipres_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.tipo_responsabilidad.tipres_codigo IS 'Identificador de tabla';
          parametricas          usr_controleg    false    210            2           0    0 )   COLUMN tipo_responsabilidad.tipres_nombre    COMMENT     k   COMMENT ON COLUMN parametricas.tipo_responsabilidad.tipres_nombre IS 'Nombre del tipo de responsabilidad';
          parametricas          usr_controleg    false    210            3           0    0 .   COLUMN tipo_responsabilidad.tipres_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.tipres_descripcion IS 'Campo que hace referencia a descripcion del tipo de responsabilidad';
          parametricas          usr_controleg    false    210            4           0    0 ,   COLUMN tipo_responsabilidad.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    210            5           0    0 0   COLUMN tipo_responsabilidad.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    210            6           0    0 (   COLUMN tipo_responsabilidad.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_responsabilidad.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    210            7           0    0 *   COLUMN tipo_responsabilidad.fecha_registro    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_responsabilidad.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    210            8           0    0 .   COLUMN tipo_responsabilidad.fecha_modificacion    COMMENT     `   COMMENT ON COLUMN parametricas.tipo_responsabilidad.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    210            9           0    0 &   COLUMN tipo_responsabilidad.fecha_baja    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_responsabilidad.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    210            :           0    0    TABLE tipo_responsabilidad    ACL     \   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_responsabilidad TO usr_controleg_app;
          parametricas          usr_controleg    false    210            �            1259    16668    tipo_rol    TABLE     �  CREATE TABLE parametricas.tipo_rol (
    tiprol_codigo integer NOT NULL,
    tiprol_nombre character varying,
    tiprol_descripcion character varying,
    tiprol_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 "   DROP TABLE parametricas.tipo_rol;
       parametricas         heap    usr_controleg    false    9            ;           0    0    TABLE tipo_rol    COMMENT     a   COMMENT ON TABLE parametricas.tipo_rol IS 'Tabla para contral el tipo de rol, INTERNO, EXTERNO';
          parametricas          usr_controleg    false    224            <           0    0    COLUMN tipo_rol.tiprol_codigo    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_rol.tiprol_codigo IS 'Identificador de tabla.';
          parametricas          usr_controleg    false    224            =           0    0    COLUMN tipo_rol.tiprol_nombre    COMMENT     W   COMMENT ON COLUMN parametricas.tipo_rol.tiprol_nombre IS 'Nombre del tipo de usuario';
          parametricas          usr_controleg    false    224            >           0    0 "   COLUMN tipo_rol.tiprol_descripcion    COMMENT     o   COMMENT ON COLUMN parametricas.tipo_rol.tiprol_descripcion IS 'Descripcion o aclaracion del tipo de usuario.';
          parametricas          usr_controleg    false    224            ?           0    0     COLUMN tipo_rol.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_rol.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    224            @           0    0 $   COLUMN tipo_rol.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_rol.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    224            A           0    0    COLUMN tipo_rol.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_rol.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    224            B           0    0    COLUMN tipo_rol.fecha_registro    COMMENT     L   COMMENT ON COLUMN parametricas.tipo_rol.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    224            C           0    0 "   COLUMN tipo_rol.fecha_modificacion    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_rol.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    224            D           0    0    COLUMN tipo_rol.fecha_baja    COMMENT     D   COMMENT ON COLUMN parametricas.tipo_rol.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    224            E           0    0    TABLE tipo_rol    ACL     P   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_rol TO usr_controleg_app;
          parametricas          usr_controleg    false    224            �            1259    16510    tipo_sancion    TABLE     �  CREATE TABLE parametricas.tipo_sancion (
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
       parametricas         heap    usr_controleg    false    9            F           0    0    TABLE tipo_sancion    COMMENT     �   COMMENT ON TABLE parametricas.tipo_sancion IS 'Tabla para definir que tipo de sanciones se tienen en el sistema, para usarlos en contra de los demandados, inicialmente de procesos administrativos diciplinarios.';
          parametricas          usr_controleg    false    215            G           0    0 !   COLUMN tipo_sancion.tipsan_codigo    COMMENT     W   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_codigo IS 'Idnetificador de tabla';
          parametricas          usr_controleg    false    215            H           0    0 !   COLUMN tipo_sancion.tipsan_nombre    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_nombre IS 'Nombre del tipo de sancion';
          parametricas          usr_controleg    false    215            I           0    0 &   COLUMN tipo_sancion.tipsan_descripcion    COMMENT     p   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_descripcion IS 'Descripcion o claracion de tipo de accion.';
          parametricas          usr_controleg    false    215            J           0    0 !   COLUMN tipo_sancion.tipsan_estado    COMMENT     U   COMMENT ON COLUMN parametricas.tipo_sancion.tipsan_estado IS 'Estado del Registro.';
          parametricas          usr_controleg    false    215            K           0    0 $   COLUMN tipo_sancion.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_sancion.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    215            L           0    0 (   COLUMN tipo_sancion.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_sancion.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    215            M           0    0     COLUMN tipo_sancion.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_sancion.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    215            N           0    0 "   COLUMN tipo_sancion.fecha_registro    COMMENT     P   COMMENT ON COLUMN parametricas.tipo_sancion.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    215            O           0    0 &   COLUMN tipo_sancion.fecha_modificacion    COMMENT     X   COMMENT ON COLUMN parametricas.tipo_sancion.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    215            P           0    0    COLUMN tipo_sancion.fecha_baja    COMMENT     H   COMMENT ON COLUMN parametricas.tipo_sancion.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    215            Q           0    0    TABLE tipo_sancion    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_sancion TO usr_controleg_app;
          parametricas          usr_controleg    false    215            �            1259    16609    tipo_solicitante    TABLE     �  CREATE TABLE parametricas.tipo_solicitante (
    tipsol_codigo integer NOT NULL,
    tipsol_descripcion character varying,
    tipsol_observacion character varying,
    tipsol_estado integer DEFAULT 1 NOT NULL,
    usuario_registro character varying NOT NULL,
    usuario_modificacion character varying DEFAULT ''::character varying NOT NULL,
    usuario_baja character varying DEFAULT ''::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
 *   DROP TABLE parametricas.tipo_solicitante;
       parametricas         heap    usr_controleg    false    9            R           0    0 %   COLUMN tipo_solicitante.tipsol_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_codigo IS 'llave primaria de la tabla';
          parametricas          usr_controleg    false    221            S           0    0 *   COLUMN tipo_solicitante.tipsol_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_descripcion IS 'campo donde se almancena la descripcion del tipo de solicitante';
          parametricas          usr_controleg    false    221            T           0    0 *   COLUMN tipo_solicitante.tipsol_observacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_observacion IS 'en este campo se almacena alguna observacion al registro del tipo de solicitante';
          parametricas          usr_controleg    false    221            U           0    0 %   COLUMN tipo_solicitante.tipsol_estado    COMMENT     u   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_estado IS 'estado del registro de la tabla tipo solicitante';
          parametricas          usr_controleg    false    221            V           0    0 (   COLUMN tipo_solicitante.usuario_registro    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.usuario_registro IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo el registro.';
          parametricas          usr_controleg    false    221            W           0    0 ,   COLUMN tipo_solicitante.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.usuario_modificacion IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la modificacion.';
          parametricas          usr_controleg    false    221            X           0    0 $   COLUMN tipo_solicitante.usuario_baja    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.usuario_baja IS 'Identificador referencial, es el per_codigo y el ent_codigo de la persona que realizo la baja logica';
          parametricas          usr_controleg    false    221            Y           0    0 &   COLUMN tipo_solicitante.fecha_registro    COMMENT     T   COMMENT ON COLUMN parametricas.tipo_solicitante.fecha_registro IS 'Fecha registro';
          parametricas          usr_controleg    false    221            Z           0    0 *   COLUMN tipo_solicitante.fecha_modificacion    COMMENT     \   COMMENT ON COLUMN parametricas.tipo_solicitante.fecha_modificacion IS 'Fecha modificacion';
          parametricas          usr_controleg    false    221            [           0    0 "   COLUMN tipo_solicitante.fecha_baja    COMMENT     L   COMMENT ON COLUMN parametricas.tipo_solicitante.fecha_baja IS 'Fecha baja';
          parametricas          usr_controleg    false    221            \           0    0    TABLE tipo_solicitante    ACL     X   GRANT SELECT,INSERT,UPDATE ON TABLE parametricas.tipo_solicitante TO usr_controleg_app;
          parametricas          usr_controleg    false    221            �          0    17199    menu 
   TABLE DATA           �   COPY autenticacion.menu (men_codigo, men_orden, men_nombre, men_icono, men_ruta, men_codigo_padre, men_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    262   J�      �          0    17185    recurso 
   TABLE DATA           �   COPY autenticacion.recurso (rec_codigo, rec_nombre, rec_descripcion, men_codigo, rec_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    261   ��      �          0    17171    rol 
   TABLE DATA           �   COPY autenticacion.rol (rol_codigo, rol_nombre, rol_descripcion, tiprol_codigo, rol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    260   \�      �          0    17214    rol_recurso_operacion 
   TABLE DATA           �   COPY autenticacion.rol_recurso_operacion (rro_codigo, rol_codigo, rec_codigo, ope_codigo, rro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    263   g�      �          0    17137    usuario 
   TABLE DATA           �   COPY autenticacion.usuario (usu_codigo, usu_usuario, usu_contrasenia, usu_fecha_expiracion, per_codigo, usu_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    258   �      �          0    17155    usuario_entidad 
   TABLE DATA           �   COPY autenticacion.usuario_entidad (usuent_codigo, usuent_primer_ingreso, usuent_ultimo_ingreso, ent_codigo, usu_codigo, usuent_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    259   ��      �          0    17228    usuario_operacion 
   TABLE DATA           �   COPY autenticacion.usuario_operacion (usuope_codigo, usurol_codigo, rec_codigo, ope_codigo, usuope_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    264   >�      �          0    17242    usuario_rol 
   TABLE DATA           �   COPY autenticacion.usuario_rol (usurol_codigo, usu_codigo, rol_codigo, usurol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    autenticacion          usr_controleg    false    265   C�      �          0    16997    cargo 
   TABLE DATA           �   COPY controleg_dictamen.cargo (car_codigo, car_numero, car_monto, dicent_codigo, mon_codigo, car_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    248   ��      �          0    17095    dictamen_cge 
   TABLE DATA             COPY controleg_dictamen.dictamen_cge (diccge_codigo, diccge_fecha, diccge_descripcion, diccge_respaldo, dic_codigo, dicent_codigo, diccge_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    255   D�      �          0    17081    dictamen_entidad 
   TABLE DATA           �   COPY controleg_dictamen.dictamen_entidad (dicent_codigo, dicent_gestion, ent_codigo, tipres_codigo, dicent_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    254   a�      �          0    17067    informe_uai 
   TABLE DATA           \  COPY controleg_dictamen.informe_uai (infuai_codigo, infuai_gestion, infuai_numero, infuai_fecha, dicuai_numero_informe, dicuai_fecha_informe, tipaud_codigo, dicuai_nota_remision, infuai_nombre_auditoria, dicent_codigo, infuai_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    253   ��      �          0    17109    involucrado 
   TABLE DATA           �   COPY controleg_dictamen.involucrado (inv_codigo, car_codigo, perres_codigo, tipinf_codigo, inv_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    256   �      �          0    17039    seguimiento_cargo 
   TABLE DATA           	  COPY controleg_dictamen.seguimiento_cargo (segcar_codigo, segcar_fecha, segcar_descripcion, segcar_respaldo, car_codigo, estcla_codigo, segcar_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_dictamen          usr_controleg    false    251   ��      �          0    16919    empresa_unipersonal 
   TABLE DATA           �   COPY controleg_persona.empresa_unipersonal (empuni_codigo, per_codigo, perjur_codigo, empuni_observacion, empuni_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    243   ��                0    18956    entidad 
   TABLE DATA           <  COPY controleg_persona.entidad (ent_codigo, ent_descripcion, ent_nit, ent_correo_electronico, ent_observacion, ent_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja, ent_sigla, ent_codigo_presupuestario, ent_codigo_padre, ent_descripcion_padre) FROM stdin;
    controleg_persona          usr_controleg    false    275   �                0    18944    persona 
   TABLE DATA           �  COPY controleg_persona.persona (per_codigo, per_nombres, per_apellido_paterno, per_apellido_materno, per_apellido_conyuge, per_documento_identidad, per_complemento_segip, per_fecha_nacimiento, per_nacionalidad, per_correo_electronico, per_domicilio, per_telefono, per_observacion, validado_segip, tipdoc_codigo, per_genero, per_lugar_emision, per_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    274   [�      �          0    16907    persona_juridica 
   TABLE DATA           \  COPY controleg_persona.persona_juridica (perjur_codigo, perjur_razon_social, perjur_nit, perjur_sigla, perjur_direccion, perjur_telefono, perjur_fax, perjur_correo_electronico, perjur_observacion, perjur_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja, perjur_codigo_seprec) FROM stdin;
    controleg_persona          usr_controleg    false    242   d�      �          0    17123    persona_responsable 
   TABLE DATA             COPY controleg_persona.persona_responsable (perres_codigo, per_codigo, per_codigo_natural, empuni_codigo, perjur_codigo, ent_codigo, perres_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    257   0      �          0    16943    representante_legal 
   TABLE DATA           �   COPY controleg_persona.representante_legal (repleg_codigo, per_codigo, perjur_codigo, repleg_respaldo, repleg_observacion, repleg_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    controleg_persona          usr_controleg    false    244   �      �          0    17053 	   demandado 
   TABLE DATA           �   COPY controleg_proceso.demandado (dem_codigo, pro_codigo, perres_codigo, dem_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    252   D       �          0    16955    proceso 
   TABLE DATA           C  COPY controleg_proceso.proceso (pro_codigo, pro_gestion, pro_fecha_inicio, pro_monto, pro_codigo_fiscalia, pro_causa, pro_datos_adicionales, pro_observacion, ent_codigo, tippro_codigo, mon_codigo, pro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    245   �       �          0    16983    proceso_abogado 
   TABLE DATA           �   COPY controleg_proceso.proceso_abogado (proabo_codigo, pro_codigo, per_codigo, proabo_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    247   D%                0    19217    proceso_archivo 
   TABLE DATA              COPY controleg_proceso.proceso_archivo (proarc_codigo, pro_codigo, proarc_id_archivo, proarc_hash_archivo, proarc_observacion, proarc_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    276   [&      �          0    17011    proceso_cargo 
   TABLE DATA           �   COPY controleg_proceso.proceso_cargo (procar_codigo, pro_codigo, car_codigo, procar_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    249   �'      �          0    16969    proceso_juzgado 
   TABLE DATA           �   COPY controleg_proceso.proceso_juzgado (projuz_codigo, pro_codigo, juz_codigo, projuz_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    246   �'      �          0    17256    sancion 
   TABLE DATA           �   COPY controleg_proceso.sancion (san_codigo, dem_codigo, tipsan_codigo, san_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    266   �(      �          0    17025    seguimiento_proceso 
   TABLE DATA           
  COPY controleg_proceso.seguimiento_proceso (segpro_codigo, segpro_fecha, segpro_descripcion, segpro_respaldo, pro_codigo, estcla_codigo, segpro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    250   �(      �          0    17270    seguimiento_sancion 
   TABLE DATA           
  COPY controleg_proceso.seguimiento_sancion (segsan_codigo, segsan_fecha, segsan_descripcion, segsan_respaldo, san_codigo, estcla_codigo, segsan_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_proceso          usr_controleg    false    267   �)      �          0    16742    solicitud_archivo_digital 
   TABLE DATA           )  COPY controleg_solvencia.solicitud_archivo_digital (sad_codigo, ssf_codigo, tipadj_codigo, arcdig_codigo, arcdig_hash, arcdig_nombre_archivo, arcdig_peso, arcdig_formato, sad_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_solvencia          usr_controleg    false    229   �)      �          0    16727    solicitud_solvencia_fiscal 
   TABLE DATA           �  COPY controleg_solvencia.solicitud_solvencia_fiscal (ssf_codigo, ssf_fecha_solicitud, ssf_correo_electronico, ssf_objeto, ssf_telefono, ssf_nro_documento, ssf_notaria, per_codigo, per_codigo_apoderado, tipsol_codigo, lug_codigo, motsol_codigo, ent_codigo, lug_codigo_apoderado, drt_codigo, ssf_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_solvencia          usr_controleg    false    228   �)                 0    17284    departamento 
   TABLE DATA           �   COPY controleg_ubicacion.departamento (dep_codigo, dep_codigo_ine, dep_orden, dep_abreviacion, dep_nombre, dep_descripcion, dep_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_ubicacion          usr_controleg    false    268   �)                0    18913    juzgado 
   TABLE DATA           �   COPY controleg_ubicacion.juzgado (juz_codigo, juz_nombre, juz_descripcion, dep_codigo, pro_codigo, mun_codigo, juz_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_ubicacion          usr_controleg    false    272   �*                0    17316 	   municipio 
   TABLE DATA           7  COPY controleg_ubicacion.municipio (mun_codigo, mun_codigo_ine, mun_orden, mun_abreviacion, mun_nombre, mun_nombre_complementario, mun_seccion, mun_descripcion, dep_codigo, pro_codigo, mun_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_ubicacion          usr_controleg    false    270   I-                0    17300 	   provincia 
   TABLE DATA             COPY controleg_ubicacion.provincia (pro_codigo, pro_codigo_ine, pro_orden, pro_abreviacion, pro_nombre, pro_descripcion, dep_codigo, pro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    controleg_ubicacion          usr_controleg    false    269   SJ      �          0    16815    acceso 
   TABLE DATA           �   COPY dictamen.acceso (acc_codigo, acc_plazo, acc_qr, acc_cantidad_descargas, dic_codigo, acc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    234   bQ      �          0    16767    catalogo_general 
   TABLE DATA           �   COPY dictamen.catalogo_general (catgen_codigo, catgen_codigo_dominio, catgen_descripcion_dominio, catgen_codigo_valor, catgen_acronimo, catgen_descripcion_valor, catgen_estado, usuario_base_datos, fecha_registro) FROM stdin;
    dictamen          usr_controleg    false    231   Q      �          0    16828    descarga 
   TABLE DATA           �   COPY dictamen.descarga (des_codigo, des_numero, des_fecha, per_codigo, inf_codigo, acc_codigo, des_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    235   �Q      �          0    16755    dictamen 
   TABLE DATA           �   COPY dictamen.dictamen (dic_codigo, dic_gestion, dic_numero, dic_nombre_auditoria, dic_observacion, ent_codigo, dic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    230   �Q      �          0    16861    dictamen_archivo 
   TABLE DATA             COPY dictamen.dictamen_archivo (dicarc_codigo, dicarc_ruta, dicarc_hash, dicarc_nombre, dicarc_mime, dicarc_descripcion, dic_codigo, dicarc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    238   �Q      �          0    16804    informe 
   TABLE DATA           5  COPY dictamen.informe (inf_codigo, inf_gestion, inf_numero, inf_codigo_informe, inf_dep_codigo, inf_unidad_codigo, dic_codigo, tipinf_dominio, tipinf_codigo, sti_dominio, sti_codigo, inf_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    233   �Q      �          0    16780    informe_archivo 
   TABLE DATA             COPY dictamen.informe_archivo (infarc_codigo, infarc_ruta, infarc_hash, infarc_nombre, infarc_mime, infarc_descripcion, inf_codigo, infarc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    232   R      �          0    16838    notificacion 
   TABLE DATA           �   COPY dictamen.notificacion (not_codigo, acc_codigo, not_correo, not_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    236   -R      �          0    16850    persona_dictamen 
   TABLE DATA           5  COPY dictamen.persona_dictamen (perdic_codigo, perdic_notificacion, inf_codigo, tipinv_dominio, tipinv_codigo, perres_codigo, per_codigo, perjur_codigo, empuni_codigo, ent_codigo, perdic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    237   JR      �          0    16873    persona_dictamen_archivo 
   TABLE DATA           �   COPY dictamen.persona_dictamen_archivo (pda_codigo, pda_ruta, pda_hash, pda_nombre, pda_mime, pda_descripcion, perdic_codigo, pda_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    239   gR      �          0    16885    proceso_entidad 
   TABLE DATA             COPY dictamen.proceso_entidad (proent_codigo, proent_fecha_remision, proent_inicio_accion, proent_fecha_accion, proent_dep, proent_observacion, dic_codigo, proent_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    240   �R      �          0    16895    proceso_entidad_archivo 
   TABLE DATA           �   COPY dictamen.proceso_entidad_archivo (pea_codigo, pea_ruta, pea_hash, pea_nombre, pea_mime, pea_descripcion, proent_codigo, pea_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_controleg    false    241   �R      �          0    16623    documento_representante_tipo 
   TABLE DATA           �   COPY parametricas.documento_representante_tipo (drt_codigo, drt_descripcion, drt_observacion, drt_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    222   �R      �          0    16698    estado_clasificacion 
   TABLE DATA             COPY parametricas.estado_clasificacion (estcla_codigo, estcla_orden, estcon_codigo, esteta_codigo, tippro_codigo, tipres_codigo, tipsan_codigo, estcla_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    226   �R      �          0    16496    estado_control 
   TABLE DATA           �   COPY parametricas.estado_control (estcont_codigo, estcon_nombre, estcon_descripcion, estcon_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    214   �U      �          0    16682    estado_etapa 
   TABLE DATA           �   COPY parametricas.estado_etapa (esteta_codigo, esteta_orden, esteta_nombre, esteta_solvencia, esteta_descripcion, esteta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    225   �W      �          0    16409    estados 
   TABLE DATA           �   COPY parametricas.estados (est_codigo, est_nombre, est_descripcion, est_color, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    208   �X      �          0    16638    genero 
   TABLE DATA           �   COPY parametricas.genero (gen_codigo, gen_descripcion, gen_abreviacion, gen_mostrar, gen_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    223   �Y      �          0    16538    lugar 
   TABLE DATA           �   COPY parametricas.lugar (lug_codigo, lug_nombre, lug_descripcion, lug_abreviacion, lug_nacional, lug_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    216   �Z      �          0    16553    moneda 
   TABLE DATA           �   COPY parametricas.moneda (mon_codigo, mon_descripcion, mon_abreviacion, mon_mostrar, mon_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    217   �Z      �          0    16595    motivo_solvencia 
   TABLE DATA           �   COPY parametricas.motivo_solvencia (motsol_codigo, motsol_descripcion, motsol_observacion, motsol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    220   -[      �          0    16713 	   operacion 
   TABLE DATA           �   COPY parametricas.operacion (ope_codigo, ope_sigla, ope_nombre, ope_descripcion, ope_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    227   J[      �          0    16454    sub_tipo_informe 
   TABLE DATA           �   COPY parametricas.sub_tipo_informe (sti_codigo, sti_nombre, sti_descripcion, sti_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    211   \      �          0    16581    tipo_adjunto 
   TABLE DATA           �   COPY parametricas.tipo_adjunto (tipadj_codigo, tipadj_descripcion, tipadj_tramite, tipadj_observacion, tipadj_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    219   7\                0    18899    tipo_documento 
   TABLE DATA           �   COPY parametricas.tipo_documento (tipdoc_codigo, tipdoc_nombre, tipdoc_abreviacion, tipdoc_descripcion, tipdoc_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    271   T\      �          0    16567    tipo_documento_remision 
   TABLE DATA           �   COPY parametricas.tipo_documento_remision (tdr_codigo, tdr_descripcion, tdr_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    218   �\      �          0    16468    tipo_infraccion 
   TABLE DATA           �   COPY parametricas.tipo_infraccion (tipinf_codigo, tipinf_nombre, tipinf_descripcion, tipres_codigo, tipinf_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    212   �\      �          0    16482    tipo_involucrado 
   TABLE DATA           �   COPY parametricas.tipo_involucrado (tipinv_codigo, tipinv_descripcion, tipinv_abreviacion, tipinv_mostrar, tipinv_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    213   h]      �          0    16426    tipo_proceso 
   TABLE DATA           �   COPY parametricas.tipo_proceso (tippro_codigo, tippro_nombre, tippro_descripcion, tippro_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    209   �]                0    18927    tipo_proceso_datos_adicionales 
   TABLE DATA           �  COPY parametricas.tipo_proceso_datos_adicionales (tpda_codigo, tpda_texto, tpda_descripcion, tpda_clave, tpda_regla, tpda_tipo_dato, tpda_col, tpda_value, tpda_disabled, tda_servicio, tpda_servicio_recurso, tpda_servicio_params, tda_servicio_clave, tippro_codigo, tpda_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    273   �a      �          0    16440    tipo_responsabilidad 
   TABLE DATA           �   COPY parametricas.tipo_responsabilidad (tipres_codigo, tipres_nombre, tipres_descripcion, tipres_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    210   �b      �          0    16668    tipo_rol 
   TABLE DATA           �   COPY parametricas.tipo_rol (tiprol_codigo, tiprol_nombre, tiprol_descripcion, tiprol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    224   �c      �          0    16510    tipo_sancion 
   TABLE DATA           �   COPY parametricas.tipo_sancion (tipsan_codigo, tipsan_nombre, tipsan_descripcion, tipsan_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    215   Yd      �          0    16609    tipo_solicitante 
   TABLE DATA           �   COPY parametricas.tipo_solicitante (tipsol_codigo, tipsol_descripcion, tipsol_observacion, tipsol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    parametricas          usr_controleg    false    221   	e      �           2606    17241 )   usuario_operacion lista_control_acceso_pk 
   CONSTRAINT     y   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT lista_control_acceso_pk PRIMARY KEY (usuope_codigo);
 Z   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT lista_control_acceso_pk;
       autenticacion            usr_controleg    false    264            �           2606    17213    menu menu_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY autenticacion.menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (men_codigo);
 =   ALTER TABLE ONLY autenticacion.menu DROP CONSTRAINT menu_pk;
       autenticacion            usr_controleg    false    262            x           2606    17168 "   usuario_entidad persona_entidad_pk 
   CONSTRAINT     r   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT persona_entidad_pk PRIMARY KEY (usuent_codigo);
 S   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT persona_entidad_pk;
       autenticacion            usr_controleg    false    259            z           2606    17170 "   usuario_entidad persona_entidad_uq 
   CONSTRAINT     v   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT persona_entidad_uq UNIQUE (ent_codigo, usu_codigo);
 S   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT persona_entidad_uq;
       autenticacion            usr_controleg    false    259    259            r           2606    17152    usuario persona_uq 
   CONSTRAINT     Z   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT persona_uq UNIQUE (per_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT persona_uq;
       autenticacion            usr_controleg    false    258            ~           2606    17198    recurso recurso_pk 
   CONSTRAINT     _   ALTER TABLE ONLY autenticacion.recurso
    ADD CONSTRAINT recurso_pk PRIMARY KEY (rec_codigo);
 C   ALTER TABLE ONLY autenticacion.recurso DROP CONSTRAINT recurso_pk;
       autenticacion            usr_controleg    false    261            |           2606    17184 
   rol rol_pk 
   CONSTRAINT     W   ALTER TABLE ONLY autenticacion.rol
    ADD CONSTRAINT rol_pk PRIMARY KEY (rol_codigo);
 ;   ALTER TABLE ONLY autenticacion.rol DROP CONSTRAINT rol_pk;
       autenticacion            usr_controleg    false    260            �           2606    17227 +   rol_recurso_operacion rol_recurso_acceso_pk 
   CONSTRAINT     x   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT rol_recurso_acceso_pk PRIMARY KEY (rro_codigo);
 \   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT rol_recurso_acceso_pk;
       autenticacion            usr_controleg    false    263            t           2606    17150    usuario usuario_pk 
   CONSTRAINT     _   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (usu_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT usuario_pk;
       autenticacion            usr_controleg    false    258            �           2606    17255    usuario_rol usuario_rol_pk 
   CONSTRAINT     j   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT usuario_rol_pk PRIMARY KEY (usurol_codigo);
 K   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT usuario_rol_pk;
       autenticacion            usr_controleg    false    265            v           2606    17154    usuario usuario_uq 
   CONSTRAINT     [   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT usuario_uq UNIQUE (usu_usuario);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT usuario_uq;
       autenticacion            usr_controleg    false    258            ^           2606    17010    cargo cargo_pk 
   CONSTRAINT     `   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT cargo_pk PRIMARY KEY (car_codigo);
 D   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT cargo_pk;
       controleg_dictamen            usr_controleg    false    248            j           2606    17094    dictamen_entidad dictamen_pk 
   CONSTRAINT     q   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad
    ADD CONSTRAINT dictamen_pk PRIMARY KEY (dicent_codigo);
 R   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad DROP CONSTRAINT dictamen_pk;
       controleg_dictamen            usr_controleg    false    254            h           2606    17080    informe_uai dictamen_uai_pk 
   CONSTRAINT     p   ALTER TABLE ONLY controleg_dictamen.informe_uai
    ADD CONSTRAINT dictamen_uai_pk PRIMARY KEY (infuai_codigo);
 Q   ALTER TABLE ONLY controleg_dictamen.informe_uai DROP CONSTRAINT dictamen_uai_pk;
       controleg_dictamen            usr_controleg    false    253            n           2606    17122    involucrado involucrado_pk 
   CONSTRAINT     l   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT involucrado_pk PRIMARY KEY (inv_codigo);
 P   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT involucrado_pk;
       controleg_dictamen            usr_controleg    false    256            d           2606    17052 &   seguimiento_cargo seguimiento_cargo_pk 
   CONSTRAINT     {   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT seguimiento_cargo_pk PRIMARY KEY (segcar_codigo);
 \   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT seguimiento_cargo_pk;
       controleg_dictamen            usr_controleg    false    251            l           2606    17108 $   dictamen_cge seguimiento_dictamen_pk 
   CONSTRAINT     y   ALTER TABLE ONLY controleg_dictamen.dictamen_cge
    ADD CONSTRAINT seguimiento_dictamen_pk PRIMARY KEY (diccge_codigo);
 Z   ALTER TABLE ONLY controleg_dictamen.dictamen_cge DROP CONSTRAINT seguimiento_dictamen_pk;
       controleg_dictamen            usr_controleg    false    255            T           2606    16930 *   empresa_unipersonal empresa_unipersonal_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT empresa_unipersonal_pk PRIMARY KEY (empuni_codigo);
 _   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT empresa_unipersonal_pk;
       controleg_persona            usr_controleg    false    243            �           2606    18967    entidad entidad_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg_persona.entidad
    ADD CONSTRAINT entidad_pk PRIMARY KEY (ent_codigo);
 G   ALTER TABLE ONLY controleg_persona.entidad DROP CONSTRAINT entidad_pk;
       controleg_persona            usr_controleg    false    275            R           2606    16918 $   persona_juridica persona_juridica_pk 
   CONSTRAINT     x   ALTER TABLE ONLY controleg_persona.persona_juridica
    ADD CONSTRAINT persona_juridica_pk PRIMARY KEY (perjur_codigo);
 Y   ALTER TABLE ONLY controleg_persona.persona_juridica DROP CONSTRAINT persona_juridica_pk;
       controleg_persona            usr_controleg    false    242            �           2606    18955    persona persona_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT persona_pk PRIMARY KEY (per_codigo);
 G   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT persona_pk;
       controleg_persona            usr_controleg    false    274            p           2606    17136 *   persona_responsable persona_responsable_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_responsable_pk PRIMARY KEY (perres_codigo);
 _   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_responsable_pk;
       controleg_persona            usr_controleg    false    257            V           2606    16954 *   representante_legal representante_legal_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT representante_legal_pk PRIMARY KEY (repleg_codigo);
 _   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT representante_legal_pk;
       controleg_persona            usr_controleg    false    244            f           2606    17066    demandado demandado_pk 
   CONSTRAINT     g   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT demandado_pk PRIMARY KEY (dem_codigo);
 K   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT demandado_pk;
       controleg_proceso            usr_controleg    false    252            �           2606    17269    sancion demandado_sancion_pk 
   CONSTRAINT     m   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT demandado_sancion_pk PRIMARY KEY (san_codigo);
 Q   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT demandado_sancion_pk;
       controleg_proceso            usr_controleg    false    266            \           2606    16996 "   proceso_abogado proceso_abogado_pk 
   CONSTRAINT     v   ALTER TABLE ONLY controleg_proceso.proceso_abogado
    ADD CONSTRAINT proceso_abogado_pk PRIMARY KEY (proabo_codigo);
 W   ALTER TABLE ONLY controleg_proceso.proceso_abogado DROP CONSTRAINT proceso_abogado_pk;
       controleg_proceso            usr_controleg    false    247            �           2606    19230 "   proceso_archivo proceso_archivo_pk 
   CONSTRAINT     v   ALTER TABLE ONLY controleg_proceso.proceso_archivo
    ADD CONSTRAINT proceso_archivo_pk PRIMARY KEY (proarc_codigo);
 W   ALTER TABLE ONLY controleg_proceso.proceso_archivo DROP CONSTRAINT proceso_archivo_pk;
       controleg_proceso            usr_controleg    false    276            `           2606    17024    proceso_cargo proceso_cargo_pk 
   CONSTRAINT     r   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT proceso_cargo_pk PRIMARY KEY (procar_codigo);
 S   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT proceso_cargo_pk;
       controleg_proceso            usr_controleg    false    249            Z           2606    16982 "   proceso_juzgado proceso_juzgado_pk 
   CONSTRAINT     v   ALTER TABLE ONLY controleg_proceso.proceso_juzgado
    ADD CONSTRAINT proceso_juzgado_pk PRIMARY KEY (projuz_codigo);
 W   ALTER TABLE ONLY controleg_proceso.proceso_juzgado DROP CONSTRAINT proceso_juzgado_pk;
       controleg_proceso            usr_controleg    false    246            X           2606    16968    proceso proceso_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT proceso_pk PRIMARY KEY (pro_codigo);
 G   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT proceso_pk;
       controleg_proceso            usr_controleg    false    245            b           2606    17038 *   seguimiento_proceso seguimiento_proceso_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT seguimiento_proceso_pk PRIMARY KEY (segpro_codigo);
 _   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT seguimiento_proceso_pk;
       controleg_proceso            usr_controleg    false    250            �           2606    17283 *   seguimiento_sancion seguimiento_sancion_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT seguimiento_sancion_pk PRIMARY KEY (segsan_codigo);
 _   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT seguimiento_sancion_pk;
       controleg_proceso            usr_controleg    false    267            6           2606    16754 6   solicitud_archivo_digital solicitud_archivo_digital_pk 
   CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital
    ADD CONSTRAINT solicitud_archivo_digital_pk PRIMARY KEY (sad_codigo);
 m   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital DROP CONSTRAINT solicitud_archivo_digital_pk;
       controleg_solvencia            usr_controleg    false    229            4           2606    16741 8   solicitud_solvencia_fiscal solicitud_solvencia_fiscal_pk 
   CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT solicitud_solvencia_fiscal_pk PRIMARY KEY (ssf_codigo);
 o   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT solicitud_solvencia_fiscal_pk;
       controleg_solvencia            usr_controleg    false    228            �           2606    17299    departamento dep_codigo_ine_uq 
   CONSTRAINT     p   ALTER TABLE ONLY controleg_ubicacion.departamento
    ADD CONSTRAINT dep_codigo_ine_uq UNIQUE (dep_codigo_ine);
 U   ALTER TABLE ONLY controleg_ubicacion.departamento DROP CONSTRAINT dep_codigo_ine_uq;
       controleg_ubicacion            usr_controleg    false    268            �           2606    17297    departamento departamento_pk 
   CONSTRAINT     o   ALTER TABLE ONLY controleg_ubicacion.departamento
    ADD CONSTRAINT departamento_pk PRIMARY KEY (dep_codigo);
 S   ALTER TABLE ONLY controleg_ubicacion.departamento DROP CONSTRAINT departamento_pk;
       controleg_ubicacion            usr_controleg    false    268            �           2606    18926    juzgado juzgado_pk 
   CONSTRAINT     e   ALTER TABLE ONLY controleg_ubicacion.juzgado
    ADD CONSTRAINT juzgado_pk PRIMARY KEY (juz_codigo);
 I   ALTER TABLE ONLY controleg_ubicacion.juzgado DROP CONSTRAINT juzgado_pk;
       controleg_ubicacion            usr_controleg    false    272            �           2606    17331    municipio mun_codigo_ine_uq 
   CONSTRAINT     m   ALTER TABLE ONLY controleg_ubicacion.municipio
    ADD CONSTRAINT mun_codigo_ine_uq UNIQUE (mun_codigo_ine);
 R   ALTER TABLE ONLY controleg_ubicacion.municipio DROP CONSTRAINT mun_codigo_ine_uq;
       controleg_ubicacion            usr_controleg    false    270            �           2606    17329    municipio municipio_pk 
   CONSTRAINT     i   ALTER TABLE ONLY controleg_ubicacion.municipio
    ADD CONSTRAINT municipio_pk PRIMARY KEY (mun_codigo);
 M   ALTER TABLE ONLY controleg_ubicacion.municipio DROP CONSTRAINT municipio_pk;
       controleg_ubicacion            usr_controleg    false    270            �           2606    17315    provincia pro_codigo_ine_uq 
   CONSTRAINT     m   ALTER TABLE ONLY controleg_ubicacion.provincia
    ADD CONSTRAINT pro_codigo_ine_uq UNIQUE (pro_codigo_ine);
 R   ALTER TABLE ONLY controleg_ubicacion.provincia DROP CONSTRAINT pro_codigo_ine_uq;
       controleg_ubicacion            usr_controleg    false    269            �           2606    17313    provincia provincia_pk 
   CONSTRAINT     i   ALTER TABLE ONLY controleg_ubicacion.provincia
    ADD CONSTRAINT provincia_pk PRIMARY KEY (pro_codigo);
 M   ALTER TABLE ONLY controleg_ubicacion.provincia DROP CONSTRAINT provincia_pk;
       controleg_ubicacion            usr_controleg    false    269            B           2606    16827    acceso acceso_pk 
   CONSTRAINT     X   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT acceso_pk PRIMARY KEY (acc_codigo);
 <   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT acceso_pk;
       dictamen            usr_controleg    false    234            :           2606    16777 $   catalogo_general catalogo_general_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT catalogo_general_pk PRIMARY KEY (catgen_codigo);
 P   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT catalogo_general_pk;
       dictamen            usr_controleg    false    231            <           2606    16779 $   catalogo_general catalogo_general_uk 
   CONSTRAINT     �   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT catalogo_general_uk UNIQUE (catgen_codigo_dominio, catgen_codigo_valor);
 P   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT catalogo_general_uk;
       dictamen            usr_controleg    false    231    231            D           2606    16837    descarga descarga_pk 
   CONSTRAINT     \   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT descarga_pk PRIMARY KEY (des_codigo);
 @   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT descarga_pk;
       dictamen            usr_controleg    false    235            J           2606    16872 $   dictamen_archivo dictamen_archivo_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT dictamen_archivo_pk PRIMARY KEY (dicarc_codigo);
 P   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT dictamen_archivo_pk;
       dictamen            usr_controleg    false    238            8           2606    16766    dictamen dictamen_pk 
   CONSTRAINT     \   ALTER TABLE ONLY dictamen.dictamen
    ADD CONSTRAINT dictamen_pk PRIMARY KEY (dic_codigo);
 @   ALTER TABLE ONLY dictamen.dictamen DROP CONSTRAINT dictamen_pk;
       dictamen            usr_controleg    false    230            >           2606    16791 "   informe_archivo informe_archivo_pk 
   CONSTRAINT     m   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT informe_archivo_pk PRIMARY KEY (infarc_codigo);
 N   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT informe_archivo_pk;
       dictamen            usr_controleg    false    232            @           2606    16814    informe informe_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT informe_pk PRIMARY KEY (inf_codigo);
 >   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT informe_pk;
       dictamen            usr_controleg    false    233            F           2606    16849    notificacion notificacion_pk 
   CONSTRAINT     d   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT notificacion_pk PRIMARY KEY (not_codigo);
 H   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT notificacion_pk;
       dictamen            usr_controleg    false    236            L           2606    16884 4   persona_dictamen_archivo persona_dictamen_archivo_pk 
   CONSTRAINT     |   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT persona_dictamen_archivo_pk PRIMARY KEY (pda_codigo);
 `   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT persona_dictamen_archivo_pk;
       dictamen            usr_controleg    false    239            H           2606    16860 $   persona_dictamen persona_dictamen_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_dictamen_pk PRIMARY KEY (perdic_codigo);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_dictamen_pk;
       dictamen            usr_controleg    false    237            P           2606    16906 2   proceso_entidad_archivo proceso_entidad_archivo_pk 
   CONSTRAINT     z   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT proceso_entidad_archivo_pk PRIMARY KEY (pea_codigo);
 ^   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT proceso_entidad_archivo_pk;
       dictamen            usr_controleg    false    241            N           2606    16894 "   proceso_entidad proceso_entidad_pk 
   CONSTRAINT     m   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT proceso_entidad_pk PRIMARY KEY (proent_codigo);
 N   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT proceso_entidad_pk;
       dictamen            usr_controleg    false    240            2           2606    16726    operacion acceso_pk 
   CONSTRAINT     _   ALTER TABLE ONLY parametricas.operacion
    ADD CONSTRAINT acceso_pk PRIMARY KEY (ope_codigo);
 C   ALTER TABLE ONLY parametricas.operacion DROP CONSTRAINT acceso_pk;
       parametricas            usr_controleg    false    227            (           2606    16636 <   documento_representante_tipo documento_representante_tipo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.documento_representante_tipo
    ADD CONSTRAINT documento_representante_tipo_pk PRIMARY KEY (drt_codigo);
 l   ALTER TABLE ONLY parametricas.documento_representante_tipo DROP CONSTRAINT documento_representante_tipo_pk;
       parametricas            usr_controleg    false    222            0           2606    16712 ,   estado_clasificacion estado_clasificacion_pk 
   CONSTRAINT     {   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_clasificacion_pk PRIMARY KEY (estcla_codigo);
 \   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_clasificacion_pk;
       parametricas            usr_controleg    false    226                       2606    16509     estado_control estado_control_pk 
   CONSTRAINT     p   ALTER TABLE ONLY parametricas.estado_control
    ADD CONSTRAINT estado_control_pk PRIMARY KEY (estcont_codigo);
 P   ALTER TABLE ONLY parametricas.estado_control DROP CONSTRAINT estado_control_pk;
       parametricas            usr_controleg    false    214            .           2606    16697    estado_etapa estado_etapa_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.estado_etapa
    ADD CONSTRAINT estado_etapa_pk PRIMARY KEY (esteta_codigo);
 L   ALTER TABLE ONLY parametricas.estado_etapa DROP CONSTRAINT estado_etapa_pk;
       parametricas            usr_controleg    false    225            
           2606    16423    estados estado_registro_pk 
   CONSTRAINT     f   ALTER TABLE ONLY parametricas.estados
    ADD CONSTRAINT estado_registro_pk PRIMARY KEY (est_codigo);
 J   ALTER TABLE ONLY parametricas.estados DROP CONSTRAINT estado_registro_pk;
       parametricas            usr_controleg    false    208            *           2606    16651    genero genero_pk 
   CONSTRAINT     \   ALTER TABLE ONLY parametricas.genero
    ADD CONSTRAINT genero_pk PRIMARY KEY (gen_codigo);
 @   ALTER TABLE ONLY parametricas.genero DROP CONSTRAINT genero_pk;
       parametricas            usr_controleg    false    223                       2606    16481 "   tipo_infraccion infraccion_tipo_pk 
   CONSTRAINT     q   ALTER TABLE ONLY parametricas.tipo_infraccion
    ADD CONSTRAINT infraccion_tipo_pk PRIMARY KEY (tipinf_codigo);
 R   ALTER TABLE ONLY parametricas.tipo_infraccion DROP CONSTRAINT infraccion_tipo_pk;
       parametricas            usr_controleg    false    212                       2606    16552    lugar lugar_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY parametricas.lugar
    ADD CONSTRAINT lugar_pk PRIMARY KEY (lug_codigo);
 >   ALTER TABLE ONLY parametricas.lugar DROP CONSTRAINT lugar_pk;
       parametricas            usr_controleg    false    216                       2606    16566    moneda moneda_pk 
   CONSTRAINT     \   ALTER TABLE ONLY parametricas.moneda
    ADD CONSTRAINT moneda_pk PRIMARY KEY (mon_codigo);
 @   ALTER TABLE ONLY parametricas.moneda DROP CONSTRAINT moneda_pk;
       parametricas            usr_controleg    false    217            $           2606    16608 $   motivo_solvencia motivo_solvencia_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.motivo_solvencia
    ADD CONSTRAINT motivo_solvencia_pk PRIMARY KEY (motsol_codigo);
 T   ALTER TABLE ONLY parametricas.motivo_solvencia DROP CONSTRAINT motivo_solvencia_pk;
       parametricas            usr_controleg    false    220                       2606    16425    estados nombre_uq 
   CONSTRAINT     X   ALTER TABLE ONLY parametricas.estados
    ADD CONSTRAINT nombre_uq UNIQUE (est_nombre);
 A   ALTER TABLE ONLY parametricas.estados DROP CONSTRAINT nombre_uq;
       parametricas            usr_controleg    false    208                       2606    16467 $   sub_tipo_informe sub_tipo_informe_pk 
   CONSTRAINT     p   ALTER TABLE ONLY parametricas.sub_tipo_informe
    ADD CONSTRAINT sub_tipo_informe_pk PRIMARY KEY (sti_codigo);
 T   ALTER TABLE ONLY parametricas.sub_tipo_informe DROP CONSTRAINT sub_tipo_informe_pk;
       parametricas            usr_controleg    false    211                       2606    16523    tipo_sancion tipo_accion_pk 
   CONSTRAINT     j   ALTER TABLE ONLY parametricas.tipo_sancion
    ADD CONSTRAINT tipo_accion_pk PRIMARY KEY (tipsan_codigo);
 K   ALTER TABLE ONLY parametricas.tipo_sancion DROP CONSTRAINT tipo_accion_pk;
       parametricas            usr_controleg    false    215            "           2606    16594    tipo_adjunto tipo_adjunto_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_adjunto
    ADD CONSTRAINT tipo_adjunto_pk PRIMARY KEY (tipadj_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_adjunto DROP CONSTRAINT tipo_adjunto_pk;
       parametricas            usr_controleg    false    219            �           2606    18912     tipo_documento tipo_documento_pk 
   CONSTRAINT     o   ALTER TABLE ONLY parametricas.tipo_documento
    ADD CONSTRAINT tipo_documento_pk PRIMARY KEY (tipdoc_codigo);
 P   ALTER TABLE ONLY parametricas.tipo_documento DROP CONSTRAINT tipo_documento_pk;
       parametricas            usr_controleg    false    271                        2606    16580 2   tipo_documento_remision tipo_documento_remision_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY parametricas.tipo_documento_remision
    ADD CONSTRAINT tipo_documento_remision_pk PRIMARY KEY (tdr_codigo);
 b   ALTER TABLE ONLY parametricas.tipo_documento_remision DROP CONSTRAINT tipo_documento_remision_pk;
       parametricas            usr_controleg    false    218                       2606    16495 $   tipo_involucrado tipo_involucrado_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.tipo_involucrado
    ADD CONSTRAINT tipo_involucrado_pk PRIMARY KEY (tipinv_codigo);
 T   ALTER TABLE ONLY parametricas.tipo_involucrado DROP CONSTRAINT tipo_involucrado_pk;
       parametricas            usr_controleg    false    213            �           2606    18943 @   tipo_proceso_datos_adicionales tipo_proceso_datos_adicionales_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT tipo_proceso_datos_adicionales_pk PRIMARY KEY (tpda_codigo);
 p   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT tipo_proceso_datos_adicionales_pk;
       parametricas            usr_controleg    false    273                       2606    16439    tipo_proceso tipo_proceso_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_proceso
    ADD CONSTRAINT tipo_proceso_pk PRIMARY KEY (tippro_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_proceso DROP CONSTRAINT tipo_proceso_pk;
       parametricas            usr_controleg    false    209                       2606    16453 ,   tipo_responsabilidad tipo_responsabilidad_pk 
   CONSTRAINT     {   ALTER TABLE ONLY parametricas.tipo_responsabilidad
    ADD CONSTRAINT tipo_responsabilidad_pk PRIMARY KEY (tipres_codigo);
 \   ALTER TABLE ONLY parametricas.tipo_responsabilidad DROP CONSTRAINT tipo_responsabilidad_pk;
       parametricas            usr_controleg    false    210            &           2606    16622 $   tipo_solicitante tipo_solicitante_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.tipo_solicitante
    ADD CONSTRAINT tipo_solicitante_pk PRIMARY KEY (tipsol_codigo);
 T   ALTER TABLE ONLY parametricas.tipo_solicitante DROP CONSTRAINT tipo_solicitante_pk;
       parametricas            usr_controleg    false    221            ,           2606    16681    tipo_rol tipo_usuario_pk 
   CONSTRAINT     g   ALTER TABLE ONLY parametricas.tipo_rol
    ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY (tiprol_codigo);
 H   ALTER TABLE ONLY parametricas.tipo_rol DROP CONSTRAINT tipo_usuario_pk;
       parametricas            usr_controleg    false    224                       2606    18755    rol_recurso_operacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (ope_codigo) REFERENCES parametricas.operacion(ope_codigo);
 P   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT acceso_fk;
       autenticacion          usr_controleg    false    227    263    3634            #           2606    18780    usuario_operacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (ope_codigo) REFERENCES parametricas.operacion(ope_codigo);
 L   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT acceso_fk;
       autenticacion          usr_controleg    false    264    227    3634                       2606    18705    usuario estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT estado_fk FOREIGN KEY (usu_estado) REFERENCES parametricas.estados(est_codigo);
 B   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    208    258    3594                       2606    18715    usuario_entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (usuent_estado) REFERENCES parametricas.estados(est_codigo);
 J   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    208    259    3594                       2606    18735    recurso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.recurso
    ADD CONSTRAINT estado_fk FOREIGN KEY (rec_estado) REFERENCES parametricas.estados(est_codigo);
 B   ALTER TABLE ONLY autenticacion.recurso DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    261    208    3594                       2606    18740    menu estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.menu
    ADD CONSTRAINT estado_fk FOREIGN KEY (men_estado) REFERENCES parametricas.estados(est_codigo);
 ?   ALTER TABLE ONLY autenticacion.menu DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    262    208    3594                       2606    18750    rol_recurso_operacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (rro_estado) REFERENCES parametricas.estados(est_codigo);
 P   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    208    263    3594            %           2606    18785    usuario_rol estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT estado_fk FOREIGN KEY (usurol_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    3594    265    208                       2606    18865    rol estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol
    ADD CONSTRAINT estado_fk FOREIGN KEY (rol_estado) REFERENCES parametricas.estados(est_codigo);
 >   ALTER TABLE ONLY autenticacion.rol DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    260    208    3594            $           2606    18870    usuario_operacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (usuope_estado) REFERENCES parametricas.estados(est_codigo);
 L   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT estado_fk;
       autenticacion          usr_controleg    false    264    3594    208                       2606    18730    recurso menu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.recurso
    ADD CONSTRAINT menu_fk FOREIGN KEY (men_codigo) REFERENCES autenticacion.menu(men_codigo);
 @   ALTER TABLE ONLY autenticacion.recurso DROP CONSTRAINT menu_fk;
       autenticacion          usr_controleg    false    262    261    3712                       2606    18745    menu menu_menu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.menu
    ADD CONSTRAINT menu_menu_fk FOREIGN KEY (men_codigo_padre) REFERENCES autenticacion.menu(men_codigo);
 B   ALTER TABLE ONLY autenticacion.menu DROP CONSTRAINT menu_menu_fk;
       autenticacion          usr_controleg    false    3712    262    262                       2606    19193    usuario persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario DROP CONSTRAINT persona_fk;
       autenticacion          usr_controleg    false    258    3742    274                        2606    18765     rol_recurso_operacion recurso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT recurso_fk FOREIGN KEY (rec_codigo) REFERENCES autenticacion.recurso(rec_codigo);
 Q   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT recurso_fk;
       autenticacion          usr_controleg    false    261    263    3710            "           2606    18775    usuario_operacion recurso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT recurso_fk FOREIGN KEY (rec_codigo) REFERENCES autenticacion.recurso(rec_codigo);
 M   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT recurso_fk;
       autenticacion          usr_controleg    false    3710    264    261                       2606    18760     rol_recurso_operacion rol_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol_recurso_operacion
    ADD CONSTRAINT rol_codigo FOREIGN KEY (rol_codigo) REFERENCES autenticacion.rol(rol_codigo);
 Q   ALTER TABLE ONLY autenticacion.rol_recurso_operacion DROP CONSTRAINT rol_codigo;
       autenticacion          usr_controleg    false    260    263    3708            &           2606    18790    usuario_rol rol_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT rol_fk FOREIGN KEY (rol_codigo) REFERENCES autenticacion.rol(rol_codigo);
 C   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT rol_fk;
       autenticacion          usr_controleg    false    260    265    3708                       2606    18725    rol tipo_rol_usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.rol
    ADD CONSTRAINT tipo_rol_usuario_fk FOREIGN KEY (tiprol_codigo) REFERENCES parametricas.tipo_rol(tiprol_codigo);
 H   ALTER TABLE ONLY autenticacion.rol DROP CONSTRAINT tipo_rol_usuario_fk;
       autenticacion          usr_controleg    false    224    260    3628                       2606    18720    usuario_entidad usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_entidad
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usu_codigo) REFERENCES autenticacion.usuario(usu_codigo);
 K   ALTER TABLE ONLY autenticacion.usuario_entidad DROP CONSTRAINT usuario_fk;
       autenticacion          usr_controleg    false    258    259    3700            '           2606    18795    usuario_rol usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_rol
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usu_codigo) REFERENCES autenticacion.usuario(usu_codigo);
 G   ALTER TABLE ONLY autenticacion.usuario_rol DROP CONSTRAINT usuario_fk;
       autenticacion          usr_controleg    false    258    265    3700            !           2606    18770     usuario_operacion usuario_rol_fk    FK CONSTRAINT     �   ALTER TABLE ONLY autenticacion.usuario_operacion
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY (usurol_codigo) REFERENCES autenticacion.usuario_rol(usurol_codigo);
 Q   ALTER TABLE ONLY autenticacion.usuario_operacion DROP CONSTRAINT usuario_rol_fk;
       autenticacion          usr_controleg    false    264    3718    265            �           2606    18585    seguimiento_cargo cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 P   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT cargo_fk;
       controleg_dictamen          usr_controleg    false    248    251    3678            	           2606    18655    involucrado cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 J   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT cargo_fk;
       controleg_dictamen          usr_controleg    false    256    248    3678                       2606    18620    informe_uai dictamen_entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.informe_uai
    ADD CONSTRAINT dictamen_entidad_fk FOREIGN KEY (dicent_codigo) REFERENCES controleg_dictamen.dictamen_entidad(dicent_codigo);
 U   ALTER TABLE ONLY controleg_dictamen.informe_uai DROP CONSTRAINT dictamen_entidad_fk;
       controleg_dictamen          usr_controleg    false    253    254    3690                       2606    18645     dictamen_cge dictamen_entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.dictamen_cge
    ADD CONSTRAINT dictamen_entidad_fk FOREIGN KEY (dicent_codigo) REFERENCES controleg_dictamen.dictamen_entidad(dicent_codigo);
 V   ALTER TABLE ONLY controleg_dictamen.dictamen_cge DROP CONSTRAINT dictamen_entidad_fk;
       controleg_dictamen          usr_controleg    false    255    254    3690            �           2606    18540    cargo dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dicent_codigo) REFERENCES controleg_dictamen.dictamen_entidad(dicent_codigo);
 G   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT dictamen_fk;
       controleg_dictamen          usr_controleg    false    248    3690    254                       2606    18650    dictamen_cge dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.dictamen_cge
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo);
 N   ALTER TABLE ONLY controleg_dictamen.dictamen_cge DROP CONSTRAINT dictamen_fk;
       controleg_dictamen          usr_controleg    false    230    255    3640                       2606    19203    dictamen_entidad esntidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad
    ADD CONSTRAINT esntidad_fk FOREIGN KEY (ent_codigo) REFERENCES controleg_persona.entidad(ent_codigo);
 R   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad DROP CONSTRAINT esntidad_fk;
       controleg_dictamen          usr_controleg    false    275    254    3744            �           2606    18590 )   seguimiento_cargo estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 _   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT estado_clasificacion_fk;
       controleg_dictamen          usr_controleg    false    226    251    3632            �           2606    18550    cargo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT estado_fk FOREIGN KEY (car_estado) REFERENCES parametricas.estados(est_codigo);
 E   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    3594    248    208            �           2606    18595    seguimiento_cargo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo
    ADD CONSTRAINT estado_fk FOREIGN KEY (segcar_estado) REFERENCES parametricas.estados(est_codigo);
 Q   ALTER TABLE ONLY controleg_dictamen.seguimiento_cargo DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    208    3594    251                       2606    18615    informe_uai estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.informe_uai
    ADD CONSTRAINT estado_fk FOREIGN KEY (infuai_estado) REFERENCES parametricas.estados(est_codigo);
 K   ALTER TABLE ONLY controleg_dictamen.informe_uai DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    253    208    3594                       2606    18630    dictamen_entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (dicent_estado) REFERENCES parametricas.estados(est_codigo);
 P   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    254    208    3594                       2606    18640    dictamen_cge estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.dictamen_cge
    ADD CONSTRAINT estado_fk FOREIGN KEY (diccge_estado) REFERENCES parametricas.estados(est_codigo);
 L   ALTER TABLE ONLY controleg_dictamen.dictamen_cge DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    255    208    3594                       2606    18665    involucrado estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT estado_fk FOREIGN KEY (inv_estado) REFERENCES parametricas.estados(est_codigo);
 K   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT estado_fk;
       controleg_dictamen          usr_controleg    false    256    208    3594                       2606    18670    involucrado infraccion_tipo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT infraccion_tipo_fk FOREIGN KEY (tipinf_codigo) REFERENCES parametricas.tipo_infraccion(tipinf_codigo);
 T   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT infraccion_tipo_fk;
       controleg_dictamen          usr_controleg    false    3604    212    256            �           2606    18545    cargo mon_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.cargo
    ADD CONSTRAINT mon_codigo FOREIGN KEY (mon_codigo) REFERENCES parametricas.moneda(mon_codigo);
 F   ALTER TABLE ONLY controleg_dictamen.cargo DROP CONSTRAINT mon_codigo;
       controleg_dictamen          usr_controleg    false    3614    217    248            ]           0    0    CONSTRAINT mon_codigo ON cargo    COMMENT     `   COMMENT ON CONSTRAINT mon_codigo ON controleg_dictamen.cargo IS 'Referencia al tipo de moneda';
          controleg_dictamen          usr_controleg    false    3827            
           2606    18660 "   involucrado persona_responsable_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.involucrado
    ADD CONSTRAINT persona_responsable_fk FOREIGN KEY (perres_codigo) REFERENCES controleg_persona.persona_responsable(perres_codigo);
 X   ALTER TABLE ONLY controleg_dictamen.involucrado DROP CONSTRAINT persona_responsable_fk;
       controleg_dictamen          usr_controleg    false    257    256    3696                       2606    18635 (   dictamen_entidad tipos_responabilidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad
    ADD CONSTRAINT tipos_responabilidad_fk FOREIGN KEY (tipres_codigo) REFERENCES parametricas.tipo_responsabilidad(tipres_codigo);
 ^   ALTER TABLE ONLY controleg_dictamen.dictamen_entidad DROP CONSTRAINT tipos_responabilidad_fk;
       controleg_dictamen          usr_controleg    false    254    210    3600                       2606    18690 *   persona_responsable empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES controleg_persona.empresa_unipersonal(empuni_codigo);
 _   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT empresa_unipersonal_fk;
       controleg_persona          usr_controleg    false    257    243    3668                       2606    19188    persona_responsable entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT entidad_fk FOREIGN KEY (ent_codigo) REFERENCES controleg_persona.entidad(ent_codigo);
 S   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT entidad_fk;
       controleg_persona          usr_controleg    false    257    275    3744            �           2606    18455    persona_juridica estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_juridica
    ADD CONSTRAINT estado_fk FOREIGN KEY (perjur_estado) REFERENCES parametricas.estados(est_codigo);
 O   ALTER TABLE ONLY controleg_persona.persona_juridica DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    3594    242    208            �           2606    18460    empresa_unipersonal estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT estado_fk FOREIGN KEY (empuni_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    3594    243    208                       2606    18695    persona_responsable estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT estado_fk FOREIGN KEY (perres_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    3594    257    208            �           2606    18860    representante_legal estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT estado_fk FOREIGN KEY (repleg_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    208    3594    244            ;           2606    19068    persona estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT estado_fk FOREIGN KEY (per_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    208    3594    274            ?           2606    19133    entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (ent_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY controleg_persona.entidad DROP CONSTRAINT estado_fk;
       controleg_persona          usr_controleg    false    208    275    3594            <           2606    19078    persona genero_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT genero_fk FOREIGN KEY (per_genero) REFERENCES parametricas.genero(gen_codigo);
 F   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT genero_fk;
       controleg_persona          usr_controleg    false    274    223    3626            =           2606    19073    persona lugar_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT lugar_fk FOREIGN KEY (per_lugar_emision) REFERENCES controleg_ubicacion.departamento(dep_codigo);
 E   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT lugar_fk;
       controleg_persona          usr_controleg    false    268    3726    274            �           2606    19093    representante_legal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 S   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT persona_fk;
       controleg_persona          usr_controleg    false    244    3742    274            �           2606    19168    empresa_unipersonal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 S   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT persona_fk;
       controleg_persona          usr_controleg    false    274    243    3742                       2606    19178    persona_responsable persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 S   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_fk;
       controleg_persona          usr_controleg    false    3742    257    274            �           2606    18470 '   empresa_unipersonal persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.empresa_unipersonal
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 \   ALTER TABLE ONLY controleg_persona.empresa_unipersonal DROP CONSTRAINT persona_juridica_fk;
       controleg_persona          usr_controleg    false    242    3666    243            �           2606    18485 '   representante_legal persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.representante_legal
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 \   ALTER TABLE ONLY controleg_persona.representante_legal DROP CONSTRAINT persona_juridica_fk;
       controleg_persona          usr_controleg    false    3666    244    242                       2606    18685 '   persona_responsable persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 \   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_juridica_fk;
       controleg_persona          usr_controleg    false    3666    242    257                       2606    19183 &   persona_responsable persona_natural_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona_responsable
    ADD CONSTRAINT persona_natural_fk FOREIGN KEY (per_codigo_natural) REFERENCES controleg_persona.persona(per_codigo);
 [   ALTER TABLE ONLY controleg_persona.persona_responsable DROP CONSTRAINT persona_natural_fk;
       controleg_persona          usr_controleg    false    3742    257    274            >           2606    19013    persona tipo_documento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_persona.persona
    ADD CONSTRAINT tipo_documento_fk FOREIGN KEY (tipdoc_codigo) REFERENCES parametricas.tipo_documento(tipdoc_codigo);
 N   ALTER TABLE ONLY controleg_persona.persona DROP CONSTRAINT tipo_documento_fk;
       controleg_persona          usr_controleg    false    3736    271    274            �           2606    18560    proceso_cargo cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg_dictamen.cargo(car_codigo);
 K   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT cargo_fk;
       controleg_proceso          usr_controleg    false    248    249    3678            *           2606    18810    sancion demandado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT demandado_fk FOREIGN KEY (dem_codigo) REFERENCES controleg_proceso.demandado(dem_codigo);
 I   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT demandado_fk;
       controleg_proceso          usr_controleg    false    252    266    3686            �           2606    19198    proceso entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT entidad_fk FOREIGN KEY (ent_codigo) REFERENCES controleg_persona.entidad(ent_codigo);
 G   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT entidad_fk;
       controleg_proceso          usr_controleg    false    275    245    3744            �           2606    18575 +   seguimiento_proceso estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 `   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT estado_clasificacion_fk;
       controleg_proceso          usr_controleg    false    226    250    3632            ,           2606    18820 +   seguimiento_sancion estado_clasificacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT estado_clasificacion_fk FOREIGN KEY (estcla_codigo) REFERENCES parametricas.estado_clasificacion(estcla_codigo);
 `   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT estado_clasificacion_fk;
       controleg_proceso          usr_controleg    false    226    267    3632            �           2606    18500    proceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (pro_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    245    208    3594            �           2606    18520    proceso_juzgado estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_juzgado
    ADD CONSTRAINT estado_fk FOREIGN KEY (projuz_estado) REFERENCES parametricas.estados(est_codigo);
 N   ALTER TABLE ONLY controleg_proceso.proceso_juzgado DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    246    208    3594            �           2606    18535    proceso_abogado estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_abogado
    ADD CONSTRAINT estado_fk FOREIGN KEY (proabo_estado) REFERENCES parametricas.estados(est_codigo);
 N   ALTER TABLE ONLY controleg_proceso.proceso_abogado DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    3594    208    247            �           2606    18555    proceso_cargo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT estado_fk FOREIGN KEY (procar_estado) REFERENCES parametricas.estados(est_codigo);
 L   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    208    3594    249            �           2606    18580    seguimiento_proceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (segpro_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    208    3594    250                        2606    18610    demandado estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT estado_fk FOREIGN KEY (dem_estado) REFERENCES parametricas.estados(est_codigo);
 H   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    252    208    3594            )           2606    18805    sancion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT estado_fk FOREIGN KEY (san_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    208    266    3594            -           2606    18875    seguimiento_sancion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT estado_fk FOREIGN KEY (segsan_estado) REFERENCES parametricas.estados(est_codigo);
 R   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    267    208    3594            @           2606    19236    proceso_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (proarc_estado) REFERENCES parametricas.estados(est_codigo);
 N   ALTER TABLE ONLY controleg_proceso.proceso_archivo DROP CONSTRAINT estado_fk;
       controleg_proceso          usr_controleg    false    3594    276    208            �           2606    19158    proceso_juzgado juzgado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_juzgado
    ADD CONSTRAINT juzgado_fk FOREIGN KEY (juz_codigo) REFERENCES controleg_ubicacion.juzgado(juz_codigo);
 O   ALTER TABLE ONLY controleg_proceso.proceso_juzgado DROP CONSTRAINT juzgado_fk;
       controleg_proceso          usr_controleg    false    246    272    3738            �           2606    18490    proceso moneda_codigo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT moneda_codigo_fk FOREIGN KEY (mon_codigo) REFERENCES parametricas.moneda(mon_codigo);
 M   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT moneda_codigo_fk;
       controleg_proceso          usr_controleg    false    217    3614    245            �           2606    19173    proceso_abogado persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_abogado
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 O   ALTER TABLE ONLY controleg_proceso.proceso_abogado DROP CONSTRAINT persona_fk;
       controleg_proceso          usr_controleg    false    274    247    3742            �           2606    18605     demandado persona_responsable_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT persona_responsable_fk FOREIGN KEY (perres_codigo) REFERENCES controleg_persona.persona_responsable(perres_codigo);
 U   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT persona_responsable_fk;
       controleg_proceso          usr_controleg    false    252    257    3696            �           2606    18515    proceso_juzgado proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_juzgado
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 O   ALTER TABLE ONLY controleg_proceso.proceso_juzgado DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    246    245    3672            �           2606    18525    proceso_abogado proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_abogado
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 O   ALTER TABLE ONLY controleg_proceso.proceso_abogado DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    247    3672    245            �           2606    18565    proceso_cargo proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_cargo
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 M   ALTER TABLE ONLY controleg_proceso.proceso_cargo DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    249    3672    245            �           2606    18570    seguimiento_proceso proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 S   ALTER TABLE ONLY controleg_proceso.seguimiento_proceso DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    250    3672    245            �           2606    18600    demandado proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.demandado
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 I   ALTER TABLE ONLY controleg_proceso.demandado DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    252    245    3672            A           2606    19231    proceso_archivo proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso_archivo
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_proceso.proceso(pro_codigo);
 O   ALTER TABLE ONLY controleg_proceso.proceso_archivo DROP CONSTRAINT proceso_fk;
       controleg_proceso          usr_controleg    false    276    3672    245            +           2606    18815    seguimiento_sancion sancion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion
    ADD CONSTRAINT sancion_fk FOREIGN KEY (san_codigo) REFERENCES controleg_proceso.sancion(san_codigo);
 S   ALTER TABLE ONLY controleg_proceso.seguimiento_sancion DROP CONSTRAINT sancion_fk;
       controleg_proceso          usr_controleg    false    3720    267    266            �           2606    18495    proceso tipo_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.proceso
    ADD CONSTRAINT tipo_proceso_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 L   ALTER TABLE ONLY controleg_proceso.proceso DROP CONSTRAINT tipo_proceso_fk;
       controleg_proceso          usr_controleg    false    3598    209    245            (           2606    18800    sancion tipo_sancion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_proceso.sancion
    ADD CONSTRAINT tipo_sancion_fk FOREIGN KEY (tipsan_codigo) REFERENCES parametricas.tipo_sancion(tipsan_codigo);
 L   ALTER TABLE ONLY controleg_proceso.sancion DROP CONSTRAINT tipo_sancion_fk;
       controleg_proceso          usr_controleg    false    215    266    3610            �           2606    18255 :   solicitud_solvencia_fiscal documento_representante_tipo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT documento_representante_tipo_fk FOREIGN KEY (drt_codigo) REFERENCES parametricas.documento_representante_tipo(drt_codigo);
 q   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT documento_representante_tipo_fk;
       controleg_solvencia          usr_controleg    false    228    3624    222            �           2606    18245 .   solicitud_solvencia_fiscal motivo_solvencia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT motivo_solvencia_fk FOREIGN KEY (motsol_codigo) REFERENCES parametricas.motivo_solvencia(motsol_codigo);
 e   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT motivo_solvencia_fk;
       controleg_solvencia          usr_controleg    false    220    3620    228            �           2606    19063 /   solicitud_solvencia_fiscal persona_apoderado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT persona_apoderado_fk FOREIGN KEY (per_codigo_apoderado) REFERENCES controleg_persona.persona(per_codigo);
 f   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT persona_apoderado_fk;
       controleg_solvencia          usr_controleg    false    228    274    3742            �           2606    19058 %   solicitud_solvencia_fiscal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo);
 \   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT persona_fk;
       controleg_solvencia          usr_controleg    false    3742    228    274            �           2606    18270 7   solicitud_archivo_digital solicitud_solvencia_fiscal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital
    ADD CONSTRAINT solicitud_solvencia_fiscal_fk FOREIGN KEY (ssf_codigo) REFERENCES controleg_solvencia.solicitud_solvencia_fiscal(ssf_codigo);
 n   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital DROP CONSTRAINT solicitud_solvencia_fiscal_fk;
       controleg_solvencia          usr_controleg    false    3636    229    228            �           2606    18275 )   solicitud_archivo_digital tipo_adjunto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital
    ADD CONSTRAINT tipo_adjunto_fk FOREIGN KEY (tipadj_codigo) REFERENCES parametricas.tipo_adjunto(tipadj_codigo);
 `   ALTER TABLE ONLY controleg_solvencia.solicitud_archivo_digital DROP CONSTRAINT tipo_adjunto_fk;
       controleg_solvencia          usr_controleg    false    219    3618    229            �           2606    18250 .   solicitud_solvencia_fiscal tipo_solicitante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal
    ADD CONSTRAINT tipo_solicitante_fk FOREIGN KEY (tipsol_codigo) REFERENCES parametricas.tipo_solicitante(tipsol_codigo);
 e   ALTER TABLE ONLY controleg_solvencia.solicitud_solvencia_fiscal DROP CONSTRAINT tipo_solicitante_fk;
       controleg_solvencia          usr_controleg    false    3622    221    228            0           2606    18835    provincia departamento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.provincia
    ADD CONSTRAINT departamento_fk FOREIGN KEY (dep_codigo) REFERENCES controleg_ubicacion.departamento(dep_codigo);
 P   ALTER TABLE ONLY controleg_ubicacion.provincia DROP CONSTRAINT departamento_fk;
       controleg_ubicacion          usr_controleg    false    3726    269    268            3           2606    18850    municipio departamento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.municipio
    ADD CONSTRAINT departamento_fk FOREIGN KEY (dep_codigo) REFERENCES controleg_ubicacion.departamento(dep_codigo);
 P   ALTER TABLE ONLY controleg_ubicacion.municipio DROP CONSTRAINT departamento_fk;
       controleg_ubicacion          usr_controleg    false    3726    268    270            5           2606    19033    juzgado departamento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.juzgado
    ADD CONSTRAINT departamento_fk FOREIGN KEY (dep_codigo) REFERENCES controleg_ubicacion.departamento(dep_codigo);
 N   ALTER TABLE ONLY controleg_ubicacion.juzgado DROP CONSTRAINT departamento_fk;
       controleg_ubicacion          usr_controleg    false    272    3726    268            .           2606    18825    departamento estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.departamento
    ADD CONSTRAINT estado_fk FOREIGN KEY (dep_estado) REFERENCES parametricas.estados(est_codigo);
 M   ALTER TABLE ONLY controleg_ubicacion.departamento DROP CONSTRAINT estado_fk;
       controleg_ubicacion          usr_controleg    false    268    208    3594            /           2606    18830    provincia estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.provincia
    ADD CONSTRAINT estado_fk FOREIGN KEY (pro_estado) REFERENCES parametricas.estados(est_codigo);
 J   ALTER TABLE ONLY controleg_ubicacion.provincia DROP CONSTRAINT estado_fk;
       controleg_ubicacion          usr_controleg    false    208    3594    269            1           2606    18840    municipio estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.municipio
    ADD CONSTRAINT estado_fk FOREIGN KEY (mun_estado) REFERENCES parametricas.estados(est_codigo);
 J   ALTER TABLE ONLY controleg_ubicacion.municipio DROP CONSTRAINT estado_fk;
       controleg_ubicacion          usr_controleg    false    270    208    3594            6           2606    19023    juzgado estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.juzgado
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (juz_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 Q   ALTER TABLE ONLY controleg_ubicacion.juzgado DROP CONSTRAINT estado_registro_fk;
       controleg_ubicacion          usr_controleg    false    3594    272    208            7           2606    19028    juzgado municipio_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.juzgado
    ADD CONSTRAINT municipio_fk FOREIGN KEY (mun_codigo) REFERENCES controleg_ubicacion.municipio(mun_codigo);
 K   ALTER TABLE ONLY controleg_ubicacion.juzgado DROP CONSTRAINT municipio_fk;
       controleg_ubicacion          usr_controleg    false    270    3734    272            2           2606    18845    municipio provincia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.municipio
    ADD CONSTRAINT provincia_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_ubicacion.provincia(pro_codigo);
 M   ALTER TABLE ONLY controleg_ubicacion.municipio DROP CONSTRAINT provincia_fk;
       controleg_ubicacion          usr_controleg    false    3730    270    269            8           2606    19038    juzgado provincia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg_ubicacion.juzgado
    ADD CONSTRAINT provincia_fk FOREIGN KEY (pro_codigo) REFERENCES controleg_ubicacion.provincia(pro_codigo);
 K   ALTER TABLE ONLY controleg_ubicacion.juzgado DROP CONSTRAINT provincia_fk;
       controleg_ubicacion          usr_controleg    false    3730    272    269            �           2606    18355    descarga acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES dictamen.acceso(acc_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT acceso_fk;
       dictamen          usr_controleg    false    234    235    3650            �           2606    18365    notificacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES dictamen.acceso(acc_codigo) MATCH FULL;
 B   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT acceso_fk;
       dictamen          usr_controleg    false    234    236    3650            �           2606    18315    informe dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    233    3640    230            �           2606    18340    acceso dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    3640    234    230            �           2606    18415    dictamen_archivo dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 H   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    238    3640    230            �           2606    18435    proceso_entidad dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT dictamen_fk;
       dictamen          usr_controleg    false    240    3640    230            �           2606    18395 '   persona_dictamen empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES controleg_persona.empresa_unipersonal(empuni_codigo);
 S   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT empresa_unipersonal_fk;
       dictamen          usr_controleg    false    3668    237    243            �           2606    18280    dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (dic_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    230    208    3594            �           2606    18285    catalogo_general estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT estado_fk FOREIGN KEY (catgen_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    3594    231            �           2606    18295    informe_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (infarc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 E   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    232    208    3594            �           2606    18320    informe estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT estado_fk FOREIGN KEY (inf_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 =   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    233    3594            �           2606    18335    acceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (acc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 <   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    234    3594            �           2606    18350    descarga estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT estado_fk FOREIGN KEY (des_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    235    3594            �           2606    18370    notificacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (not_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 B   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    236    3594            �           2606    18380    persona_dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (perdic_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    208    237    3594            �           2606    18420    dictamen_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (dicarc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3594    208    238            �           2606    18430 "   persona_dictamen_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (pda_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 N   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3594    208    239            �           2606    18440    proceso_entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (proent_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 E   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    240    208    3594            �           2606    18450 !   proceso_entidad_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (pea_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 M   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_controleg    false    3594    241    208            �           2606    18290    informe_archivo informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT informe_fk;
       dictamen          usr_controleg    false    232    233    3648            �           2606    18360    descarga informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT informe_fk;
       dictamen          usr_controleg    false    233    235    3648            �           2606    18385    persona_dictamen informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT informe_fk;
       dictamen          usr_controleg    false    233    3648    237            �           2606    18425 ,   persona_dictamen_archivo persona_dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT persona_dictamen_fk FOREIGN KEY (perdic_codigo) REFERENCES dictamen.persona_dictamen(perdic_codigo) MATCH FULL;
 X   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT persona_dictamen_fk;
       dictamen          usr_controleg    false    3656    239    237            �           2606    19083    descarga persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES controleg_persona.persona(per_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT persona_fk;
       dictamen          usr_controleg    false    3742    274    235            �           2606    18390 $   persona_dictamen persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES controleg_persona.persona_juridica(perjur_codigo);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_juridica_fk;
       dictamen          usr_controleg    false    237    3666    242            �           2606    18405 )   persona_dictamen persona_responsable_2_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_responsable_2_fk FOREIGN KEY (perres_codigo) REFERENCES controleg_persona.persona_responsable(perres_codigo);
 U   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_responsable_2_fk;
       dictamen          usr_controleg    false    237    257    3696            �           2606    18445 *   proceso_entidad_archivo proceso_entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT proceso_entidad_fk FOREIGN KEY (proent_codigo) REFERENCES dictamen.proceso_entidad(proent_codigo) MATCH FULL;
 V   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT proceso_entidad_fk;
       dictamen          usr_controleg    false    241    3662    240            �           2606    18330    informe subtipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT subtipo_informe_fk FOREIGN KEY (sti_dominio, sti_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT subtipo_informe_fk;
       dictamen          usr_controleg    false    233    3644    231    231    233            �           2606    18325    informe tipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT tipo_informe_fk FOREIGN KEY (tipinf_dominio, tipinf_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor) MATCH FULL;
 C   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT tipo_informe_fk;
       dictamen          usr_controleg    false    231    233    233    3644    231            �           2606    18400 $   persona_dictamen tipo_involucrado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT tipo_involucrado_fk FOREIGN KEY (tipinv_dominio, tipinv_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT tipo_involucrado_fk;
       dictamen          usr_controleg    false    3644    237    231    231    237            �           2606    18210 &   estado_clasificacion estado_control_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_control_fk FOREIGN KEY (estcon_codigo) REFERENCES parametricas.estado_control(estcont_codigo);
 V   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_control_fk;
       parametricas          usr_controleg    false    214    3608    226            �           2606    18215 $   estado_clasificacion estado_etapa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_etapa_fk FOREIGN KEY (esteta_codigo) REFERENCES parametricas.estado_etapa(esteta_codigo);
 T   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_etapa_fk;
       parametricas          usr_controleg    false    226    225    3630            �           2606    18110    sub_tipo_informe estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.sub_tipo_informe
    ADD CONSTRAINT estado_fk FOREIGN KEY (sti_estado) REFERENCES parametricas.estados(est_codigo);
 J   ALTER TABLE ONLY parametricas.sub_tipo_informe DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3594    208    211            �           2606    18130    estado_control estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_control
    ADD CONSTRAINT estado_fk FOREIGN KEY (estcon_estado) REFERENCES parametricas.estados(est_codigo);
 H   ALTER TABLE ONLY parametricas.estado_control DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    208    214    3594            �           2606    18135    tipo_sancion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_sancion
    ADD CONSTRAINT estado_fk FOREIGN KEY (tipsan_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY parametricas.tipo_sancion DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3594    208    215            �           2606    18205    tipo_rol estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_rol
    ADD CONSTRAINT estado_fk FOREIGN KEY (tiprol_estado) REFERENCES parametricas.estados(est_codigo);
 B   ALTER TABLE ONLY parametricas.tipo_rol DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    208    3594    224            �           2606    18225    estado_clasificacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (estcla_estado) REFERENCES parametricas.estados(est_codigo);
 N   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    208    226    3594            �           2606    18240    operacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.operacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (ope_estado) REFERENCES parametricas.estados(est_codigo);
 C   ALTER TABLE ONLY parametricas.operacion DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    208    227    3594            �           2606    18855    estado_etapa estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_etapa
    ADD CONSTRAINT estado_fk FOREIGN KEY (esteta_estado) REFERENCES parametricas.estados(est_codigo);
 F   ALTER TABLE ONLY parametricas.estado_etapa DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3594    225    208            9           2606    19053 (   tipo_proceso_datos_adicionales estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT estado_fk FOREIGN KEY (tpda_estado) REFERENCES parametricas.estados(est_codigo);
 X   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT estado_fk;
       parametricas          usr_controleg    false    3594    273    208            ^           0    0 6   CONSTRAINT estado_fk ON tipo_proceso_datos_adicionales    COMMENT     i   COMMENT ON CONSTRAINT estado_fk ON parametricas.tipo_proceso_datos_adicionales IS 'Estado del Registro';
          parametricas          usr_controleg    false    3897            �           2606    18100    tipo_proceso estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tippro_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.tipo_proceso DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    209    3594    208            �           2606    18105 '   tipo_responsabilidad estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_responsabilidad
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipres_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 W   ALTER TABLE ONLY parametricas.tipo_responsabilidad DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    210    3594    208            �           2606    18120 "   tipo_infraccion estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_infraccion
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipinf_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 R   ALTER TABLE ONLY parametricas.tipo_infraccion DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    212    3594    208            �           2606    18125 #   tipo_involucrado estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_involucrado
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipinv_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 S   ALTER TABLE ONLY parametricas.tipo_involucrado DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    3594    213    208            �           2606    18155    lugar estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.lugar
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (lug_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 H   ALTER TABLE ONLY parametricas.lugar DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    216    3594    208            �           2606    18160    moneda estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.moneda
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (mon_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 I   ALTER TABLE ONLY parametricas.moneda DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    3594    217    208            �           2606    18165 *   tipo_documento_remision estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_documento_remision
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tdr_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 Z   ALTER TABLE ONLY parametricas.tipo_documento_remision DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    3594    218            �           2606    18170    tipo_adjunto estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_adjunto
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipadj_estado) REFERENCES parametricas.estados(est_codigo);
 O   ALTER TABLE ONLY parametricas.tipo_adjunto DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    208    219    3594            �           2606    18175 #   motivo_solvencia estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.motivo_solvencia
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (motsol_estado) REFERENCES parametricas.estados(est_codigo);
 S   ALTER TABLE ONLY parametricas.motivo_solvencia DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    3594    220    208            �           2606    18180 #   tipo_solicitante estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_solicitante
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipsol_estado) REFERENCES parametricas.estados(est_codigo);
 S   ALTER TABLE ONLY parametricas.tipo_solicitante DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    221    208    3594            �           2606    18185 /   documento_representante_tipo estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.documento_representante_tipo
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (drt_estado) REFERENCES parametricas.estados(est_codigo);
 _   ALTER TABLE ONLY parametricas.documento_representante_tipo DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    3594    222    208            �           2606    18190    genero estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.genero
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (gen_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 I   ALTER TABLE ONLY parametricas.genero DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    223    208    3594            4           2606    19008 !   tipo_documento estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_documento
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipdoc_estado) REFERENCES parametricas.estados(est_codigo) MATCH FULL;
 Q   ALTER TABLE ONLY parametricas.tipo_documento DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg    false    3594    208    271            :           2606    19048 @   tipo_proceso_datos_adicionales tipo_proceso_datos_adicionales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT tipo_proceso_datos_adicionales_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 p   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT tipo_proceso_datos_adicionales_fk;
       parametricas          usr_controleg    false    273    209    3598            �           2606    18230 $   estado_clasificacion tipo_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT tipo_proceso_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 T   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT tipo_proceso_fk;
       parametricas          usr_controleg    false    3598    226    209            �           2606    18115 '   tipo_infraccion tipo_responsabilidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_infraccion
    ADD CONSTRAINT tipo_responsabilidad_fk FOREIGN KEY (tipres_codigo) REFERENCES parametricas.tipo_responsabilidad(tipres_codigo) MATCH FULL;
 W   ALTER TABLE ONLY parametricas.tipo_infraccion DROP CONSTRAINT tipo_responsabilidad_fk;
       parametricas          usr_controleg    false    3600    212    210            �           2606    18235 ,   estado_clasificacion tipo_responsabilidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT tipo_responsabilidad_fk FOREIGN KEY (tipres_codigo) REFERENCES parametricas.tipo_responsabilidad(tipres_codigo);
 \   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT tipo_responsabilidad_fk;
       parametricas          usr_controleg    false    3600    210    226            �           2606    18220 $   estado_clasificacion tipo_sancion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_clasificacion
    ADD CONSTRAINT tipo_sancion_fk FOREIGN KEY (tipsan_codigo) REFERENCES parametricas.tipo_sancion(tipsan_codigo);
 T   ALTER TABLE ONLY parametricas.estado_clasificacion DROP CONSTRAINT tipo_sancion_fk;
       parametricas          usr_controleg    false    3610    226    215            �   3  x���MN�0���)|�3��o��ucZmm�ɱ8�Mh�H#Y��>�7H��\r{ߥv�2�-�-{	{O�p�R���ϝ��;Y�APHB� �&$��
�(86��$� X�ء.�U�)���@W)l|#A�����+#,�#8 ���Ir;��ޜ�F���.�0^\���lj�gC�c>�p�Π�>���S����!R+J!��Q�^�ӻ>}�o�\'`�}j�1=A"��A�z��&1G�_;�7���'(�+��u��|]Uts�R���O�K�`(�%�����r��yUU�lu��      �   �   x���1n�0�Y>�.`���m����!KS���kP�q"��_H�ۺ��._�~�H��}ݗ��\�G��jJ�B�#5��0-0p҄Yd�"�G��>�O̩xu����>S�͊2��~���_��!u�� B�(�X�����c��0 C�UK�ԏ�X;��BY�]ݘ���!�`=>Y������0��ѵ      �   �   x����n�0E��+�����R7ݴU���
Ve)`d�~!
�H���l<wqε۹/?�x��{{7���pX�ٸ4$�# Y�(Qp���QȚaP���i��
��{}X�q����?tCZd��=u���B�v��`l7����J�JZ��!]!* �-@�mt�&�N���F�Ja�!������F��ݐ�F��6�"U�Բ��"��e��O���ޚl�;���XL�&��*���B�q      �   �   x���AC!е��H@A������.��f��(8#��a���E��HcZ��f�bƜ'�vU'�� y,��&u��L�d�Ne�'�\�H��!�����L�b��5�[/�Ejgo��MbW���h@�L1
G�?�E��7��d�      �   �   x���Ok�@�����2�fw��s<xIE�Rh�z)4
�7)Ġ��ӛ�o�о��n~�>~���a��e�9ު���Z�	W2J0	�J4�(D�L2��1/�IN�	l�U�1�3�����/Vug_�Z��:R�l#;%I�%K��9��VgtP�l��˵��䘻t�����e�r��>|�#������!�^�W�s�"o�      �   F   x�mȱ� ��U�� �
�cǞ��}�t
(�`tgx�¹t�>�2��SG!���ٮf� ��      �   �   x���M��0�s�\ <��e��!n�ŕ2�eV��	�H8�8HI)����ds�,��4��Q;����mV���%ut)+���J��Rj;7�:S�$V�m�W&$���`G͈.�o��2շ����]�AZD�ސ�rV&��6�4F����=
���/��<W}��e�(�GY(�Wα$}��"����r.��K�RM��g�-�I�_�=�I�_�6z�d����9���L��\��۶�)�*s      �   �   x�����1�3�"$���,��F�/URd�8|2��("��Cm�fY���H��P�v�z�׭�\y9�Q3M�� �>�Z�"�p��z���׮�dD2����8vh�U�ɕ��{���a^F      �   `   x�����0C�0EHd ?2K���4綊l�`YOj@�#�Bk�f�_�W�eN�ā	'`m�u��/��X�;�1����Ӵ��!v̼
3���+�      �      x������ � �      �   B   x�m��� ��,d��6����Q��}�2M���9
]Y����|�uH �ej{������      �   M   x�mL�	�0{�Sd�ى!�,���1}�Q!�R(HJ:$�J'މ2 :�ʡ�l�0���a�/��р(�u|f~ $�      �   d   x����	1��S�6#�vp\��_��[� ��dB�;�1�I�,;���|�
�Lد�w����A6K��c���L]����F�)��y~t����8      �      x������ � �      �   ^  x���K��0���)|��K�C��ng�4N'@;)�b�޾��"���1�l�+�gR$��lQ ��w�UCE{�Z�ˇ��;�ʹ�����������нf�v��Q�!v���� AQތ�Tc� �٫3�\?���6I�+B$��cu$���!�p'$��9sN�=PG�BLųSt�.�k?��?�/o�6��J�D1`S6G19�a�ѓק�[�������z>|����gr�H5��<��E�hB`Kh�+$���N��b�PJ��Zj`{C��e�
�t<�%b�L5d4����W��' $_\Rs/��72���	�^����1L$����t�c~JI���ޢz�	����ͻ���	s�k��Uo,��Eѿ۠[ci�V�bk`\oT=�!�ˌ�� ��R� 0�K�-�G+M�LS�]���з�Vα
[;�DZ�nQ=ZPb���������y �c�0|Z�-�f�[��*�><6�SZD!�Jc�DiJ�Aբ��I!N��ǽbM�a�
(������qN&�4F��w�i-lU�@\���u��8�G6	.*�X�1	t���;���ۨz�7��A��~����{�̝�?Y��j�~�7����� ����         <  x����n�0�ϛ��H���}��Z.(�ʕ�1.J���}���Z�Ų,�3�~30��.D�k����� .�����ͻ:u!F
^�i�;�V����У���v�q	<9�9�ȴ��QT�Vդ�es����ѱl2	w����+I��s��^�+r�Hܤ-dQ*&���oqd�P�~mbkq�{���o�:���q�m�m����KvQy�T��qI����ůI)�Y ��>[lN�O踰�~�Y�J8g��K����gX�=ޏ�~H�l�*�*#�0U0Q���oQ�r��\2�wf�,�g��"˲7�!�            x��=�v�F�ύ��9�����Ȳ���v<r2�͙H��E:$eG��������n@ Ф�4%��P]�KC8�_l��m�v���?�5x8�U�W<��[�z�Z~]V����@�6p�/����K�$|����s?�L�3-K��6���/B�ٻ������r�e�>T�zI��>������ ���f��z��k&Mi�3Z��-D`�6�Y��O���j5��Y��V��b�n���&����q�D)�0���-�d�n��}N�1Zy��P#�_I�y�E��?�l��٦��<�s������Umq�.���)�El���ͧ;x����v���7݂�#-\Muͮ��y:��x}�vHy~�d(]06�h��nA��"����4������+����8,��Jo��!�'���<�T�R�/���u���/���Hu�bvț��bJǂ-�Sz#��EF�"�*AA�S c�|����}�#�:њ�gtO��G���#<����/#��V��"p�Gg8�P�r���g��5�/��Pt-i���\����x��+����b��y\�V��r�������u5��&���/�m�[2���}\�� {��_�t�$ϭ���a"ܙTgƕV*��!1�����4��ji]왱� Ɔ��x��DH�������1VѢ
ޕV��bKǀ�1��օ���4�bw�ww���B�������o�����Z��`m���Rd��ph!��y���&���7_���7(ncin�#w��P�7�^k�������.�pB�1���Ūz�.+��l[�ُ���wrf��!��K�kj��v�Ւ	D>W�N̝ז�������#O�RK�F^� 13 �m|aٯ��j6�����t3�R�g[ ��$PF16�m�,�ڶŭ@�ѷKK�%	��ݎ���h󽵢+�(��̀����ZX�Sk��I+���@ً��k\\�ToO9U�N4�>�)�hJg{J|8����S���juS�O�����Hd_�:
svݥp���j5��3)� �E]�U���D�3͑W�0�Kz m�$'E��l*���d��]��n���nJX �T�+�y���]�7ۇ����|0Z�&r�o�����7���M+0�޶�����d��W��z����m�^���=�퐙�	J��;�c�P�#'���Ђ�Tr��>,o�٪���� S��.a�.��� _�~%{	����n����K��վ����Z�%���v�e��|��ps�G#��yMy׼՘r�4J݅;2d@,n2޿<S����~��W��-�u�#��q۽��r�Z��hGynYja�1V����2Z�(擷��z�b�?���.��r�����r�,�84[ҹ]�z��0C;*Op��00����5HX��@�,����Ng]X�&������y��.k?�$� ����1_��E{�>��f��ph�y3[/w���ڐ:�N��.|��E�� <����?��TU�YT�I�m�.a��*�B���2 <H�e��S27��f���؇�i��C��V֩� �ͳ\�>�����7���~cNcxK;��$�#����p]So̣��w�<y+C�C>�퀚�7���juZD�k�x#	�B�x�T{Av��b:�Rk)���yRv"9*M�kXva2����Cꮅ�Z����`}{}��fӛ���v�G�Emj�SD������Xs�& ~?\�tI:Z`@�^.��l�f)�Ĥ���Ar��yĭy'���%p)�h�����c�P�1�P��?��NAp��K-	��%RJ-��xR�hdP�J	�Z�T�h�a����4���0����O����kJq;�.����K���s�y�zuê�BI ��6��e�_����A<km��v���h/�A�A_]�� �E�xc��������51�:a���2ԡ�.��ɲ���s�;Q�U�-�hl�@=�|H?��V��s�����]�o�����9٢:�@2`{ѳ�c�ZpJC��l���$�����D���g-2S�p#��%8<��u0�P�!� ��C��{��I�8N�-�o�%������f�7�J���1�t��ڥ�V�_H��A��-�mI�?+��=`�@4�2v�- �_lg��v��o�������d�n�[x'���:���*+�9��B����~}FLk5,�3�Lw��5�[�0��e1}9�d����Ц�U-����9;��
XE�k�l��8��gr�d7���cV��O- |��.w{X�|r��Q�*z��_���d��t�X_[�c4�4ė%�9��R�c��r����B�� ��N������1���w|�8zb�8�ށ+�7�N-�?SU����զ!n,N�$e@ܼ'�Op���r�+��Y�1�Bs6�O35�ڀ��5\k�6��@V��˿��A\�Qr\�vc�HoL$���KO�Z�٣�1q3F^mv��7�<Ÿq�;d�g�ge2�����Hc��6�~=�������j[%��^���z['����+ڝSzc���,8��,{���3��6�����	#S����f��֑O(e�����'��w����gUM�gYj}��#HI,�H]@p��Wl��ـ�e�mX�"���U�;tL����gM7����Q�<���a�ݰg�uEL�	�xb]r!�ܡ�<���J���lk�م.u��	N������v�ݳ��i�����\���Y�n�8��	Q�!���H�ʣlk��$���փ{�袹QO-{�X����s��3u�a���(�4��+BZ����#���q�_AiL�	&E,%�y��OTj�zL{kt���~B*����Ku!X7�B�ؒE�zJ�_UL�F����D޶Mv�=T�ǧ�l�g���G��n�;�4�!ԡ����1�a<�@3KLm�6����$�Q���.�H�Mu�Ӻ������S��9fDe?yxj�������z���%c��k<����ϸ��_\E����L�R��q��Y��݀ 5�M�-�@�a�c�b�������B�q�%	�KT�����eC��}ŖB�߀���čy�z�X�jt8Ӣ4����^x���==�݌=1�)�*��hNu�^��"�1&��%��T�28�QaȆP��5{ZW��}~�P�_T��CE9nXM�I���ү�<�rC���q��8�����2H�}��(	,L��t���b��0������3YӺ]G'礮���yv��1s�K�j�LS��͘�c�d�@wZnd8����!2 AV4 !��!�J��]s~tͩ�CX��3�ʑ��@t�=�,���E�2����/��E�@��2J�ϋI/��`�!4�u���?Z؀Ze���(�tc3M��	���K]Uڕ`�Ȉ�pha�.���8K����K�S�[À.���w9�A	q�%s.'��D��"K�m���6��?�q}�8+5�Ԧ�r�pGpT0�[rGt�G��_��1�T��0� 6����?����z��	>(���T��/w�P�K&@)��A�b��k� ��uا�'f^�3F���]D���S
�s	�kmOJ�@�Yu}���k�$����vusdu�頼q�r
*P�b�OJ��P�;��
l	����] YZ'�̈�)(a� �E�h��k�m{jg ��$�L���#���@M$8eJ�mX�0�g�\������~6G��
��m�o��.��rVw�	�H �J�����Ô8�\w��0G�jPy�]l Ȟ������0�T;��H�'C�$�z�g�]�u{��ʜ� �ݪwJl�T!�t���{�'�j�a���Lp���z���@}�t��&*�㌐�3
��r��-�bf0��|����5�~����!�.jqǮ+�l�����0�6l�ɶy�������(������?�a6���id��EpK?r�;\��︚/G���`+y�Ct7����h�8%��j(�`[6gF@V�zSF�    q~~'���U�]q0���b_�F��^���C��%mƱF'�E��á�ł$�~zTe�&ɖ��$��t	������0����N����1��u��%��i�%%�]^	�<��c�� ���ЋP�2z�
�l�Q����XN�'Ch�G[Ε�ܒ��b� ������.&��qM.FW%�B��4�Q}4���*)���'��i!��}�;- �;z��x#8cs�Fv���a������F�}-�M���M�!�L�� 2"��1qz��u�<Zhp�7��v:����a��'�|"u����Փ�Burm�;'c��T8b����Q�j����UX�f��t�c�<�,������H�L8\�H#�9W��Qc�Lʭ}j�<;}��}����7d>S���_�d$�V��/W2���1����;�w�&c���d��TTf����GA<�__�P���D��2������K�x�3k5Z����VjF-�Z�^/�%c^TK;r!��aB���`hw�xM~����H�i-�i��� R>F�Գ��]~0�����b���]�y�4��,CS��y��vX�+���*�����?Z���,���68ч��R6<����1�h6�i�2�{(��!���7_������)Z���lM��3�;Z�n�q/�/Є>��ᤏާ�DT��3���Xhf8VF ;�6҄l�(9h�ǚY=hiF%�Zoz�4Z�r�QѦ{ili��<�*ep��<�1��o�Eb-�����uq\�nI�M4t"\g�FA�,*z���k��锉^�&�F_��aN_Su؀�Af8���M���Y���Bw]�.�6&FE���&��áE0���b;�]��04x@�æ�6���ǡ��D��ی�����~��d�ƃU��,7&qՃ�>'0�A���-�gg���'Z7Z^���|��ڣ�#�dg `,�������,���~ �r�G�̑��'#�r�'���:$��+� z;_�2�Si��))�c
^'8��NW�Hh�3�8W�R��?����Q$<��.Sm=PPFZ�C�3����zx��f�Xw��rYDqD�c�DeDv(�TD�قz���8������?'�GH���-E�g�v8������9���Uu|c��<yD���+Yi;��#���A����v�$�j�+��f[Kf[���d]e2�ÚBF����OA3���ÒyQ�}3���F/�p�� �ȡ2
�:��-�9�2l�zY�,=�h�.����4�(���D��d���`���b�U�Tt5��`�ۮ2
H��}����R�ă�f��ټ��;�t!T*� �sO-��B�(2h�IJ���h�zD���r��	��̺�����	ODS����#s;�J
&������(`�感?1]��z/��#K��{t��{�(����U����(;u��U7��8��'x����`1Z����r���:�<U������Dgjo,s���ݯ����vŘ�� �
$!Gb���J
I8�Ș~40
�y��_���؉t��j6D9�k�~\���@τ���1P�.4�������!�LOԽ���J��djFBQ�������������01�FŤhk�σ,�8X�#P���[�����HSS�ZW3f9Xr�s9cRL���as��Gzc���lu�ʳ"�9�=N�Pk��p�zz:c�S���b����x(�
Hs2c���G�
��~0
(���=|0��7irc�>����hi���(`g���7�ҏ�۵���:���u=w=�?
�YL!.*|7��\u�9:"��1,�[��Oc������m�of�H&�x�`7&Ǚ��F~��b[z7�	�>u���~+e���w8�
�(���of\<Tݰ1��_�Ae�q4 ��6Z�%�͒�a
X�:�:�bY�lr����̵�C3�
��bJa&�]�(��'�27��0Z`Gv����1
3�?Y�΢�03Q�2��
���aQX�c�;����d?�����������_.?���Q�3Y����N�u���3[c�p4Z��R�5�f_��q���8�	�R��z8
ؙ��ؾ�W���q.���:�W�.=0����(�f�gk$ih����#�E}�LfϞ��X
}V8�����+�'����1܀]���.=
�y���-@w���s�wl��$Уf"d�6����h��%h<���0$
u�3F��T�,�9"Ca�б1���]�]�0�n'
�GPá_Y���( ( ��A4�0�����p
gn��^� <9�g�}_����9�V՟��M����;}
Ά���uhO�R'E�q-p�.���Z�:6;�C���16d8����F�Սz���E|3pA�(���d�=
��y��v+uRoG�#?�i�
�i�[RJ���*���=a���P�Ȥ�F�ױ	��5�hѷNc�n����vi�ʮT��'��,j;3h���>?��j���6!	���;ڦb���5ν	��/w��P@-��Z5�|�*΂+���QE}�
g��s�$����a�p��j�¿4)��F⷇����ܵC�dpJK�Hn�C��D*5'Ape�����H(`&[~Rl�u�z�_h!�K�J����:�.UFA3������!8��L��c��k�fM����/�S��7'XQ��1DP���Q��J|���[�5[f�X̾ވ��i�p'e�	-�����$�yh?�m����A� �#;���P@�%�I��F�mqbteO��#��NŮ�4Yڿ�p(��ۋ�b��j���lN�v�a󹪧�-ط,y�Z	�e'��,��9�ح�ٝd��˃G������R��H{@
'���q���}>'�q�z�t�`CCUl>c	'�B:�͝d�#ˉ{����� 2K6
��L�N�)@��t�8JlZ��CKJ͹
=m?Z`	�Dk>����M�D�Xج�zB��	lף�p`����~3r�P��f���Kz�_tP�4�x�p��^{P�T��V4>���[�C���_�1��o�Se8���V����y�S�����)�^z��c���e��#��)�E1(��Ѧ~J�*}�[�X(���h%����#�5�w{ԝB�V�Qe�B3��
��䒢c���#�y�j�?�+=�Ae�2
�a�2���M����r~VgЮ6�W$��.>Z�[M����F�6Y����,�h�r���ykz��(`'ZY�9�n�j�@��KC�9݆��Z�Y�-}�ku*��&��s�H����GO�X
����);���P@O�8L��xz� ��L!�Y�V��"��á��A�u[�{���+��hu��w��v���@��mJ]�"��uZ?�Gc�˾\Z���(�RG�E����a?��w�8s�l�Od$4���y�go�D�h�\�f2��>T ����<�HhD��oM2�����:w"�-l��dJ�M^���@��q��Y����1�A��L�	\���qjX��L;7 �u(^�7�z]M>U�U��(�z[4|^�O���x� p%ܠ9p�J�z�$�d	�3PͰ�͟����a���/q�����r59��BR+�����h���K��R���:����S��
�v���?��l����q8W��;�Bnl�g6X�+��wVZ~����~g�%�����B]l�/՞r���]:/n7<�P.t39���h�~�b�i�H�	0�����q�;����9)��g��ۛ	�Q=�!���Buq0;ښ�eN��4��{՛S�)��D�O�J�ǝ+'W��^]�ή~���9;��g�^�d�?�<RQ���DE��.�x�- n�L���K�E�h�O���.z��Z����ϟ'�o>���o�}���a�(t�r'��Ku�iMZD���-p�������"�i�������:+�`��$8�6����@%c~�c0�S?�޿������~��*'��J!n�P���waH��`�dF{��
4��l;c��v�ndj�9|�#>N+ �  i.���gM��3μ� !��p(�G�cG��=폍MR�#�b���\����	2��N@I�J��hhػ�v1c� �)n�gq�|��Wo��<F7>����0*|����wDQsĦz���7�mv�[����0n�
H����3���Du\}�#�S��;�-���6K���qF�)�6�i���0�XR��Fa�j"��`(`@��5A�W���O��Q���.X'����B���o)��c;���������zi�Tb����p(SM��A�jM;m2x"2?���5�zQ��G��<�̚�#j�&���k���|�ܺ�R�+�Z�X�W�dV���ZF��2�i�!�i���z�>��,^?�� QR�0���Ͽ~�\]�����o~f篯.��(������G�I�j`
R���(��v��Ϥل}r����Ў�o�r���k ��t+�{ksxj��D�Y�SB-V�tz�Q�t,����qw|��Q��?eQ��Pqb      �      x��}ɒ�F����4{�.��g�Ui6=S��*�m�f8���`>"S%��g�j՟��s�� £��7I�p'��8����6�y��.ݟ�JOq{:�'����@g;�Ie T�OR�I��R7�ߘ�oB4�~�w����U'��N[';��ۄ�����	s&~'Í17ڴ�S��O�U/m�����O�����t�xxL���O��1:i;�������a�fܟ�"���������_r��t���sѶ����}�����ޓ��
�.�(y�Ct��/��7*�ڻ�V?J�{yK���!ݟv?�>|<�����/�^��w!MǷ�������~�Wj��o�O����a�����_�I�u�376��2�'d륍6��a�1h!@	���' �-J�ݠ��k}��s��P+m�+�s�Ă�%&x�s�b��R�͡��v�Y^�B�h'��G���x�.C2t�ܓ�wޮv*�p��V#u�_�R�h/�k,Ut
�x'��[[qL��(�w����NHA7�V�伿�J3k����:}��p�t"h� ��Wb�K�x�������C��T��Po��7�||m� ˎj�t7,�Wүɭ�1�V=��Q�n=�+��@�����v�t>=���ﾽ�o���/O����O�@������o�����?�oߝ��x�\d�o�^��3Us��ֶN���"}��&g��f`��Cē�z�ҙ�0�|��ȯ��M�ڐ"�*�Ҏ���_�oO���԰�RF7��_����e��p�E�{�V)��}��KWC�6��J�Z�hf��ݢ�>�����g�o��o��|v_~����R��w�|^q_&�A������}Kj5��V�V�Hۆ���q�I�E'����v�����ἇi~����������CB)|�7?�/��D���������A����������^Z�YCn�����χ���x�;z�F����+�������H��@lq�r2kz�YjQ��r�a��rЫvn�q˨?�Ǝ[b_����������|�Hg���~~��_�C��%������6���	��O'T���f���t�}<=���7�<�\���?���3��É�k���h�v��Í&k�:�٥���6Q|q<��2��No�|O�o�І����私�����ߣ:�P{\W��5�������_|��O�%ޜ>� xwO�F��$����o�|����M��������ij���{W��Zj�^9s2�M'K�|���
���o��q��_���o���)���P����ۿ=�.n%�	��{�=yqf'#��V���8����f��)�C���t��-"����V��%�#mg;��캵���/5r��.�w=<��]6>~�o���O���ݲ��J�ܵn���KUҦ��w��xꖺ3�9ý:E���}C*�����<�y��fn���%�*i����w�XK�$	"�D�Z�'�����s-���.��-mt��1rp(L w0i�#�/��;�իa�Դ҅����<��Ϗ�.N�������x�3=���AEE�N�!���֜�l$�����e���k����'�$���4=���qՂ_���������?�,~>�|'~]aב���zF��\����$r��!�ׂ��'�����͗_�~��W���l�#� Z?D�㒝Ҥ4�o��fj�M�xh����#�.L��o�~�-��#?D�t�bM3ghY[Yt��(�����p����+�a�޿�S,x`��i�����?��,��7X)8e�3a��K82���{B$(h����z
)C0d��)�C�i~��SMA�6-|�`��K��QR���b���{�<��r7!�����ʊZ>�V'â+�� ��ǝ�}؟g�ꓟQ���/���8o�
���>�����/k4g�\�n�S%l�3G�6,����)��y��(�Қ�<�mf�9.]ԋR��6(��O�r���f8b�� G�x�9բ3/�� �Z
l�ʥk��<3D̆!2�B����@�ChG6��-�.�Ywyܹ�9�|��QV�m�uQo�vK�@9YqZ�r����*۩e	TJ�r�D"=�%�(%�S�b�bP��?���W�ްAJ��Rc�Y�zi�`��g���8��N��1�8d㻵l<ڇ� ��Y��6*��P�Ԡ����̏��
jG�%'��B�����VJc��GP�t=p�E\z�����gq����p�{�����*���y<�;�������~ 5�Xq|��x�/+��taPLcH;�r��ѝ�;��'J�If�=��#�+Ug�L5\�0�e����j�N��(NZ�S6Ϋ�V�X&ho�6����x��q���!Q�����7͓	��1�E�R�!톸9*	B��J�9*'���%�=۷AF�)�Ji��]�S��М�(]�}o��A�([�T���*a�A7M�-��)���p'=S(�Q6޹κE,T)mЍΚ��N��p����n/Dc��<)8ɉB����UJ�vgĐG'�������ɥB�I/;S��@a�7!�E5TJ#�����t6����`��^Z4�B*��B�(���+����; ��ܹ�&��{:���(�#n��t��������`��hq�/��������u:�R�<��H��:c:Ե�ip�O.�����/���c���j���
6�R}�
�F�]P�%cVS �#qע��ڍWI�Kc����r����26�Y�q�+��J٩��m���P���d�i`0�K�g��3�*�ѠV[x�1�t�*i�6�Y*������d��=iTu�L$�Œg��YkUJ�g���6�'��<��dW��g˯qO���dO'9�y��/Z��� �6=�n����gr�<��,�̷6hG*p��oc�+ur�Q"3�a����?�D.yF�[CW�^y�a`m��;�}��(C��� K�?>�I�|�Ug�c��q�L�_v-B���AP9&�G_�_d�/e�9�绻t<�	���h5[\c:���R�8(94��s�Nxo
�4���
5��O]#���y8Ј輊j��S���M6�ٛ����$%��z���7�T}���.�]�[�������s�Y���k㢧�?J�Q26FG���`�h��k���xF������FM����*�M�C*�����(���A�t~�sǓS�k�T�B
���S*9�|3H�q��liЏ��+�������r���RA�Э�E�t3#�
i�yF�v�d�`" � h� >��B��'�Q�(�0o��Gɗj;���,?J$<Mj,f���үy�8�pK�f5��Z���Ѭ�pGy_����ݐ�	!�-(Yp������ߎ�����M�&�Hu�g���6�؟�z�;jU�_�OOB�+�E�R�x�1��Za�%M��yc�{Ao���
ld���������Ɠola$�<�d@k�꿌���;��h����#J��<�˵E���|�R��6ʵ+�H�����tr��Q_JG�(q�Q�6,/X%m<e*����J��`CUC��%��µZ��6�RTe��"b�2w�I�w�MP���q>�^�xǌ���V+�A��Ub��b�yN�:9ׄ��Ƴƶ�J�TN	ZN����?�R�VʡJ�xʀ�E�f��d�z>��)��FZ��^���q(�_�p���ᥔ(����.�ny�*i��i�Z����^�LiL��
aѩ*�M��&χ�χ1y1%���zр+�MP�hj����Cʇ�2�_��)��BVJ�@)�q�s}A����4�A����k�M���������4_����]�Z8 U�&�p���	�L|1����r�ܠ^�(v8M�>U��%�4�dv��w�!��3�A���+V%m�� j����^ZfP�ʷ!�N��k�H��3+�c?�4��1�4�,)Qd��=U	(����A�Kiu<#ɫ ݢUJ�(f:��؏ ��̔�#1�B�WJ�؍̂���h>t�w�������x~���    ��9*KJ5�&����A�K�Rs�2Z��oUJ���j��؏ ��̠H%MYU�Y%l�a�5x��'�&�bz��*4Efi�+�Mdo?'��c?�4�3��F�uҭ]�F�DJ�sBD+�8^+(�Rv��)t�Y��Jiy`�����c?�4�3Cs6�7J�h�
aC��0wj��3���e|hy;A�eP]%l���9��nJ�f���K9��V�.uk���$M���$h��� %�4_���kUT:,Zu�����	P������b^�<z�|fP�����g��(-��K3H���"��iu�Y�gqd����=�C��p�H��e�x��m�R�N��!��_�����C$ϲ��NJZ:�mku�Og,�B
���	��Y�KAx�59>5���|Ê��rN��������}A�My��@a��f{��|���7������m�����x�B��"�S�N��UPn9Y�����Vxύ
C��S_�y�Q����*�J���b^:��I<��Vuj��c��_�f�}���ñ?
����4���؋����V"0�9^!��T��D�.ݽ�FZ�2����n����<�R0	�n�1�J��p��Y�7!@�-���q�:5R���V@[�!]��)6�(����]^�J�tM�Q� �����3J#ؠd�C-Z�RURP��q����~i��zII���z:��
))N�vy�e�Mg i8n�сb����+���� iC�]�
ox�������7hܼ��JA�2�<1e �k�����41��@J�T׾B��������- �O0Mp�Y^�
e�ݼ��J�,+���A_P*�*+{�s�[;���R�t�>��<y`<�����*%G#s46G�-*�R
J���1��lR�:�W��������8
���i�2h�e渵@�y��p�?��*'2U�3ڭ���6��l�|���q�p�9�膰
Aq0J�/_+9�����c?�4���-��=��f׬��Qɍ��132&F6�Pb�"v�����S�e<�#H�%5F�R�D%-k�}�V�PB��qY�ӱA�#ϋ��ȹ�X+mh
 �w2v��A_P*�yV���P���gS^_!+��JSi�oA_P*h��d!�}:`�
i�i98S&ggF�O0Mp�����vJ?�c�
)�Q^\qr��e�/(t�U$�.��_�׭��4{��!
����Ѣ��,e:���Ӂ�WHZ�rn|��j��-r�w�^k���k� ��u�^\��`��No���lBc������{���c?�4�-F�w�A�5A�t����0���ű��6(Y^0�:��~*���:�|�x�G�F�E�c\rB��q�
iC���2?��P?�4���oJ�;v�Y+3(y_֚N��`���@�֢��׮�6m2��N��
�`E�	�օn�%�+�`%_�1��
��JSZK�jׅ�q����p��J%.`_0��tz���VJ�����JJ&�mG�U �a*�*-K�G�30�z���q��ȏh�0�A>�EuD��R
Z4��f�h�bB��7�YΎyӅeMUJ�̑�Ů��'2�����X���T)�s<�]��R)3��iq��)�/�7��P��O6�{����v�kb,M��}�4A���"Gk��V�/|�J)ȑ���W�t��V�n14���M�}���h�������P?�4�f��Q@/Sa�*�`F������RA��)mG[]�n�U҆�흇a"����	�	^e�W�]W��E]UJ���qҢ���T�+2.-4%�s/�[#+YS����RA[���ϼt *���8;�AL��`��3-iP-*����R
f��w�~i[�h	Q��svaq*�`D�yC�E}A��V4.L�oi���UR�
����^CJ�<b���!O��8�C��)�=�'�&�����i�^$ j�M�d�մ(�/(���JR;��%��҆���Ts<�Z@_P*h����Xl�A.��JiC~���?E�F��
�bE�޶�cNWJ��g�=uZ�UP?�4����Wp����R)m:�<��#Kӡ��
�b�)�C�K�W)m(�9{�<?Ą�	�	n13��B�q�*�`6�r|�&]�L�`����L�׮������@�L��`��3�C�\iEUR04�<�m }A��-VyT�RTJ�*�ZՊ�؏ �`���2�ذt�+�M�e&�(Q@_P*h��Ѵ�-ſr�TJ�*Oe7�nx�D}A��-V��Sk��˜i���|�œv���~i�,{镬V�\H��)����{Q�+{;����`e�>�TIQ@_P*h�U�=8,̙_�J)X���x�2\�	�����>�L��������ziC1[Bk��'�h�����%���y��Rp"�=�G0��S�*�������X����+� W���#�J������h+�@3d��j>�q��ճ��O2�X��F/��"5���y)O3�n]h�/�W�=�(1˫T�i����Lݲ��V�4G�������UR��-raD}A��-V�+�l4�&^+mh�#��P�?i}A��'m�ʴ�f�*�')����֬T擏2�<ᆧf��'�&x�n�۸k�Q����Q��4���(s3y}�b�jB����gG�G���wF�]�F
f������jr��^���is=ۢ߫Y6�^
f��AX��
�Jm��qbg�_��JiC;��i�!�[�O0Mp����c���Z)��O ��n����22<��'�F3�8�R0�Ü.��x�G�Fp��aϿf��BiV	�.�3��ї/���'����}��K���J)�.2���2y��T�UV���1���[�hĕR�R��a��WOAI������P�NK�(�J)X�QQ)1��l1r��@���5R02y'	���ȪX�w��#�bĿ��1��q��hv�<��~i[�b�M��PӕR0rôE*���RA�m����}X��J)X���YĞ�6i��a��J�TIA(����xs}A��-V�U-�]xL2�)�{\���ZeU+_���9M�KT���1�ziC�c��H>{w�l0����;9O���#�[�"�E&�0t^;�丿�1�P?�4��B
�����\���,T��A0�ն�e��f�A�yD���QR<Y��C줝��Z)��g����N��Jm�
<D�p|᫑4rjxaM�M���V`f�mn�͟L=O���~jη���F��,מ)�L�L�l5��j;>�[M��(�0��4���T�5V9��}�v���6��OeN�	�L����/�ЏX������"��*��Tk��
��{+�/W\�mO��q��*���u*�����"B�0�~�9ܽc2�����c�M���#`�&k���䠽5]Z\���A�����_��Ӭ^�<B7����-�\~��u����q���]_
�{��´�����Rp�L��â����6X�/�4k7Ԯ6��v��T��bB����ʻ��j5���H���N��4�A��ƿ��ł�sF�ђ��uj�`aš�.�q��s��Y��}��4h�"���ER�^�(�������v��0d���wT�~�wy�*)�N-��������`rf��r��/m�}������%HhM�P:���h�y�}��n��r�W/�����\�ą�/�{��0�r�i��w�|��`Co���W��Nٰ�i�҆V%���Z޺��~�i�[���[my	���5�F�%�*��qc�<��q{�iH�d�0�nf2�͙�g���1���RA����D�P�U�FK�XKK�O0Mp��� �����KWIR��#�cNd'6)p*���E���B����i�{���o��uv�D�^��Nid-a,�7�u�E��6նv�)8�N�@�l�Z�Z�9��R��G\ґ"1��o^�'�m��#��6�V�ҏ��	p ���mA�H��4�w��F���!Aań�	�	n1S4C2��d�ZaC9ܒ�bB�����SB|S�i�= mBp+��J
RP���,�AM��o�n0 �   1����R�5Z%mh�����Q���,�z��e���6�������E��.��W&���m�ͨ����h��Qۧ�[/���v� b�:���|"�>�VF���q�Z!�����[���O�e3�i1ޢ�89ĨO��R���c%�;�S'�M���ߧ���c���׭�6��6M��)      �   �   x��P�iC1�-O���N���!2A���~i�@kB������y�aD����X)=�1f�%I2,����ݚ�$���8�]��Kr�]D���eǚ��<�������=�K��S ���q�l���������U�V�j��t��,���O>�\x#����1BO�m���}�־ w"a
      �   @  x��[K��\W��/�z�%>}{�6Cr(KYz=������9菺���yCH�B4�Dfdm��o�����O/�O۷��o�__��.����i���z����/�7�;�����q\>�|�z�nu�:-=^�V���&�姿��Uq�ޙ����׏/K�}f���Нڳ-k,)izt:��o�_>�]*�4��;kZ]0��}�3����N=�:[ԇA��Q�+��3�wh�V�&?��0*��v����~��ח˿������[{6e�\RО�8*����;2��;���l,e��AP2�|��ׁ�w���ջè�è���������/ܷCJ��.��-ľ��X�8�ԧ������Z������bm����3��ry�h��J��b�W
mM��+�2a��}Z�&v�A��E��5�X󈵜M��]��!�O����M����Wņ�/.6Ҳ�F�ƞ�v���e�>�4�g��gk�^Xx�|��]���ǲ�׎�ړ)g�xaW_��C\�ٕ5�'_ؿ*j�+��!*��1�83dx�R��}����ǿhp>h\�[�g��l�YuUS8v}O���� k���`T�Ɛ9�skɥ��|N�bk�IժЮ6U�_g2��=�QS)���>��H�[��bk��O��9�9@��5@8��;�
�'sq��<�4�g���$C��Kkή�ģ�ؼ��_cL�1���硦�.�kuX��)'Q�s�).���qo��~��*�tv~�1��<�ITT�ǰ0*��;��@;t�z��i��8��-���%7���D�w�n�]J�)�AR�z����֗��wqpl9�]GsYn����Fw<�l	�uN�u
�i&;�ݫQ�h�b�����a&�֙@xd���6�
t ��_#yo9�E�� ���$*P* ����,��R��ǴZ7YRg�~�PA�w�����zy���\ܠ�è�*�gH3��b��g��~�GN�-�43��}��|���9xஃ����g�l"�n�<�*�M���4`���x�w�j��F$����T�<�yNuw&]��aT�)ܢ��$��H�����!x�u��BOo����"�]��N����x~O9 -����9*�RK����7�1�*=�!gӡƴ Z Tdd�e�C%��[��W���زe{�����|V�k��b��u;�
�Z[�[u�@A���E&�K���i?{3���\C˂ԑ&��H^l�3�ZH��7،6��g<3�(,�tG��`{`��U >���֞:s�#U��Y+́�W�����^���1�7�=Ň��>���?��	F�������s(����(��yI5�{nU����J\H�
���]GB	��cD����|-��`a��^gP��m�6p�N����Z����'��G�����:�a��y�|��!t8�
t�3��ص[�=����Z�5)��G�W��O5zO�[��*wA���n#̠�C�4������Sñ$$�����0*��`��0B�p��!m�����[c�P��Z�oQ�����wN���((� ��ƚn�iĚ��L�OL'QAn��+�ވ��w���w��IT���s%67�>Q�/÷[S��A*��YZ{���� =�\Y�������E���{59��w}��"�U�� �[k�U�.@b�fP��B1��~�̷Ƙ�
�T�xwf;�
º�_XeM큢y4��ܙ�����$*��L��4b��1��P[c%X�Zo(���B$J�ϯ
$v��G�{8ƥ[c@��!c�"��}�3��<��	k�����:{�2�3�yzd�q@��W%���X��o/�ۯ��2u�M���,*�V�n�0.�7� C�����i-��s�:�Jtu�-��h���\?ڃ�=4��y�YM͢YmkR�	'j�{k@N���+����͠���t�㢎O����9�צf��Y{��p|5��㉾2�z]�OF�;
J��#Q�
��Ю���9ti!�ܧX��iG���*=K��_>�[Cr��X�X`�ݞ�An�����o?"O�
M��tu��0Tp���Yޚ�y{y����S7��$9�S�be#3#>X�]8z�6�*HM����f����C)�tժT��X�*zb��5$��,���jGIk{�{�<w���8"8�Jb��+E��;C>��}o��U���\t�E��2�>N8�Ts�� �30��dS�8�!P�|��"�ր<S�X�z�����*��$p��?�[���+�l4��ǍTxQ����%�\�a�ۣ9�g��"�q����AA�mY��޺P�����17�oE*n{�0�JU�X����Y��[Cr(m^eH%�!s,U�E������̨5�ԙW%��w�y�M#d&��~�[cH�����6�*��L��.��~k�K���ޞfP���&nr��? ����6���͠�[BhS��4�H�h�������'K���\8�E�4�fS�:80����Sa����ݨ9P�ۼ�C���g�zuIwE�YT
L�*��R���g�ۣ��[SkqM!���IT �(�,��Sʜ�G{�<�̈ͼ��SG����,����Q�ӵ5&���x'&Q)Z��e��E� [�Zk@ny��F�m�g����X��e��X��+m���W�f��)Tx��3�Z�Ő]/���ԯ
��n@p������3����m +jްڟ �~SO�RJ�r�e�q��ݺkkL^����F��Ȓ�x}���jc��cY�jE�|g�3(�)h���o��L��!�B���s�j�k�^��YW�L��4H����0ũE��k��U{o�{�ы�3�׹�졊X[�k������y��O1�Λ̠`�fq���z�\ۭ1��?,���γ(�c��FG�3�zPaQ��4��;ժTFӒ�Gmb�������Y�y�'Q���m�m����!;��^�J����K�m��������ѡx���G���w>���=��}ts:�
o,�mV��S盖��w� �!�Т��A�w��/�F
��[	d�5���8jp��fP�SG��zkO��1�7��ts7������x��ߚ=��ju�9�.pM��ך0:�Y��P��׮�={8�St�/2�]ȞD�y��끙��z]/zd����8*�\�|��NU�s��V�N\��Ƌ��B�$*�x)��t�T1�h�y����u���)T�YD�3-g=q������$�	QX=��$*<Ť�s��F]nڃ�.}k?�8z�qwW�d�#����bZqo���i0Ĩѵ`���w�z������^�����e���ļ�����~�$
b߈a����u��l_�_����/R�qb:��O����c      �   C   x�mȱ� ��=�b�ga�9��t�	Z�� c:�k6eq�vW�+t�N�Y�������q      �   �  x���n�6���S�H4���n�f�H�)�E{Tؖ+�A� ��CJ�H2�10ٴ��y(~:��Ǧ�b���-��4CD`�E���[X����>$��s��M����$�O�e�Po}B��`�
I׈h�o1�w��	���L�IL!��4Sa�	��C����	��
ó��L��jyF"=���b@��X���p�
��W���F�¿�z���-��� ��bY��b����UOFv�n�C���,�j�2��LgJ���0%� �,��pF��K)���g�AI6�)�z*����pK1T�2� @��G�8�ԍ���B����W�eF�T��Z���a*B��p�c8��@&�<�]F� F�Tc0(�j��a#�I��gϔ�V�U^��U�(g����4���SF8U��4�q��
1��m�0m(K���1l�P�(��Ry��Ŀ%�����1�5D�!�'қ��8��V���2P&�S���h���*IF�Y���=ϟ�}n?/˼X�pe�M7vp���*�^�~�˓Mo����.7�ɵ��O7�>�Un����]}p��n�e��_GWy�7?��snOl����0ض��)~x��cǱ���dX^'6����W���b�r�be7�30�eۯ�<j7�<V�E����Y��~����*{qb��]�]T݂Ow���f󯱅Kj�|��|E$�w?��t��Ck�r�/!zE}��'��B��6��f|�����&�l4�l���U�w�Ys��N���v��
�=�^+�t$�^:Ml��R<�	�/]]N�}��#XF�LJ!��B:th7�?��#hZ�Vʛ���ߟ�vn���_n������S�>��Ӥ=	NeF���I�F�)�C� ��`K���b� ������n4�\����%��֙�JLC��n_n|i�
�ӕ�	�-���9���Rl�)�v�t��~�����R���$}��D��-�����mY�Ͱ$`*��!�!����zz}4���F//����P�q(�Bq������T�$���y2��o�3"ϺD��o��f�����7�����dz�d���6_�;���o����@��$��T*�P\�3}�$U����^������"o=��f
^�5A@�S�h��?1F5�1��f��m      �     x���ˍ�  �3�b�忍k���X'#�eɈ� =�z/�c0���'���0�dFz���'R�b�{uv�����Of�,B�`��-����JH�1�E�$R��"j"o�>b)ڋ��K�D|_��K��<fq��9涘c~g�@N��m�=|&��'��6��\��)]@���[���e��D��o6(K3�&"-SR�/bop9<ԍ��?��&���.Ǉ�=K��\����&]E/$���/���r�ަq��Y�~��8�_	>ٹ           x��ϻj1����;X�%���I���`�2l��$ߟa�.n%�\�#�w�`�Z�Ѽb���2`��\xU�0<u4��Ơ�u��kC1�V���^>���.;d���G� Ir��}�=�.�%�B0g
Pb�Gز�q��ۄ�NNa�1Y�J�0v�sJ`�z)�BӬ��``gs%��@�2 џd��a�,��0y��d��֒�A�cX�(&����ٰ*ul��X�	e֘���fy��|}>���O_�l~8��Om����������y��o���      �      x������ � �      �     x����m�0�3]�40?7I�%���9�3P �$��9)��9�HE�-��d���p�X�%��ד�u��� {��Q>>Rƶh��D�g�p�O�m�it�w1^%Z�<a��b��*�b^s���C#en�I닸J��B��{��t�.΅6����/��zX�;�6�I�/䨈�Rd�6�m�#4��+��s�s�X��f�c9�:����A��q�n���,��H�7�k~0q���#���<�0�v�g��HYUm�������b��G      �      x������ � �      �   �   x�m�K�0D��)|��$��=J,Ģ�s�]@%�Y�y�1�+�`�V}��g����%��8�N����0�����Go#���I�~ě�(��9Cj�yiӵs���>#�cj=8���9c���b��<�����,	�<Mi����=�      �      x������ � �      �      x������ � �      �      x������ � �          �   x����n�@D��W������٥�HQ��)��YH$)>ap�?�+�1�"��͌�x�@

��0��${�W�tLl2�U��ڨ�i��X��*��Ԥ���ճ_�A������{'�kǀ��X���^�
h����}�#b�KP����gI�0^�5֎YX4/h>���b�+P�
~	/�G�{,:�x��<V�z�<"?���[�p����Z�.�$����r         t  x����n�0E��W�Lp�o.�nZ����lS
V 9A���v5�l�6)�������x�ݥ��\���Wi�V�su����!ôf�@[�C�z)q�����G!����K	���q����W���s}Řf7�������U4{xWY5ۦ�g۪��ߎv�G��6�k�ʟ��R6*�20R:3Y����ަ��-%F�¡q~�����ڌ���2��+���dyWB�MǷ��H������ Q�h�@㵚�JJ٣<���_.t4��-��&����}n/�_;�B #<�K�@@z2�Ъڤ�^�g�z3F�qh�'zk��!@ߘ���:���j��j7MWf��Հp���������C������e���֯��Kh%���"8덟����껮���r}71M�EP��#�>b�H��s���ڦ
���fF��DAQd��cH D4�P�f����wRK��շ���S��Ӱ
�������#�-cL��\�[o���ǌ^7��`�^HY��3z)���'��<���J4���q�nF-�S�$E9>��dF�4�5u'�\rF̡OB�0L7�F�I���O�2�}�4�����z&}Xhz�5݈�b���h             x��]�r�F�>�O���t���&����lY���7��*q$���2���5�	|�s�k���C&Y?D��p��]�R0��Hd�A�^f�we���<��������Û��w���~BB/�"����(�:���B?L��D��?�i�ƥ�A�u�?���g_ED�$�QI������բ6Lmc~�9#������9q��q3g�W�'C��[�y޼���7�}�M�	QN�ゾ�M��������w�����A�W�QOIz�8�o��`�Ez�	�D�tF/�}��޻ECt�>^��3?%IԈ�,�4�1}�va���=����Ձ��0�	P���4�$g��ڿ2}_�f-pp kJ\�cNL�������f�����9�4�a���bb�k7�y$%��^��@ȓ�~Q5�X�ќq!�`�i��t}��f����(�<�~J3֛N�l�i&<�"/!�L����9�.��*��#�6L���7��P�{�E��?��\W<3O�¨�>�V4�a~N����,��<�ð�+��7��.޻��2	��a&��w�7��B�z���3"�ԟ�4G��Գ�d�dB���lr8@s�#��H���d�5�l�/���*w>1��2p�:�$Ɏ��4�g��uG��I�~$��}��>���q�X:d�m�|��J#��ݖ��}��޴Ҵ9��Gj|X�k(zixVf���'R����u��������W���Um�Ț��fJ��?������qI�����cˑé��p� i.4~F���_���*�5�`T��'ʐ8�6F���������x�+28�4p��X�G\�< �k",�d�.hU��>�a4��4aL�i0�Sf�#m�A��F�Dq�$�����M��$m����ऴ&�E��o?�ag��0s��D;�&=��"`�b�5���ω�⠤p��ed \�Q�2Q(F�DqRdL���#ZF��.a�tC^~�D"�O�K���t�U-&�	#�Έ�%�M6�;� ��g�S�((i�Y��\m��c�����	iA��0�̧A����G*��l̢�H�>A����e�4p�X�K,3ssx��]���;s��e��s��Rr�vA�	�E0d/1.� ����W������`�_�APLz�3�$~q�y�E���%x�P��,�cTz�?��?"�������=Ͱ4�8���ң_�j3�d��j���6i�3�:?��w4����{w�O�!��>�8�(E����L����!��e b��x�uA���L덈��O��#�SF�NR�x�$�Q��f]���_����l�9 �Gڎ��X� �g�Y��"��=�8��C���|��z%xD���]j�b?<�}����#�;��>���_�Q��}yz�.�}?���^#�#4�����EBD6��M�6��y����snT��2�����F�>�Nnq��̑�e��W�co{����n W�n����T��~�?��\y�bVP����o��y����)KXP�^L�"i ����� ���ke�\u9�2��\`o�^m]�&��e gaq�w��2����`"`X����&7g-��C�KEy+Y�����]����a�����P��<�� S�w�����n)�A�C�[�E��1��8�YU1��<"q���$s�X5ԑ�<��5H1�������7���@|��Eo���#�?���s���'���Y���F�M�Q���)Ǧ]���Fʗ�CÊt3^�rZ�2�]��đ{� �U(�yĤi��R!ʹ��s�t�E��Y^9M��[H	�����M�܋a�}O�ǂ����'�?����\<$X�
$�49m���"d��x����wk����E��ςCXU5ǉ�3����<�=T5RT�5H=�N7��ъ,��{�jԠ�;"���n��Z<���a�[#E�+V襐�"/�&Hu�*2V�U� OP�_��m��p����"gFHAb����rhf�����؝8������3|��=�uG��+�b2P������1��f�v�阩/+aZ���I����v��r�Z�\��A�Ϛ�Z��U�p'
��M��s��{L/M�U�gs�Q������;�����ʄ�{�E��k̊37�y����puw����sn�q�s�����4$'� 07�jҘ�Z�nޔ��؏
���<�X�0U��;֡�@����C�	S]�˂U^��x��7�B� ]ug�-fT�ʅa�m��L�*yl�#p@���6}Ԛ!Gv�T�p����&�{խ���ͦ�(�:g3c�O�;�j���,��w�r�%����Z��Î<����'�Ɖ�$m2'~F\�g�������`vț���\r��L����>D������:r@��8�z��C {��M��������5R>�e`�@uY�7ك5�^�و���V(*~$��-�f�ێ���vJTtH���.�f&m��2����[�R#�\��d �"�1�7 �:�mƿݝ0�ꒋT��,{�Ә��7녘U垫zE!6�\�}��Y���}t�����kq�͏M�;N�
v��˪�������Hq��!��tSI���X�xF~!'"��!�,�q@�%�ʂ�tlO| ���}�NSl-B�5EA�y��@�󉈉}N}��R���02�.���S�FD���ш�	�<�_Q��9�)�ԍ��I}�]���'{g�'��+N�+'.s>�n;�1� "�x�+�aeB�_=�ˮ�~�{F���9�!x1�F���ԯ��s�7Ei�8�� K��7�{9�gc�4�q@:���mrQ���9 Rr��^Д=�u�["�-�%����� q�p"%��,���P5���0z{��d�B�3�ɛv�W�mݭ�ˡ�%�~@�6����\yJ�ЄS`��]�P�*�Ѣ���㰏#�����^J�s]��*��kpq���vf�c��o;L��c6�q
��e�W����p�t-�8a�p������͉�+)�Oyn���w���FP�ӆ'���g���ts��"�p����<��j���Ye~���	�[5�0t��j�K^��%�A�h�3U����D�s�5Cz��f@wq"K#��`���<86�v��9�D<����6f�����+Ĭ)TP����X���2���i�0p����i�u��.LzU��!���)π�ŀ� *]�a�c)����%î^�Ļ�\vh�t��+\ rΩC=��E'F,F�=�G�-��n[�
��
 X�bl>{������^
�w�
0���"�8�҈�B�`bT�Xt���Twc��g�Ε�4f` ��F>f� e�	"�q�@{Ӊ���5:ҔP�&�n�Y���s� Tj�~HH�9�������u;Ҝ�-'ڎɮ��3�������7-���1ۑ�;��zi�� ֵ�Rk"6Z��}��z2�Ǟ=�u�D��~��|����|�[�ԉ����~��%<�#����,������<H:B��&��s��3���ʇ��]���;܋%&,�RŅ:K��h����˪�~n;i>xR+�~I�_� �����)j��{(��,�nAi�8�?�U&��ES�s� ����$�:ɱ�H,(�QYA,�|b�y8eE�H�X�����,�3?u$�Y��	��x���!�P7��Z>Aj��C�$2��:P~sR�\�%�ɀ�~x��msja.R����%�E�Km��M�輋�v	��z�%����O�J��� ]���<b�*H8��9�P��i#�w_/i�j���Rf��%���o��i��f�daL���Pp'�������I W]�G�{��u\�|���l����rP���x�2�[G�B�.B�������|�1�u�_�Ypy������5Hp�C�kU"��o��eVе'���L~�sG����P�<8�߆|>C��������w�O6U�|�����v������C�Q4�
hь�('r���ܧ@bvBg<OXO�΢`s�_9 �  m�м}t3��X8�b!���WΕ��d�xs��������ʀW
�({��>޽�����^���]�Ո���X'�D[�-��"X9��g'⇮X�acE[��6/b{���x�>׵i˄���s������O��0�uϕ�2��g8!�u���g��|����|�O�ʋ_i����C�8�@2�}�h�A@���IX洈ql�(��j1'���ivH�������%�ŴL�)sP��.8�g7�+>v��H�\o��LY��Л��_���.x��4�}��<{�U�as�Ղ.��i_;�e� ���4&�-cCl�����͟Ċ�#F�Y�>�`W�Ң�^��1A).�У��  Y'�(�/6i� �E��?%�*�r�/�=_sP�TS=���<�$�Y�O4�������7�߄�껖Sz۔�b]��'��`,]x��>�"�_�	Ҡ��%\�pC�b-ǁ'�zASHKN���7�Y<R�o���IHZ4�1?�i䃧�y�=�(��wG�8�u��n����2A)����G,�	�!��p[؅1��ans����8"���vse��{��?OQ�I�r�+6.��'g�;܅����p��2H$]��-m��91kqT}c�s�1��/�FzK$i]t����*S������%d	��b*�bꕩ���2�I�<W���8�y��K=Lp���j|Dk&$���]���A�7�e���QN���[�՛�mb,�1�'��^!	R.�q�H�'�R���&��K��?�rq��MS2�c/fcKMx�ߏC%_T!�ҵ�"k���Kct��R����Qʋ?������(���?�x)� ��j������7��KC��:��)_�E�V�@��J<_�7c�Q��N���a�S�z��(B�k%ps���l�L��v��M"� ]k7y���A<�j��x��#k6�%IvwrZO��;�,����'�ኘT���_��������H�CRw65G��F���a�u�Q��;��Ӱ�n��aʲiMU��D����9Q�5I���8^�ͳ˪_V���p0S�xA�9T�6le3�X��2��z�āU�'�ܐ1"z�;�8P�$ 8�}w�s��2�G3\+��D�Rze���.�5yDt� �xBD��E�]_���x	��ѐt�+��k�UL�«d���?�8}�(+��ҼɍĽ�}ݵ�ވdp1���<O9�ߎ���$-���N�$c&B��GM���ߍ�2��ۅ!�A�k�{:_�'Ly
���%���b���uM�1gW �ET'�^��=Jr��
Vث���W�-��S��S�o=�4�~v��+�	�����pN�S(��d#�A�W�D���B�T	��F$GLE�:���tR���F�9t��A�=wZ|��y�Q�g8JC$��t���F��2��_�����eպ5�Ÿ$���>oF��8�Ӕ;$�xO��<��)wKF�Zcj+������<�r��a�w���H�<�^r"^�`''ݖ!vnD�o!�R�P�|�d�k�jQ��>���V�rE8lQu'����������?��]f�k�p�܃��<��G�n/d!�
�Hô�g�8�}���K	G��,||�4̦����K9�Y p�-3@Z���C���@Mr-8��x[�H?���V���AL�?ݖ�G�C�0S����d2l?[�}�<��)I�C��A9e��C-n��@�qʹ�z�<<mm����'P�H_�c�6q��X�eDH~ϵ�R�%Kj��w]��u�3"�B�LK��I�7Ս�2q(G���0�(�͑���Oq�{�_�LH��cs�ԭ�/�l���>���zl@UrF.v�M��b-��[$G�;=�	K?~c:����A�0��� Oق!b�6f�4T���}T�t�3I���|���U��d�F���V�̜�ɪb�D*��ϕI��|B��mշ�_i�_���k��X��k��M7��o�gG�r��HJ��puϮՏC�	�$)>j���rS�M���H�ð�����(���F�����ny��@݉]D��z�9u���b�3%?"�ꭈ�Cml>�T�N݂a]W���Z����'Ns�0��O���F�w˪����5˩���Q�q )�
�ە����Q�/e����»��,�[�T�l/�=�0Ǖ�z�Y?>��9��<�U�{�<B%O��/�����8��(mĐ�3�Xxh�*3���؇��V�@���Z�
�s�&�{o�̌uG���ϵ�Ƥ�kC���V��9���"橅�K'<��#mSK�y;ݙU��@��v�M%kA�,e�=�h��:����2��=*�A�r�{%⑇%;'xX�	˜$��V���R�$%m�w��=�@7 Q�DWNd�����1�ri���[R����%�u��'��	YPu� �H"�ʥ����œ����T#�q`������y[��A�� ����`c��¥0}[I���h����#�W�u9(�U,#������-��D�f���T_�F<%⼱���7�4y��#�G��U���D���ǿ�<g�X��/�3��$�Ѡ��k��ORp�i�IA,�9\�� �e#�� q�e���p���y|0M�J^�S~�0 r.��(�C݈	'p�jL�����FV��^D�d����R#�����1�$��<_>����}O#}o����vG$<F.F���~>�Ȏ��S��m��o��a�	o1�g��u�ϓ����3�`5��ݖOZv]-X�>zL�2�����u|����	�V%3�BM���/J����^�ChgB_�6��,���V�[)/�U�H�����+A�iE,�Ȥdk�������((�%o#��r�c}�t���{`�i.zL@��xmx�j˷�;���NI�{-ϙ?�NJ��p /㛯Vս�N�ve� NE#��3|G�p��I�<&(qXr.ǇJ� �./���V���ۺ1�f�]�S������Ą=�V���GZ#�JC�����3׀�0���Xzikb����z6������V<,uܢ��z�,������s����:A�G,�(>N����r�@Պ��b;e�c�^�Ƥ�X���m�}TY~��@>^r�<}�T����ߐ5��]�-�J'��v��)���������u�/�É����gS��`����=O`r��d�4���k�M���y�mĬ��Շ��QQ��q�P!z���o����9!���E�6�o��w�*��篾��� �`         �  x��Z�n7<�����l����je9r�H�r���Z��3���/�	:��C�O�K5W�}ȱe`Ud�������$�:'Z�ϡ��D)e�Y�ϒ�Y���|Q�/��yڶm�P�&ɳ$ŏJ������$xCmAtj;�`�:�f�$9HJ�R��Mp��^������iB8.g;��v�{(������W�Һ�J�W�O�"�
~k�$v�*,�f�嗎�L
*��[��Nt�-�+�j��z����`�%�2i�S���c���ax@�%5�ݕ��4���� ]�Pi$��Ѣ��M+jp �z��8iu����A�� JA���ݭ�(zI���;+
_��

8������;@�IjP�_�zX�0y�����A��
���pwҡj��D���P��,>N9K�XK����f(�(��Ҕ�D.u0��(*�P(��{���gU�a�Q-\ϽXjF�V%��y����N�����Q/�̨ڝ�� +:E# z��d3��������*�]=+p��F�����C��9�5�^6wrV0B��V䣃ړ#u��ۥv(?�v�ꖱ?�F!�3��o�^��(�e�4���/;D�K�>���~k�E�����1��:?��Fp0)Ex���]}��#+�nB�{Y�kOn�F�9	������q2+��"t�,׆J��W&lN����oQ���e[@�(�8f�����M8����o3����v%H � �h����1�}Ňv�Ե[�t�k-���I�ᝇ-�_�4 ȩ-g�ح�q����A�L ���п�gz���^4@���i�(�v�WK�
&��d�)�E����ǔ�z�p����T�U�6;^=���<
���l�ܤs���~;���D%�0߳��~{�*
U��@�@�#+���Ȏ�و���
&��b�g��y��Sצq3��SM�
�G�n�����J�WP<ZQ���q��P��*K%���2�4o�@%�{�
I���N�ΠQ��"�Y;�c�X=^�r<�Q�&-���
�#��Ҕ�A�j��?8�|�euj���[��C��B���D��.�^��"���(<\'\�K�p$��>yZI/����H^4Vut-�a^�`a�����;kF��Q,�J8��n������6#�)x4��]��͈s��DDI� ��}k�kۭe��٣�G��×�lm�Y�e��o��;�Q�� ��r�([p��@A��Ŧ<R<A��E���[C9���C�P�p��:o;��=�̕E
��~����yEπ^Q�OB3�⤮~Zz��?��`I��a�/ ;�3x[�T՝,A	�1zs��zNRAtD?�����w?Rˑ��3j9��J����� J�`'�V��BO��6����)-c�Q���)G������(�>�^��]0
V��P���(G��<�,��=�6G��рwѭ-wA�k�񝉟���R�4��,[	6�8����!N���a'���]��je�-�N7��Mf��(4��&N���`e7M��(�Pg��A�6�����;y9t�H�ѧSl�w�m�$:<?0�?��F><N �������Dρ�SV}s�$�N^��=LM(!��ƣ������a%�z@�5�����J�� Gv,�N�3+}�P^���:M�Nr�b���VO�e�,��Mo���z�7�%y`P!��Ƞ>ng��Z��M���\�[+��?���"N��aT7��!pF��������_�L1      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x��Vm�� �mN�<��!z���]�M�����L �"�+!�o\�%u��+�ضaF�ʗȃ�:٩uї%�Zg5��<������"�E�b�!��"��jތ�z�M��t��i����֯���0r���X�-g�m
�)ԥ���㘙=D��k;����)� OJ�{C�K�S�,b� ����@3E�I��v��=C8�8��Ju��q|����q�1�R5c[&a�U|���[J���sa��3籵�!LS�ѭ���O� X?�C6�J�C5����W�pM �l���}�.=��Kc"u��	v1�s��Aڐ�~$�靼�q�jdm�߷�M���G��۬L�!<~.�����`&�uKLnT9Jn��h�,=/�I�J$�OA��W��1�)~�#jU�����|T^H�,�pA��2�$��~!NK�|��ܴ��:�����0�#À艕�8�2G�2����?��[A�d�3K�{��4Rn��d0��o8Ɉ�>2K�����������}<���P|����R:.�EC��� aP����<�ծ�kCC$�&?��R�Y��"�0ֱ���x (��������ݟ�	=kf�F�.�n����`}��zť�S�H/��(^��*��w��>8���a���ΛK��x"x| ��~�'!���>Y��?*�&���O��ľ���J) *fK      �   �  x��SMo�0=˿B��A�>,�&(�  �'�a�e�+��GyM�,���-C4��GR�������S.#c��A�z#q����ja-xt��	���a^-_�l��~��<ѷ�������}ޖ��*S�|7��;��S��xX�E_���q���I�~*i8���̵���M��i��}���.~\�8�=��9��_fj=O�ȅo��.��X��>N�W#f�Ԧ��A���?�|� �F�N�K����d��5/�rz�T��p��8��"�Fh�;
����+�7���N?54�9A�%�9D�Hɵ��
d�7h��m[����%��x�G/P���Ÿ&�\�Zpm��R�>V��Z�V�R6�&0��j1Zu�4M�0N��Q`����$�W/�`�Pj�A&H'z����(���]"TAa��Z���k��Z5� ���'�u�O�      �     x��P�N�0<�_���/;�^ ���m�"Ѥ
��׳E�H��]����gv��i܎�;:GΆ��j&�V9E��8, �m �߭a�L�u���q��,;vO�����nv��S'+����xO�d%��a��pXl���:4��#EV�1Q���Q|��U������bV.Q��e���fB�D��s��T�2��d�%R$��:E��FI�����g{ܺ����J����m��t�W�U|J���T(�D��?�U �Tpα�o�{�<�      �   0  x���Mj�0�|���ƶL~v��PA�!	Yu#ۓT%�R��Ez�^�r�)�Β@b6��!d�L���W�p�l���`�\g��eө޿����N�9eO$��'̯#>�h�&�x���)�q�9�����7BV�"U� �/4(>/��|��4P�:i=%�5�4%bYUn����m/�y�aZu�4�hr0@NW���8E>I���}�k��������ْ#=���t�H��^�����x���H<Ϊն���T��5L���~��aQG8Rl�vWmDv7��_ƪ�Ǯ�a��:��}t�D      �   �   x����
�0��?O�H����m�VZL��El'�->�i�������>P�ƶ���I(K 1}pU���xO\�����[��b}ڞ��o��А����4���x݇4ҵi����q�Kͼ��u`F�3�b�Ro��6^      �      x������ � �      �   ~   x�3�t����t���t
�4�4�##]#]#CCS+cK+#K=CC##NCK]C R00�#lb\F�.�>�A����4՘���45)Q��0A���6X(�m0�312343#چ=... ��4�      �      x������ � �      �   �   x�����0�g�~P�l�u�Zغ���"��J`��7�֟���}֝��c��Z�i���<��L�����g�2��`��#e� ��H�J�D���MT�ݪu�Y
�
�BTo��%
�����Ρ���|Oz�ɚ-�P@M�o�ؚ��H�
�j4-�
Np�~�@�Ÿ�&�2,�,I�'����      �      x������ � �      �      x������ � �         }   x��̱
�0F���)�	��	�I6��E
�]�P[�_q,�7��0����նn��o��j�q��LL "�Dq��S	���uHQq����W3Bs�����;ͧ���"��1h��ߋ7Ƽ��(�      �      x������ � �      �   Z   x�m�;� ��\ �v���� &4h���Oeaf��0�Ժ�e�k��(��k>��n�	���A���8;��x�V����*�.�	�      �      x������ � �      �   X  x����n�8���S�B����M��@���I��Ҧ9��$H�=��w(;����6���O�χ�Eu�W}��x��D)����8��B8�/��_ɹ~�sY\7�j��CU�]Uߴ_�r۔��<4��}���填�5Q�h�j�ہU�_�]�x��C��U����U�ko�~=ǂO�X[k!�j{����M_�K��׻v�nB
(���ۦo��f3dQ}KVu(I�m8ِ��e�}�WPƨ����s_�u��˪�5��])�aEN�?RhO�CW��ي}���+/�C�_�c���˷���j�:ܴt�A��ӮYѹ+�_^�}-E4�K�� (��J{!�&���%A��璡JwZ|s-��y�q�0^*�)�R��GΔ�xZ{��� @4R�.Zyt%:��-��+ZB��<ݧD��݀(�������tHRH2N�a�9k��Z&�N�0x��+g��!s� B�N�t\�A5)�☶�X�,�O?��ܗ����������织���GH^�G��1��As�D1G+�@,O��^ᘄ@��@�Y�F�<R�>�K�\e�5�z�	�9�Y���r>�� u�4 )�Tc����K�2�L�����4B{)=� �ڜ/�b��l����^�3��C�P3T�4�����c��H����W�	#�@ȱ�b4r �&`
I�d��c�S��(WS<����Q� C�`���npi����F����q C�����h� �+�b@��_�Q�@�P
� p~���2�O�B��a�a�s�6BL�Bz���0/�C<�:�p!����G�<rb%�z7=��r����(N�BM�Ӡ��#Fy���0C۠.-�E�GO����@#dFy���!\�4��\���+�2L������<nb�:Ă���噌�����ӴsvRo�<" uqά��wq��X9�� b~�UTGN�b/�C\m����C8�@ҳb�K�(��=53�h3Am�{�Dc2��bi{��u)i��ґ�F�v҆h5,��X�R����#\]4*a>.�0Z��9M^z�-w�o�^��X\�]��[��K���+�ϼ�(
\	�/�l6�`�^�         �   x�����0�sy
�&.m������O`bj����C4jBH�zh���R��V4+ ����ö�%�OU����^��2仺��P��Cp�����4-#'k�k����P�Rm�ɀ,b���{�\��l�_��d��A�7j�}�g�Q������QLz�P������k-ì�L1kB�
9�J-��*���xm�      �   �   x����J�0���S���2[_��K7���V�<��rP�03a��>Tw�-O�!o�����y�}N���4�9/���H�C@�j	5v�^�EBr
#@XZ�gײ��}Z��pX�mJsZ^�=���d�������(U���N#
[�`l��/'MD��!����I=�c(�j	Q��g�7� ���Pˋ�7�U�_�KbYM��=�*�MWcS��5:�N���2Β�.�ǽT�Q��E�|�NcM�4�Ϙ�A      �   w   x�3���q���H,JT(��I-VH��S(�,�WHIUHLNN-�WH�(I-���4�##]#]#CCS+cs+cK=3CNCK]C R00�#lb\F���؛�G]{c���� ,�:f      �   �   x��ν
�@ �9��=�\zw�&�P�g��\�v��7(B�&�@_B�Z����~�`��R!WL�j��2�)�� VHVQ_57s�~�-�F�����	.�}�fi�TO��F;r��g]>z|�<�g��bQ��p�}�"T**d��{10wι'��F�      �      x������ � �     