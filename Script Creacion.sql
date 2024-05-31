DROP TABLE INSCRIPCIONES;
DROP TABLE ACTIVIDADES;
DROP TABLE INFORMES;
DROP TABLE CITAS_MEDICAS;
DROP TABLE UNIDADES;
DROP TABLE PRESTAMOS;
DROP TABLE MATERIALES_PRESTADOS;
DROP TABLE ESTANCIAS;
DROP TABLE ALOJAMIENTOS;
DROP TABLE USUARIOS;

CREATE TABLE  USUARIOS (
            DNI   VARCHAR2(50) NOT NULL CHECK((DNI='T')OR(DNI='F')), /*DNI=T SIGNIFICA USUARIO AUTORIZADO.*/
            NOMBRE VARCHAR2(50) NOT NULL,
            APELLIDOS VARCHAR2(50) NOT NULL,
            OBSERVACIONES VARCHAR2(200),
            CONTACTO      VARCHAR2(50) NOT NULL UNIQUE,
            MOTIVO_INGRESO VARCHAR2(200)  NOT NULL,
            ESTADO_PSICOLOGICO VARCHAR2(200)  NOT NULL,
            ESTADO_MEDICO VARCHAR2(200)  NOT NULL,
            SANCIONES  NUMBER(10),
            PREMIOS NUMBER(10),
		
            
        PRIMARY KEY(DNI)
);
/


CREATE TABLE ACTIVIDADES (

            OID_ACT NUMBER(10) NOT NULL,
            LUGAR VARCHAR2(50) NOT NULL,
            FECHA DATE NOT NULL,
            NUMERO_ASISTENTES NUMBER(10),
            CALIFICACIONES VARCHAR2(200),
            
            PRIMARY KEY(OID_ACT)
);
/

CREATE TABLE INSCRIPCIONES (

        OID_INS NUMBER(10) NOT NULL,
		DNI VARCHAR2(50) NOT NULL,
        OID_ACT NUMBER(10) NOT NULL,
        FECHA DATE NOT NULL,
		CORREO_ELECTRONICO VARCHAR2(50) NOT NULL,
		
        PRIMARY KEY(OID_INS),
        FOREIGN KEY(DNI) REFERENCES USUARIOS,
        FOREIGN KEY(OID_ACT) REFERENCES ACTIVIDADES

);
/


CREATE TABLE CITAS_MEDICAS (

        OID_CM NUMBER(10) NOT NULL,
        DNI VARCHAR2(50 BYTE) NOT NULL,
        DOCTOR VARCHAR2(50 BYTE) NOT NULL,
        FECHA DATE NOT NULL,
        LUGAR VARCHAR2(50 BYTE) NOT NULL,
        
        PRIMARY KEY(OID_CM),
        FOREIGN KEY(DNI) REFERENCES USUARIOS
);
/


CREATE TABLE INFORMES (
    
    OID_INF NUMBER(10) NOT NULL,
    OID_CM NUMBER(10) NOT NULL,
    DNI VARCHAR2(50 BYTE) NOT NULL,
    TIPO VARCHAR2(50 BYTE) NOT NULL,
    RESPONSABLE VARCHAR2(50 BYTE) NOT NULL,
    FECHA DATE NOT NULL,
    LUGAR VARCHAR2(50 BYTE) NOT NULL,
    OBSERVACIONES LONG,
    
    PRIMARY KEY(OID_INF),
    FOREIGN KEY(OID_CM) REFERENCES CITAS_MEDICAS,
    FOREIGN KEY(DNI) REFERENCES USUARIOS

);
/


CREATE TABLE PRESTAMOS(
    
    OID_PRE NUMBER(10) NOT NULL,
    DNI VARCHAR2(50 BYTE) NOT NULL,
    FECHA_INICIO DATE NOT NULL,
    FECHA_FIN DATE NOT NULL,
    DEVOLUCION VARCHAR2(1 BYTE) CHECK((DEVOLUCION='T')OR(DEVOLUCION='F')),
    NOMBRE_ENCARGADO VARCHAR2(50 BYTE),
	CONSTRAINT FECHAS CHECK (FECHA_INICIO < FECHA_FIN),
    
    PRIMARY KEY(OID_PRE),
    FOREIGN KEY(DNI) REFERENCES USUARIOS
    
);
/


CREATE TABLE MATERIALES_PRESTADOS(

        OID_MPR NUMBER(10) NOT NULL,
        NOMBRE VARCHAR2(50 BYTE),
        DISPONIBILIDAD VARCHAR2(1 BYTE) CHECK((DISPONIBILIDAD= 'T')OR(DISPONIBILIDAD= 'F')),
        ESTADO_DEVOLUCION VARCHAR2(50 BYTE) CHECK((ESTADO_DEVOLUCION IN('BIEN', 'MAL'))),
        CANTIDAD VARCHAR2(50 BYTE),
        TIPO VARCHAR2(50 BYTE),
        
        PRIMARY KEY(OID_MPR)
    
);
/


CREATE TABLE UNIDADES(
    
    OID_PRE NUMBER(10) NOT NULL,
    OID_MPR NUMBER(10) NOT NULL,
    CODIGO_IDENTIFICACION VARCHAR2(50) NOT NULL,
    ESTADO_EJEMPLAR VARCHAR2(50) CHECK((ESTADO_EJEMPLAR='BUENO')OR(ESTADO_EJEMPLAR='MALO')),
    
    PRIMARY KEY(CODIGO_IDENTIFICACION),
    FOREIGN KEY(OID_PRE) REFERENCES PRESTAMOS,
    FOREIGN KEY(OID_MPR) REFERENCES MATERIALES_PRESTADOS


);
/


