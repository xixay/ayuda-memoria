PGDMP             	             |            bd_cge_controleg_dev    11.14    13.13 (Debian 13.13-0+deb11u1)    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262 	   546892858    bd_cge_controleg_dev    DATABASE     i   CREATE DATABASE bd_cge_controleg_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_BO.UTF-8';
 $   DROP DATABASE bd_cge_controleg_dev;
             	   dba_admin    false            �           0    0    DATABASE bd_cge_controleg_dev    ACL     �   GRANT CREATE,CONNECT ON DATABASE bd_cge_controleg_dev TO usr_controleg_dev;
GRANT CREATE,CONNECT ON DATABASE bd_cge_controleg_dev TO usr_dictamen;
                	   dba_admin    false    4252            	            2615 	   547523335 	   controleg    SCHEMA        CREATE SCHEMA controleg;
    DROP SCHEMA controleg;
                usr_controleg_dev    false            �           0    0    SCHEMA controleg    COMMENT     >   COMMENT ON SCHEMA controleg IS 'Esquema que administrara...';
                   usr_controleg_dev    false    9                        2615 	   563871620    dictamen    SCHEMA        CREATE SCHEMA dictamen;
    DROP SCHEMA dictamen;
                usr_dictamen    false            �           0    0    SCHEMA dictamen    ACL     3   GRANT ALL ON SCHEMA dictamen TO usr_controleg_dev;
                   usr_dictamen    false    7                        2615 	   546945328    parametricas    SCHEMA        CREATE SCHEMA parametricas;
    DROP SCHEMA parametricas;
                usr_controleg_dev    false            �           0    0    SCHEMA parametricas    ACL     g   GRANT ALL ON SCHEMA parametricas TO usr_controleg;
