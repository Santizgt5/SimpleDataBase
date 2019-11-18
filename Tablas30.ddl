-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2019-11-17 19:26:55 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE registro CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

CREATE TABLE cliente (
    cedula                 NVARCHAR2(30) NOT NULL,
    nombre                 NVARCHAR2(30),
    fechanacimiento        DATE,
    direccion              NVARCHAR2(20),
    telefono               NVARCHAR2(30),
    registro_registro_id   NUMBER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula );

CREATE TABLE funcionario (
    cedula            NVARCHAR2(30) NOT NULL,
    nombre            NVARCHAR2(30),
    fechanacimiento   DATE,
    direccion         NVARCHAR2(30),
    telefono          NVARCHAR2(30)
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cedula );

CREATE TABLE producto (
    nombretipo             NVARCHAR2(30) NOT NULL,
    descripcion            NVARCHAR2(100),
    registro_registro_id   NUMBER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( nombretipo );

CREATE TABLE registro (
    fechainicio   DATE,
    fechafin      DATE,
    registro_id   NUMBER NOT NULL
);

ALTER TABLE registro ADD CONSTRAINT registro_pk PRIMARY KEY ( registro_id );

CREATE TABLE solicitud (
    codigo                NUMBER NOT NULL AUTO_INCREMENT,
    nombretipo            NVARCHAR2(30),
    estado                NVARCHAR2(30),
    descripcion           NVARCHAR2(100),
    cliente_cedula        NVARCHAR2(30) NOT NULL,
    funcionario_cedula    NVARCHAR2(30) NOT NULL,
    producto_nombretipo   NVARCHAR2(30) NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( codigo );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_registro_fk FOREIGN KEY ( registro_registro_id )
        REFERENCES registro ( registro_id );

ALTER TABLE producto
    ADD CONSTRAINT producto_registro_fk FOREIGN KEY ( registro_registro_id )
        REFERENCES registro ( registro_id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_funcionario_fk FOREIGN KEY ( funcionario_cedula )
        REFERENCES funcionario ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_nombretipo )
        REFERENCES producto ( nombretipo );

CREATE SEQUENCE registro_registro_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER registro_registro_id_trg BEFORE
    INSERT ON registro
    FOR EACH ROW
    WHEN ( new.registro_id IS NULL )
BEGIN
    :new.registro_id := registro_registro_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