CREATE TABLE ALOJAMIENTOS(
        
        OID_ALJ NUMBER(10) NOT NULL,
        UBICACION VARCHAR2(50 BYTE),
        DIRECCION VARCHAR2(50 BYTE),
        RESIDENTES VARCHAR2(200 BYTE),
        NUMERO_RESIDENTES NUMBER(10),
        NUMERO_HABITACION NUMBER(10),
        DISPONIBILIDAD VARCHAR2(1 BYTE) CHECK((DISPONIBILIDAD='T')OR(DISPONIBILIDAD='F')),
        
        PRIMARY KEY(OID_ALJ)
        
);
/

CREATE TABLE ESTANCIAS(

    OID_EST NUMBER(10) NOT NULL,
    DNI VARCHAR2(50 BYTE) NOT NULL,
    OID_ALJ NUMBER(10) NOT NULL,
    FECHA_ENTRADA DATE NOT NULL,
    FECHA_SALIDA DATE,
	CONSTRAINT FECHAS_ESTANCIA CHECK (FECHA_ENTRADA < FECHA_SALIDA),
    
    PRIMARY KEY(OID_EST),
    FOREIGN KEY(DNI) REFERENCES USUARIOS,
    FOREIGN KEY(OID_ALJ) REFERENCES ALOJAMIENTOS

);
/

-----------------------------------------------/* SECUENCIAS */------------------------------------------
DROP SEQUENCE SEC_OID_ACT;
CREATE SEQUENCE SEC_OID_ACT START WITH 1 INCREMENT BY 1;

/* DUAL: tabla que tiene oracle para probar funciones on hacer calculos rápidos*/
CREATE OR REPLACE TRIGGER NUEVO_OID_ACT
BEFORE INSERT ON ACTIVIDADES
FOR EACH ROW
 BEGIN 
    SELECT SEC_OID_ACT.NEXTVAL INTO :NEW.OID_ACT FROM DUAL;
 END NUEVO_OID_ACT;
/


DROP SEQUENCE SEC_OID_INS;
CREATE SEQUENCE SEC_OID_INS START WITH 1 INCREMENT BY 1;

/* DUAL: tabla que tiene oracle para probar funciones on hacer calculos rápidos*/
CREATE OR REPLACE TRIGGER NUEVO_OID_INS
BEFORE INSERT ON INSCRIPCIONES
FOR EACH ROW
 BEGIN 
    SELECT SEC_OID_INS.NEXTVAL INTO :NEW.OID_INS FROM DUAL;
 END NUEVO_OID_INS;
/  


DROP SEQUENCE SEC_OID_CM;
CREATE SEQUENCE SEC_OID_CM START WITH 1 INCREMENT BY 1;

/* DUAL: tabla que tiene oracle para probar funciones on hacer calculos rápidos*/
CREATE OR REPLACE TRIGGER NUEVO_OID_CM
BEFORE INSERT ON CITAS_MEDICAS
FOR EACH ROW
 BEGIN 
    SELECT SEC_OID_CM.NEXTVAL INTO :NEW.OID_CM FROM DUAL;
 END NUEVO_OID_CM;
/


DROP SEQUENCE SEC_OID_INF;
CREATE SEQUENCE SEC_OID_INF START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER NUEVO_OID_INF
BEFORE INSERT ON INFORMES
FOR EACH ROW
    BEGIN
        SELECT SEC_OID_INF.NEXTVAL INTO :NEW.OID_INF FROM DUAL;
END NUEVO_OID_INF;
/

DROP SEQUENCE SEC_OID_PRE;
CREATE SEQUENCE SEC_OID_PRE START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER NUEVO_OID_PRE
BEFORE INSERT ON PRESTAMOS
FOR EACH ROW
    BEGIN
        SELECT SEC_OID_PRE.NEXTVAL INTO :NEW.OID_PRE FROM DUAL;
END NUEVO_OID_PRE;
/

DROP SEQUENCE SEC_OID_MPR;
CREATE SEQUENCE SEC_OID_MPR START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER NUEVO_OID_MPR
BEFORE INSERT ON MATERIALES_PRESTADOS
FOR EACH ROW
    BEGIN
        SELECT SEC_OID_MPR.NEXTVAL INTO :NEW.OID_MPR FROM DUAL;
END NUEVO_OID_MPR;
/


DROP SEQUENCE SEC_OID_ALJ;
CREATE SEQUENCE SEC_OID_ALJ START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER NUEVO_OID_ALJ
BEFORE INSERT ON ALOJAMIENTOS
FOR EACH ROW
 BEGIN 
    SELECT SEC_OID_ALJ.NEXTVAL INTO :NEW.OID_ALJ FROM DUAL;
 END NUEVO_OID_ALJ;
/

DROP SEQUENCE SEC_OID_EST;
CREATE SEQUENCE SEC_OID_EST START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER NUEVO_OID_EST
BEFORE INSERT ON ESTANCIAS
FOR EACH ROW
    BEGIN
        SELECT SEC_OID_EST.NEXTVAL INTO :NEW.OID_EST FROM DUAL;
END NUEVO_OID_EST;
/