GRANT USAGE ON SCHEMA parametricas TO usr_dictamen;
                   usr_controleg_dev    false    5            �            1259 	   563954632    cargo    TABLE     �  CREATE TABLE controleg.cargo (
    car_codigo integer NOT NULL,
    dic_codigo integer NOT NULL,
    car_monto numeric NOT NULL,
    mon_codigo integer,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone,
    car_numero integer NOT NULL,
    estcar_codigo smallint DEFAULT 1 NOT NULL
);
    DROP TABLE controleg.cargo;
    	   controleg            usr_controleg_dev    false    9            �           0    0    COLUMN cargo.car_codigo    COMMENT     N   COMMENT ON COLUMN controleg.cargo.car_codigo IS 'llave primaria de la tabla';
       	   controleg          usr_controleg_dev    false    237            �           0    0    COLUMN cargo.dic_codigo    COMMENT     X   COMMENT ON COLUMN controleg.cargo.dic_codigo IS 'llave foranea a la tabla de dictamen';
       	   controleg          usr_controleg_dev    false    237            �           0    0    COLUMN cargo.car_monto    COMMENT     Z   COMMENT ON COLUMN controleg.cargo.car_monto IS 'monto del cargo que se esta registrando';
       	   controleg          usr_controleg_dev    false    237            �           0    0    COLUMN cargo.mon_codigo    COMMENT     u   COMMENT ON COLUMN controleg.cargo.mon_codigo IS 'llave foranea a la tabla de moneda donde indica el tipo de moneda';
       	   controleg          usr_controleg_dev    false    237            �            1259 	   563954615 	   demandado    TABLE     o  CREATE TABLE controleg.demandado (
    dem_codigo integer NOT NULL,
    pro_codigo integer,
    per_codigo integer,
    perjur_codigo integer,
    empuni_codigo integer,
    ent_codigo integer,
    tipdem_codigo integer NOT NULL,
    dem_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone,
    dem_consolidado smallint DEFAULT 0,
    fecha_consolidado timestamp without time zone
);
     DROP TABLE controleg.demandado;
    	   controleg            usr_controleg_dev    false    9            �           0    0    COLUMN demandado.dem_codigo    COMMENT     O   COMMENT ON COLUMN controleg.demandado.dem_codigo IS 'id primario de la tabla';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.pro_codigo    COMMENT     [   COMMENT ON COLUMN controleg.demandado.pro_codigo IS 'llave foranea a la tabla de proceso';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.per_codigo    COMMENT     [   COMMENT ON COLUMN controleg.demandado.per_codigo IS 'llave foranea a la tabla de persona';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.perjur_codigo    COMMENT     g   COMMENT ON COLUMN controleg.demandado.perjur_codigo IS 'llave foranea a la tabla de persona juridica';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.empuni_codigo    COMMENT     j   COMMENT ON COLUMN controleg.demandado.empuni_codigo IS 'llave foranea a la tabla de empresa unipersonal';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.ent_codigo    COMMENT     g   COMMENT ON COLUMN controleg.demandado.ent_codigo IS 'campo donde se almacena el nombre de la entidad';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.tipdem_codigo    COMMENT     |   COMMENT ON COLUMN controleg.demandado.tipdem_codigo IS 'tipo de demandado persona, persona juridica, unipersonal, entidad';
       	   controleg          usr_controleg_dev    false    235            �           0    0    COLUMN demandado.dem_estado    COMMENT     L   COMMENT ON COLUMN controleg.demandado.dem_estado IS 'estado del demandado';
       	   controleg          usr_controleg_dev    false    235            �            1259 	   563954723    dictamen_uai    TABLE     �  CREATE TABLE controleg.dictamen_uai (
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
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now(),
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 #   DROP TABLE controleg.dictamen_uai;
    	   controleg            usr_controleg_dev    false    9            �           0    0 !   COLUMN dictamen_uai.dicuai_codigo    COMMENT     U   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_codigo IS 'id de la llave primaria';
       	   controleg          usr_controleg_dev    false    239            �           0    0 "   COLUMN dictamen_uai.dicuai_gestion    COMMENT     S   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_gestion IS 'gestion del dictamen';
       	   controleg          usr_controleg_dev    false    239            �           0    0 !   COLUMN dictamen_uai.dicuai_numero    COMMENT     l   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_numero IS 'numero del dictamen emitido por la contraloria';
       	   controleg          usr_controleg_dev    false    239            �           0    0     COLUMN dictamen_uai.dicuai_fecha    COMMENT     j   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_fecha IS 'fecha del dictamen emitido por la contraloria';
       	   controleg          usr_controleg_dev    false    239            �           0    0 )   COLUMN dictamen_uai.dicuai_numero_informe    COMMENT     n   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_numero_informe IS 'numero del informe de la entidad externa';
       	   controleg          usr_controleg_dev    false    239            �           0    0 (   COLUMN dictamen_uai.dicuai_fecha_informe    COMMENT     t   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_fecha_informe IS 'fecha del informe de la auditoria de la entidad';
       	   controleg          usr_controleg_dev    false    239            �           0    0 !   COLUMN dictamen_uai.tipaud_codigo    COMMENT     Y   COMMENT ON COLUMN controleg.dictamen_uai.tipaud_codigo IS 'Tipo de auditoria realizada';
       	   controleg          usr_controleg_dev    false    239            �           0    0 (   COLUMN dictamen_uai.dicuai_nota_remision    COMMENT     �   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_nota_remision IS 'numero de la nota de la entidad con la cual remitio los informes de auditoria';
       	   controleg          usr_controleg_dev    false    239            �           0    0    COLUMN dictamen_uai.ent_codigo    COMMENT     n   COMMENT ON COLUMN controleg.dictamen_uai.ent_codigo IS 'id de la entidad que remite el informe de auditoria';
       	   controleg          usr_controleg_dev    false    239            �           0    0 +   COLUMN dictamen_uai.dicuai_nombre_auditoria    COMMENT     h   COMMENT ON COLUMN controleg.dictamen_uai.dicuai_nombre_auditoria IS 'nombre de la auditoria realizada';
       	   controleg          usr_controleg_dev    false    239            �            1259 	   563954733 
   dictamenes    TABLE     �  CREATE TABLE controleg.dictamenes (
    dic_codigo integer NOT NULL,
    dic_procedencia integer NOT NULL,
    dic_llave integer NOT NULL,
    dic_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 !   DROP TABLE controleg.dictamenes;
    	   controleg            usr_controleg_dev    false    9            �           0    0    COLUMN dictamenes.dic_codigo    COMMENT     G   COMMENT ON COLUMN controleg.dictamenes.dic_codigo IS 'id de la tabla';
       	   controleg          usr_controleg_dev    false    240            �           0    0 !   COLUMN dictamenes.dic_procedencia    COMMENT     t   COMMENT ON COLUMN controleg.dictamenes.dic_procedencia IS '1 o 2 (si es 1 la procedencia es conaud y si es 2 uai)';
       	   controleg          usr_controleg_dev    false    240            �           0    0    COLUMN dictamenes.dic_llave    COMMENT     U   COMMENT ON COLUMN controleg.dictamenes.dic_llave IS 'id de la tabla de procedencia';
       	   controleg          usr_controleg_dev    false    240            �            1259 	   563954771    involucrado    TABLE     :  CREATE TABLE controleg.involucrado (
    inv_codigo integer NOT NULL,
    car_codigo integer NOT NULL,
    per_codigo integer,
    perjur_codigo integer,
    empuni_codigo integer,
    ent_codigo integer,
    tipinv_codigo integer NOT NULL,
    inftip_codigo integer,
    inv_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 "   DROP TABLE controleg.involucrado;
    	   controleg            usr_controleg_dev    false    9            �           0    0    COLUMN involucrado.inv_codigo    COMMENT     Q   COMMENT ON COLUMN controleg.involucrado.inv_codigo IS 'id primario de la tabla';
       	   controleg          usr_controleg_dev    false    241            �           0    0    COLUMN involucrado.car_codigo    COMMENT     [   COMMENT ON COLUMN controleg.involucrado.car_codigo IS 'llave foranea a la tabla de cargo';
       	   controleg          usr_controleg_dev    false    241            �           0    0    COLUMN involucrado.per_codigo    COMMENT     ]   COMMENT ON COLUMN controleg.involucrado.per_codigo IS 'llave foranea a la tabla de persona';
       	   controleg          usr_controleg_dev    false    241            �           0    0     COLUMN involucrado.perjur_codigo    COMMENT     i   COMMENT ON COLUMN controleg.involucrado.perjur_codigo IS 'llave foranea a la tabla de persona juridica';
       	   controleg          usr_controleg_dev    false    241            �           0    0     COLUMN involucrado.empuni_codigo    COMMENT     l   COMMENT ON COLUMN controleg.involucrado.empuni_codigo IS 'llave foranea a la tabla de empresa unipersonal';
       	   controleg          usr_controleg_dev    false    241            �           0    0    COLUMN involucrado.ent_codigo    COMMENT     e   COMMENT ON COLUMN controleg.involucrado.ent_codigo IS 'campo donde se almacena el id de la entidad';
       	   controleg          usr_controleg_dev    false    241            �           0    0     COLUMN involucrado.tipinv_codigo    COMMENT     �   COMMENT ON COLUMN controleg.involucrado.tipinv_codigo IS 'tipo de involucrado persona, persona juridica, unipersonal, entidad';
       	   controleg          usr_controleg_dev    false    241            �           0    0     COLUMN involucrado.inftip_codigo    COMMENT     h   COMMENT ON COLUMN controleg.involucrado.inftip_codigo IS 'llave foranea a la tabla de infraccion Tipo';
       	   controleg          usr_controleg_dev    false    241            �           0    0    COLUMN involucrado.inv_estado    COMMENT     P   COMMENT ON COLUMN controleg.involucrado.inv_estado IS 'estado del involucrado';
       	   controleg          usr_controleg_dev    false    241            �            1259 	   563954606    proceso    TABLE     3  CREATE TABLE controleg.proceso (
    pro_codigo integer NOT NULL,
    pro_gestion integer NOT NULL,
    tippro_codigo integer NOT NULL,
    pro_fecha_inicio date,
    pro_abogado_codigo integer,
    pro_monto numeric,
    mon_codigo integer,
    ent_codigo integer NOT NULL,
    pro_codigo_fiscalia character varying,
    pro_juzgado character varying,
    pro_causa character varying,
    estpro_codigo integer DEFAULT 1,
    pro_observacion character varying,
    pro_datos_adicionales json,
    car_codigo integer,
    pro_codigo_anterior integer,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
    DROP TABLE controleg.proceso;
    	   controleg            usr_controleg_dev    false    9            �           0    0    COLUMN proceso.pro_codigo    COMMENT     X   COMMENT ON COLUMN controleg.proceso.pro_codigo IS 'Llave primaria de la tabla proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.pro_gestion    COMMENT     `   COMMENT ON COLUMN controleg.proceso.pro_gestion IS 'Campo que almacena la gestion del proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.tippro_codigo    COMMENT     p   COMMENT ON COLUMN controleg.proceso.tippro_codigo IS 'Llave foranea a la tabla parametrica de Tipo de Proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.pro_fecha_inicio    COMMENT     o   COMMENT ON COLUMN controleg.proceso.pro_fecha_inicio IS 'Campo donde almacena la fecha de inicio del proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0 !   COLUMN proceso.pro_abogado_codigo    COMMENT     h   COMMENT ON COLUMN controleg.proceso.pro_abogado_codigo IS 'Campo de almacenamiento del id del abagado';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.pro_monto    COMMENT     a   COMMENT ON COLUMN controleg.proceso.pro_monto IS 'campo donde se almacena el monto del proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.mon_codigo    COMMENT     y   COMMENT ON COLUMN controleg.proceso.mon_codigo IS 'llave foranea a la tabla moneda donde se almacena el tipo de moneda';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.ent_codigo    COMMENT     l   COMMENT ON COLUMN controleg.proceso.ent_codigo IS 'campo donde se almacena el id de la entidad demandante';
       	   controleg          usr_controleg_dev    false    234            �           0    0 "   COLUMN proceso.pro_codigo_fiscalia    COMMENT     �   COMMENT ON COLUMN controleg.proceso.pro_codigo_fiscalia IS 'campo donde se puede escribir el codigo del proceso ejm el codigo de la fiscalia';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.pro_juzgado    COMMENT     s   COMMENT ON COLUMN controleg.proceso.pro_juzgado IS 'campo donde se almacena el juzgado donde se lleva el proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.estpro_codigo    COMMENT     c   COMMENT ON COLUMN controleg.proceso.estpro_codigo IS 'llave foranea a la tabla de estado proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0 $   COLUMN proceso.pro_datos_adicionales    COMMENT     �   COMMENT ON COLUMN controleg.proceso.pro_datos_adicionales IS 'campos donde se registra un json donde se registra los datos adicionales del proceso segun el tipo de proceso';
       	   controleg          usr_controleg_dev    false    234            �           0    0    COLUMN proceso.car_codigo    COMMENT     W   COMMENT ON COLUMN controleg.proceso.car_codigo IS 'llave foranea a la tabla de cargo';
       	   controleg          usr_controleg_dev    false    234            �           0    0 "   COLUMN proceso.pro_codigo_anterior    COMMENT     �   COMMENT ON COLUMN controleg.proceso.pro_codigo_anterior IS 'campo donde se llena el id del proceso que viene del proceso anterior';
       	   controleg          usr_controleg_dev    false    234            �            1259 	   563954622    seguimiento_proceso    TABLE     ,  CREATE TABLE controleg.seguimiento_proceso (
    segpro_codigo integer NOT NULL,
    pro_codigo integer NOT NULL,
    estpro_codigo integer NOT NULL,
    segpro_fecha date NOT NULL,
    segpro_descripcion character varying,
    segpro_respaldo json,
    segpro_estado smallint DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 *   DROP TABLE controleg.seguimiento_proceso;
    	   controleg            usr_controleg_dev    false    9            �           0    0 (   COLUMN seguimiento_proceso.segpro_codigo    COMMENT     _   COMMENT ON COLUMN controleg.seguimiento_proceso.segpro_codigo IS 'llave primaria de la tabla';
       	   controleg          usr_controleg_dev    false    236            �           0    0 %   COLUMN seguimiento_proceso.pro_codigo    COMMENT     j   COMMENT ON COLUMN controleg.seguimiento_proceso.pro_codigo IS 'llave foranea al campo de proceso codigo';
       	   controleg          usr_controleg_dev    false    236            �           0    0 (   COLUMN seguimiento_proceso.estpro_codigo    COMMENT     �   COMMENT ON COLUMN controleg.seguimiento_proceso.estpro_codigo IS 'llave foranea a la tabla de estado proceso, este campo indica el estado del proceso';
       	   controleg          usr_controleg_dev    false    236            �           0    0 '   COLUMN seguimiento_proceso.segpro_fecha    COMMENT     p   COMMENT ON COLUMN controleg.seguimiento_proceso.segpro_fecha IS 'feha del actuado que se encuentra realizando';
       	   controleg          usr_controleg_dev    false    236            �           0    0 -   COLUMN seguimiento_proceso.segpro_descripcion    COMMENT     x   COMMENT ON COLUMN controleg.seguimiento_proceso.segpro_descripcion IS 'Descripcion del actuado que se esta realizando';
       	   controleg          usr_controleg_dev    false    236            �           0    0 *   COLUMN seguimiento_proceso.segpro_respaldo    COMMENT     y   COMMENT ON COLUMN controleg.seguimiento_proceso.segpro_respaldo IS 'resapaldo del actuado que se encuentra registrando';
       	   controleg          usr_controleg_dev    false    236            �           0    0 (   COLUMN seguimiento_proceso.segpro_estado    COMMENT     l   COMMENT ON COLUMN controleg.seguimiento_proceso.segpro_estado IS 'estado del registro en la base de datos';
       	   controleg          usr_controleg_dev    false    236            �            1259 	   548429055    solicitud_archivo_digital    TABLE     _  CREATE TABLE controleg.solicitud_archivo_digital (
    sad_codigo integer NOT NULL,
    ssf_codigo integer,
    tipadj_codigo integer,
    arcdig_codigo character varying,
    arcdig_hash character varying,
    arcdig_nombre_archivo character varying,
    arcdig_peso integer,
    arcdig_formato character varying,
    sad_estado integer,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 0   DROP TABLE controleg.solicitud_archivo_digital;
    	   controleg            usr_controleg_dev    false    9            �           0    0 +   COLUMN solicitud_archivo_digital.sad_codigo    COMMENT     b   COMMENT ON COLUMN controleg.solicitud_archivo_digital.sad_codigo IS 'llave primaria de la tabla';
       	   controleg          usr_controleg_dev    false    216            �           0    0 +   COLUMN solicitud_archivo_digital.ssf_codigo    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_archivo_digital.ssf_codigo IS 'llave foranea a la tabla de solicitud de solvencia digital';
       	   controleg          usr_controleg_dev    false    216            �           0    0 .   COLUMN solicitud_archivo_digital.tipadj_codigo    COMMENT     s   COMMENT ON COLUMN controleg.solicitud_archivo_digital.tipadj_codigo IS 'llave foranea a la tabla de tipo adjunto';
       	   controleg          usr_controleg_dev    false    216            �           0    0 .   COLUMN solicitud_archivo_digital.arcdig_codigo    COMMENT     v   COMMENT ON COLUMN controleg.solicitud_archivo_digital.arcdig_codigo IS 'llave foranea a la tabla de archivo digital';
       	   controleg          usr_controleg_dev    false    216            �            1259 	   548429007    solicitud_solvencia_fiscal    TABLE     �  CREATE TABLE controleg.solicitud_solvencia_fiscal (
    ssf_codigo integer NOT NULL,
    tipsol_codigo integer,
    lug_codigo integer,
    motsol_codigo integer,
    ssf_fecha_solicitud timestamp without time zone DEFAULT now(),
    per_codigo integer,
    ssf_objeto character varying,
    ent_codigo integer,
    ssf_correo_electronico character varying,
    ssf_telefono integer,
    per_codigo_apoderado integer,
    lug_codigo_apoderado integer,
    drt_codigo integer,
    ssf_nro_documento character varying,
    ssf_notaria character varying,
    fecha_registro timestamp without time zone DEFAULT now(),
    ssf_estado integer DEFAULT 1,
    fecha_modificacion timestamp without time zone
);
 1   DROP TABLE controleg.solicitud_solvencia_fiscal;
    	   controleg            usr_controleg_dev    false    9            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_codigo    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ssf_codigo IS 'llave primaria de la tabla, la misma sera incremental (max +1)';
       	   controleg          usr_controleg_dev    false    215            �           0    0 /   COLUMN solicitud_solvencia_fiscal.tipsol_codigo    COMMENT     x   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.tipsol_codigo IS 'llave foranea a la tabla de tipo solicitante';
       	   controleg          usr_controleg_dev    false    215            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.lug_codigo    COMMENT     x   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.lug_codigo IS 'campo que relaciona la tabla con la tabla lugar';
       	   controleg          usr_controleg_dev    false    215            �           0    0 /   COLUMN solicitud_solvencia_fiscal.motsol_codigo    COMMENT     n   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.motsol_codigo IS 'llave foranea a la tabla de motivo';
       	   controleg          usr_controleg_dev    false    215            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.per_codigo    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.per_codigo IS 'llave foranea al campo de persona, en este campo se almacenara el ID de la persona solicitante';
       	   controleg          usr_controleg_dev    false    215            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_objeto    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ssf_objeto IS 'en este campo se almacenara el campo de objeto de la certificacion, la descripcion del motivo del tramite';
       	   controleg          usr_controleg_dev    false    215            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ent_codigo    COMMENT     e   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ent_codigo IS 'Id de la entidad solicitante';
       	   controleg          usr_controleg_dev    false    215            �           0    0 8   COLUMN solicitud_solvencia_fiscal.ssf_correo_electronico    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ssf_correo_electronico IS 'correo electronico de la persona solicitante';
       	   controleg          usr_controleg_dev    false    215            �           0    0 .   COLUMN solicitud_solvencia_fiscal.ssf_telefono    COMMENT     m   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ssf_telefono IS 'telefono de la persona solicitante';
       	   controleg          usr_controleg_dev    false    215            �           0    0 6   COLUMN solicitud_solvencia_fiscal.per_codigo_apoderado    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.per_codigo_apoderado IS 'Id de la persona que es apoderado de la solicitud de solvencia fiscal';
       	   controleg          usr_controleg_dev    false    215            �           0    0 6   COLUMN solicitud_solvencia_fiscal.lug_codigo_apoderado    COMMENT     t   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.lug_codigo_apoderado IS 'campo foranea a la tabla de lugar';
       	   controleg          usr_controleg_dev    false    215            �           0    0 -   COLUMN solicitud_solvencia_fiscal.ssf_notaria    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ssf_notaria IS 'nro de la notoria donde se realizo el tramite de apoderado';
       	   controleg          usr_controleg_dev    false    215            �           0    0 ,   COLUMN solicitud_solvencia_fiscal.ssf_estado    COMMENT     l   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.ssf_estado IS 'estado de la solicitud de solvencia';
       	   controleg          usr_controleg_dev    false    215            �           0    0 4   COLUMN solicitud_solvencia_fiscal.fecha_modificacion    COMMENT     �   COMMENT ON COLUMN controleg.solicitud_solvencia_fiscal.fecha_modificacion IS 'fecha de modificacion de la solicitud de solvencia';
       	   controleg          usr_controleg_dev    false    215            �            1259 	   563872878    acceso    TABLE     �  CREATE TABLE dictamen.acceso (
    acc_codigo integer NOT NULL,
    dic_codigo integer NOT NULL,
    acc_plazo integer NOT NULL,
    acc_qr character varying,
    acc_cantidad_descargas smallint DEFAULT 0,
    acc_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.acceso;
       dictamen            usr_dictamen    false    7            �           0    0    TABLE acceso    COMMENT     s   COMMENT ON TABLE dictamen.acceso IS 'tabla donde se almacenara la lista de los accesos permitidos a los archivos';
          dictamen          usr_dictamen    false    222            �           0    0    COLUMN acceso.acc_codigo    COMMENT     i   COMMENT ON COLUMN dictamen.acceso.acc_codigo IS 'Campo donde se almacena la llave primaria de la tabla';
          dictamen          usr_dictamen    false    222            �           0    0    COLUMN acceso.dic_codigo    COMMENT     V   COMMENT ON COLUMN dictamen.acceso.dic_codigo IS 'Llave foranea de la tabla dictamen';
          dictamen          usr_dictamen    false    222            �           0    0    COLUMN acceso.acc_plazo    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_plazo IS 'campo donde se almacenra el registro de la cantidad de dias que tiene plazo la persona para ingresar al url';
          dictamen          usr_dictamen    false    222            �           0    0    COLUMN acceso.acc_qr    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_qr IS 'campo donde se almacenara la direccion generada para poder visualizar el archivo';
          dictamen          usr_dictamen    false    222            �           0    0 $   COLUMN acceso.acc_cantidad_descargas    COMMENT     �   COMMENT ON COLUMN dictamen.acceso.acc_cantidad_descargas IS 'campo que almacenara la cantidad de descargas que se puede realizar para el archivo';
          dictamen          usr_dictamen    false    222            �           0    0    COLUMN acceso.acc_estado    COMMENT     S   COMMENT ON COLUMN dictamen.acceso.acc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    222            �           0    0    TABLE acceso    ACL     <   GRANT SELECT ON TABLE dictamen.acceso TO usr_controleg_dev;
          dictamen          usr_dictamen    false    222            �            1259 	   563872865    catalogo_general    TABLE     4  CREATE TABLE dictamen.catalogo_general (
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
       dictamen            usr_dictamen    false    7            �           0    0 %   COLUMN catalogo_general.catgen_estado    COMMENT     `   COMMENT ON COLUMN dictamen.catalogo_general.catgen_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    221            �           0    0    TABLE catalogo_general    ACL     T   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.catalogo_general TO usr_controleg_dev;
          dictamen          usr_dictamen    false    221            �            1259 	   563872891    descarga    TABLE     	  CREATE TABLE dictamen.descarga (
    des_codigo integer NOT NULL,
    per_codigo integer NOT NULL,
    inf_codigo integer NOT NULL,
    acc_codigo integer NOT NULL,
    des_numero smallint NOT NULL,
    des_fecha timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    des_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.descarga;
       dictamen            usr_dictamen    false    7            �           0    0    TABLE descarga    COMMENT     �   COMMENT ON TABLE dictamen.descarga IS 'tabla donde se almacenara un los registros de las descargas realizadas por los usuarios';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.des_codigo    COMMENT     P   COMMENT ON COLUMN dictamen.descarga.des_codigo IS 'llave primaria de la tabla';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.per_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.descarga.per_codigo IS 'llave foranea a la tabla de persona';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.inf_codigo    COMMENT     V   COMMENT ON COLUMN dictamen.descarga.inf_codigo IS 'llave foranea a la tabla informe';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.acc_codigo    COMMENT     X   COMMENT ON COLUMN dictamen.descarga.acc_codigo IS 'llave foranea a la tabla de acceso';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.des_numero    COMMENT     k   COMMENT ON COLUMN dictamen.descarga.des_numero IS 'campo que almacena el numero de la descarga realizada';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.des_fecha    COMMENT     d   COMMENT ON COLUMN dictamen.descarga.des_fecha IS 'campo donde se almacena la fecha de la descarga';
          dictamen          usr_dictamen    false    223            �           0    0    COLUMN descarga.des_estado    COMMENT     U   COMMENT ON COLUMN dictamen.descarga.des_estado IS 'llave foranea a la tabal estado';
          dictamen          usr_dictamen    false    223            �           0    0    TABLE descarga    ACL     >   GRANT SELECT ON TABLE dictamen.descarga TO usr_controleg_dev;
          dictamen          usr_dictamen    false    223            �            1259 	   563872818    dictamen    TABLE     �  CREATE TABLE dictamen.dictamen (
    dic_codigo integer NOT NULL,
    dic_gestion smallint NOT NULL,
    dic_numero text NOT NULL,
    dic_nombre_auditoria text,
    ent_codigo integer NOT NULL,
    dic_observacion character varying(500),
    dic_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.dictamen;
       dictamen            usr_dictamen    false    7            �           0    0    TABLE dictamen    COMMENT     p   COMMENT ON TABLE dictamen.dictamen IS 'Tabla donde se almacenara los dictamenes registrados por el area legal';
          dictamen          usr_dictamen    false    217            �           0    0    COLUMN dictamen.dic_codigo    COMMENT     W   COMMENT ON COLUMN dictamen.dictamen.dic_codigo IS 'identifcador de la tabla dictamen';
          dictamen          usr_dictamen    false    217            �           0    0    COLUMN dictamen.dic_gestion    COMMENT     h   COMMENT ON COLUMN dictamen.dictamen.dic_gestion IS 'Campo donde se almacenara la gestion del dictamen';
          dictamen          usr_dictamen    false    217                        0    0    COLUMN dictamen.dic_numero    COMMENT     e   COMMENT ON COLUMN dictamen.dictamen.dic_numero IS 'campo donde se almancera el numero del dictamen';
          dictamen          usr_dictamen    false    217                       0    0 $   COLUMN dictamen.dic_nombre_auditoria    COMMENT     v   COMMENT ON COLUMN dictamen.dictamen.dic_nombre_auditoria IS 'campo donde se almacenera los nombre de las auditorias';
          dictamen          usr_dictamen    false    217                       0    0    COLUMN dictamen.ent_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.ent_codigo IS 'campo donde se almacenara el Id de la Entidad a la cual pertenece el dictamen';
          dictamen          usr_dictamen    false    217                       0    0    COLUMN dictamen.dic_observacion    COMMENT     o   COMMENT ON COLUMN dictamen.dictamen.dic_observacion IS 'campo donde se almancena la observacion del registro';
          dictamen          usr_dictamen    false    217                       0    0    COLUMN dictamen.dic_estado    COMMENT     X   COMMENT ON COLUMN dictamen.dictamen.dic_estado IS 'llave foranea a la tabla de estado';
          dictamen          usr_dictamen    false    217                       0    0     COLUMN dictamen.usuario_registro    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_registro IS 'campo donde se almacenara el  id del usuario que realizo el registro';
          dictamen          usr_dictamen    false    217                       0    0    COLUMN dictamen.fecha_registro    COMMENT     r   COMMENT ON COLUMN dictamen.dictamen.fecha_registro IS 'Fecha de registro de la solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    217                       0    0 $   COLUMN dictamen.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_modificacion IS 'campo donde se almacera el id de usuario que realizo la modificacion del registro';
          dictamen          usr_dictamen    false    217                       0    0    COLUMN dictamen.usuario_baja    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen.usuario_baja IS 'campo donde se almacera el id de usuario que realizo la eliminacion del registro';
          dictamen          usr_dictamen    false    217            	           0    0    TABLE dictamen    ACL     >   GRANT SELECT ON TABLE dictamen.dictamen TO usr_controleg_dev;
          dictamen          usr_dictamen    false    217            �            1259 	   563872937    dictamen_archivo    TABLE       CREATE TABLE dictamen.dictamen_archivo (
    dicarc_codigo integer NOT NULL,
    dic_codigo integer,
    dicarc_ruta character varying(500),
    dicarc_hash character varying NOT NULL,
    dicarc_nombre character varying NOT NULL,
    dicarc_mime character varying NOT NULL,
    dicarc_descripcion character varying,
    dicarc_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE dictamen.dictamen_archivo;
       dictamen            usr_dictamen    false    7            
           0    0    TABLE dictamen_archivo    COMMENT        COMMENT ON TABLE dictamen.dictamen_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados del dictamen';
          dictamen          usr_dictamen    false    227                       0    0 %   COLUMN dictamen_archivo.dicarc_codigo    COMMENT     [   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_dictamen    false    227                       0    0 "   COLUMN dictamen_archivo.dic_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen_archivo.dic_codigo IS 'Campo donde se almacenara el id del dictamen a cual esta relacionado el archivo';
          dictamen          usr_dictamen    false    227                       0    0 #   COLUMN dictamen_archivo.dicarc_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_dictamen    false    227                       0    0 %   COLUMN dictamen_archivo.dicarc_nombre    COMMENT     p   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_dictamen    false    227                       0    0 #   COLUMN dictamen_archivo.dicarc_mime    COMMENT     g   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_dictamen    false    227                       0    0 *   COLUMN dictamen_archivo.dicarc_descripcion    COMMENT     {   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_dictamen    false    227                       0    0 %   COLUMN dictamen_archivo.dicarc_estado    COMMENT     `   COMMENT ON COLUMN dictamen.dictamen_archivo.dicarc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    227                       0    0    TABLE dictamen_archivo    ACL     F   GRANT SELECT ON TABLE dictamen.dictamen_archivo TO usr_controleg_dev;
          dictamen          usr_dictamen    false    227            �            1259 	   563872995    empresa_unipersonal    TABLE     �  CREATE TABLE dictamen.empresa_unipersonal (
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
 )   DROP TABLE dictamen.empresa_unipersonal;
       dictamen            usr_dictamen    false    7                       0    0 (   COLUMN empresa_unipersonal.empuni_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.empresa_unipersonal.empuni_codigo IS 'campo donde se almacenara el id de la persona juridica relacionada con persona que ingreso al sistema';
          dictamen          usr_dictamen    false    232                       0    0 %   COLUMN empresa_unipersonal.per_codigo    COMMENT     a   COMMENT ON COLUMN dictamen.empresa_unipersonal.per_codigo IS 'llave foranea a la tabla persona';
          dictamen          usr_dictamen    false    232                       0    0 (   COLUMN empresa_unipersonal.perjur_codigo    COMMENT     m   COMMENT ON COLUMN dictamen.empresa_unipersonal.perjur_codigo IS 'llave foranea a la tabla persona juridica';
          dictamen          usr_dictamen    false    232                       0    0 -   COLUMN empresa_unipersonal.empuni_observacion    COMMENT     �   COMMENT ON COLUMN dictamen.empresa_unipersonal.empuni_observacion IS 'campo donde se almacenara alguna observacion si fuera necesario';
          dictamen          usr_dictamen    false    232                       0    0 (   COLUMN empresa_unipersonal.empuni_estado    COMMENT     `   COMMENT ON COLUMN dictamen.empresa_unipersonal.empuni_estado IS 'llave forenea a tabla estado';
          dictamen          usr_dictamen    false    232                       0    0    TABLE empresa_unipersonal    ACL     F   GRANT ALL ON TABLE dictamen.empresa_unipersonal TO usr_controleg_dev;
          dictamen          usr_dictamen    false    232            �            1259 	   563962177    entidad_dictamen    TABLE     	  CREATE TABLE dictamen.entidad_dictamen (
    entdic_codigo integer NOT NULL,
    ent_codigo integer,
    entdic_nit integer,
    entdic_correo_electronico character varying,
    entdic_observacion character varying,
    entdic_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 &   DROP TABLE dictamen.entidad_dictamen;
       dictamen            usr_dictamen    false    7                       0    0 "   COLUMN entidad_dictamen.ent_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.entidad_dictamen.ent_codigo IS 'llave primararia de la taba';
          dictamen          usr_dictamen    false    242                       0    0 "   COLUMN entidad_dictamen.entdic_nit    COMMENT     Z   COMMENT ON COLUMN dictamen.entidad_dictamen.entdic_nit IS 'nit de la entidad registrada';
          dictamen          usr_dictamen    false    242                       0    0 1   COLUMN entidad_dictamen.entdic_correo_electronico    COMMENT     t   COMMENT ON COLUMN dictamen.entidad_dictamen.entdic_correo_electronico IS 'correo con el cual ingresara la entidad';
          dictamen          usr_dictamen    false    242                       0    0    TABLE entidad_dictamen    ACL     F   GRANT SELECT ON TABLE dictamen.entidad_dictamen TO usr_controleg_dev;
          dictamen          usr_dictamen    false    242            �            1259 	   563872901    estado    TABLE     x  CREATE TABLE dictamen.estado (
    est_codigo smallint NOT NULL,
    est_nombre character varying NOT NULL,
    est_descripcion character varying,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer DEFAULT 0 NOT NULL,
    usuario_baja integer DEFAULT 0 NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL,
    fecha_baja timestamp without time zone DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NOT NULL
);
    DROP TABLE dictamen.estado;
       dictamen            usr_dictamen    false    7                       0    0    TABLE estado    COMMENT     _   COMMENT ON TABLE dictamen.estado IS 'Tabla para el registro de estados que el sistema usara.';
          dictamen          usr_dictamen    false    224                       0    0    COLUMN estado.est_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.estado.est_codigo IS 'Identificador de la tabla que se consitituye en el estado que las tablas usaran.';
          dictamen          usr_dictamen    false    224                       0    0    COLUMN estado.est_nombre    COMMENT     Z   COMMENT ON COLUMN dictamen.estado.est_nombre IS 'Nombre descriptivo y unico del estado.';
          dictamen          usr_dictamen    false    224                        0    0    COLUMN estado.est_descripcion    COMMENT     {   COMMENT ON COLUMN dictamen.estado.est_descripcion IS 'Descripción del estado que ayude a comprender su uso y proposito.';
          dictamen          usr_dictamen    false    224            !           0    0    TABLE estado    ACL     J   GRANT SELECT,INSERT,UPDATE ON TABLE dictamen.estado TO usr_controleg_dev;
          dictamen          usr_dictamen    false    224            �            1259 	   563872854    informe    TABLE     �  CREATE TABLE dictamen.informe (
    inf_codigo integer NOT NULL,
    inf_gestion smallint NOT NULL,
    dic_codigo integer,
    tipinf_dominio smallint DEFAULT 1 NOT NULL,
    tipinf_codigo integer NOT NULL,
    sti_dominio smallint DEFAULT 2 NOT NULL,
    sti_codigo integer NOT NULL,
    inf_numero character varying(100),
    inf_codigo_informe character varying(100),
    inf_dep_codigo integer,
    inf_unidad_codigo integer,
    inf_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
    DROP TABLE dictamen.informe;
       dictamen            usr_dictamen    false    7            "           0    0    TABLE informe    COMMENT     M   COMMENT ON TABLE dictamen.informe IS 'Informes relacionados en un dictamen';
          dictamen          usr_dictamen    false    220            #           0    0    COLUMN informe.inf_codigo    COMMENT     R   COMMENT ON COLUMN dictamen.informe.inf_codigo IS 'identificador único de tabla';
          dictamen          usr_dictamen    false    220            $           0    0    COLUMN informe.inf_gestion    COMMENT     u   COMMENT ON COLUMN dictamen.informe.inf_gestion IS 'Campo donde se almacenara el registro de la gestion del informe';
          dictamen          usr_dictamen    false    220            %           0    0    COLUMN informe.dic_codigo    COMMENT     d   COMMENT ON COLUMN dictamen.informe.dic_codigo IS 'identificador secuancial de tabla dictamen - FK';
          dictamen          usr_dictamen    false    220            &           0    0    COLUMN informe.tipinf_dominio    COMMENT     p   COMMENT ON COLUMN dictamen.informe.tipinf_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_dictamen    false    220            '           0    0    COLUMN informe.tipinf_codigo    COMMENT     v   COMMENT ON COLUMN dictamen.informe.tipinf_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_dictamen    false    220            (           0    0    COLUMN informe.sti_dominio    COMMENT     m   COMMENT ON COLUMN dictamen.informe.sti_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_dictamen    false    220            )           0    0    COLUMN informe.sti_codigo    COMMENT     s   COMMENT ON COLUMN dictamen.informe.sti_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_dictamen    false    220            *           0    0    COLUMN informe.inf_numero    COMMENT     c   COMMENT ON COLUMN dictamen.informe.inf_numero IS 'campo donde se almacenara el numero de informe';
          dictamen          usr_dictamen    false    220            +           0    0 !   COLUMN informe.inf_codigo_informe    COMMENT     f   COMMENT ON COLUMN dictamen.informe.inf_codigo_informe IS 'Esta campo almacena el codigo del informe';
          dictamen          usr_dictamen    false    220            ,           0    0    COLUMN informe.inf_dep_codigo    COMMENT     s   COMMENT ON COLUMN dictamen.informe.inf_dep_codigo IS 'departamento donde se realizo el registro del departamento';
          dictamen          usr_dictamen    false    220            -           0    0     COLUMN informe.inf_unidad_codigo    COMMENT     k   COMMENT ON COLUMN dictamen.informe.inf_unidad_codigo IS 'unidad donde se realizo el registro del informe';
          dictamen          usr_dictamen    false    220            .           0    0    COLUMN informe.inf_estado    COMMENT     T   COMMENT ON COLUMN dictamen.informe.inf_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    220            /           0    0    COLUMN informe.usuario_registro    COMMENT     ~   COMMENT ON COLUMN dictamen.informe.usuario_registro IS 'Codigo de usuario que actualiza la solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    220            0           0    0    COLUMN informe.fecha_registro    COMMENT     q   COMMENT ON COLUMN dictamen.informe.fecha_registro IS 'Fecha de registro de la solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    220            1           0    0 #   COLUMN informe.usuario_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.informe.usuario_modificacion IS 'Codigo de usuario que actualiza la solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    220            2           0    0 !   COLUMN informe.fecha_modificacion    COMMENT     �   COMMENT ON COLUMN dictamen.informe.fecha_modificacion IS 'Fecha de actualizacion del registro de solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    220            3           0    0    COLUMN informe.usuario_baja    COMMENT     �   COMMENT ON COLUMN dictamen.informe.usuario_baja IS 'Codigo de usuario que hace la baja logica la solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    220            4           0    0    COLUMN informe.fecha_baja    COMMENT     }   COMMENT ON COLUMN dictamen.informe.fecha_baja IS 'Fecha de la baja logica del registro de solicitud - columna de auditoria';
          dictamen          usr_dictamen    false    220            5           0    0    TABLE informe    ACL     =   GRANT SELECT ON TABLE dictamen.informe TO usr_controleg_dev;
          dictamen          usr_dictamen    false    220            �            1259 	   563872830    informe_archivo    TABLE       CREATE TABLE dictamen.informe_archivo (
    infarc_codigo integer NOT NULL,
    inf_codigo integer,
    infarc_ruta character varying(500),
    infarc_hash character varying NOT NULL,
    infarc_nombre character varying NOT NULL,
    infarc_mime character varying NOT NULL,
    infarc_descripcion character varying,
    infarc_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 %   DROP TABLE dictamen.informe_archivo;
       dictamen            usr_dictamen    false    7            6           0    0    TABLE informe_archivo    COMMENT     q   COMMENT ON TABLE dictamen.informe_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados';
          dictamen          usr_dictamen    false    218            7           0    0 $   COLUMN informe_archivo.infarc_codigo    COMMENT     Z   COMMENT ON COLUMN dictamen.informe_archivo.infarc_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_dictamen    false    218            8           0    0 !   COLUMN informe_archivo.inf_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.informe_archivo.inf_codigo IS 'Campo donde se almacenara el id del dictamen a cual esta relacionado el archivo';
          dictamen          usr_dictamen    false    218            9           0    0 "   COLUMN informe_archivo.infarc_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.informe_archivo.infarc_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_dictamen    false    218            :           0    0 $   COLUMN informe_archivo.infarc_nombre    COMMENT     o   COMMENT ON COLUMN dictamen.informe_archivo.infarc_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_dictamen    false    218            ;           0    0 "   COLUMN informe_archivo.infarc_mime    COMMENT     f   COMMENT ON COLUMN dictamen.informe_archivo.infarc_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_dictamen    false    218            <           0    0 )   COLUMN informe_archivo.infarc_descripcion    COMMENT     z   COMMENT ON COLUMN dictamen.informe_archivo.infarc_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_dictamen    false    218            =           0    0 $   COLUMN informe_archivo.infarc_estado    COMMENT     _   COMMENT ON COLUMN dictamen.informe_archivo.infarc_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    218            >           0    0    TABLE informe_archivo    ACL     E   GRANT SELECT ON TABLE dictamen.informe_archivo TO usr_controleg_dev;
          dictamen          usr_dictamen    false    218            �            1259 	   563872914    notificacion    TABLE     g  CREATE TABLE dictamen.notificacion (
    not_codigo integer NOT NULL,
    acc_codigo integer NOT NULL,
    not_correo character varying NOT NULL,
    not_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 "   DROP TABLE dictamen.notificacion;
       dictamen            usr_dictamen    false    7            ?           0    0    TABLE notificacion    COMMENT     �   COMMENT ON TABLE dictamen.notificacion IS 'Tabla donde se almacenara el registro de las notificaciones realizadas de un acceso';
          dictamen          usr_dictamen    false    225            @           0    0    COLUMN notificacion.acc_codigo    COMMENT     Y   COMMENT ON COLUMN dictamen.notificacion.acc_codigo IS 'llave foranea a la tabla acceso';
          dictamen          usr_dictamen    false    225            A           0    0    COLUMN notificacion.not_correo    COMMENT     �   COMMENT ON COLUMN dictamen.notificacion.not_correo IS 'campo donde se almacenara los correos a los cuales fueron notificados los accesos';
          dictamen          usr_dictamen    false    225            B           0    0    COLUMN notificacion.not_estado    COMMENT     Y   COMMENT ON COLUMN dictamen.notificacion.not_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    225            C           0    0    TABLE notificacion    ACL     B   GRANT SELECT ON TABLE dictamen.notificacion TO usr_controleg_dev;
          dictamen          usr_dictamen    false    225            �            1259 	   563872842    persona    TABLE     �  CREATE TABLE dictamen.persona (
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
    DROP TABLE dictamen.persona;
       dictamen            usr_dictamen    false    7            D           0    0    COLUMN persona.per_codigo    COMMENT     y   COMMENT ON COLUMN dictamen.persona.per_codigo IS 'campo donde se almacenara el id de la persona que ingreso al sistema';
          dictamen          usr_dictamen    false    219            E           0    0    COLUMN persona.per_nombres    COMMENT     �   COMMENT ON COLUMN dictamen.persona.per_nombres IS 'campo donde se almacenara los nombres de las personas que ingresaron al sistema';
          dictamen          usr_dictamen    false    219            F           0    0 #   COLUMN persona.per_apellido_paterno    COMMENT     z   COMMENT ON COLUMN dictamen.persona.per_apellido_paterno IS 'campo donde se almacenara el apellido paterno de la persona';
          dictamen          usr_dictamen    false    219            G           0    0 #   COLUMN persona.per_apellido_materno    COMMENT     {   COMMENT ON COLUMN dictamen.persona.per_apellido_materno IS 'campo donde se almacenara el apellido maternod de la persona';
          dictamen          usr_dictamen    false    219            H           0    0    COLUMN persona.per_estado    COMMENT     Q   COMMENT ON COLUMN dictamen.persona.per_estado IS 'llave forenea a tabla estado';
          dictamen          usr_dictamen    false    219            I           0    0 #   COLUMN persona.per_fecha_nacimiento    COMMENT     �   COMMENT ON COLUMN dictamen.persona.per_fecha_nacimiento IS 'campo donde se almacena la fecha de nacimiento de la persona que ingreso al sistema';
          dictamen          usr_dictamen    false    219            J           0    0 &   COLUMN persona.per_documento_identidad    COMMENT     �   COMMENT ON COLUMN dictamen.persona.per_documento_identidad IS 'campo donde se registra la cedula de identidad de la persona que ingresa al sistema';
          dictamen          usr_dictamen    false    219            K           0    0    COLUMN persona.per_nacionalidad    COMMENT     p   COMMENT ON COLUMN dictamen.persona.per_nacionalidad IS 'campo donde se almacenara la naciolidad de la persona';
          dictamen          usr_dictamen    false    219            L           0    0 %   COLUMN persona.per_correo_electronico    COMMENT     �   COMMENT ON COLUMN dictamen.persona.per_correo_electronico IS 'campo donde se almacenara el dato del correo electronico de la persona';
          dictamen          usr_dictamen    false    219            M           0    0    COLUMN persona.tipdoc_codigo    COMMENT     f   COMMENT ON COLUMN dictamen.persona.tipdoc_codigo IS 'campo donde se almacenara el tipo de documento';
          dictamen          usr_dictamen    false    219            N           0    0 #   COLUMN persona.per_apellido_conyuge    COMMENT     �   COMMENT ON COLUMN dictamen.persona.per_apellido_conyuge IS 'campo donde se almacenara el apellido de onyuge paterno de la persona si corresponde';
          dictamen          usr_dictamen    false    219            O           0    0 $   COLUMN persona.per_complemento_segip    COMMENT     }   COMMENT ON COLUMN dictamen.persona.per_complemento_segip IS 'campo donde se almacenara el complemento segip si corresponde';
          dictamen          usr_dictamen    false    219            P           0    0     COLUMN persona.per_lugar_emision    COMMENT     �   COMMENT ON COLUMN dictamen.persona.per_lugar_emision IS 'campo donde se almacenara el lugar de emision del documento de identidad';
          dictamen          usr_dictamen    false    219            Q           0    0    COLUMN persona.per_genero    COMMENT     g   COMMENT ON COLUMN dictamen.persona.per_genero IS 'campo donde se almacenara el genero de una persona';
          dictamen          usr_dictamen    false    219            R           0    0    COLUMN persona.per_domicilio    COMMENT     m   COMMENT ON COLUMN dictamen.persona.per_domicilio IS 'campo donde se almacenara el domicilio de una persona';
          dictamen          usr_dictamen    false    219            S           0    0    COLUMN persona.perext_codigo    COMMENT     m   COMMENT ON COLUMN dictamen.persona.perext_codigo IS 'Campo que hace referencia a codigo de persona externa';
          dictamen          usr_dictamen    false    219            T           0    0    COLUMN persona.per_telefono    COMMENT     p   COMMENT ON COLUMN dictamen.persona.per_telefono IS 'Campo que hace referencia a numero de telefono de persona';
          dictamen          usr_dictamen    false    219            U           0    0    COLUMN persona.validado_segip    COMMENT     t   COMMENT ON COLUMN dictamen.persona.validado_segip IS 'Campo que hace referencia a validacion con segip de persona';
          dictamen          usr_dictamen    false    219            V           0    0    COLUMN persona.per_observacion    COMMENT     u   COMMENT ON COLUMN dictamen.persona.per_observacion IS 'campo donde se almacenara alguna observacion si corresponde';
          dictamen          usr_dictamen    false    219            W           0    0    TABLE persona    ACL     :   GRANT ALL ON TABLE dictamen.persona TO usr_controleg_dev;
          dictamen          usr_dictamen    false    219            �            1259 	   563872926    persona_dictamen    TABLE       CREATE TABLE dictamen.persona_dictamen (
    perdic_codigo integer NOT NULL,
    per_codigo integer,
    inf_codigo integer,
    perdic_notificacion boolean DEFAULT false,
    tipinv_dominio smallint DEFAULT 3,
    tipinv_codigo integer,
    perdic_estado smallint DEFAULT 1,
    perjur_codigo integer,
    empuni_codigo integer,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    entdic_codigo integer
);
 &   DROP TABLE dictamen.persona_dictamen;
       dictamen            usr_dictamen    false    7            X           0    0 %   COLUMN persona_dictamen.perdic_codigo    COMMENT     [   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_codigo IS 'llave primaria de la tabla';
          dictamen          usr_dictamen    false    226            Y           0    0 "   COLUMN persona_dictamen.per_codigo    COMMENT     ^   COMMENT ON COLUMN dictamen.persona_dictamen.per_codigo IS 'llave foranea a la tabla persona';
          dictamen          usr_dictamen    false    226            Z           0    0 "   COLUMN persona_dictamen.inf_codigo    COMMENT     u   COMMENT ON COLUMN dictamen.persona_dictamen.inf_codigo IS 'codigo del informe al cual esta asociado el involucrado';
          dictamen          usr_dictamen    false    226            [           0    0 +   COLUMN persona_dictamen.perdic_notificacion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_notificacion IS 'campo donde se almacenara la bandera en caso de que a una persona ya se le haya realizado la notificacion';
          dictamen          usr_dictamen    false    226            \           0    0 &   COLUMN persona_dictamen.tipinv_dominio    COMMENT     y   COMMENT ON COLUMN dictamen.persona_dictamen.tipinv_dominio IS 'codigo agrupador de relacion estado en catalogo general';
          dictamen          usr_dictamen    false    226            ]           0    0 %   COLUMN persona_dictamen.tipinv_codigo    COMMENT        COMMENT ON COLUMN dictamen.persona_dictamen.tipinv_codigo IS 'codigo identificador de relacion de estado en catalogo general';
          dictamen          usr_dictamen    false    226            ^           0    0 %   COLUMN persona_dictamen.perdic_estado    COMMENT     S   COMMENT ON COLUMN dictamen.persona_dictamen.perdic_estado IS 'estado de la tabla';
          dictamen          usr_dictamen    false    226            _           0    0 %   COLUMN persona_dictamen.perjur_codigo    COMMENT     h   COMMENT ON COLUMN dictamen.persona_dictamen.perjur_codigo IS 'llave fonaea a la tala persona juridica';
          dictamen          usr_dictamen    false    226            `           0    0 %   COLUMN persona_dictamen.empuni_codigo    COMMENT     m   COMMENT ON COLUMN dictamen.persona_dictamen.empuni_codigo IS 'clave foranea a la tabla empresa unipersonal';
          dictamen          usr_dictamen    false    226            a           0    0    TABLE persona_dictamen    ACL     F   GRANT SELECT ON TABLE dictamen.persona_dictamen TO usr_controleg_dev;
          dictamen          usr_dictamen    false    226            �            1259 	   563872949    persona_dictamen_archivo    TABLE       CREATE TABLE dictamen.persona_dictamen_archivo (
    pda_codigo integer NOT NULL,
    perdic_codigo integer,
    pda_ruta character varying(500),
    pda_hash character varying NOT NULL,
    pda_nombre character varying NOT NULL,
    pda_mime character varying NOT NULL,
    pda_descripcion character varying,
    pda_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 .   DROP TABLE dictamen.persona_dictamen_archivo;
       dictamen            usr_dictamen    false    7            b           0    0    TABLE persona_dictamen_archivo    COMMENT     q   COMMENT ON TABLE dictamen.persona_dictamen_archivo IS 'Tabla donde se almacenara archivos de persona diactamen';
          dictamen          usr_dictamen    false    228            c           0    0 *   COLUMN persona_dictamen_archivo.pda_codigo    COMMENT     `   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_dictamen    false    228            d           0    0 -   COLUMN persona_dictamen_archivo.perdic_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.perdic_codigo IS 'Campo donde se almacenara el id de persona_dictamen a cual esta relacionado el archivo';
          dictamen          usr_dictamen    false    228            e           0    0 (   COLUMN persona_dictamen_archivo.pda_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_ruta IS 'Campo donde se almacenara la ruta del archivo escaneado dentro del storage';
          dictamen          usr_dictamen    false    228            f           0    0 (   COLUMN persona_dictamen_archivo.pda_hash    COMMENT     i   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_hash IS 'representacion unívoca de un archivo';
          dictamen          usr_dictamen    false    228            g           0    0 *   COLUMN persona_dictamen_archivo.pda_nombre    COMMENT     u   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_dictamen    false    228            h           0    0 (   COLUMN persona_dictamen_archivo.pda_mime    COMMENT     l   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_dictamen    false    228            i           0    0 /   COLUMN persona_dictamen_archivo.pda_descripcion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_dictamen    false    228            j           0    0 *   COLUMN persona_dictamen_archivo.pda_estado    COMMENT     e   COMMENT ON COLUMN dictamen.persona_dictamen_archivo.pda_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    228            k           0    0    TABLE persona_dictamen_archivo    ACL     N   GRANT SELECT ON TABLE dictamen.persona_dictamen_archivo TO usr_controleg_dev;
          dictamen          usr_dictamen    false    228            �            1259 	   563872983    persona_juridica    TABLE     �  CREATE TABLE dictamen.persona_juridica (
    perjur_codigo integer NOT NULL,
    perjur_razon_social character varying NOT NULL,
    perjur_nit character varying(20),
    perjur_sigla character varying(10) NOT NULL,
    perjur_direccion character varying NOT NULL,
    perjur_telefono character varying,
    perjur_fax character varying,
    perjur_correo_electronico character varying,
    perjur_observacion character varying,
    perjur_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 &   DROP TABLE dictamen.persona_juridica;
       dictamen            usr_dictamen    false    7            l           0    0 %   COLUMN persona_juridica.perjur_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_codigo IS 'campo donde se almacenara el id de la persona juridica que ingreso al sistema';
          dictamen          usr_dictamen    false    231            m           0    0 +   COLUMN persona_juridica.perjur_razon_social    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_razon_social IS 'campo donde se almacenara la razon social de persona juridica';
          dictamen          usr_dictamen    false    231            n           0    0 "   COLUMN persona_juridica.perjur_nit    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_nit IS 'campo donde se registra el NIT de la persona juridica que ingresa al sistema';
          dictamen          usr_dictamen    false    231            o           0    0 $   COLUMN persona_juridica.perjur_sigla    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_sigla IS 'campo donde se almacena la sigla de la entidad juridica si tuviera';
          dictamen          usr_dictamen    false    231            p           0    0 (   COLUMN persona_juridica.perjur_direccion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_direccion IS 'campo donde se almacenara la direccion de la persona juridica';
          dictamen          usr_dictamen    false    231            q           0    0 '   COLUMN persona_juridica.perjur_telefono    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_telefono IS 'campo donde se almacenara el dato del telefono de la persona juridica';
          dictamen          usr_dictamen    false    231            r           0    0 "   COLUMN persona_juridica.perjur_fax    COMMENT     ~   COMMENT ON COLUMN dictamen.persona_juridica.perjur_fax IS 'campo donde se almacenara el fax de la persona juridica si tiene';
          dictamen          usr_dictamen    false    231            s           0    0 1   COLUMN persona_juridica.perjur_correo_electronico    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_correo_electronico IS 'campo donde se almacenara el correo electronico de la persona juridica';
          dictamen          usr_dictamen    false    231            t           0    0 *   COLUMN persona_juridica.perjur_observacion    COMMENT     �   COMMENT ON COLUMN dictamen.persona_juridica.perjur_observacion IS 'campo donde se almacenara alguna observacion si corresponde';
          dictamen          usr_dictamen    false    231            u           0    0 %   COLUMN persona_juridica.perjur_estado    COMMENT     ]   COMMENT ON COLUMN dictamen.persona_juridica.perjur_estado IS 'llave forenea a tabla estado';
          dictamen          usr_dictamen    false    231            v           0    0    TABLE persona_juridica    ACL     C   GRANT ALL ON TABLE dictamen.persona_juridica TO usr_controleg_dev;
          dictamen          usr_dictamen    false    231            �            1259 	   563872961    proceso_entidad    TABLE       CREATE TABLE dictamen.proceso_entidad (
    proent_codigo integer NOT NULL,
    dic_codigo integer,
    proent_fecha_remision timestamp without time zone,
    proent_inicio_accion boolean DEFAULT false,
    proent_fecha_accion timestamp without time zone,
    proent_dep integer,
    proent_observacion character varying(200),
    proent_estado smallint DEFAULT 1,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 %   DROP TABLE dictamen.proceso_entidad;
       dictamen            usr_dictamen    false    7            w           0    0    TABLE proceso_entidad    COMMENT     �   COMMENT ON TABLE dictamen.proceso_entidad IS 'tabla donde se almacenara el registro de inicio de acciones remitida a una entidad';
          dictamen          usr_dictamen    false    229            x           0    0 $   COLUMN proceso_entidad.proent_codigo    COMMENT     Z   COMMENT ON COLUMN dictamen.proceso_entidad.proent_codigo IS 'llave primaria de la tabla';
          dictamen          usr_dictamen    false    229            y           0    0 !   COLUMN proceso_entidad.dic_codigo    COMMENT     b   COMMENT ON COLUMN dictamen.proceso_entidad.dic_codigo IS 'llave foranea hacia la tabla dictamen';
          dictamen          usr_dictamen    false    229            z           0    0 ,   COLUMN proceso_entidad.proent_fecha_remision    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_fecha_remision IS 'fecha de cuando se realizo la remision de la nota de inicio de acciones';
          dictamen          usr_dictamen    false    229            {           0    0 +   COLUMN proceso_entidad.proent_inicio_accion    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_inicio_accion IS 'bandera para señalar que la entidad realizo el inicio de acciones';
          dictamen          usr_dictamen    false    229            |           0    0 *   COLUMN proceso_entidad.proent_fecha_accion    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_fecha_accion IS 'campo donde se almacena la fecha cuando se inicio las acciones';
          dictamen          usr_dictamen    false    229            }           0    0 !   COLUMN proceso_entidad.proent_dep    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad.proent_dep IS 'campo donde se almacenara el campo del departamento donde se remitio la nota de inicio de acciones';
          dictamen          usr_dictamen    false    229            ~           0    0 )   COLUMN proceso_entidad.proent_observacion    COMMENT     g   COMMENT ON COLUMN dictamen.proceso_entidad.proent_observacion IS 'observacion del registro realizado';
          dictamen          usr_dictamen    false    229                       0    0    TABLE proceso_entidad    ACL     E   GRANT SELECT ON TABLE dictamen.proceso_entidad TO usr_controleg_dev;
          dictamen          usr_dictamen    false    229            �            1259 	   563872971    proceso_entidad_archivo    TABLE     
  CREATE TABLE dictamen.proceso_entidad_archivo (
    pea_codigo integer NOT NULL,
    proent_codigo integer,
    pea_ruta character varying(500),
    pea_hash character varying NOT NULL,
    pea_nombre character varying NOT NULL,
    pea_mime character varying NOT NULL,
    pea_descripcion character varying,
    pea_estado smallint DEFAULT 1 NOT NULL,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone
);
 -   DROP TABLE dictamen.proceso_entidad_archivo;
       dictamen            usr_dictamen    false    7            �           0    0    TABLE proceso_entidad_archivo    COMMENT     y   COMMENT ON TABLE dictamen.proceso_entidad_archivo IS 'Tabla donde se almacenara el registro de los archivos escaneados';
          dictamen          usr_dictamen    false    230            �           0    0 )   COLUMN proceso_entidad_archivo.pea_codigo    COMMENT     _   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_codigo IS 'Llave primaria de la tabla';
          dictamen          usr_dictamen    false    230            �           0    0 ,   COLUMN proceso_entidad_archivo.proent_codigo    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.proent_codigo IS 'Campo donde se almacenara el id del proceso entidad registrado';
          dictamen          usr_dictamen    false    230            �           0    0 '   COLUMN proceso_entidad_archivo.pea_ruta    COMMENT     �   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_ruta IS 'Campo donde se almacenara la ruta donde se encuentra el archivo escaneado dentro del storage';
          dictamen          usr_dictamen    false    230            �           0    0 )   COLUMN proceso_entidad_archivo.pea_nombre    COMMENT     t   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_nombre IS 'campo donde se almacenara el nombre del archivo';
          dictamen          usr_dictamen    false    230            �           0    0 '   COLUMN proceso_entidad_archivo.pea_mime    COMMENT     k   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_mime IS 'campo donde ira la extension del archivo';
          dictamen          usr_dictamen    false    230            �           0    0 .   COLUMN proceso_entidad_archivo.pea_descripcion    COMMENT        COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_descripcion IS 'campo donde se almacenara una descripcion del archivo';
          dictamen          usr_dictamen    false    230            �           0    0 )   COLUMN proceso_entidad_archivo.pea_estado    COMMENT     d   COMMENT ON COLUMN dictamen.proceso_entidad_archivo.pea_estado IS 'llave foranea a la tabla estado';
          dictamen          usr_dictamen    false    230            �           0    0    TABLE proceso_entidad_archivo    ACL     M   GRANT SELECT ON TABLE dictamen.proceso_entidad_archivo TO usr_controleg_dev;
          dictamen          usr_dictamen    false    230            �            1259 	   548428739    documento_representante_tipo    TABLE     �  CREATE TABLE parametricas.documento_representante_tipo (
    drt_codigo integer NOT NULL,
    drt_descripcion character varying,
    drt_observacion character varying,
    drt_estado integer DEFAULT 1,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 6   DROP TABLE parametricas.documento_representante_tipo;
       parametricas            usr_controleg_dev    false    5            �           0    0 3   COLUMN documento_representante_tipo.drt_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.drt_descripcion IS 'descripcion del tipo de documento de representate';
          parametricas          usr_controleg_dev    false    214            �           0    0 3   COLUMN documento_representante_tipo.drt_observacion    COMMENT     �   COMMENT ON COLUMN parametricas.documento_representante_tipo.drt_observacion IS 'observacion del registro de tipo de documento representante';
          parametricas          usr_controleg_dev    false    214            �           0    0 "   TABLE documento_representante_tipo    ACL     Q   GRANT SELECT ON TABLE parametricas.documento_representante_tipo TO usr_dictamen;
          parametricas          usr_controleg_dev    false    214            �            1259 	   547007008    estado_cargo    TABLE     S  CREATE TABLE parametricas.estado_cargo (
    estcar_codigo integer NOT NULL,
    estcar_descripcion character varying,
    estcar_deshabilita_cargo bit(1),
    estcar_recupera_monto bit(1),
    estcar_prioridad integer,
    tipinf_codigo integer NOT NULL,
    estcar_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 &   DROP TABLE parametricas.estado_cargo;
       parametricas            usr_controleg_dev    false    5            �           0    0 &   COLUMN estado_cargo.estcar_descripcion    COMMENT     }   COMMENT ON COLUMN parametricas.estado_cargo.estcar_descripcion IS 'Campo que hace referencia a descripcion de estado_cargo';
          parametricas          usr_controleg_dev    false    205            �           0    0 ,   COLUMN estado_cargo.estcar_deshabilita_cargo    COMMENT     z   COMMENT ON COLUMN parametricas.estado_cargo.estcar_deshabilita_cargo IS 'Campo que deshabilita el cargo de estado_cargo';
          parametricas          usr_controleg_dev    false    205            �           0    0 )   COLUMN estado_cargo.estcar_recupera_monto    COMMENT     q   COMMENT ON COLUMN parametricas.estado_cargo.estcar_recupera_monto IS 'Campo que recupera monto de estado_cargo';
          parametricas          usr_controleg_dev    false    205            �           0    0 $   COLUMN estado_cargo.estcar_prioridad    COMMENT     y   COMMENT ON COLUMN parametricas.estado_cargo.estcar_prioridad IS 'Campo que hace referencia a prioridad de estado_cargo';
          parametricas          usr_controleg_dev    false    205            �           0    0    TABLE estado_cargo    ACL     A   GRANT SELECT ON TABLE parametricas.estado_cargo TO usr_dictamen;
          parametricas          usr_controleg_dev    false    205            �            1259 	   547007018    estado_dictamen    TABLE     �  CREATE TABLE parametricas.estado_dictamen (
    estdic_codigo integer NOT NULL,
    estdic_descripcion character varying,
    tipinf_codigo integer NOT NULL,
    estdic_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 )   DROP TABLE parametricas.estado_dictamen;
       parametricas            usr_controleg_dev    false    5            �           0    0 )   COLUMN estado_dictamen.estdic_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_dictamen.estdic_descripcion IS 'Campo que hace referencia a la descripcion de estado_dictamen';
          parametricas          usr_controleg_dev    false    206            �           0    0    TABLE estado_dictamen    ACL     D   GRANT SELECT ON TABLE parametricas.estado_dictamen TO usr_dictamen;
          parametricas          usr_controleg_dev    false    206            �            1259 	   547006968    estado_proceso    TABLE     V  CREATE TABLE parametricas.estado_proceso (
    estpro_codigo integer NOT NULL,
    estpro_descripcion character varying,
    estpro_deshabilita_proceso bit(1),
    estpro_recupera_monto bit(1),
    estpro_prioridad integer,
    estpro_control_de_baja bit(1),
    estpro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 (   DROP TABLE parametricas.estado_proceso;
       parametricas            usr_controleg_dev    false    5            �           0    0 (   COLUMN estado_proceso.estpro_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_proceso.estpro_descripcion IS 'Campo que hace referencia a descripcion de estado_proceso';
          parametricas          usr_controleg_dev    false    201            �           0    0 0   COLUMN estado_proceso.estpro_deshabilita_proceso    COMMENT     �   COMMENT ON COLUMN parametricas.estado_proceso.estpro_deshabilita_proceso IS 'Campo que deshabilita el proceso de estado_proceso';
          parametricas          usr_controleg_dev    false    201            �           0    0 +   COLUMN estado_proceso.estpro_recupera_monto    COMMENT     u   COMMENT ON COLUMN parametricas.estado_proceso.estpro_recupera_monto IS 'Campo que recupera monto de estado_proceso';
          parametricas          usr_controleg_dev    false    201            �           0    0 &   COLUMN estado_proceso.estpro_prioridad    COMMENT     }   COMMENT ON COLUMN parametricas.estado_proceso.estpro_prioridad IS 'Campo que hace referencia a prioridad de estado_proceso';
          parametricas          usr_controleg_dev    false    201            �           0    0 ,   COLUMN estado_proceso.estpro_control_de_baja    COMMENT     u   COMMENT ON COLUMN parametricas.estado_proceso.estpro_control_de_baja IS 'Campo que controla baja de estado_proceso';
          parametricas          usr_controleg_dev    false    201            �           0    0    TABLE estado_proceso    ACL     C   GRANT SELECT ON TABLE parametricas.estado_proceso TO usr_dictamen;
          parametricas          usr_controleg_dev    false    201            �            1259 	   547006959    estado_registro    TABLE     �  CREATE TABLE parametricas.estado_registro (
    estreg_codigo integer NOT NULL,
    estreg_descripcion character varying,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 )   DROP TABLE parametricas.estado_registro;
       parametricas            usr_controleg_dev    false    5            �           0    0 )   COLUMN estado_registro.estreg_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.estado_registro.estreg_descripcion IS 'Campo que hace referencia a descripcion de estado_registro';
          parametricas          usr_controleg_dev    false    200            �           0    0    TABLE estado_registro    ACL     A   GRANT ALL ON TABLE parametricas.estado_registro TO usr_dictamen;
          parametricas          usr_controleg_dev    false    200            �            1259 	   563911532    genero    TABLE     �  CREATE TABLE parametricas.genero (
    gen_codigo integer NOT NULL,
    gen_descripcion character varying,
    gen_abreviacion character varying,
    gen_mostrar bit(1),
    gen_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
     DROP TABLE parametricas.genero;
       parametricas            usr_controleg_dev    false    5            �           0    0    COLUMN genero.gen_descripcion    COMMENT     o   COMMENT ON COLUMN parametricas.genero.gen_descripcion IS 'Campo que hace referencia a descripcion del genero';
          parametricas          usr_controleg_dev    false    233            �           0    0    COLUMN genero.gen_abreviacion    COMMENT     n   COMMENT ON COLUMN parametricas.genero.gen_abreviacion IS 'Campo que hace referencia a abreviacion de genero';
          parametricas          usr_controleg_dev    false    233            �           0    0    COLUMN genero.gen_mostrar    COMMENT     f   COMMENT ON COLUMN parametricas.genero.gen_mostrar IS 'Campo que hace referencia a mostrar el genero';
          parametricas          usr_controleg_dev    false    233            �           0    0    TABLE genero    ACL     8   GRANT ALL ON TABLE parametricas.genero TO usr_dictamen;
          parametricas          usr_controleg_dev    false    233            �            1259 	   547006998    infraccion_tipo    TABLE     �  CREATE TABLE parametricas.infraccion_tipo (
    inftip_codigo integer NOT NULL,
    inftip_descripcion character varying,
    tipinf_codigo integer NOT NULL,
    inftip_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 )   DROP TABLE parametricas.infraccion_tipo;
       parametricas            usr_controleg_dev    false    5            �           0    0 )   COLUMN infraccion_tipo.inftip_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.infraccion_tipo.inftip_descripcion IS 'Campo que hace referencia a la descripcion de infraccion_tipo';
          parametricas          usr_controleg_dev    false    204            �           0    0    TABLE infraccion_tipo    ACL     D   GRANT SELECT ON TABLE parametricas.infraccion_tipo TO usr_dictamen;
          parametricas          usr_controleg_dev    false    204            �            1259 	   547007028    juzgado    TABLE     �  CREATE TABLE parametricas.juzgado (
    juz_codigo integer NOT NULL,
    juz_descripcion character varying,
    tippro_codigo integer NOT NULL,
    juz_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 !   DROP TABLE parametricas.juzgado;
       parametricas            usr_controleg_dev    false    5            �           0    0    COLUMN juzgado.juz_descripcion    COMMENT     s   COMMENT ON COLUMN parametricas.juzgado.juz_descripcion IS 'Campo que hace referencia a la descripcion de juzgado';
          parametricas          usr_controleg_dev    false    207            �           0    0    TABLE juzgado    ACL     <   GRANT SELECT ON TABLE parametricas.juzgado TO usr_dictamen;
          parametricas          usr_controleg_dev    false    207            �            1259 	   547007038    lugar    TABLE     �  CREATE TABLE parametricas.lugar (
    lug_codigo integer NOT NULL,
    lug_descripcion character varying,
    lug_abreviacion character varying,
    lug_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
    DROP TABLE parametricas.lugar;
       parametricas            usr_controleg_dev    false    5            �           0    0    COLUMN lugar.lug_descripcion    COMMENT     l   COMMENT ON COLUMN parametricas.lugar.lug_descripcion IS 'Campo que hace referencia a descripcion de lugar';
          parametricas          usr_controleg_dev    false    208            �           0    0    COLUMN lugar.lug_abreviacion    COMMENT     l   COMMENT ON COLUMN parametricas.lugar.lug_abreviacion IS 'Campo que hace referencia a abreviacion de lugar';
          parametricas          usr_controleg_dev    false    208            �           0    0    TABLE lugar    ACL     7   GRANT ALL ON TABLE parametricas.lugar TO usr_dictamen;
          parametricas          usr_controleg_dev    false    208            �            1259 	   547007048    moneda    TABLE     �  CREATE TABLE parametricas.moneda (
    mon_codigo integer NOT NULL,
    mon_descripcion character varying,
    mon_abreviacion character varying,
    mon_mostrar bit(1),
    mon_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
     DROP TABLE parametricas.moneda;
       parametricas            usr_controleg_dev    false    5            �           0    0    COLUMN moneda.mon_descripcion    COMMENT     n   COMMENT ON COLUMN parametricas.moneda.mon_descripcion IS 'Campo que hace referencia a descripcion de moneda';
          parametricas          usr_controleg_dev    false    209            �           0    0    COLUMN moneda.mon_abreviacion    COMMENT     n   COMMENT ON COLUMN parametricas.moneda.mon_abreviacion IS 'Campo que hace referencia a abreviacion de moneda';
          parametricas          usr_controleg_dev    false    209            �           0    0    COLUMN moneda.mon_mostrar    COMMENT     c   COMMENT ON COLUMN parametricas.moneda.mon_mostrar IS 'Campo que hace referencia a mostrar moneda';
          parametricas          usr_controleg_dev    false    209            �           0    0    TABLE moneda    ACL     ;   GRANT SELECT ON TABLE parametricas.moneda TO usr_dictamen;
          parametricas          usr_controleg_dev    false    209            �            1259 	   548428716    motivo_solvencia    TABLE     �  CREATE TABLE parametricas.motivo_solvencia (
    motsol_codigo integer NOT NULL,
    motsol_descripcion character varying,
    motsol_observacion character varying,
    motsol_estado integer,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT now(),
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 *   DROP TABLE parametricas.motivo_solvencia;
       parametricas            usr_controleg_dev    false    5            �           0    0 %   COLUMN motivo_solvencia.motsol_codigo    COMMENT     �   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_codigo IS 'tabla donde se almacenara los motivos de la solicitud de solvencia';
          parametricas          usr_controleg_dev    false    212            �           0    0 *   COLUMN motivo_solvencia.motsol_descripcion    COMMENT     n   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_descripcion IS 'despcripcion del motivo de solicitud';
          parametricas          usr_controleg_dev    false    212            �           0    0 *   COLUMN motivo_solvencia.motsol_observacion    COMMENT     x   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_observacion IS 'observacion al registro de motivo de solicitud';
          parametricas          usr_controleg_dev    false    212            �           0    0 %   COLUMN motivo_solvencia.motsol_estado    COMMENT     d   COMMENT ON COLUMN parametricas.motivo_solvencia.motsol_estado IS 'estado del registro de la tabla';
          parametricas          usr_controleg_dev    false    212            �           0    0    TABLE motivo_solvencia    ACL     E   GRANT SELECT ON TABLE parametricas.motivo_solvencia TO usr_dictamen;
          parametricas          usr_controleg_dev    false    212            �            1259 	   548428702    tipo_adjunto    TABLE     �  CREATE TABLE parametricas.tipo_adjunto (
    tipadj_codigo integer NOT NULL,
    tipadj_descripcion character varying,
    tipadj_tramite integer,
    tipadj_observacion character varying,
    tipadj_estado integer,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now(),
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 &   DROP TABLE parametricas.tipo_adjunto;
       parametricas            usr_controleg_dev    false    5            �           0    0 !   COLUMN tipo_adjunto.tipadj_codigo    COMMENT     [   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_codigo IS 'llave primaria de la tabla';
          parametricas          usr_controleg_dev    false    211            �           0    0 &   COLUMN tipo_adjunto.tipadj_descripcion    COMMENT     e   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_descripcion IS 'descripcion del tipo de adjunto';
          parametricas          usr_controleg_dev    false    211            �           0    0 "   COLUMN tipo_adjunto.tipadj_tramite    COMMENT     w   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_tramite IS 'codigo del tramite del cual podra ser el tipo adjunto';
          parametricas          usr_controleg_dev    false    211            �           0    0 &   COLUMN tipo_adjunto.tipadj_observacion    COMMENT     q   COMMENT ON COLUMN parametricas.tipo_adjunto.tipadj_observacion IS 'observacion al registro del tipo de adjunto';
          parametricas          usr_controleg_dev    false    211            �           0    0    TABLE tipo_adjunto    ACL     A   GRANT SELECT ON TABLE parametricas.tipo_adjunto TO usr_dictamen;
          parametricas          usr_controleg_dev    false    211            �            1259 	   547006949    tipo_documento    TABLE     �  CREATE TABLE parametricas.tipo_documento (
    tipdoc_codigo integer NOT NULL,
    tipdoc_descripcion character varying,
    tipdoc_abreviacion character varying,
    tipdoc_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 (   DROP TABLE parametricas.tipo_documento;
       parametricas            usr_controleg_dev    false    5            �           0    0 (   COLUMN tipo_documento.tipdoc_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_descripcion IS 'Campo que hace referencia a descripcion de tipo_documento';
          parametricas          usr_controleg_dev    false    199            �           0    0 (   COLUMN tipo_documento.tipdoc_abreviacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento.tipdoc_abreviacion IS 'Campo que hace referencia a abreviacion de tipo_documento';
          parametricas          usr_controleg_dev    false    199            �           0    0    TABLE tipo_documento    ACL     C   GRANT SELECT ON TABLE parametricas.tipo_documento TO usr_dictamen;
          parametricas          usr_controleg_dev    false    199            �            1259 	   547007058    tipo_documento_remision    TABLE     �  CREATE TABLE parametricas.tipo_documento_remision (
    tdr_codigo integer NOT NULL,
    tdr_descripcion character varying,
    tdr_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 1   DROP TABLE parametricas.tipo_documento_remision;
       parametricas            usr_controleg_dev    false    5            �           0    0 .   COLUMN tipo_documento_remision.tdr_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_documento_remision.tdr_descripcion IS 'Campo que hace referencia a descripcion de tipo_documento_remision';
          parametricas          usr_controleg_dev    false    210            �           0    0    TABLE tipo_documento_remision    ACL     L   GRANT SELECT ON TABLE parametricas.tipo_documento_remision TO usr_dictamen;
          parametricas          usr_controleg_dev    false    210            �            1259 	   547006988    tipo_informe    TABLE     �  CREATE TABLE parametricas.tipo_informe (
    tipinf_codigo integer NOT NULL,
    tipinf_descripcion character varying,
    tipinf_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 &   DROP TABLE parametricas.tipo_informe;
       parametricas            usr_controleg_dev    false    5            �           0    0 &   COLUMN tipo_informe.tipinf_descripcion    COMMENT     }   COMMENT ON COLUMN parametricas.tipo_informe.tipinf_descripcion IS 'Campo que hace referencia a descripcion de tipo_informe';
          parametricas          usr_controleg_dev    false    203            �           0    0    TABLE tipo_informe    ACL     A   GRANT SELECT ON TABLE parametricas.tipo_informe TO usr_dictamen;
          parametricas          usr_controleg_dev    false    203            �            1259 	   563954703    tipo_involucrado    TABLE       CREATE TABLE parametricas.tipo_involucrado (
    tipinv_codigo integer NOT NULL,
    tipinv_descripcion character varying,
    tipinv_abreviacion character varying,
    tipinv_mostrar bit(1),
    tipinv_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 *   DROP TABLE parametricas.tipo_involucrado;
       parametricas            usr_controleg_dev    false    5            �           0    0 *   COLUMN tipo_involucrado.tipinv_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_descripcion IS 'Campo que hace referencia a descripcion del tipo de involucrado';
          parametricas          usr_controleg_dev    false    238            �           0    0 *   COLUMN tipo_involucrado.tipinv_abreviacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_abreviacion IS 'Campo que hace referencia a abreviacion del tipo de involucrado';
          parametricas          usr_controleg_dev    false    238            �           0    0 &   COLUMN tipo_involucrado.tipinv_mostrar    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_involucrado.tipinv_mostrar IS 'Campo que hace referencia a mostrar el tipo de involucrado';
          parametricas          usr_controleg_dev    false    238            �            1259 	   547006978    tipo_proceso    TABLE     �  CREATE TABLE parametricas.tipo_proceso (
    tippro_codigo integer NOT NULL,
    tippro_descripcion character varying,
    tippro_estado integer DEFAULT 1 NOT NULL,
    usuario_registro integer,
    fecha_registro timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone,
    tippro_estado_destino json
);
 &   DROP TABLE parametricas.tipo_proceso;
       parametricas            usr_controleg_dev    false    5            �           0    0 &   COLUMN tipo_proceso.tippro_descripcion    COMMENT     }   COMMENT ON COLUMN parametricas.tipo_proceso.tippro_descripcion IS 'Campo que hace referencia a descripcion de tipo_proceso';
          parametricas          usr_controleg_dev    false    202            �           0    0    TABLE tipo_proceso    ACL     A   GRANT SELECT ON TABLE parametricas.tipo_proceso TO usr_dictamen;
          parametricas          usr_controleg_dev    false    202            �            1259 	   578344592    tipo_proceso_datos_adicionales    TABLE     �   CREATE TABLE parametricas.tipo_proceso_datos_adicionales (
    tpda_codigo integer NOT NULL,
    tpda_tipo_proceso integer NOT NULL,
    tpda_descripcion character varying,
    tpda_nombre character varying NOT NULL,
    tpda_label character varying
);
 8   DROP TABLE parametricas.tipo_proceso_datos_adicionales;
       parametricas            usr_controleg_dev    false    5            �            1259 	   578344569    tipo_proceso_estado_destino    TABLE     �   CREATE TABLE parametricas.tipo_proceso_estado_destino (
    tped_codigo integer NOT NULL,
    tped_tipo_proceso integer NOT NULL,
    tped_estado_proceso integer NOT NULL
);
 5   DROP TABLE parametricas.tipo_proceso_estado_destino;
       parametricas            usr_controleg_dev    false    5            �            1259 	   548428730    tipo_solicitante    TABLE     �  CREATE TABLE parametricas.tipo_solicitante (
    tipsol_codigo integer NOT NULL,
    tipsol_descripcion character varying,
    tipsol_observacion character varying,
    tipsol_estado integer,
    usuario_registro integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now(),
    usuario_modificacion integer,
    fecha_modificacion timestamp without time zone,
    usuario_baja integer,
    fecha_baja timestamp without time zone
);
 *   DROP TABLE parametricas.tipo_solicitante;
       parametricas            usr_controleg_dev    false    5            �           0    0 %   COLUMN tipo_solicitante.tipsol_codigo    COMMENT     _   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_codigo IS 'llave primaria de la tabla';
          parametricas          usr_controleg_dev    false    213            �           0    0 *   COLUMN tipo_solicitante.tipsol_descripcion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_descripcion IS 'campo donde se almancena la descripcion del tipo de solicitante';
          parametricas          usr_controleg_dev    false    213            �           0    0 *   COLUMN tipo_solicitante.tipsol_observacion    COMMENT     �   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_observacion IS 'en este campo se almacena alguna observacion al registro del tipo de solicitante';
          parametricas          usr_controleg_dev    false    213            �           0    0 %   COLUMN tipo_solicitante.tipsol_estado    COMMENT     u   COMMENT ON COLUMN parametricas.tipo_solicitante.tipsol_estado IS 'estado del registro de la tabla tipo solicitante';
          parametricas          usr_controleg_dev    false    213            �           0    0    TABLE tipo_solicitante    ACL     E   GRANT SELECT ON TABLE parametricas.tipo_solicitante TO usr_dictamen;
          parametricas          usr_controleg_dev    false    213            �          0 	   563954632    cargo 
   TABLE DATA           �   COPY controleg.cargo (car_codigo, dic_codigo, car_monto, mon_codigo, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja, car_numero, estcar_codigo) FROM stdin;
 	   controleg          usr_controleg_dev    false    237   �      �          0 	   563954615 	   demandado 
   TABLE DATA             COPY controleg.demandado (dem_codigo, pro_codigo, per_codigo, perjur_codigo, empuni_codigo, ent_codigo, tipdem_codigo, dem_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja, dem_consolidado, fecha_consolidado) FROM stdin;
 	   controleg          usr_controleg_dev    false    235   U�      �          0 	   563954723    dictamen_uai 
   TABLE DATA           Q  COPY controleg.dictamen_uai (dicuai_codigo, dicuai_gestion, dicuai_numero, dicuai_fecha, dicuai_numero_informe, dicuai_fecha_informe, tipaud_codigo, dicuai_nota_remision, ent_codigo, dicuai_nombre_auditoria, dicuai_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
 	   controleg          usr_controleg_dev    false    239   �      �          0 	   563954733 
   dictamenes 
   TABLE DATA           �   COPY controleg.dictamenes (dic_codigo, dic_procedencia, dic_llave, dic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
 	   controleg          usr_controleg_dev    false    240   ��      �          0 	   563954771    involucrado 
   TABLE DATA             COPY controleg.involucrado (inv_codigo, car_codigo, per_codigo, perjur_codigo, empuni_codigo, ent_codigo, tipinv_codigo, inftip_codigo, inv_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
 	   controleg          usr_controleg_dev    false    241   K�      �          0 	   563954606    proceso 
   TABLE DATA           �  COPY controleg.proceso (pro_codigo, pro_gestion, tippro_codigo, pro_fecha_inicio, pro_abogado_codigo, pro_monto, mon_codigo, ent_codigo, pro_codigo_fiscalia, pro_juzgado, pro_causa, estpro_codigo, pro_observacion, pro_datos_adicionales, car_codigo, pro_codigo_anterior, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
 	   controleg          usr_controleg_dev    false    234   h�      �          0 	   563954622    seguimiento_proceso 
   TABLE DATA             COPY controleg.seguimiento_proceso (segpro_codigo, pro_codigo, estpro_codigo, segpro_fecha, segpro_descripcion, segpro_respaldo, segpro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
 	   controleg          usr_controleg_dev    false    236   u      z          0 	   548429055    solicitud_archivo_digital 
   TABLE DATA             COPY controleg.solicitud_archivo_digital (sad_codigo, ssf_codigo, tipadj_codigo, arcdig_codigo, arcdig_hash, arcdig_nombre_archivo, arcdig_peso, arcdig_formato, sad_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
 	   controleg          usr_controleg_dev    false    216         y          0 	   548429007    solicitud_solvencia_fiscal 
   TABLE DATA           T  COPY controleg.solicitud_solvencia_fiscal (ssf_codigo, tipsol_codigo, lug_codigo, motsol_codigo, ssf_fecha_solicitud, per_codigo, ssf_objeto, ent_codigo, ssf_correo_electronico, ssf_telefono, per_codigo_apoderado, lug_codigo_apoderado, drt_codigo, ssf_nro_documento, ssf_notaria, fecha_registro, ssf_estado, fecha_modificacion) FROM stdin;
 	   controleg          usr_controleg_dev    false    215   	      �          0 	   563872878    acceso 
   TABLE DATA           �   COPY dictamen.acceso (acc_codigo, dic_codigo, acc_plazo, acc_qr, acc_cantidad_descargas, acc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    222   *
                0 	   563872865    catalogo_general 
   TABLE DATA           �   COPY dictamen.catalogo_general (catgen_codigo, catgen_codigo_dominio, catgen_descripcion_dominio, catgen_codigo_valor, catgen_acronimo, catgen_descripcion_valor, catgen_estado, usuario_base_datos, fecha_registro) FROM stdin;
    dictamen          usr_dictamen    false    221   �      �          0 	   563872891    descarga 
   TABLE DATA           �   COPY dictamen.descarga (des_codigo, per_codigo, inf_codigo, acc_codigo, des_numero, des_fecha, des_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    223   �      {          0 	   563872818    dictamen 
   TABLE DATA           �   COPY dictamen.dictamen (dic_codigo, dic_gestion, dic_numero, dic_nombre_auditoria, ent_codigo, dic_observacion, dic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    217   �      �          0 	   563872937    dictamen_archivo 
   TABLE DATA             COPY dictamen.dictamen_archivo (dicarc_codigo, dic_codigo, dicarc_ruta, dicarc_hash, dicarc_nombre, dicarc_mime, dicarc_descripcion, dicarc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    227   �      �          0 	   563872995    empresa_unipersonal 
   TABLE DATA           �   COPY dictamen.empresa_unipersonal (empuni_codigo, per_codigo, perjur_codigo, empuni_observacion, empuni_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    232   v      �          0 	   563962177    entidad_dictamen 
   TABLE DATA           �   COPY dictamen.entidad_dictamen (entdic_codigo, ent_codigo, entdic_nit, entdic_correo_electronico, entdic_observacion, entdic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    242   �      �          0 	   563872901    estado 
   TABLE DATA           �   COPY dictamen.estado (est_codigo, est_nombre, est_descripcion, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    224   �      ~          0 	   563872854    informe 
   TABLE DATA           5  COPY dictamen.informe (inf_codigo, inf_gestion, dic_codigo, tipinf_dominio, tipinf_codigo, sti_dominio, sti_codigo, inf_numero, inf_codigo_informe, inf_dep_codigo, inf_unidad_codigo, inf_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    220   �      |          0 	   563872830    informe_archivo 
   TABLE DATA             COPY dictamen.informe_archivo (infarc_codigo, inf_codigo, infarc_ruta, infarc_hash, infarc_nombre, infarc_mime, infarc_descripcion, infarc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    218   �      �          0 	   563872914    notificacion 
   TABLE DATA           �   COPY dictamen.notificacion (not_codigo, acc_codigo, not_correo, not_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    225   �      }          0 	   563872842    persona 
   TABLE DATA           �  COPY dictamen.persona (per_codigo, per_nombres, per_apellido_paterno, per_apellido_materno, per_estado, per_fecha_nacimiento, per_documento_identidad, per_nacionalidad, per_correo_electronico, tipdoc_codigo, per_apellido_conyuge, per_complemento_segip, per_lugar_emision, per_genero, per_domicilio, perext_codigo, per_telefono, validado_segip, per_observacion, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    219   &      �          0 	   563872926    persona_dictamen 
   TABLE DATA           )  COPY dictamen.persona_dictamen (perdic_codigo, per_codigo, inf_codigo, perdic_notificacion, tipinv_dominio, tipinv_codigo, perdic_estado, perjur_codigo, empuni_codigo, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja, entdic_codigo) FROM stdin;
    dictamen          usr_dictamen    false    226   '      �          0 	   563872949    persona_dictamen_archivo 
   TABLE DATA           �   COPY dictamen.persona_dictamen_archivo (pda_codigo, perdic_codigo, pda_ruta, pda_hash, pda_nombre, pda_mime, pda_descripcion, pda_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    228         �          0 	   563872983    persona_juridica 
   TABLE DATA           =  COPY dictamen.persona_juridica (perjur_codigo, perjur_razon_social, perjur_nit, perjur_sigla, perjur_direccion, perjur_telefono, perjur_fax, perjur_correo_electronico, perjur_observacion, perjur_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    231         �          0 	   563872961    proceso_entidad 
   TABLE DATA             COPY dictamen.proceso_entidad (proent_codigo, dic_codigo, proent_fecha_remision, proent_inicio_accion, proent_fecha_accion, proent_dep, proent_observacion, proent_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    229   !      �          0 	   563872971    proceso_entidad_archivo 
   TABLE DATA           �   COPY dictamen.proceso_entidad_archivo (pea_codigo, proent_codigo, pea_ruta, pea_hash, pea_nombre, pea_mime, pea_descripcion, pea_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    dictamen          usr_dictamen    false    230   k!      x          0 	   548428739    documento_representante_tipo 
   TABLE DATA           �   COPY parametricas.documento_representante_tipo (drt_codigo, drt_descripcion, drt_observacion, drt_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    214   /"      o          0 	   547007008    estado_cargo 
   TABLE DATA             COPY parametricas.estado_cargo (estcar_codigo, estcar_descripcion, estcar_deshabilita_cargo, estcar_recupera_monto, estcar_prioridad, tipinf_codigo, estcar_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    205   �"      p          0 	   547007018    estado_dictamen 
   TABLE DATA           �   COPY parametricas.estado_dictamen (estdic_codigo, estdic_descripcion, tipinf_codigo, estdic_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    206   �$      k          0 	   547006968    estado_proceso 
   TABLE DATA           #  COPY parametricas.estado_proceso (estpro_codigo, estpro_descripcion, estpro_deshabilita_proceso, estpro_recupera_monto, estpro_prioridad, estpro_control_de_baja, estpro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    201   J&      j          0 	   547006959    estado_registro 
   TABLE DATA           �   COPY parametricas.estado_registro (estreg_codigo, estreg_descripcion, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    200   Q*      �          0 	   563911532    genero 
   TABLE DATA           �   COPY parametricas.genero (gen_codigo, gen_descripcion, gen_abreviacion, gen_mostrar, gen_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    233   �*      n          0 	   547006998    infraccion_tipo 
   TABLE DATA           �   COPY parametricas.infraccion_tipo (inftip_codigo, inftip_descripcion, tipinf_codigo, inftip_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    204   $+      q          0 	   547007028    juzgado 
   TABLE DATA           �   COPY parametricas.juzgado (juz_codigo, juz_descripcion, tippro_codigo, juz_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    207   �,      r          0 	   547007038    lugar 
   TABLE DATA           �   COPY parametricas.lugar (lug_codigo, lug_descripcion, lug_abreviacion, lug_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    208   �-      s          0 	   547007048    moneda 
   TABLE DATA           �   COPY parametricas.moneda (mon_codigo, mon_descripcion, mon_abreviacion, mon_mostrar, mon_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    209   �0      v          0 	   548428716    motivo_solvencia 
   TABLE DATA           �   COPY parametricas.motivo_solvencia (motsol_codigo, motsol_descripcion, motsol_observacion, motsol_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    212   	2      u          0 	   548428702    tipo_adjunto 
   TABLE DATA           �   COPY parametricas.tipo_adjunto (tipadj_codigo, tipadj_descripcion, tipadj_tramite, tipadj_observacion, tipadj_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    211   g2      i          0 	   547006949    tipo_documento 
   TABLE DATA           �   COPY parametricas.tipo_documento (tipdoc_codigo, tipdoc_descripcion, tipdoc_abreviacion, tipdoc_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    199   �2      t          0 	   547007058    tipo_documento_remision 
   TABLE DATA           �   COPY parametricas.tipo_documento_remision (tdr_codigo, tdr_descripcion, tdr_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    210   �3      m          0 	   547006988    tipo_informe 
   TABLE DATA           �   COPY parametricas.tipo_informe (tipinf_codigo, tipinf_descripcion, tipinf_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    203   �4      �          0 	   563954703    tipo_involucrado 
   TABLE DATA           �   COPY parametricas.tipo_involucrado (tipinv_codigo, tipinv_descripcion, tipinv_abreviacion, tipinv_mostrar, tipinv_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    238   �5      l          0 	   547006978    tipo_proceso 
   TABLE DATA           �   COPY parametricas.tipo_proceso (tippro_codigo, tippro_descripcion, tippro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja, tippro_estado_destino) FROM stdin;
    parametricas          usr_controleg_dev    false    202   ^6      �          0 	   578344592    tipo_proceso_datos_adicionales 
   TABLE DATA           �   COPY parametricas.tipo_proceso_datos_adicionales (tpda_codigo, tpda_tipo_proceso, tpda_descripcion, tpda_nombre, tpda_label) FROM stdin;
    parametricas          usr_controleg_dev    false    244   �9      �          0 	   578344569    tipo_proceso_estado_destino 
   TABLE DATA           p   COPY parametricas.tipo_proceso_estado_destino (tped_codigo, tped_tipo_proceso, tped_estado_proceso) FROM stdin;
    parametricas          usr_controleg_dev    false    243   �;      w          0 	   548428730    tipo_solicitante 
   TABLE DATA           �   COPY parametricas.tipo_solicitante (tipsol_codigo, tipsol_descripcion, tipsol_observacion, tipsol_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja) FROM stdin;
    parametricas          usr_controleg_dev    false    213   �=      �           2606 	   563954640    cargo cargo_pk 
   CONSTRAINT     W   ALTER TABLE ONLY controleg.cargo
    ADD CONSTRAINT cargo_pk PRIMARY KEY (car_codigo);
 ;   ALTER TABLE ONLY controleg.cargo DROP CONSTRAINT cargo_pk;
    	   controleg            usr_controleg_dev    false    237            �           2606 	   563954621    demandado demandado_pk 
   CONSTRAINT     _   ALTER TABLE ONLY controleg.demandado
    ADD CONSTRAINT demandado_pk PRIMARY KEY (dem_codigo);
 C   ALTER TABLE ONLY controleg.demandado DROP CONSTRAINT demandado_pk;
    	   controleg            usr_controleg_dev    false    235            �           2606 	   563954739    dictamenes dictamen_pk 
   CONSTRAINT     _   ALTER TABLE ONLY controleg.dictamenes
    ADD CONSTRAINT dictamen_pk PRIMARY KEY (dic_codigo);
 C   ALTER TABLE ONLY controleg.dictamenes DROP CONSTRAINT dictamen_pk;
    	   controleg            usr_controleg_dev    false    240            �           2606 	   563954732    dictamen_uai dictamen_uai_pk 
   CONSTRAINT     h   ALTER TABLE ONLY controleg.dictamen_uai
    ADD CONSTRAINT dictamen_uai_pk PRIMARY KEY (dicuai_codigo);
 I   ALTER TABLE ONLY controleg.dictamen_uai DROP CONSTRAINT dictamen_uai_pk;
    	   controleg            usr_controleg_dev    false    239            �           2606 	   563954777    involucrado involucrado_pk 
   CONSTRAINT     c   ALTER TABLE ONLY controleg.involucrado
    ADD CONSTRAINT involucrado_pk PRIMARY KEY (inv_codigo);
 G   ALTER TABLE ONLY controleg.involucrado DROP CONSTRAINT involucrado_pk;
    	   controleg            usr_controleg_dev    false    241            �           2606 	   563954614    proceso proceso_pk 
   CONSTRAINT     [   ALTER TABLE ONLY controleg.proceso
    ADD CONSTRAINT proceso_pk PRIMARY KEY (pro_codigo);
 ?   ALTER TABLE ONLY controleg.proceso DROP CONSTRAINT proceso_pk;
    	   controleg            usr_controleg_dev    false    234            �           2606 	   563954631 *   seguimiento_proceso seguimiento_proceso_pk 
   CONSTRAINT     v   ALTER TABLE ONLY controleg.seguimiento_proceso
    ADD CONSTRAINT seguimiento_proceso_pk PRIMARY KEY (segpro_codigo);
 W   ALTER TABLE ONLY controleg.seguimiento_proceso DROP CONSTRAINT seguimiento_proceso_pk;
    	   controleg            usr_controleg_dev    false    236            \           2606 	   548429063 6   solicitud_archivo_digital solicitud_archivo_digital_pk 
   CONSTRAINT        ALTER TABLE ONLY controleg.solicitud_archivo_digital
    ADD CONSTRAINT solicitud_archivo_digital_pk PRIMARY KEY (sad_codigo);
 c   ALTER TABLE ONLY controleg.solicitud_archivo_digital DROP CONSTRAINT solicitud_archivo_digital_pk;
    	   controleg            usr_controleg_dev    false    216            Z           2606 	   548429017 8   solicitud_solvencia_fiscal solicitud_solvencia_fiscal_pk 
   CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal
    ADD CONSTRAINT solicitud_solvencia_fiscal_pk PRIMARY KEY (ssf_codigo);
 e   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal DROP CONSTRAINT solicitud_solvencia_fiscal_pk;
    	   controleg            usr_controleg_dev    false    215            j           2606 	   563872890    acceso acceso_pk 
   CONSTRAINT     X   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT acceso_pk PRIMARY KEY (acc_codigo);
 <   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT acceso_pk;
       dictamen            usr_dictamen    false    222            f           2606 	   563872875 $   catalogo_general catalogo_general_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT catalogo_general_pk PRIMARY KEY (catgen_codigo);
 P   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT catalogo_general_pk;
       dictamen            usr_dictamen    false    221            h           2606 	   563872877 $   catalogo_general catalogo_general_uk 
   CONSTRAINT     �   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT catalogo_general_uk UNIQUE (catgen_codigo_dominio, catgen_codigo_valor);
 P   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT catalogo_general_uk;
       dictamen            usr_dictamen    false    221    221            l           2606 	   563872900    descarga descarga_pk 
   CONSTRAINT     \   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT descarga_pk PRIMARY KEY (des_codigo);
 @   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT descarga_pk;
       dictamen            usr_dictamen    false    223            t           2606 	   563872948 $   dictamen_archivo dictamen_archivo_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT dictamen_archivo_pk PRIMARY KEY (dicarc_codigo);
 P   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT dictamen_archivo_pk;
       dictamen            usr_dictamen    false    227            ^           2606 	   563872829    dictamen dictamen_pk 
   CONSTRAINT     \   ALTER TABLE ONLY dictamen.dictamen
    ADD CONSTRAINT dictamen_pk PRIMARY KEY (dic_codigo);
 @   ALTER TABLE ONLY dictamen.dictamen DROP CONSTRAINT dictamen_pk;
       dictamen            usr_dictamen    false    217            ~           2606 	   563873006 *   empresa_unipersonal empresa_unipersonal_pk 
   CONSTRAINT     u   ALTER TABLE ONLY dictamen.empresa_unipersonal
    ADD CONSTRAINT empresa_unipersonal_pk PRIMARY KEY (empuni_codigo);
 V   ALTER TABLE ONLY dictamen.empresa_unipersonal DROP CONSTRAINT empresa_unipersonal_pk;
       dictamen            usr_dictamen    false    232            �           2606 	   563962186 $   entidad_dictamen entidad_dictamen_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.entidad_dictamen
    ADD CONSTRAINT entidad_dictamen_pk PRIMARY KEY (entdic_codigo);
 P   ALTER TABLE ONLY dictamen.entidad_dictamen DROP CONSTRAINT entidad_dictamen_pk;
       dictamen            usr_dictamen    false    242            n           2606 	   563872913    estado estado_pk 
   CONSTRAINT     X   ALTER TABLE ONLY dictamen.estado
    ADD CONSTRAINT estado_pk PRIMARY KEY (est_codigo);
 <   ALTER TABLE ONLY dictamen.estado DROP CONSTRAINT estado_pk;
       dictamen            usr_dictamen    false    224            `           2606 	   563872841 "   informe_archivo informe_archivo_pk 
   CONSTRAINT     m   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT informe_archivo_pk PRIMARY KEY (infarc_codigo);
 N   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT informe_archivo_pk;
       dictamen            usr_dictamen    false    218            d           2606 	   563872864    informe informe_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT informe_pk PRIMARY KEY (inf_codigo);
 >   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT informe_pk;
       dictamen            usr_dictamen    false    220            p           2606 	   563872925    notificacion notificacion_pk 
   CONSTRAINT     d   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT notificacion_pk PRIMARY KEY (not_codigo);
 H   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT notificacion_pk;
       dictamen            usr_dictamen    false    225            v           2606 	   563872960 4   persona_dictamen_archivo persona_dictamen_archivo_pk 
   CONSTRAINT     |   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT persona_dictamen_archivo_pk PRIMARY KEY (pda_codigo);
 `   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT persona_dictamen_archivo_pk;
       dictamen            usr_dictamen    false    228            r           2606 	   563872936 $   persona_dictamen persona_dictamen_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_dictamen_pk PRIMARY KEY (perdic_codigo);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_dictamen_pk;
       dictamen            usr_dictamen    false    226            |           2606 	   563872994 $   persona_juridica persona_juridica_pk 
   CONSTRAINT     o   ALTER TABLE ONLY dictamen.persona_juridica
    ADD CONSTRAINT persona_juridica_pk PRIMARY KEY (perjur_codigo);
 P   ALTER TABLE ONLY dictamen.persona_juridica DROP CONSTRAINT persona_juridica_pk;
       dictamen            usr_dictamen    false    231            b           2606 	   563872853    persona persona_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY dictamen.persona
    ADD CONSTRAINT persona_pk PRIMARY KEY (per_codigo);
 >   ALTER TABLE ONLY dictamen.persona DROP CONSTRAINT persona_pk;
       dictamen            usr_dictamen    false    219            z           2606 	   563872982 2   proceso_entidad_archivo proceso_entidad_archivo_pk 
   CONSTRAINT     z   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT proceso_entidad_archivo_pk PRIMARY KEY (pea_codigo);
 ^   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT proceso_entidad_archivo_pk;
       dictamen            usr_dictamen    false    230            x           2606 	   563872970 "   proceso_entidad proceso_entidad_pk 
   CONSTRAINT     m   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT proceso_entidad_pk PRIMARY KEY (proent_codigo);
 N   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT proceso_entidad_pk;
       dictamen            usr_dictamen    false    229            X           2606 	   548428748 <   documento_representante_tipo documento_representante_tipo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.documento_representante_tipo
    ADD CONSTRAINT documento_representante_tipo_pk PRIMARY KEY (drt_codigo);
 l   ALTER TABLE ONLY parametricas.documento_representante_tipo DROP CONSTRAINT documento_representante_tipo_pk;
       parametricas            usr_controleg_dev    false    214            F           2606 	   547007017    estado_cargo estado_cargo_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.estado_cargo
    ADD CONSTRAINT estado_cargo_pk PRIMARY KEY (estcar_codigo);
 L   ALTER TABLE ONLY parametricas.estado_cargo DROP CONSTRAINT estado_cargo_pk;
       parametricas            usr_controleg_dev    false    205            H           2606 	   547007027 "   estado_dictamen estado_dictamen_pk 
   CONSTRAINT     q   ALTER TABLE ONLY parametricas.estado_dictamen
    ADD CONSTRAINT estado_dictamen_pk PRIMARY KEY (estdic_codigo);
 R   ALTER TABLE ONLY parametricas.estado_dictamen DROP CONSTRAINT estado_dictamen_pk;
       parametricas            usr_controleg_dev    false    206            >           2606 	   547006977     estado_proceso estado_proceso_pk 
   CONSTRAINT     o   ALTER TABLE ONLY parametricas.estado_proceso
    ADD CONSTRAINT estado_proceso_pk PRIMARY KEY (estpro_codigo);
 P   ALTER TABLE ONLY parametricas.estado_proceso DROP CONSTRAINT estado_proceso_pk;
       parametricas            usr_controleg_dev    false    201            <           2606 	   547006967 "   estado_registro estado_registro_pk 
   CONSTRAINT     q   ALTER TABLE ONLY parametricas.estado_registro
    ADD CONSTRAINT estado_registro_pk PRIMARY KEY (estreg_codigo);
 R   ALTER TABLE ONLY parametricas.estado_registro DROP CONSTRAINT estado_registro_pk;
       parametricas            usr_controleg_dev    false    200            �           2606 	   563911541    genero genero_pk 
   CONSTRAINT     \   ALTER TABLE ONLY parametricas.genero
    ADD CONSTRAINT genero_pk PRIMARY KEY (gen_codigo);
 @   ALTER TABLE ONLY parametricas.genero DROP CONSTRAINT genero_pk;
       parametricas            usr_controleg_dev    false    233            D           2606 	   547007007 "   infraccion_tipo infraccion_tipo_pk 
   CONSTRAINT     q   ALTER TABLE ONLY parametricas.infraccion_tipo
    ADD CONSTRAINT infraccion_tipo_pk PRIMARY KEY (inftip_codigo);
 R   ALTER TABLE ONLY parametricas.infraccion_tipo DROP CONSTRAINT infraccion_tipo_pk;
       parametricas            usr_controleg_dev    false    204            J           2606 	   547007037    juzgado juzgado_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY parametricas.juzgado
    ADD CONSTRAINT juzgado_pk PRIMARY KEY (juz_codigo);
 B   ALTER TABLE ONLY parametricas.juzgado DROP CONSTRAINT juzgado_pk;
       parametricas            usr_controleg_dev    false    207            L           2606 	   547007047    lugar lugar_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY parametricas.lugar
    ADD CONSTRAINT lugar_pk PRIMARY KEY (lug_codigo);
 >   ALTER TABLE ONLY parametricas.lugar DROP CONSTRAINT lugar_pk;
       parametricas            usr_controleg_dev    false    208            N           2606 	   547007057    moneda moneda_pk 
   CONSTRAINT     \   ALTER TABLE ONLY parametricas.moneda
    ADD CONSTRAINT moneda_pk PRIMARY KEY (mon_codigo);
 @   ALTER TABLE ONLY parametricas.moneda DROP CONSTRAINT moneda_pk;
       parametricas            usr_controleg_dev    false    209            T           2606 	   548428724 $   motivo_solvencia motivo_solvencia_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.motivo_solvencia
    ADD CONSTRAINT motivo_solvencia_pk PRIMARY KEY (motsol_codigo);
 T   ALTER TABLE ONLY parametricas.motivo_solvencia DROP CONSTRAINT motivo_solvencia_pk;
       parametricas            usr_controleg_dev    false    212            R           2606 	   548428710    tipo_adjunto tipo_adjunto_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_adjunto
    ADD CONSTRAINT tipo_adjunto_pk PRIMARY KEY (tipadj_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_adjunto DROP CONSTRAINT tipo_adjunto_pk;
       parametricas            usr_controleg_dev    false    211            :           2606 	   547006958     tipo_documento tipo_documento_pk 
   CONSTRAINT     o   ALTER TABLE ONLY parametricas.tipo_documento
    ADD CONSTRAINT tipo_documento_pk PRIMARY KEY (tipdoc_codigo);
 P   ALTER TABLE ONLY parametricas.tipo_documento DROP CONSTRAINT tipo_documento_pk;
       parametricas            usr_controleg_dev    false    199            P           2606 	   547007067 2   tipo_documento_remision tipo_documento_remision_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY parametricas.tipo_documento_remision
    ADD CONSTRAINT tipo_documento_remision_pk PRIMARY KEY (tdr_codigo);
 b   ALTER TABLE ONLY parametricas.tipo_documento_remision DROP CONSTRAINT tipo_documento_remision_pk;
       parametricas            usr_controleg_dev    false    210            B           2606 	   547006997    tipo_informe tipo_informe_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_informe
    ADD CONSTRAINT tipo_informe_pk PRIMARY KEY (tipinf_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_informe DROP CONSTRAINT tipo_informe_pk;
       parametricas            usr_controleg_dev    false    203            �           2606 	   563954712 $   tipo_involucrado tipo_involucrado_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.tipo_involucrado
    ADD CONSTRAINT tipo_involucrado_pk PRIMARY KEY (tipinv_codigo);
 T   ALTER TABLE ONLY parametricas.tipo_involucrado DROP CONSTRAINT tipo_involucrado_pk;
       parametricas            usr_controleg_dev    false    238            �           2606 	   578344599 @   tipo_proceso_datos_adicionales tipo_proceso_datos_adicionales_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT tipo_proceso_datos_adicionales_pk PRIMARY KEY (tpda_codigo);
 p   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT tipo_proceso_datos_adicionales_pk;
       parametricas            usr_controleg_dev    false    244            �           2606 	   578344573 :   tipo_proceso_estado_destino tipo_proceso_estado_destino_pk 
   CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_estado_destino
    ADD CONSTRAINT tipo_proceso_estado_destino_pk PRIMARY KEY (tped_codigo);
 j   ALTER TABLE ONLY parametricas.tipo_proceso_estado_destino DROP CONSTRAINT tipo_proceso_estado_destino_pk;
       parametricas            usr_controleg_dev    false    243            @           2606 	   547006987    tipo_proceso tipo_proceso_pk 
   CONSTRAINT     k   ALTER TABLE ONLY parametricas.tipo_proceso
    ADD CONSTRAINT tipo_proceso_pk PRIMARY KEY (tippro_codigo);
 L   ALTER TABLE ONLY parametricas.tipo_proceso DROP CONSTRAINT tipo_proceso_pk;
       parametricas            usr_controleg_dev    false    202            V           2606 	   548428738 $   tipo_solicitante tipo_solicitante_pk 
   CONSTRAINT     s   ALTER TABLE ONLY parametricas.tipo_solicitante
    ADD CONSTRAINT tipo_solicitante_pk PRIMARY KEY (tipsol_codigo);
 T   ALTER TABLE ONLY parametricas.tipo_solicitante DROP CONSTRAINT tipo_solicitante_pk;
       parametricas            usr_controleg_dev    false    213            �           2606 	   563954648    proceso abogado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.proceso
    ADD CONSTRAINT abogado_fk FOREIGN KEY (pro_abogado_codigo) REFERENCES dictamen.persona(per_codigo);
 ?   ALTER TABLE ONLY controleg.proceso DROP CONSTRAINT abogado_fk;
    	   controleg          usr_controleg_dev    false    3938    234    219            �           2606 	   563954663    proceso cargo_codigo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.proceso
    ADD CONSTRAINT cargo_codigo_fk FOREIGN KEY (car_codigo) REFERENCES controleg.cargo(car_codigo);
 D   ALTER TABLE ONLY controleg.proceso DROP CONSTRAINT cargo_codigo_fk;
    	   controleg          usr_controleg_dev    false    234    3976    237            �           2606 	   563954778    involucrado cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.involucrado
    ADD CONSTRAINT cargo_fk FOREIGN KEY (car_codigo) REFERENCES controleg.cargo(car_codigo);
 A   ALTER TABLE ONLY controleg.involucrado DROP CONSTRAINT cargo_fk;
    	   controleg          usr_controleg_dev    false    3976    237    241            �           2606 	   563954740    cargo dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.cargo
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES controleg.dictamenes(dic_codigo);
 >   ALTER TABLE ONLY controleg.cargo DROP CONSTRAINT dictamen_fk;
    	   controleg          usr_controleg_dev    false    237    240    3982            �           2606 	   548429028 :   solicitud_solvencia_fiscal documento_representante_tipo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal
    ADD CONSTRAINT documento_representante_tipo_fk FOREIGN KEY (drt_codigo) REFERENCES parametricas.documento_representante_tipo(drt_codigo);
 g   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal DROP CONSTRAINT documento_representante_tipo_fk;
    	   controleg          usr_controleg_dev    false    3928    214    215            �           2606 	   563954760     demandado empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.demandado
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES dictamen.empresa_unipersonal(empuni_codigo);
 M   ALTER TABLE ONLY controleg.demandado DROP CONSTRAINT empresa_unipersonal_fk;
    	   controleg          usr_controleg_dev    false    232    3966    235            �           2606 	   563954793 "   involucrado empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.involucrado
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES dictamen.empresa_unipersonal(empuni_codigo);
 O   ALTER TABLE ONLY controleg.involucrado DROP CONSTRAINT empresa_unipersonal_fk;
    	   controleg          usr_controleg_dev    false    232    241    3966            �           2606 	   578152045    cargo estado_cargo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.cargo
    ADD CONSTRAINT estado_cargo_fk FOREIGN KEY (estcar_codigo) REFERENCES parametricas.estado_cargo(estcar_codigo);
 B   ALTER TABLE ONLY controleg.cargo DROP CONSTRAINT estado_cargo_fk;
    	   controleg          usr_controleg_dev    false    237    205    3910            �           2606 	   563954765    dictamen_uai estado_dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.dictamen_uai
    ADD CONSTRAINT estado_dictamen_fk FOREIGN KEY (dicuai_estado) REFERENCES parametricas.estado_dictamen(estdic_codigo);
 L   ALTER TABLE ONLY controleg.dictamen_uai DROP CONSTRAINT estado_dictamen_fk;
    	   controleg          usr_controleg_dev    false    3912    239    206            �           2606 	   563954658    proceso estado_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.proceso
    ADD CONSTRAINT estado_proceso_fk FOREIGN KEY (estpro_codigo) REFERENCES parametricas.estado_proceso(estpro_codigo);
 F   ALTER TABLE ONLY controleg.proceso DROP CONSTRAINT estado_proceso_fk;
    	   controleg          usr_controleg_dev    false    3902    201    234            �           2606 	   563954688 %   seguimiento_proceso estado_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.seguimiento_proceso
    ADD CONSTRAINT estado_proceso_fk FOREIGN KEY (estpro_codigo) REFERENCES parametricas.estado_proceso(estpro_codigo);
 R   ALTER TABLE ONLY controleg.seguimiento_proceso DROP CONSTRAINT estado_proceso_fk;
    	   controleg          usr_controleg_dev    false    236    3902    201            �           2606 	   563954653    proceso moneda_codigo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.proceso
    ADD CONSTRAINT moneda_codigo_fk FOREIGN KEY (mon_codigo) REFERENCES parametricas.moneda(mon_codigo);
 E   ALTER TABLE ONLY controleg.proceso DROP CONSTRAINT moneda_codigo_fk;
    	   controleg          usr_controleg_dev    false    209    234    3918            �           2606 	   548429018 .   solicitud_solvencia_fiscal motivo_solvencia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal
    ADD CONSTRAINT motivo_solvencia_fk FOREIGN KEY (motsol_codigo) REFERENCES parametricas.motivo_solvencia(motsol_codigo);
 [   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal DROP CONSTRAINT motivo_solvencia_fk;
    	   controleg          usr_controleg_dev    false    212    3924    215            �           2606 	   563932022 /   solicitud_solvencia_fiscal persona_apoderado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal
    ADD CONSTRAINT persona_apoderado_fk FOREIGN KEY (per_codigo_apoderado) REFERENCES dictamen.persona(per_codigo);
 \   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal DROP CONSTRAINT persona_apoderado_fk;
    	   controleg          usr_controleg_dev    false    215    3938    219            �           2606 	   563932017 %   solicitud_solvencia_fiscal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES dictamen.persona(per_codigo);
 R   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal DROP CONSTRAINT persona_fk;
    	   controleg          usr_controleg_dev    false    219    215    3938            �           2606 	   563954678    demandado persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.demandado
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES dictamen.persona(per_codigo);
 A   ALTER TABLE ONLY controleg.demandado DROP CONSTRAINT persona_fk;
    	   controleg          usr_controleg_dev    false    219    3938    235            �           2606 	   563954783    involucrado persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.involucrado
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES dictamen.persona(per_codigo);
 C   ALTER TABLE ONLY controleg.involucrado DROP CONSTRAINT persona_fk;
    	   controleg          usr_controleg_dev    false    3938    241    219            �           2606 	   563954750    demandado persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.demandado
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES dictamen.persona_juridica(perjur_codigo);
 J   ALTER TABLE ONLY controleg.demandado DROP CONSTRAINT persona_juridica_fk;
    	   controleg          usr_controleg_dev    false    3964    231    235            �           2606 	   563954788    involucrado persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.involucrado
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES dictamen.persona_juridica(perjur_codigo);
 L   ALTER TABLE ONLY controleg.involucrado DROP CONSTRAINT persona_juridica_fk;
    	   controleg          usr_controleg_dev    false    241    231    3964            �           2606 	   563954668    demandado proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.demandado
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg.proceso(pro_codigo);
 A   ALTER TABLE ONLY controleg.demandado DROP CONSTRAINT proceso_fk;
    	   controleg          usr_controleg_dev    false    3970    234    235            �           2606 	   563954683    seguimiento_proceso proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.seguimiento_proceso
    ADD CONSTRAINT proceso_fk FOREIGN KEY (pro_codigo) REFERENCES controleg.proceso(pro_codigo);
 K   ALTER TABLE ONLY controleg.seguimiento_proceso DROP CONSTRAINT proceso_fk;
    	   controleg          usr_controleg_dev    false    234    3970    236            �           2606 	   548429064 7   solicitud_archivo_digital solicitud_solvencia_fiscal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_archivo_digital
    ADD CONSTRAINT solicitud_solvencia_fiscal_fk FOREIGN KEY (ssf_codigo) REFERENCES controleg.solicitud_solvencia_fiscal(ssf_codigo);
 d   ALTER TABLE ONLY controleg.solicitud_archivo_digital DROP CONSTRAINT solicitud_solvencia_fiscal_fk;
    	   controleg          usr_controleg_dev    false    215    3930    216            �           2606 	   548429069 )   solicitud_archivo_digital tipo_adjunto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_archivo_digital
    ADD CONSTRAINT tipo_adjunto_fk FOREIGN KEY (tipadj_codigo) REFERENCES parametricas.tipo_adjunto(tipadj_codigo);
 V   ALTER TABLE ONLY controleg.solicitud_archivo_digital DROP CONSTRAINT tipo_adjunto_fk;
    	   controleg          usr_controleg_dev    false    216    211    3922            �           2606 	   563954713    demandado tipo_involucrado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.demandado
    ADD CONSTRAINT tipo_involucrado_fk FOREIGN KEY (tipdem_codigo) REFERENCES parametricas.tipo_involucrado(tipinv_codigo);
 J   ALTER TABLE ONLY controleg.demandado DROP CONSTRAINT tipo_involucrado_fk;
    	   controleg          usr_controleg_dev    false    235    238    3978            �           2606 	   563954799    involucrado tipo_involucrado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.involucrado
    ADD CONSTRAINT tipo_involucrado_fk FOREIGN KEY (tipinv_codigo) REFERENCES parametricas.tipo_involucrado(tipinv_codigo);
 L   ALTER TABLE ONLY controleg.involucrado DROP CONSTRAINT tipo_involucrado_fk;
    	   controleg          usr_controleg_dev    false    238    3978    241            �           2606 	   548429023 .   solicitud_solvencia_fiscal tipo_solicitante_fk    FK CONSTRAINT     �   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal
    ADD CONSTRAINT tipo_solicitante_fk FOREIGN KEY (tipsol_codigo) REFERENCES parametricas.tipo_solicitante(tipsol_codigo);
 [   ALTER TABLE ONLY controleg.solicitud_solvencia_fiscal DROP CONSTRAINT tipo_solicitante_fk;
    	   controleg          usr_controleg_dev    false    215    3926    213            �           2606 	   563873072    descarga acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES dictamen.acceso(acc_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT acceso_fk;
       dictamen          usr_dictamen    false    223    3946    222            �           2606 	   563873082    notificacion acceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT acceso_fk FOREIGN KEY (acc_codigo) REFERENCES dictamen.acceso(acc_codigo) MATCH FULL;
 B   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT acceso_fk;
       dictamen          usr_dictamen    false    222    225    3946            �           2606 	   563873027    informe dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT dictamen_fk;
       dictamen          usr_dictamen    false    3934    220    217            �           2606 	   563873057    acceso dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT dictamen_fk;
       dictamen          usr_dictamen    false    217    3934    222            �           2606 	   563873122    dictamen_archivo dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 H   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT dictamen_fk;
       dictamen          usr_dictamen    false    227    3934    217            �           2606 	   563873142    proceso_entidad dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT dictamen_fk FOREIGN KEY (dic_codigo) REFERENCES dictamen.dictamen(dic_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT dictamen_fk;
       dictamen          usr_dictamen    false    217    229    3934            �           2606 	   563873117 '   persona_dictamen empresa_unipersonal_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT empresa_unipersonal_fk FOREIGN KEY (empuni_codigo) REFERENCES dictamen.empresa_unipersonal(empuni_codigo);
 S   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT empresa_unipersonal_fk;
       dictamen          usr_dictamen    false    232    226    3966            �           2606 	   563962192    persona_dictamen entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT entidad_fk FOREIGN KEY (entdic_codigo) REFERENCES dictamen.entidad_dictamen(entdic_codigo);
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT entidad_fk;
       dictamen          usr_dictamen    false    242    3986    226            �           2606 	   563873007    dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (dic_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    217    3950    224            �           2606 	   563873017    informe_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (infarc_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 E   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    3950    224    218            �           2606 	   563873022    persona estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona
    ADD CONSTRAINT estado_fk FOREIGN KEY (per_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 =   ALTER TABLE ONLY dictamen.persona DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    224    3950    219            �           2606 	   563873042    informe estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT estado_fk FOREIGN KEY (inf_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 =   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    3950    224    220            �           2606 	   563873047    catalogo_general estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.catalogo_general
    ADD CONSTRAINT estado_fk FOREIGN KEY (catgen_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.catalogo_general DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    224    3950    221            �           2606 	   563873052    acceso estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.acceso
    ADD CONSTRAINT estado_fk FOREIGN KEY (acc_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 <   ALTER TABLE ONLY dictamen.acceso DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    3950    222    224            �           2606 	   563873067    descarga estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT estado_fk FOREIGN KEY (des_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 >   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    223    3950    224            �           2606 	   563873087    notificacion estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.notificacion
    ADD CONSTRAINT estado_fk FOREIGN KEY (not_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 B   ALTER TABLE ONLY dictamen.notificacion DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    224    225    3950            �           2606 	   563873097    persona_dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (perdic_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    3950    226    224            �           2606 	   563873127    dictamen_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.dictamen_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (dicarc_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.dictamen_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    224    3950    227            �           2606 	   563873137 "   persona_dictamen_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (pda_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 N   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    224    3950    228            �           2606 	   563873147    proceso_entidad estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (proent_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 E   ALTER TABLE ONLY dictamen.proceso_entidad DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    229    3950    224            �           2606 	   563873157 !   proceso_entidad_archivo estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT estado_fk FOREIGN KEY (pea_estado) REFERENCES dictamen.estado(est_codigo) MATCH FULL;
 M   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    3950    224    230            �           2606 	   563873162    persona_juridica estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_juridica
    ADD CONSTRAINT estado_fk FOREIGN KEY (perjur_estado) REFERENCES dictamen.estado(est_codigo);
 F   ALTER TABLE ONLY dictamen.persona_juridica DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    231    224    3950            �           2606 	   563873167    empresa_unipersonal estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.empresa_unipersonal
    ADD CONSTRAINT estado_fk FOREIGN KEY (empuni_estado) REFERENCES dictamen.estado(est_codigo);
 I   ALTER TABLE ONLY dictamen.empresa_unipersonal DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    3950    224    232            �           2606 	   563980471    entidad_dictamen estado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.entidad_dictamen
    ADD CONSTRAINT estado_fk FOREIGN KEY (entdic_estado) REFERENCES dictamen.estado(est_codigo);
 F   ALTER TABLE ONLY dictamen.entidad_dictamen DROP CONSTRAINT estado_fk;
       dictamen          usr_dictamen    false    224    3950    242            �           2606 	   563911547    persona genero_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona
    ADD CONSTRAINT genero_fk FOREIGN KEY (per_genero) REFERENCES parametricas.genero(gen_codigo);
 =   ALTER TABLE ONLY dictamen.persona DROP CONSTRAINT genero_fk;
       dictamen          usr_dictamen    false    219    3968    233            �           2606 	   563873012    informe_archivo informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe_archivo
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.informe_archivo DROP CONSTRAINT informe_fk;
       dictamen          usr_dictamen    false    218    3940    220            �           2606 	   563873077    descarga informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT informe_fk;
       dictamen          usr_dictamen    false    3940    223    220            �           2606 	   563873102    persona_dictamen informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT informe_fk FOREIGN KEY (inf_codigo) REFERENCES dictamen.informe(inf_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT informe_fk;
       dictamen          usr_dictamen    false    220    226    3940            �           2606 	   563911518    persona lugar_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona
    ADD CONSTRAINT lugar_fk FOREIGN KEY (per_lugar_emision) REFERENCES parametricas.lugar(lug_codigo);
 <   ALTER TABLE ONLY dictamen.persona DROP CONSTRAINT lugar_fk;
       dictamen          usr_dictamen    false    3916    219    208            �           2606 	   563873132 ,   persona_dictamen_archivo persona_dictamen_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen_archivo
    ADD CONSTRAINT persona_dictamen_fk FOREIGN KEY (perdic_codigo) REFERENCES dictamen.persona_dictamen(perdic_codigo) MATCH FULL;
 X   ALTER TABLE ONLY dictamen.persona_dictamen_archivo DROP CONSTRAINT persona_dictamen_fk;
       dictamen          usr_dictamen    false    3954    228    226            �           2606 	   563873062    descarga persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.descarga
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES dictamen.persona(per_codigo) MATCH FULL;
 ?   ALTER TABLE ONLY dictamen.descarga DROP CONSTRAINT persona_fk;
       dictamen          usr_dictamen    false    219    3938    223            �           2606 	   563873092    persona_dictamen persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES dictamen.persona(per_codigo) MATCH FULL;
 G   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_fk;
       dictamen          usr_dictamen    false    3938    219    226            �           2606 	   563873172    empresa_unipersonal persona_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.empresa_unipersonal
    ADD CONSTRAINT persona_fk FOREIGN KEY (per_codigo) REFERENCES dictamen.persona(per_codigo);
 J   ALTER TABLE ONLY dictamen.empresa_unipersonal DROP CONSTRAINT persona_fk;
       dictamen          usr_dictamen    false    232    219    3938            �           2606 	   563873112 $   persona_dictamen persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES dictamen.persona_juridica(perjur_codigo);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT persona_juridica_fk;
       dictamen          usr_dictamen    false    226    3964    231            �           2606 	   563873177 '   empresa_unipersonal persona_juridica_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.empresa_unipersonal
    ADD CONSTRAINT persona_juridica_fk FOREIGN KEY (perjur_codigo) REFERENCES dictamen.persona_juridica(perjur_codigo);
 S   ALTER TABLE ONLY dictamen.empresa_unipersonal DROP CONSTRAINT persona_juridica_fk;
       dictamen          usr_dictamen    false    3964    232    231            �           2606 	   563873152 *   proceso_entidad_archivo proceso_entidad_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.proceso_entidad_archivo
    ADD CONSTRAINT proceso_entidad_fk FOREIGN KEY (proent_codigo) REFERENCES dictamen.proceso_entidad(proent_codigo) MATCH FULL;
 V   ALTER TABLE ONLY dictamen.proceso_entidad_archivo DROP CONSTRAINT proceso_entidad_fk;
       dictamen          usr_dictamen    false    229    230    3960            �           2606 	   563873037    informe subtipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT subtipo_informe_fk FOREIGN KEY (sti_dominio, sti_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor) MATCH FULL;
 F   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT subtipo_informe_fk;
       dictamen          usr_dictamen    false    220    3944    221    221    220            �           2606 	   563873032    informe tipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.informe
    ADD CONSTRAINT tipo_informe_fk FOREIGN KEY (tipinf_dominio, tipinf_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor) MATCH FULL;
 C   ALTER TABLE ONLY dictamen.informe DROP CONSTRAINT tipo_informe_fk;
       dictamen          usr_dictamen    false    220    220    221    221    3944            �           2606 	   563873107 $   persona_dictamen tipo_involucrado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY dictamen.persona_dictamen
    ADD CONSTRAINT tipo_involucrado_fk FOREIGN KEY (tipinv_dominio, tipinv_codigo) REFERENCES dictamen.catalogo_general(catgen_codigo_dominio, catgen_codigo_valor);
 P   ALTER TABLE ONLY dictamen.persona_dictamen DROP CONSTRAINT tipo_involucrado_fk;
       dictamen          usr_dictamen    false    221    3944    226    221    226            �           2606 	   547007068 !   tipo_documento estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_documento
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipdoc_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 Q   ALTER TABLE ONLY parametricas.tipo_documento DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    3900    199            �           2606 	   547007073 !   estado_proceso estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_proceso
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (estpro_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 Q   ALTER TABLE ONLY parametricas.estado_proceso DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    3900    201            �           2606 	   547007078    tipo_proceso estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tippro_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.tipo_proceso DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    202    3900    200            �           2606 	   547007083    tipo_informe estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_informe
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipinf_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.tipo_informe DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    203    3900            �           2606 	   547007093 "   infraccion_tipo estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.infraccion_tipo
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (inftip_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 R   ALTER TABLE ONLY parametricas.infraccion_tipo DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    3900    200    204            �           2606 	   547007103    estado_cargo estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_cargo
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (estcar_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.estado_cargo DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    205    3900    200            �           2606 	   547007113 "   estado_dictamen estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_dictamen
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (estdic_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 R   ALTER TABLE ONLY parametricas.estado_dictamen DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    3900    206            �           2606 	   547007123    juzgado estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.juzgado
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (juz_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 J   ALTER TABLE ONLY parametricas.juzgado DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    207    3900            �           2606 	   547007128    lugar estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.lugar
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (lug_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 H   ALTER TABLE ONLY parametricas.lugar DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    3900    208            �           2606 	   547007133    moneda estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.moneda
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (mon_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 I   ALTER TABLE ONLY parametricas.moneda DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    3900    209            �           2606 	   547007138 *   tipo_documento_remision estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_documento_remision
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tdr_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 Z   ALTER TABLE ONLY parametricas.tipo_documento_remision DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    210    3900            �           2606 	   548428711    tipo_adjunto estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_adjunto
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipadj_estado) REFERENCES parametricas.estado_registro(estreg_codigo);
 O   ALTER TABLE ONLY parametricas.tipo_adjunto DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    3900    211    200            �           2606 	   548428725 #   motivo_solvencia estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.motivo_solvencia
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (motsol_estado) REFERENCES parametricas.estado_registro(estreg_codigo);
 S   ALTER TABLE ONLY parametricas.motivo_solvencia DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    3900    212    200            �           2606 	   548428749 /   documento_representante_tipo estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.documento_representante_tipo
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (drt_estado) REFERENCES parametricas.estado_registro(estreg_codigo);
 _   ALTER TABLE ONLY parametricas.documento_representante_tipo DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    214    3900    200            �           2606 	   548453718 #   tipo_solicitante estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_solicitante
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipsol_estado) REFERENCES parametricas.estado_registro(estreg_codigo);
 S   ALTER TABLE ONLY parametricas.tipo_solicitante DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    3900    200    213            �           2606 	   563911542    genero estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.genero
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (gen_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 I   ALTER TABLE ONLY parametricas.genero DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    200    3900    233            �           2606 	   563999630 #   tipo_involucrado estado_registro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_involucrado
    ADD CONSTRAINT estado_registro_fk FOREIGN KEY (tipinv_estado) REFERENCES parametricas.estado_registro(estreg_codigo) MATCH FULL;
 S   ALTER TABLE ONLY parametricas.tipo_involucrado DROP CONSTRAINT estado_registro_fk;
       parametricas          usr_controleg_dev    false    238    200    3900            �           2606 	   547007088    infraccion_tipo tipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.infraccion_tipo
    ADD CONSTRAINT tipo_informe_fk FOREIGN KEY (tipinf_codigo) REFERENCES parametricas.tipo_informe(tipinf_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.infraccion_tipo DROP CONSTRAINT tipo_informe_fk;
       parametricas          usr_controleg_dev    false    204    3906    203            �           2606 	   547007098    estado_cargo tipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_cargo
    ADD CONSTRAINT tipo_informe_fk FOREIGN KEY (tipinf_codigo) REFERENCES parametricas.tipo_informe(tipinf_codigo) MATCH FULL;
 L   ALTER TABLE ONLY parametricas.estado_cargo DROP CONSTRAINT tipo_informe_fk;
       parametricas          usr_controleg_dev    false    203    3906    205            �           2606 	   547007108    estado_dictamen tipo_informe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.estado_dictamen
    ADD CONSTRAINT tipo_informe_fk FOREIGN KEY (tipinf_codigo) REFERENCES parametricas.tipo_informe(tipinf_codigo) MATCH FULL;
 O   ALTER TABLE ONLY parametricas.estado_dictamen DROP CONSTRAINT tipo_informe_fk;
       parametricas          usr_controleg_dev    false    3906    206    203            �           2606 	   578344600 @   tipo_proceso_datos_adicionales tipo_proceso_datos_adicionales_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales
    ADD CONSTRAINT tipo_proceso_datos_adicionales_fk FOREIGN KEY (tpda_tipo_proceso) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 p   ALTER TABLE ONLY parametricas.tipo_proceso_datos_adicionales DROP CONSTRAINT tipo_proceso_datos_adicionales_fk;
       parametricas          usr_controleg_dev    false    202    244    3904            �           2606 	   578344574 :   tipo_proceso_estado_destino tipo_proceso_estado_destino_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_estado_destino
    ADD CONSTRAINT tipo_proceso_estado_destino_fk FOREIGN KEY (tped_tipo_proceso) REFERENCES parametricas.tipo_proceso(tippro_codigo);
 j   ALTER TABLE ONLY parametricas.tipo_proceso_estado_destino DROP CONSTRAINT tipo_proceso_estado_destino_fk;
       parametricas          usr_controleg_dev    false    243    3904    202            �           2606 	   578344579 <   tipo_proceso_estado_destino tipo_proceso_estado_destino_fk_1    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.tipo_proceso_estado_destino
    ADD CONSTRAINT tipo_proceso_estado_destino_fk_1 FOREIGN KEY (tped_estado_proceso) REFERENCES parametricas.estado_proceso(estpro_codigo);
 l   ALTER TABLE ONLY parametricas.tipo_proceso_estado_destino DROP CONSTRAINT tipo_proceso_estado_destino_fk_1;
       parametricas          usr_controleg_dev    false    243    3902    201            �           2606 	   547007118    juzgado tipo_proceso_fk    FK CONSTRAINT     �   ALTER TABLE ONLY parametricas.juzgado
    ADD CONSTRAINT tipo_proceso_fk FOREIGN KEY (tippro_codigo) REFERENCES parametricas.tipo_proceso(tippro_codigo) MATCH FULL;
 G   ALTER TABLE ONLY parametricas.juzgado DROP CONSTRAINT tipo_proceso_fk;
       parametricas          usr_controleg_dev    false    207    202    3904            �   =   x�3�4�4450�4�4413�4202�54�54T04�25�24�30301��C ��=... _1'      �   �  x����m�0E�St�
ⷨ!���G�N�ƴS�H K:�KҺ���o��3�aV[�"}~W���1.�*m߸=5~V�`���"��^�_/!���
ZE�3h9�qBO�.�IK��g�,�������hѣ��{X:pg'�72~ K(Ɔ���E������*��;��@;�ε8
8^�:�"����.�R����D�1Y�a�(�3��+}q�$�<N`҂.U�lQ�ph��Bj�N�n��0�T�Z�����A�p�-�753rEq�T[��q�������f� �9G��� E�CD��QV�j��Z;����PBi;�.�����z�5���B�L8����IA�a�I���)�58)���'5����nhh���p��h9ţx�.�҉=�|F�γLt�,��;a>M�F���ih#��� �3�)fHJ�'�u�o
�������'���k�_a"�@%b��>���M.94{�+�d��d���D��آ�I/d0��1د�7��/Q_��1ft�4�ɉ��Ԙi�q��wz�pv&�)��h�-��~��:�(4<�g_+$r�������u��k�����9�c�[��'��8v������qR2��~�+D��a��󽎀�l�����}��yO���W��u]� �      �   �   x�u���0 �s��}�#k���1�.S8,H`���F�ڦ�kH���3�"㤀��UjN$(^�����0�ޱj�����Pe�2��E��0V�̍���EBGW̜\9ą���;���k�v�eg6��T$�|�r��j�:��fcM��m�M�{?E?��c�1��-#14��E��s���:M��o�QB      �   Y   x�m��	� �u
0$/���	��Z
Ky����$�Z��VAe/��<�	�jH�|�X>���jckt��mEF`��}��L�9_<:�      �      x������ � �      �   �
  x��Yio�H���+����i\��Ũ?@ ���������6�����)Ȟ��F�#�:1!��U����*#,!�������
��( @�$X։�*;,{sfN��,#K	J���}��a��;���,o�0���$����7߫�1����(ۺ��4~D��{�ql��S4�HW9���.�/.HT�4;xi��*!�1��S������@I��;b��8�6��Z%$ �w�P�eR䄶焩��Qz�e�I��/JXOʇx��<���^� 	��!rA��*� 8`�U�zx��*AD�3ҷ�{@��r%�#6��,�|/(Qm��� �
оf:��T�T�h���U�Z�\=�oq����(G��q��������P��K`˖_0*�b^����V,� ��`�[��Ѩ��u��R��dF�%d�
HE�~��
��	;��v�Wq�%��_���*�i*eY&���Wχ��s�"N_��v��Z?�1!g�PB�D�3]�jV��'���U)�B^QU�2�bԳ�ԧ�h5�4�à��v��Nl�Ȋ�A�Z�UD+���zZJ � ���a�*�pI��&���q_�e�h\yS��X�~��$���+���E�bpv�֊GiCO^�$m�5���#� q��(��Wᩄ=�+y����s#��V*q` z�89,�� x��߅�X�������_��5e�Y��@�P�1�NA8�By5~vQ�Se�Sz�P��ρƙc�y��LF�����x�KY�o��y��J��)�~�\�Ry�Ճ�b@����-���O<bH7"��O=�V�Z��#�����E�\� ���α=S߇��N$�~�H�_qw�<���A�
�s����yg�c�K��/�4�@N!�98ӗ��@� =�c�_)-�BZ�k�ga�W���Z��2���H+�z�u�H2r"O���2�=� Iy�KI�G}�Q���Rț<�� �
i��2�y+�5��HS�iw��)�lt���:�*qI������*�9����6�#��ڊOdV%���uQV�2����l�!{]�9Y��	,��
D��i�֣2�CNNk���J�\LN�R?%L�u���E�Z�"��L����󙨥�BM����;ډ�Jf��q����dm�\�f�s�Z��$qx ��7	����\�� .�jU�g��O�SC�6Cz8Cx�+3�O�Y�@&> ;%��z�t�XY��=������I,#t�3�:�H��G���?M#qT�oRw঵���O�n�l��yy�X^���� �zVYRo�/�&�ח�ŵ[[��c���%#�m{i���ܜ�S���t�Yh����H�#���{�Y�]cʳ�a$����Uqݨ���0�/jE�q}�n4�`���^ҦE������Wc�sH����}��g-�,jf�=����d:uF̥���&��k2_�.8���WoX��du���h�����4������!�-j�J-��jWZX�m-��Z��޼�57��u��,�t���z���$W�uK�A1���}���/�\�����u[��N�{ ��Иǁc����K's�fzx ���[7��{p��7*�na�J�q:L�	D�
����A2Y���:��՝������s7�G���\sܗ݈�{�V�A8�P����^�۪�re F�~}ӯ��LAQ����r7����(�JJ�|�WTzo��+B���b�Ș���h4����lԯ���Y�S�hߤ�0���`ᾝ�ۈr�.��">�\=,`~�g�r�q*�v�F�G�?o��v�5�sY��n��ڐ^N�ȸ�;ZO�ŨE��)4���|����nf"���K��k� �}s��s<4:w���'Ƃ���,�fL������|��S�w{�?kϑvT'�`��k$���F�h�ծ��;�{�[�Ib(+��z�)����eS�N�\�;E�v�<4���{A��"=E*���e���+�ˇ��E0�f!��%���سxڴgC �D��������M��xgN�5�0���0����,�3ܒ+Z�"\h��f_����wj���[�q�6:��j?��c�W�=�E�iA!��̼��YOa�l��eW�u��D>$�ij�.mr5s��:���k9��mĈ�P�ZN�(գ����HGr�C@-y�Y�*3��c*������F���!bWa�a���-6�mS�+���
v'��V	���b��WY�k3��k"y�O�|6�QY�!��{.�n��]	�T��f�����e.n{oݫ�J�7��'���Hg�{��jLIrPV<ͯd���Y�J�:\곰k�7���=��
#�v8�I�����3���nf��5�Eq���:ݠ�7�;^j�����G{�ڑfSxø��j9����@�+EU��|=���f�յ���mdXa� 9��~lLF�v��8����ZxH>�w�!Wt��-��{���I��g�l�Ҭƪw�л���Aơ�_!��<g����߶�(H�.�wV��ơCG��:(r0g� 7{�V]a�Uz�{R��z�����tpǝ������t7rM/n��k�K���������|�j���������o�����.���^�-Po�Waz�mo�	ig8��x�Y,�����"���)?��%���V��	�b�~�����3�w����5�y� �^��?B�����|]�1��}1;��!Z����]~�[yy�i'�麰����_����T\ҋ������	)w��cP�x�z���o߾���h�      �   �  x��T˒�0<�_��U1����9�_`o. {��W���v\ıĚ��L���t�bX�| |(��4�j��9��W�
�ؤ��Z��{c��]�2d��l&�R�t�FL�FlN(�a�FL�t
:I�2:�<S�VmY�j<������8TqxYz�\�C��g���g^G>��|�Qi}����H#�5l�Đ���*Y����q��i����/׊�?}���S�˹���S	f���SwZÚ�&��ָ�j�j.���n��{*�X��i�-a���gVY�*�@jQ.���t���x�TF��������[����z�.]�=�=ON���MS|@)z�y�=M�٭��`c����M�,��ct'E�ҭ�w�P��*_�^�v�WG�\�      z   �   x���_JA����)�]�L2�̫ ��((����--^@��|!�#��d�=�Ds�J�3�aI��6���Q�u�5��hU�uIk��p���z�P/o��������L1o[�x9�mb�C�MQ���43[=���JXX=�ZZu�у�:w�cMR{kq�c9�??�������@��v�M����0�̗�KNSV[��5ܑ\�����2iޮM܉����,��,3z֘���1ݙ��4M_��e      y   �   x����j�0��y�I���,d�K2ʺSa�-�@X��>�lc�t|?��>H�d��4ʲ
Н������[���U���������:<]���0��qP��E]f�(�H�h�R�4ƃfʳ�����sW�$����HE��e��S�\�}���]"I_���� �z3ě�L^��EtQ|¸&�Ҿzr;���^���!zU�)1D��0���;�aZ���`Ҙ����2Z�hΪ(�u�
      �   e  x����N�@�u�)x���efb��ʔY6�R�����NY`��E�&�ϗ�_t���y.��v]�c��8	� ^T��(�<E��d/[3��&צ.��=H���̯G�Q8$��CRD�y%�@8���!#[.OA�¬��Ldendm���N�U���,�+��@0� 5����.�ܔ	ۯz��Z�2Q^���V�+
�Gszʼ��a?��]n5m�z�$���G��,K�Y{?�4lo�@Sȅ�:��S��&p��>��ǵ��/W�S�����>�� %zl'�,p�!���x�ቅ�ʴ]�j��r6߭��/ٞK߇{PI���D��7�?��ц]��Oق3ƾ I1�         �   x����j� �>E^ ag4�nnnb����=����C{�����₇Fa~|������������C3Y����������y~}~c�CQ�d��nh������%�lts�b����<�RL��S8^��?A2aB6��/V}�L)�fH�C�z�#�li,~p�$nd�	�WSڵjM	�J=��
ڡB#���9	�]�)4]+���9J�`)e���ly�CN�,����T*=4��o�M��      �      x������ � �      {   �   x������@ �ݯ��j��>�.\R�H"�@���������
�q3�g@�C��>�աS��	
�_R �@��F��Ɲ�A���۵�Л�6U�-ۺ�|��?+�����N������9�4x�M����~?_�����v3Ԧ�UͶ�r��j'��P���3�J>�ڿ���Z�%�x�)���ұ�k�,!�Y���zp#      �   �  x�����1�s�S��'U����{XXTV���PI%�3��L��ި�� �^��?$����Xw��Sݶ����e�ɹ<,��^��ɱ�4G�Z�\t�R� ��.��L^�~y kѕ��+�Ei�VՂ�C	�Jb�A<�h��i�f`��h�{�_����ɶ\���������Gm�<>�ᶬ�ݗ}� n���0�� fh
	������8�3���"'��KY����4�E�	�YC��I-��B�*J��MF�!&�<Ǫ)5��Wu��	k�й\����:I6�.c��V�n_�}s������z|����hF�|��/OG7�?@T�����H՛}6�mȥ%�r�
!�w��b�s�R���5&�("�@@���Bn�<t]fj#�z>>伬'AW6Ξf�{��?u}a:�@�P�������.X���A-�q��&�f�3�	�(F���K��n��3�r!�      �   !  x���Kn!D��)�F��>DN�My�M,�V�[J<6��f7�TE54j��p:/Ƿ���������j.��eG�\�؅"�����7�����Z�!-�]�k�RV��N���_b�ԹHљ\4&�lwF3���aOE�ݟ�y
�נANqTG���J�:�P��a��EK�xw�
��!��^V�n���`�e87F�슑������P���--X]�o��*��I
msh�z���hr%���)
��`�J�M�^?W�&7V�z
��#y�X*��2NR�G ���      �   �   x���Mj1���@�%˿�� '��;R<�r���]Li�Bh�x�� ͆��i�Ҹ��\Os-[���rK��T�r���$�#�Q�e �V)��3�������_���tK��'�Z
���a� ���5�8�u�SlAuZS��s��S]�����=�� I�6�y�-K��kj%��t��=�t�d`-��o�"�ax IHl�      �   \   x�3�ru�	rt��tR
H"FFF�@d����(�Y�[Y�rZ�����a�2�t��A�ƥ�1z\\\ 0(�      ~   �   x���Kn�0D��)t��qWFP ���s�sT��|�A�4�ސ"�z�{w��Y��r�(�(|��j�j�E)�qa��-0��Tc�ꮗ�꼮�qC������[�Z[��&�dʱ���G�QէW��w$c1PLD\�eQ��7�?.}��T�i�U�W�����1������HL�랶4Yc�w������['F5�Ȇ���Q1�-�l�o��F���l��      |   �   x���=n�0@�Y>E/ Kԯ�5{��J$�e�n�㷹B�<|��2��`s����G�w�{�/�~$  k����芘����)V(,#-M�X�%Sl$��%e"Ϲ/��c�$����
Rȱ�$��+��"KC��׆��ů����m���s�y��s�xN[�p��ӘR���}���8�/��L      �   X   x�3�4�,.-N�K�O-N�OJ,rH��+)J��/�L�K�O�K��4�4202ƺ�F�&
�V�&V�&z��Ɔ&&�1~d�r��qqq �?       }   �  x��W�n�H�=</�=_���&���0�c��J+�&��S�Hٻ��o�ϴ/v=�q�X�"d�4�55�U�b�o\]�箫�-]S�ٗ�����]�!�05A�Z&��hR���Yй�)�Q�n��Ɂ��!�ϸ�Qd3!Jr��嗪�f�q�̵�c��v�q� qi�*�H�)�p:��iPA�2�3��FF��9�!�z����1����a�p��6_n��������S�k�3��J�q��X.�nb����*� �|��jdإ�ʸl|N�W׶��u�:�v��j�S�(�񺫲���ǹo��E�r?���Y��=�: �&R)Ց�ߐq�X%��S|R5B �,��A1s����h=lZ�n�,q>� Ĺ��r0��E/���l⢌��ҭE�_�D��-1b��4Q\�]��V#���e/]ղ���յ���7s����TY<�a���[������ߧ�����*���)���]$_�Pn״�1�0搁ʔNx��Ն��cJʄN@�l�س_��*�w.�n^5�k���I̢$To:�9��<���D���w�)�H����xtz��OR���F`���_r�3�ǭ�[+�q��LBV
܇��bD�Ґ�,��^T�c箟W�ܱ���k7����X�-H�|4S���fz͆^d��<��S��t�k���_9v�kW��2Q�YsJX�g�z݀���Q��èh{�����e��е�g9�b>���ϫr�6x��h�R����-Z�^.���CtK4R�C8�F�]�^T>��l�س��r�j�ڱ$�}s�]1�����"����A�:1�rN։S����f��0e�S�4K���o�*�;��LI ���B�JC%[�0y(A����W#j��[��-J괢d��'����Rq��ِ89�C�羠c���|4��]9�cVb����}�h����O���شwM>8�"b5S�
�����ۣm۲,]�bA�x$�ä��L4 ��X]�W$�1�w�8��<.tbp�0m�֬K
��,j��א�!|�퉎��jI���M�6kT����Ո��y5��.��&�`$�or��7qb��4h��۾�R3t�ܠ$�]��-���WVv�?'b���&;���F\�H��m>M��� ��3vJ5BKs�*b"���"pZ�5�����l�rz݂�ZP-x��vw�������ձ	o�|�Ǡ�6*L��龣�0��I���}�A�l�4B�*m��ֽG�IE�8��      �   �  x���ۍ�0E��*��!�ԃEL��
�,��W�36$�.�IQ�my�,��Yd���?�ad�_�M���E�QjF*y[r���ŉ �-�HV���@M�͍�*%�2"��t��y�P�̓���2p)�x���sOXi`��δ��ͼN��B+Bm���� �N�;Q�Y��"�p�q�V�����X��ڑeG^7P7F�Ą�Y\2��ypF�ԾB��YT��	���@�܆�}����Tܲ�A�[�"�m����ks5�MK�G$}@7�l�u���Jbzo�i��<[sD&�S�����3�@m�r�䑪����9��(n5zR��q�<T����)ŕ )+�s���٘%7���SJ���t4��T����4�)Χn��!>5����ơ�TMuO��m��ܥŉ>Ǽ��v��,�2o��j"�Y�oe���X�ʧ;���:�4F���j��\��x5�zv�,޾8\���N���RJ� p��      �   �  x����n[1�����I��A�m�vP?D8�Ƶ���M�-�t .�;L�����8v�����~\�\m�����ˮYə(N!�Y�j�<v�Ne�m2 ɪ޺E˵T�+�Q4c13� e�1��zWϙex�����іü=w��|>�]�i����6����� b���ǲ��EI����N�o��8JoA9����PF�6RM�t}�!(.ʣ"FQ*jL�y�z�T� �E�ڻ�+ך��|L_��dǛ��t]�:_n���c9}�t��%����O74���F�x��:��$M�	C`7�s�4��޸���^Y��BРt�X�;�h]��
&Y�G��5�'�~���t{�����Hq�� V�^�}�I�4��<B#Ԑ�p�ie�U�B�/�ؙ���3�0R6�Ʊ�`�6��^�y/�J�&�cEO�Z�ڴ��\%�" a�%q!^������\���w���n6�?F"�      �   �  x��Vmo�6�|��!�.J��v�H��[��@�X��U� ى���ie�l��7���|h��wG�P���+�Պ1.`�T�N����uUo�ۍoU��v;��_��ͮI��)SZԏ���k8��KL��/$��(a:�5R������m�����J�k��y�r�T�DY�H�E�f���Y(�s�p!����lܺ�7adSJ*BH\q���ٽ���q뚗����L��-�0�HF#��=�xJ$4�g����8߻���o?��I�m�G3��&RRcb�� ��(Q�{Wy�7�	�����{hߟd޺}p���'�R�G��&�D�/�����l���ƾ�'�%]��+���#qLh:J,����a���`!����4�%�_�0։T�rp��$��ȳ"����(2�q�_����D�����v B���=JM
��>�C7�.�OV7LZ�DD�	{Lk:J8���I_��m�u�V��ai�����=J_(Za�s���MK ����~8Z���]	S�r��ؿ"�|��$�P�sZ͞�ml#<)8lˢJ��?���M�y�
�iW_��[J���d z4��c�4\����9(�C�����Ŀ`��o����Y������9�&�,�Ҳ����m�|�������:�7$c��1����{q�,��Z;i5)#0�v����W2P!E�-���#��w&J8�����7����������o��./"����g����������,�h`9�0D��~�]�I7�{�s�a���}~>H+���0~��L�p�O�&���~���<���CT���*���򡭩�RļG�L��(���Rd����1)�/E��"��7J&��NG	�����:�/E�IQ})��q��6\�=%X��K=*Ewx_����R�i)gD�q\����t���}hF���K1cRL_�9-EI�ETn���OG	�s���nody����n?>$͸�O����K�O�3Q�B~v?�G      �   I   x�3�4�4202�54�50Q00�#���F�1~�� )T]�V�V&�z�&�X%����,@�q������ EE�      �   �   x����m�0�Ti�"wI�."� ��8�'n!�s2d�m<�;_'��jg��Qn��8A�=YOL6.a��6��� �s݊єz��мf4�|[��
�*E�*hM��^�B"]u��c5}���6�v�}�o��x�����g~#Xb��O��_��)jd2����:O��bJF�      x   Q   x�3�t�wr�0��w
v
st����4�4426�4202�50�54P00�#�?8�2��jWq1	�5F��� �      o   1  x��T�n�0���`�&��w'K�!���{t��n� � K��d	�$��ٙ].�a��|�]ۍ�>^,OH��o �PԘ2A�`bb��3�ijX���8*�������>�7��ݟ�~�^q��3f��Bn+l!;k��BJ��
�p���]{/��4vc۷G!Xh6uPfg\�ļ���&�&-o�N�aj��{<��p�+Q��0�z&g��mvE�����V\���*x�����7�@`�A��a�'I���Ԙ<o)e�&(Q|�N�\�Z��Pn���ѧ`��P��|f�@�G۸M��?0���[��3�A�K�i8�4U�$��υ!�5|p�j�/ \OƤ�@C���=�b�y�]�S�����Ȏ�uQ#fI�~����E��v��+u��-�q]�/���1�Ȫ��a|�]�_k�1��G�!��teڥ��ݳ�������ϯo����{�Cd�v�RY�H|؊�E�m��AtJ�i�Y�����ݼ\�Bk��� kNDnŹ�A���d(b�.=y���a�+�}�l�/M�ִ�\)�6���'�4�_�}":      p   i  x�u��N�0���S�:���7��	��-{X��+X-q���"��T�!�o�}��!ӏns�~N����<���+*��!�x�K��� �h�~6��v����q�o��u��]��ɄeΕJ��r�BM�c�ܺ�En������ܦm��ݑ�N�~w��X}IQP�x�$.>����h���U?�9ɩ�h�C_�+x΄|�s��K0Ո�K��F��U;�k�2��!��S9��m�z)�Bݗ��ds�ۢ%(�I����y~y�����ݻ�O���������?yWfː���Y/�X*)f��6Pl6�n�ֺ�۷�[ԣ��M��ء�5�$:��/�_�/�r${ k����      k   �  x���In�8���)x���Q"�c$:` ��#�:L���]_�7����8v,W�T�d?��d���c�ݺ�"/-�E��1��QOLa�K�K�3�%��/�5���EITƴ@?=���������V�zgj��
~��m���CTE������d���RR
����GeX��=}����u]���p�JN3B�����,	-����v�z�0���r�?~Q��D)
�`F(㔯*�x�N
Ň�S���9z�k�Ӽ$�Li��<�/fu�n���Z˝Bf���Ӯ��k�7=�|�L������LI		�� ��ӟl��*�]c[���(-��o�q�=�<�AL��,��F	�� !�7�ePZ�¥��z�+pLg���=c���Dx���	�ކ4�@-^��T���E�(G"F�տ$B���~���ٗ�Z�/���Od���m�!���9��`}"���vE������+���4C���]傷���i �‱���]Ώ��w1�ף�4�n�أb���ڮπOC��~Jw�Bv4ݗ����(`u�7೴q��j��<9E�����p�&������Y�F�whW镆�ܻ�3t�i�9�:����Z�M��;��R������߇�5P�iU�Z���V�4��5X�jW���:��w�J;�8MhJ&�(�P����L��H������Y�w��VK�/⪐L���2sg�m���i�:�����q���Xm����$����"G�;��N���|��x5�������!`]�[7|����p�z 	�\��m�K׎�����	Й�EV����B<�^M1T����K=�Ix���� ��3\�9}~:H�+)nNs��cY?�z5��'��1��?x0~yw;5���2� ;LkH�d�A��Q���A�����gpu�qw��IrR'�>��W��8\Ҋ�����_��+ߔIL����fy�K��U+�(�T.�ܤ4+�ڱ�F��^��,Y�)"��W&��v����T�      j   j   x�}�1
�0F�9=�h��4vSqpQu���P��i��~�����Ԟ�K���p�4�H���@?(NA�6�Z�}�ZB�� ��T��vς�)�Agp�],1!�      �   I   x�3�ts�u�����t�4C##c]CC]#CK+c+SK=Kc#C#�?8�2��uv�i�%Mk� �      n   f  x�uR�n�0<�_��f�!DRJ7��:�6�@���wTJ���u �8�g$6�����~A(���2/'�o�ZK�P��^3�NLdز���Y�|�)!��x̭E�U��Xo'w���,| 	��Rj\�]+��&�(��IWj�.a��:��̚ɡu����'���u(��_�S%�G�8fv(,�!↧��w\��*ퟁ�Qb�ͼ�]_���f��V"��Y`�dC����f!���o��ll��eM�V���Ƣ�\�a)�P�^�G��Dg斨���1h����>�'�x�A��߭���\���|H��Ѳ{��uj^�˦��j�(���Gu�Iwx]�Zt-Ԙ�{|'$��'v]��|�       q     x��QKn�0]ON�`yf<���PPP�7�[�H�XH�IUۻ���7�L�os��N��r����4��2�π����΄E�>Y��5�F �����0$t���P_�p8��t��޲:��?䩌h�Af����%aM&..c���
<�&p�����8;���W�߈�ɒ6"�V�D��j�����a#��nm��H�L18������h�fo���é܎�}��Yh��>���"��#�P�d�."2��WhV�V�A�#��殛��d��R      r   �  x���Kn�0���Sp�.��G7M�6��G��в�0P$W��«^��9|�n
�7�I:N��9��>��<8�o��}]�O�R��-��y�l��q�l�ʵ�={��r�-˅��ߚ8��[� 6F\���i:B��QT�@lJc��U�j���.�18��a��׃Z��B�Ru�0�h�5������bHU�� �桷-H��;�O�&�9fC��A1яGȅ��lr,+v�hq�](T��<3�� *c)d*�
X2	�����\*U=j5�H�5f��A��u��A�9���n�R�,{uЍ9�XT#�=��AƂoJ�K�����4u\���c����A1���9Ǉ���I*S쭬(�<$@3�㌯K~G�搏U_cG��nu�(�];���^�z�v�Gt}(���Z�B� Bs`��G��x�~���FƄZr�9�,��9�Y�� �$�x6`
�B
�H�$Z��\(��|"��A�(����Bazs���h����#03����n�>�u������ZR�ȷ@����c���8�!㱠Ԃ�v+��2)(�1��`Ma|���H3� ��ݽ��'v���|sI��AZ.C�[%����I��CV��?��Ŧ��.'���?, �S~�FP����#
�N;	�-%�S6I�*3� �^�������8�0�Y�e�l�o�0�BIq�ד��� ��      s   k  x�u��n�0���Sp�����7F!��D�����	Yi����Uu�X������AH�F��SL��
j�J���DE�k)�S��
#PǦ�@�ؚ&N+Cԃ��}�k��m\Ӳf�fV�D.I��-Yl�?�X����-�T��D߳$�IC�N�e��K~�V�~��S1-'S�D�,�Ő��N�c����1u���[H6$��;�nVQ]8J��� b���)�NE1﷠I=F>�}�'!$���pMNg�D�,:k�oʦ����;O���w�j�̡���k�� 2w��y��&җ�(#���Qb{�M�ͮ���y�oC�K�q��e�0?
�.~�8�SoZp[tF2z%z��v]��{��      v   N   x�3�tqv�p���Sq1���4�4426�4202�50�54P00�#�,qa�6��w
��P1�iH� ���      u      x�}�1�0��9E. �D(��0��R�kO �W�JX�=��?�(�["��̰���S�� �!G�Cס�H�gz?4���j����C��&wn{�\�mZ,��+��1�/=>�qA�B8I[o��((-�      i   �   x�u�M� F�p
.P2?Pv�����4�����5���˙/���C5�r]�)�̥��\rQӬPaQ��X����)t>��q�`�%	ɑ%��n�+�5�ҧ�y+��i�-/��� 8H$@d�ā�I����e�5��z����v�kz`!&`� �?��vA~	�!{��j���M      t   �   x���K��0E��*���,fiJ��%mg��:���BM�fǺ�J&X�cN�p��s����e�4
DE���������]/����"�1JJ�+����t�U����0mjjq�G���Z(zE΢�Ԣ�T�&.�&��:N��4'�$o�hd�x���=7�:���y���s	j�L1��`�؇�S&g�e��h�*f��o{y��\d:      m   *  x�u�Kn�0D��)|�G"��+����$������@��qf�s���m��$0�z�=j�)f'��;��I$فH.q�h�e�2$SpA���:mF�ȱDKfOu�?�e��۰���0:�}�/˦|�õ)�]%��f���ܝ��ag�p��@��Ahw�,� q��VuH�c�V��ي���܍���q^N�;/��1t�ھhyն
�O*��%3;��19P��<� �s|꽬d^g$R�ל�}�!5�`t!�տ{.�s}���ԣ��WG���wg��9'��      �   s   x���A
� E��)�@�X&�҅QSX��9�(7����Ã�6��I2)����tS��J��1��je[��pr��Y3�\����e�~'�8<���i[�|G.o����/B�      l   ]  x��Vˎ�F<s�b�4�o4E/&В2�5ds0�\�}���ԃ��I�$6������s_��+� �@��6a�A�Xb,���&x���d��X�������j||���ϯ߾��P�?`�p�h��J�J������	����ާ/��:U��:hf� �Km�c��^W�Q�+�"m	�A�(_�	O@6��Vjh�_���6s�L\'?QZ.�i��Q��{%x�J봏�%�|s ���	9�4�a����S7t�ڼ�6������@�4%�� ��1b��-)/7<dx�(�=��E�[S�����K�g3��1;�,���a	ʍ�,tA����t�H9/:j�������H�K���N]�ش�7�]�Ic'�"��\�Gճ��fAOZɌ��L� ���I��P��4
b͖�h����c��3��dw*vM{�8ˆX%�q���c.KY�g��d����h�9(3S�^��3��$�)/@j$�)�8�3`���M��_$̢�� W���9�a�2����L6�?_99	̅��鄇%��#�}d��d̠���=�}�������W��O�*�m~o�#�fXLri�����$���	ىs/*����.�r��pj�SϘm�뻺����yA���h�@D��~�ۆ�l?�8��"��\�7�_�>���ݏ;Үz��Z��K0;�}2�{";[��%��3_�������pߢŷ��^ׁs]&.�ц��{�E�*��A�_7���q��2���o���;�t�]|���|�� ��/�f	�jا�Ҫ�����{�NR��z�W	���N�����o�h!�<ߑ�,Fb�q3���'3�駧�� x�0&      �   �  x��T�J1]'_�/��Z�b[pa)ҥb���LR23�%�\�3w����@�ɽ�{�L���dA,��Oȭm���S�i��%�M�����H�ɣJl�	m���6:IO�G\2UC��l�+���r�ܭ,y'K%^r@�:�tH,Y�1W!Ӫd����>pf�:�jekR`0�!+NX�~>�f^W��i�Oj��X�6K�b(ϤN�ӼE��Գr��x����U�,o���/@�Kt���kVxe�Z�#f��(�+ _�Қ���\]�xX �{��t����NyI����w��&�s;C��٭�
�K�g��a���FV�}[���O�tCO��t�`��HҴB��u�i���c�E��n�갻�|��?(�m �T4Cc�@C�-�R�$p��褨�����Q�����֔���D�O�u��������5)�I��_��l������%0t��I�O�_�#e�      �   �  x��I�� ��a�al������K�P!�_|��:���b--֥ͺuX��G��T�
���H�WQ�)��b��8&�݇Zw��_:o�95���	��,�j.�in����_��g������K�~����f����no�:&U�[�z`�(���j:�6U�d-���ow��5T�$�}LPk���,ݚ>�4M�]�^�����:�u�DH��:��Оfi��y�[{�G{�U�uI0�3�:a����I�锫��2C�͊��:nW��
7�Ü�a��]�c��2Ͻ�q��05&�8-��m��^��7Z<=ڶo������-R��i�.���=��]n��N����e+������m��b�Ǩ��l�:��
���
����x��#Ym{�m������L[%��6K8���<�5�#��vI��Xэ�����YmOhG��{�������h      w   P   x�3�p
��sT�s	r����4B##c]K]CKC3+CS+s=SK�
�2���
�t�tv$р=... � d     