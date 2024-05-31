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
            DNI   VARCHAR2(50 BYTE) NOT NULL CHECK((DNI='T')OR(DNI='F')), /*DNI=T SIGNIFICA USUARIO AUTORIZADO.*/
            NOMBRE VARCHAR2(50 BYTE) NOT NULL,
            APELLIDOS VARCHAR2(50 BYTE) NOT NULL,
            OBSERVACIONES VARCHAR2(200 BYTE),
            CONTACTO      VARCHAR2(50 BYTE) NOT NULL UNIQUE,
            MOTIVO_INGRESO VARCHAR2(200 BYTE)  NOT NULL,
            ESTADO_PSICOLOGICO VARCHAR2(200 BYTE)  NOT NULL,
            ESTADO_MEDICO VARCHAR2(200 BYTE)  NOT NULL,
            SANCIONES  NUMBER(10),
            PREMIOS NUMBER (10),
		
            
        PRIMARY KEY(DNI)
);
/


CREATE TABLE ACTIVIDADES (

            OID_ACT NUMBER(10) NOT NULL,
            LUGAR VARCHAR2(50 BYTE) NOT NULL,
            FECHA DATE NOT NULL,
            NUMERO_ASISTENTES NUMBER(10),
            CALIFICACIONES VARCHAR2(200 BYTE),
            
            PRIMARY KEY(OID_ACT)
);
/

CREATE TABLE INSCRIPCIONES (

        OID_INS NUMBER(10) NOT NULL,
        DNI VARCHAR2(50 BYTE) NOT NULL,
        OID_ACT NUMBER(10) NOT NULL,
        FECHA DATE NOT NULL,
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
    CODIGO_IDENTIFICACION VARCHAR2(50 BYTE) NOT NULL,
    ESTADO_EJEMPLAR VARCHAR2(50 BYTE) CHECK((ESTADO_EJEMPLAR='BUENO')OR(ESTADO_EJEMPLAR='MALO')),
    
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

create or replace PACKAGE BODY PRUEBAS_USUARIOS AS

  PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM usuarios;
    DELETE FROM departamentos;
  END inicializar;

  PROCEDURE insertar (DNI VARCHAR2, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, OBSERVACIONES VARCHAR2, CONTACTO VARCHAR2,
            MOTIVO_INGRESO VARCHAR2, ESTADO_PSICOLOGICO VARCHAR2, ESTADO_MEDICO VARCHAR2, SANCIONES NUMBER, PREMIOS NUMBER,
            salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  usuario usuarios%ROWTYPE;
  w_DNI VARCHAR2;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    INSERT INTO usuarios VALUES (DNI, w_nombre, w_apellidos, w_observacionehs, w_contacto, w_motivo_ingreso, w_estado_psicologico,
    w_estado_medico, w_sanciones, w_premios);

    SELECT * INTO usuario FROM usuarios WHERE DNI = w_DNI;
    IF (usuario.NOMBRE<>w_NOMBRE OR usuario.APELLIDOS<>w_APELLIDOS OR usuario.OBSERVACIONES<>w_OBSERVACIONES 
    OR usuario.CONTACTO<>w_CONTACTO OR usuario.MOTIVO_INGRESO<>w_MOTIVO_INGRESO OR usuario.ESTADO_PSICOLOGICO<>w_ESTADO_PSICOLOGICO
    OR usuario.ESTADO_MEDICO<>w_ESTADO_MEDICO OR usuario.SANCIONES<>w_SANCIONES OR usuario.PREMIOS<>w_PREMIOS) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;

  PROCEDURE actualizar (DNI VARCHAR2, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, OBSERVACIONES VARCHAR2, CONTACTO VARCHAR2,
            MOTIVO_INGRESO VARCHAR2, ESTADO_PSICOLOGICO VARCHAR2, ESTADO_MEDICO VARCHAR2, SANCIONES NUMBER, PREMIOS NUMBER,
            salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  usuario usuarios%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE usuarios SET NOMBRE=w_NOMBRE, APELLIDOS=w_APELLIDOS, OBSERVACIONES=w_OBSERVACIONES,
    CONTACTO=w_CONTACTO, MOTIVO_INGRESO=w_MOTIVO_INGRESO, ESTADO_PSICOLOGICO=w_ESTADO_PSICOLOGICO,
    ESTADO_MEDICO=w_ESTADO_MEDICO, SANCIONES=w_SANCIONES, PREMIOS=w_PREMIOS WHERE DNI = w_DNI;

    SELECT * INTO usuario FROM usuarios WHERE DNI = w_DNI;
    IF (usuario.NOMBRE<>w_NOMBRE OR usuario.APELLIDOS<>w_APELLIDOS OR usuario.OBSERVACIONES<>w_OBSERVACIONES 
    OR usuario.CONTACTO<>w_CONTACTO OR usuario.MOTIVO_INGRESO<>w_MOTIVO_INGRESO OR usuario.ESTADO_PSICOLOGICO<>w_ESTADO_PSICOLOGICO
    OR usuario.ESTADO_MEDICO<>w_ESTADO_MEDICO OR usuario.SANCIONES<>w_SANCIONES OR usuario.PREMIOS<>w_PREMIOS) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;

  PROCEDURE eliminar (DNI VARCHAR2, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, OBSERVACIONES VARCHAR2, CONTACTO VARCHAR2,
            MOTIVO_INGRESO VARCHAR2, ESTADO_PSICOLOGICO VARCHAR2, ESTADO_MEDICO VARCHAR2, SANCIONES NUMBER, PREMIOS NUMBER,
            salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_usuarios INTEGER;
  BEGIN
    
    DELETE FROM usuarios WHERE DNI = w_DNI;
    
    SELECT COUNT(*) INTO n_usuarios FROM usuarios WHERE DNI = w_DNI;
         IF (n_usuarios<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;

END PRUEBAS_USUARIOS;


