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
 -------------------------------------------------/*Triggers*/---------------------------------------------------------
 /*?	RN-1: No es posible tener una sexta sanción.
Como monitora,
quiero que el sistema no sea capaz de almacenar más de cinco sanciones, ya que no sería necesario, porque a la quinta se le expulsa del centro.

*/
CREATE OR REPLACE TRIGGER RN1_SANCION
    BEFORE UPDATE OF SANCIONES ON USUARIOS
FOR EACH ROW
BEGIN
    IF :NEW.SANCIONES =6
    THEN RAISE_APPLICATION_ERROR
        (-20600, ' NO SE PUEDEN TENER MAS DE 5 SANCIONES, LA CANTIDAD A ACTUALIZAR ERA: ' || :NEW.SANCIONES);
        
    END IF;
END RN1_SANCION;
/

/*?	RN-3: Imposibilidad de eliminación de datos.
Como monitora,
quiero que no se pueda eliminar información del sistema de ninguna persona que haya pasado por el centro,
para tener en cuenta el regreso de antiguos miembros.
*/
CREATE OR REPLACE TRIGGER RN3_ELIMINACION_DATOS
BEFORE DELETE ON USUARIOS
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR (-20601,'NO SE PUEDEN ELIMINAR DATOS DE LOS USUARIOS');

END RN3_ELIMINACION_DATOS;
/

/*?	RN-4: Creación de actividades.
Como monitora,
quiero que si hay menos de 10 asistentes inscritos no se pueda realizar la actividad.
*/

CREATE OR REPLACE TRIGGER RN4_CREACION_ACTIVIDADES
    BEFORE UPDATE OF NUMERO_ASISTENTES ON ACTIVIDADES
FOR EACH ROW
DECLARE
BEGIN
    IF :NEW.NUMERO_ASISTENTES < 10
     THEN RAISE_APPLICATION_ERROR(-20603, 'SOLO PUEDEN REALIZARSE ACTIVIDADES CON AL MENOS 10 ASISTENTES. EL NÚMERO DE ASISTENTES A ACTUALIZAR ERA: ' || :NEW.NUMERO_ASISTENTES);
    END IF;
END RN4_CREACION_ACTIVIDADES;
/

/*?	RN-5: Restricciones para apuntarse a una actividad.
Como monitora, quiero que el sistema no permita apuntarse a una actividad a
alguien después con más de tres sanciones por mala conducta.

*/
CREATE OR REPLACE TRIGGER RN5_INSCRIPCION_ACTIVIDAD
    BEFORE INSERT ON INSCRIPCIONES
FOR EACH ROW
DECLARE NUMERO_SANCIONES NUMBER(10);
BEGIN
    SELECT SANCIONES INTO NUMERO_SANCIONES FROM USUARIOS WHERE DNI = :NEW.DNI;
    IF (NUMERO_SANCIONES > 3)
        THEN RAISE_APPLICATION_ERROR (-20602, 'NO SE PUEDEN INSCRIBIR USUARIOS CON MÁS DE 3 SANCIONES');
    END IF;
    
END RN5_INSCRIPCION_ACTIVIDAD;
/

/*?	RN-8: Disponibilidad de los prestamos.
Como encargado de prestamos,
quiero que no puedan realizarse prestamos de materiales que no esten disponibles.
*/
CREATE OR REPLACE TRIGGER RN8_DISPONIBILIDAD_PRESTAMOS
BEFORE INSERT ON UNIDADES
FOR EACH ROW
DECLARE DISPONIBILIDAD_MATERIAL VARCHAR2(50); 
BEGIN
    SELECT DISPONIBILIDAD INTO DISPONIBILIDAD_MATERIAL FROM MATERIALES_PRESTADOS WHERE OID_MPR = :NEW.OID_MPR;
    IF (DISPONIBILIDAD_MATERIAL = 'F')
		THEN RAISE_APPLICATION_ERROR(-20603, 'NO PUEDEN REALIZARSE PRESTAMOS DE MATERIALES NO DISPONIBLES');
    END IF;
END  RN8_DISPONIBILIDAD_PRESTAMOS;
/

/*?	RN-8: Control de préstamos.
					Como encargado de préstamos,
quiero que nadie pueda tener dos préstamos al mismo tiempo,
para controlar mejor el inventario.
*/
/*
CREATE OR REPLACE TRIGGER RN7_CONTROL_PRESTAMOS
BEFORE INSERT ON PRESTAMOS
FOR EACH ROW
BEGIN
    FOR LISTA_PRESTAMOS IN (SELECT DEVOLUCION FROM PRESTAMOS WHERE DNI = :NEW.DNI)
	LOOP
		IF LISTA_PRESTAMOS.DEVOLUCION IS NOT NULL AND LISTA_PRESTAMOS.DEVOLUCION = 'F'
		THEN RAISE_APPLICATION_ERROR 
		(-20604, 'NO SE PUEDEN TENER DOS PRESTAMOS SIMULTANEAMENTE');
		END IF;
    END LOOP;
END RN7_CONTROL_PRESTAMOS;
/
*/

/*Un usuario no puede cambiar de alojamiento si no ha pasado al menos un mes en el*/
/*CREATE OR REPLACE TRIGGER T_ALOJAMIENTOS
    BEFORE UPDATE OF OID_EST ON ESTANCIAS
FOR EACH ROW
DECLARE
    DURACION_ESTANCIA NUMBER;
BEGIN
    SELECT DATEDIFF(DAY, FECHA_ENTRADA, FECHA_SALIDA) INTO DURACION_ESTANCIA FROM ESTANCIAS;
    IF ((DURACION_ESTANCIA != 30)OR(DURACION_ESTANCIA != 31))
    THEN RAISE_APPLICATION_ERROR(-20605, :NEW.OID_EST
    || 'NO SE PUEDE CAMBIAR DE ALOJAMIENTO SI LA DURACION DE LA ULTIMA ESTANCIA NO ES DE AL MENOS UN MES');
    END IF;
END T_ALOJAMIENTOS;
/
*/

/*No podemos quedarnos sin materiales para los prestamos*/
CREATE OR REPLACE TRIGGER T_MATERIALES
    BEFORE UPDATE OF OID_PRE ON PRESTAMOS
FOR EACH ROW
DECLARE
    CANTIDAD_DISPONIBLE VARCHAR2(50);
BEGIN
    SELECT CANTIDAD INTO CANTIDAD_DISPONIBLE FROM MATERIALES_PRESTADOS;
    IF((CANTIDAD_DISPONIBLE = 'UNO')OR(CANTIDAD_DISPONIBLE='1'))
    THEN RAISE_APPLICATION_ERROR(-20606, :NEW.OID_PRE 
    ||'NO PODEMOS QUEDARNOS SIN MATERIAL PARA LOS PRESTAMOS');

    END IF;
END T_MATERIALES;
/

/*No se puede solicitar otro prestamo si no se ha devuelto el anterior*/
CREATE OR REPLACE TRIGGER T_DEVOLUCION
    BEFORE UPDATE OF OID_PRE ON PRESTAMOS
FOR EACH ROW
DECLARE
    ESTADO_DEVOLUCION VARCHAR2(50);
BEGIN
    SELECT DEVOLUCION INTO ESTADO_DEVOLUCION FROM PRESTAMOS;
    IF(ESTADO_DEVOLUCION = 'F')
    THEN RAISE_APPLICATION_ERROR(-20607, :NEW.OID_PRE
    ||'DEBE DEVOLVERSE EL MATERIAL SOLICITADO ANTERIORMENTE');
    END IF;
END T_DEVOLUCION;
/
/*Un usuario no puede inscribirse varias veces en la misma actividad*/
CREATE OR REPLACE TRIGGER T_INSCRIPCIONES
    BEFORE UPDATE OF OID_INS ON INSCRIPCIONES
FOR EACH ROW
DECLARE
    ACTIVIDAD_NEW NUMBER;
    ACTIVIDAD_OLD NUMBER;
BEGIN
    SELECT :NEW.OID_ACT INTO ACTIVIDAD_NEW FROM INSCRIPCIONES;
    SELECT :OLD.OID_ACT INTO ACTIVIDAD_OLD FROM INSCRIPCIONES;

    IF(ACTIVIDAD_NEW = ACTIVIDAD_OLD )
    THEN RAISE_APPLICATION_ERROR(-20608, :NEW.OID_ACT ||'YA SE HA INSCRITO EN ESTA ACTIVIDAD');
    END IF;
END T_INSCRIPCIONES;
/
--------------------------------------------------------/* FUNCIONES */-----------------------------------------------------------

CREATE OR REPLACE FUNCTION ASSERT_EQUALS (salida BOOLEAN, salida_esperada BOOLEAN) RETURN VARCHAR2 AS 
BEGIN
  IF (salida = salida_esperada) THEN
    RETURN 'EXITO';
  ELSE
    RETURN 'FALLO';
  END IF;
END ASSERT_EQUALS;
/

CREATE OR REPLACE FUNCTION obtener_premios (w_dni IN usuarios.dni%TYPE) RETURN NUMBER IS w_premios usuarios.premios%TYPE;
BEGIN
	SELECT premios INTO w_premios FROM usuarios WHERE dni = w_dni;
	RETURN w_premios;
END obtener_premios; 
/

CREATE OR REPLACE FUNCTION obtener_sanciones (w_dni IN usuarios.dni%TYPE) RETURN NUMBER IS w_sanciones usuarios.sanciones%TYPE;
BEGIN
	SELECT sanciones INTO w_sanciones FROM usuarios WHERE dni = w_dni;
	RETURN w_sanciones;
END obtener_sanciones;
/

------------------------------------------------/* PROCEDIMIENTOS */---------------------------------------------------------

CREATE OR REPLACE PROCEDURE NUEVO_USUARIO(
	w_DNI IN USUARIOS.DNI%Type, w_NOMBRE IN USUARIOS.NOMBRE%Type, w_APELLIDOS IN USUARIOS.APELLIDOS%Type, 
	w_OBSERVACIONES IN USUARIOS.OBSERVACIONES%type, w_CONTACTO IN USUARIOS.CONTACTO%type, w_MOTIVO_INGRESO IN 
	USUARIOS.MOTIVO_INGRESO%type, w_ESTADO_PSICOLOGICO IN USUARIOS.ESTADO_PSICOLOGICO%type, 
	w_ESTADO_MEDICO IN USUARIOS.ESTADO_MEDICO%type, w_SANCIONES IN USUARIOS.SANCIONES%type, w_PREMIOS IN USUARIOS.PREMIOS%type) IS
BEGIN
INSERT INTO USUARIOS(DNI,NOMBRE, APELLIDOS, OBSERVACIONES, CONTACTO, MOTIVO_INGRESO, ESTADO_PSICOLOGICO, 
	ESTADO_MEDICO, SANCIONES, PREMIOS)
VALUES (w_DNI,w_NOMBRE,w_APELLIDOS,w_OBSERVACIONES,w_CONTACTO,w_MOTIVO_INGRESO,w_ESTADO_PSICOLOGICO,
	w_ESTADO_MEDICO,w_SANCIONES, w_PREMIOS);
COMMIT WORK;
END NUEVO_USUARIO;
/


CREATE OR REPLACE PROCEDURE NUEVA_UNIDAD(
	w_OID_PRE IN UNIDADES.OID_PRE%Type, w_OID_MPR IN UNIDADES.OID_MPR%Type,
	w_CODIGO_IDENTIFICACION IN UNIDADES.CODIGO_IDENTIFICACION%Type, 
	w_ESTADO_EJEMPLAR IN UNIDADES.ESTADO_EJEMPLAR%type) IS
BEGIN
INSERT INTO UNIDADES(OID_PRE,OID_MPR, CODIGO_IDENTIFICACION, ESTADO_EJEMPLAR)
VALUES (w_OID_PRE,w_OID_MPR, w_CODIGO_IDENTIFICACION, w_ESTADO_EJEMPLAR);
COMMIT WORK;
END NUEVA_UNIDAD;
/


CREATE OR REPLACE PROCEDURE NUEVO_PRESTAMO(
	w_DNI IN PRESTAMOS.DNI%Type, w_FECHA_INICIO IN PRESTAMOS.FECHA_INICIO%Type,
	w_FECHA_FIN IN PRESTAMOS.FECHA_FIN%Type, 
	w_DEVOLUCION IN PRESTAMOS.DEVOLUCION%type, w_NOMBRE_ENCARGADO IN PRESTAMOS.NOMBRE_ENCARGADO%type) IS
BEGIN
INSERT INTO PRESTAMOS(OID_PRE, DNI,FECHA_INICIO,FECHA_FIN,DEVOLUCION,NOMBRE_ENCARGADO)
VALUES (SEC_OID_PRE.nextval,w_DNI,w_FECHA_INICIO,w_FECHA_FIN,w_DEVOLUCION,w_NOMBRE_ENCARGADO);
COMMIT WORK;
END NUEVO_PRESTAMO;
/


CREATE OR REPLACE PROCEDURE NUEVO_MATERIAL_PRESTADO(
	w_NOMBRE IN MATERIALES_PRESTADOS.NOMBRE%Type, w_DISPONIBILIDAD IN MATERIALES_PRESTADOS.DISPONIBILIDAD%Type,
	w_ESTADO_DEVOLUCION IN MATERIALES_PRESTADOS.ESTADO_DEVOLUCION%Type, 
	w_CANTIDAD IN MATERIALES_PRESTADOS.CANTIDAD%type, w_TIPO IN MATERIALES_PRESTADOS.TIPO%type) IS
BEGIN
INSERT INTO MATERIALES_PRESTADOS(OID_MPR,NOMBRE,DISPONIBILIDAD,ESTADO_DEVOLUCION,CANTIDAD,TIPO)
VALUES (SEC_OID_MPR.nextval,w_NOMBRE,w_DISPONIBILIDAD,w_ESTADO_DEVOLUCION,w_CANTIDAD,w_TIPO);
COMMIT WORK;
END NUEVO_MATERIAL_PRESTADO;
/


CREATE OR REPLACE PROCEDURE NUEVA_INSCRIPCION(
	w_DNI IN INSCRIPCIONES.DNI%Type, w_OID_ACT IN INSCRIPCIONES.OID_ACT%Type) IS
BEGIN
INSERT INTO INSCRIPCIONES(OID_INS, DNI, OID_ACT)
VALUES (SEC_OID_INS.nextval, w_DNI, w_OID_ACT);
COMMIT WORK;
END NUEVA_INSCRIPCION;
/


CREATE OR REPLACE PROCEDURE NUEVO_INFORME(
	w_OID_CM IN INFORMES.OID_CM%Type, w_DNI IN INFORMES.DNI%Type, w_TIPO IN INFORMES.TIPO%Type, 
	w_RESPONSABLE IN INFORMES.RESPONSABLE%Type, w_FECHA IN INFORMES.FECHA%Type, w_LUGAR IN INFORMES.LUGAR%Type,
	w_OBSERVACIONES IN INFORMES.OBSERVACIONES%Type) IS
BEGIN
INSERT INTO INFORMES(OID_INF,OID_CM,DNI,TIPO,RESPONSABLE,FECHA,LUGAR,OBSERVACIONES)
VALUES (SEC_OID_INF.nextval,w_OID_CM,w_DNI,w_TIPO,w_RESPONSABLE,w_FECHA,w_LUGAR,w_OBSERVACIONES);
COMMIT WORK;
END NUEVO_INFORME;
/


CREATE OR REPLACE PROCEDURE NUEVA_ESTANCIA(
	w_DNI IN ESTANCIAS.DNI%Type, w_OID_ALJ IN ESTANCIAS.OID_ALJ%Type, w_FECHA_ENTRADA IN ESTANCIAS.FECHA_ENTRADA%Type, 
	w_FECHA_SALIDA IN ESTANCIAS.FECHA_SALIDA%Type) IS
BEGIN
INSERT INTO ESTANCIAS(OID_EST,DNI,OID_ALJ,FECHA_ENTRADA,FECHA_SALIDA)
VALUES (SEC_OID_EST.nextval,w_DNI,w_OID_ALJ,w_FECHA_ENTRADA,w_FECHA_SALIDA);
COMMIT WORK;
END NUEVA_ESTANCIA;
/


CREATE OR REPLACE PROCEDURE NUEVA_CITA_MEDICA(
	w_DNI IN CITAS_MEDICAS.DNI%Type, w_DOCTOR IN CITAS_MEDICAS.DOCTOR%Type, w_FECHA IN CITAS_MEDICAS.FECHA%Type, 
	w_LUGAR IN CITAS_MEDICAS.LUGAR%Type) IS
BEGIN
INSERT INTO CITAS_MEDICAS(OID_CM,DNI,DOCTOR,FECHA,LUGAR)
VALUES (SEC_OID_CM.nextval,w_DNI,w_DOCTOR,w_FECHA,w_LUGAR);
COMMIT WORK;
END NUEVA_CITA_MEDICA;
/


CREATE OR REPLACE PROCEDURE NUEVO_ALOJAMIENTO(
	w_UBICACION IN ALOJAMIENTOS.UBICACION%Type, w_DIRECCION IN ALOJAMIENTOS.DIRECCION%Type, 
	w_RESIDENTES IN ALOJAMIENTOS.RESIDENTES%Type, 
	w_NUMERO_RESIDENTES IN ALOJAMIENTOS.NUMERO_RESIDENTES%Type, w_NUMERO_HABITACION IN ALOJAMIENTOS.NUMERO_HABITACION%Type,
	w_DISPONIBILIDAD IN ALOJAMIENTOS.DISPONIBILIDAD%Type) IS
BEGIN
INSERT INTO ALOJAMIENTOS(OID_ALJ,UBICACION,DIRECCION,RESIDENTES,NUMERO_RESIDENTES,NUMERO_HABITACION,DISPONIBILIDAD)
VALUES (SEC_OID_ALJ.nextval,w_UBICACION,w_DIRECCION,w_RESIDENTES,w_NUMERO_RESIDENTES,w_NUMERO_HABITACION,w_DISPONIBILIDAD);
COMMIT WORK;
END NUEVO_ALOJAMIENTO;
/


CREATE OR REPLACE PROCEDURE NUEVO_ACTIVIDAD(
	w_LUGAR IN ACTIVIDADES.LUGAR%Type, w_FECHA IN ACTIVIDADES.FECHA%Type, 
	w_NUMERO_ASISTENTES IN ACTIVIDADES.NUMERO_ASISTENTES%Type, 
	w_CALIFICACIONES IN ACTIVIDADES.CALIFICACIONES%Type) IS
BEGIN
INSERT INTO ACTIVIDADES(OID_ACT,LUGAR,FECHA,NUMERO_ASISTENTES,CALIFICACIONES)
VALUES (SEC_OID_ACT.nextval,w_LUGAR,w_FECHA,w_NUMERO_ASISTENTES,w_CALIFICACIONES);
COMMIT WORK;
END NUEVO_ACTIVIDAD;
/

------------------------------------------------------------/* CURSORES */---------------------------------------------------------------
DECLARE
CURSOR cursor_usuario IS
SELECT dni, nombre, apellidos, contacto, observaciones, motivo_ingreso, estado_psicologico, estado_medico, sanciones, premios
FROM usuarios ORDER BY dni;
w_dni usuarios.dni%TYPE;
w_nombre usuarios.nombre%TYPE;
w_apellidos usuarios.apellidos%TYPE;
w_contacto usuarios.contacto%TYPE;
w_observaciones usuarios.observaciones%TYPE;
w_motivo_ingreso usuarios.motivo_ingreso%TYPE;
w_estado_psicologico usuarios.estado_psicologico%TYPE;
w_estado_medico usuarios.estado_medico%TYPE;
w_sanciones usuarios.sanciones%TYPE;
w_premios usuarios.premios%TYPE;
BEGIN
	IF NOT (cursor_usuario%ISOPEN) THEN OPEN cursor_usuario;
	END IF;
	
	LOOP
		FETCH cursor_usuario INTO w_dni, w_nombre, w_apellidos, w_contacto, w_observaciones, w_motivo_ingreso, w_estado_psicologico, w_estado_medico, w_sanciones, w_premios;
		EXIT WHEN cursor_usuario%NOTFOUND;
		UPDATE usuarios SET PREMIOS = w_premios + 1 WHERE DNI = w_dni;
	END LOOP;
	CLOSE cursor_usuario;
END cursor_usuario;
/

DECLARE
CURSOR cursor_actividad IS
SELECT oid_act, lugar, fecha, numero_asistentes, calificaciones
FROM actividades ORDER BY lugar;
w_oid_act actividades.oid_act%TYPE;
w_lugar actividades.lugar%TYPE;
w_fecha actividades.fecha%TYPE;
w_numero_asistentes actividades.numero_asistentes%TYPE;
w_calificaciones actividades.calificaciones%TYPE;

BEGIN
    IF NOT(cursor_actividad%ISOPEN) THEN OPEN cursor_actividad;
    END IF;

    LOOP
        FETCH cursor_actividad INTO w_oid_act, w_lugar, w_fecha, w_numero_asistentes, w_calificaciones;
        EXIT WHEN cursor_actividad%NOTFOUND;
        UPDATE actividades SET FECHA= w_fecha +1 WHERE LUGAR= w_lugar;
    END LOOP;
    CLOSE cursor_actividad;
END cursor_actividad;
/

DECLARE
CURSOR cursor_usuario2 IS
SELECT dni, nombre, apellidos, contacto, observaciones, motivo_ingreso, estado_psicologico, estado_medico, sanciones, premios
FROM usuarios ORDER BY dni;
w_dni usuarios.dni%TYPE;
w_nombre usuarios.nombre%TYPE;
w_apellidos usuarios.apellidos%TYPE;
w_contacto usuarios.contacto%TYPE;
w_observaciones usuarios.observaciones%TYPE;
w_motivo_ingreso usuarios.motivo_ingreso%TYPE;
w_estado_psicologico usuarios.estado_psicologico%TYPE;
w_estado_medico usuarios.estado_medico%TYPE;
w_sanciones usuarios.sanciones%TYPE;
w_premios usuarios.premios%TYPE;
BEGIN
	IF NOT (cursor_usuario2%ISOPEN) THEN OPEN cursor_usuario2;
	END IF;
	
	LOOP
		FETCH cursor_usuario2 INTO w_dni, w_nombre, w_apellidos, w_contacto, w_observaciones, w_motivo_ingreso, w_estado_psicologico, w_estado_medico, w_sanciones, w_premios;
		EXIT WHEN cursor_usuario2%NOTFOUND;
		UPDATE usuarios SET SANCIONES = w_sanciones + 1 WHERE DNI = w_dni;
	END LOOP;
	CLOSE cursor_usuario2;
END cursor_usuario2;
/

DECLARE
CURSOR cursor_informes IS
SELECT dni, tipo, responsable, fecha, lugar, observaciones
FROM informes ORDER BY dni;
w_dni informes.dni%TYPE;
w_tipo informes.tipo%TYPE;
w_responsable informes.responsable%TYPE;
w_fecha informes.fecha%TYPE;
w_lugar informes.lugar%TYPE;
w_observaciones usuarios.observaciones%TYPE;

BEGIN
	IF NOT (cursor_informes%ISOPEN) THEN OPEN cursor_informes;
	END IF;
	
	LOOP
		FETCH cursor_informes INTO w_dni, w_tipo, w_responsable, w_fecha,w_lugar, w_observaciones;
		EXIT WHEN cursor_informes%NOTFOUND;
		UPDATE informes SET TIPO = w_tipo + 1 WHERE DNI = w_dni;
	END LOOP;
	CLOSE cursor_informes;
END cursor_informes;
/

-----------------------------------------------------------/* PAQUETES */----------------------------------------------------------------
create or replace package PRUEBAS_USUARIOS as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_DNI VARCHAR2, w_nombre VARCHAR2, w_apellidos VARCHAR2, w_observaciones VARCHAR2, w_contacto VARCHAR2,
            w_motivo_ingreso VARCHAR2, w_estado_psicologico VARCHAR2, w_estado_medico VARCHAR2, w_sanciones NUMBER, w_premios NUMBER,
            salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, W_DNI VARCHAR2, w_nombre VARCHAR2, w_apellidos VARCHAR2, w_observaciones VARCHAR2, w_contacto VARCHAR2,
            w_motivo_ingreso VARCHAR2, w_estado_psicologico VARCHAR2, w_estado_medico VARCHAR2, w_sanciones NUMBER, w_premios NUMBER,
            salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_DNI VARCHAR2, salidaEsperada BOOLEAN);

end PRUEBAS_USUARIOS;
/

create or replace package PRUEBAS_UNIDADES as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_OID_PRE NUMBER, w_OID_MPR NUMBER, w_ESTADO_EJEMPLAR VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_PRE NUMBER, w_OID_MPR NUMBER, w_CODIGO_IDENTIFICACION VARCHAR2,
    w_ESTADO_EJEMPLAR VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_CODIGO_IDENTIFICACION VARCHAR2, salidaEsperada BOOLEAN);

end PRUEBAS_UNIDADES;
/

create or replace package PRUEBAS_PRESTAMOS as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_DNI VARCHAR2, w_FECHA_INICIO DATE, w_FECHA_FIN DATE, w_DEVOLUCION VARCHAR2, w_NOMBRE_ENCARGADO VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_PRE NUMBER, w_DNI VARCHAR2, w_FECHA_INICIO DATE, w_FECHA_FIN DATE, w_DEVOLUCION VARCHAR2, 
    w_NOMBRE_ENCARGADO VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_PRE VARCHAR2, salidaEsperada BOOLEAN);

end PRUEBAS_PRESTAMOS;
/

create or replace package PRUEBAS_MATERIALES_PRESTADOS as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_NOMBRE VARCHAR2, w_DISPONIBILIDAD VARCHAR2, w_ESTADO_DEVOLUCION VARCHAR2, 
    w_CANTIDAD VARCHAR2, w_TIPO VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_MPR NUMBER, w_NOMBRE VARCHAR2, w_DISPONIBILIDAD VARCHAR2, w_ESTADO_DEVOLUCION VARCHAR2,
  w_CANTIDAD VARCHAR2, w_TIPO VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_MPR VARCHAR2, salidaEsperada BOOLEAN);

end PRUEBAS_MATERIALES_PRESTADOS;
/

create or replace package PRUEBAS_INFORMES as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_OID_CM NUMBER, w_DNI VARCHAR2, w_TIPO VARCHAR2, w_RESPONSABLE VARCHAR2, w_FECHA DATE, 
    w_LUGAR VARCHAR2, w_OBSERVACIONES LONG, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, 
    w_OID_INF NUMBER, w_OID_CM NUMBER, w_DNI VARCHAR2, w_TIPO VARCHAR2, w_RESPONSABLE VARCHAR2, w_FECHA DATE, w_LUGAR VARCHAR2, w_OBSERVACIONES LONG, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_INF VARCHAR2, salidaEsperada BOOLEAN);

end PRUEBAS_INFORMES;
/

create or replace package PRUEBAS_CITAS_MEDICAS as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_DNI VARCHAR2, w_DOCTOR VARCHAR2, w_FECHA DATE, w_LUGAR VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_CM NUMBER, w_DNI VARCHAR2, w_DOCTOR VARCHAR2, w_FECHA DATE, w_LUGAR VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_CM NUMBER, salidaEsperada BOOLEAN);

end PRUEBAS_CITAS_MEDICAS;
/

create or replace package PRUEBAS_ALOJAMIENTOS as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_UBICACION VARCHAR2, w_DIRECCION VARCHAR2, w_RESIDENTES VARCHAR2, w_NUMERO_RESIDENTES NUMBER,
        w_NUMERO_HABITACION NUMBER, w_DISPONIBILIDAD VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_ALJ NUMBER, w_UBICACION VARCHAR2, w_DIRECCION VARCHAR2, w_RESIDENTES VARCHAR2, w_NUMERO_RESIDENTES NUMBER,
        w_NUMERO_HABITACION NUMBER, w_DISPONIBILIDAD VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_ALJ NUMBER, salidaEsperada BOOLEAN);

end PRUEBAS_ALOJAMIENTOS;
/

create or replace package PRUEBAS_ACTIVIDADES as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_LUGAR VARCHAR2, w_FECHA DATE, w_NUMERO_ASISTENTES NUMBER, w_CALIFICACIONES VARCHAR2,
            salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_ACT VARCHAR2, w_LUGAR VARCHAR2, w_FECHA DATE, w_NUMERO_ASISTENTES NUMBER, w_CALIFICACIONES VARCHAR2,
            salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_ACT NUMBER, salidaEsperada BOOLEAN);        

END PRUEBAS_ACTIVIDADES;
/

create or replace package PRUEBAS_ESTANCIAS as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_DNI VARCHAR2, w_OID_ALJ NUMBER, w_FECHA_ENTRADA DATE, w_FECHA_SALIDA DATE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_est NUMBER, w_DNI VARCHAR2, w_OID_ALJ NUMBER, w_FECHA_ENTRADA DATE, w_FECHA_SALIDA DATE, 
    salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_EST VARCHAR2, salidaEsperada BOOLEAN);

end PRUEBAS_ESTANCIAS;
/

create or replace package PRUEBAS_INSCRIPCIONES as

    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_DNI VARCHAR2, w_OID_ACT NUMBER, w_FECHA DATE, w_correo_electronico VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_OID_INS NUMBER, w_DNI VARCHAR2, w_OID_ACT NUMBER, w_FECHA DATE, w_correo_electronico VARCHAR2, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_OID_INS NUMBER, salidaEsperada BOOLEAN);

END PRUEBAS_INSCRIPCIONES;
/
--------------------------------------------------------------------------/*Pruebas*/-----------------------------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    cod_act NUMBER;
    cod_alj NUMBER;
    cod_ins NUMBER;
    cod_cm NUMBER;
    cod_inf NUMBER;
    cod_pre NUMBER;
    cod_mpr NUMBER;
    cod_est NUMBER;
BEGIN

    pruebas_usuarios.inicializar;
    pruebas_usuarios.insertar('Prueba usuario 1 - Insercion usuario', '30476281Z', 'Antonio', 'Palomares', 'Payaso', 'Telefono', 'Desintoxicacion', 'Depresion', 'Bueno', 0, 3, true);
    pruebas_usuarios.insertar('Prueba usuario 2 - Insercion usuario con nombre null', '30476181Z', null, 'Palomares', 'Payaso', 'Telefono', 'Desintoxicacion', 'Depresion', 'Bueno', 0, 3, false);  
    pruebas_usuarios.actualizar('Prueba usuario 3 - Actualizacion apellido usuario', '30472381Z', 'Antonio', 'Villuela', 'Payaso', 'Telefono', 'Desintoxicacion', 'Depresion', 'Bueno', 0, 3, true);
    pruebas_usuarios.actualizar('Prueba usuario 4 - Actualizacion estado medico usuario a null', '32476281Z', 'Antonio', 'Palomares', 'Payaso', 'Telefono', 'Desintoxicacion', 'Depresion', null, 0, 3, false);
    pruebas_usuarios.eliminar('Prueba usuario 5 - Eliminar usuario', '30476265Z', true);

    pruebas_actividades.inicializar;
    pruebas_actividades.insertar('Prueba actividad 1 - Insercion actividad', 'Parque', TO_DATE('01-03-2011','DD-MM-YYYY'), 40, 'Positivas', true);
    cod_act := SEC_OID_ACT.currval;
    pruebas_actividades.insertar('Prueba actividad 2 - Insercion actividad con lugar null', null, TO_DATE('01-03-2011','DD-MM-YYYY'), 40, 'Positivas', false);
    pruebas_actividades.insertar('Prueba actividad 3 - Insercion actividad con fecha null', 'Parque', null, 40, 'Positivas', false);
    pruebas_actividades.actualizar('Prueba actividad 4 - Actualizacion lugar actividad', cod_act, 'Bolera', TO_DATE('01-03-2011','DD-MM-YYYY'), 40, 'Positivas', true);
    pruebas_actividades.actualizar('Prueba actividad 5 - Actualizacion fecha actividad a null', cod_act, 'Parque', null, 40, 'Positivas', false);
    pruebas_actividades.eliminar('Prueba actividad 6 - Eliminar actividad', cod_act, true);
    
    pruebas_alojamientos.inicializar;
    pruebas_alojamientos.insertar('Prueba alojamiento 1 - Insercion alojamiento', 'Edificio 1', 'Ctr. A-392, km 1, 5', '2', 8, 4, 'T', true);
    cod_alj := SEC_OID_ALJ.currval;
    pruebas_alojamientos.actualizar('Prueba alojamiento 2 - Actualizacion residentes alojamiento', cod_alj, 'Edificio 1', 'Ctr. A-392, km 1, 5', '3', 8, 4, 'T', true);
    pruebas_alojamientos.actualizar('Prueba alojamiento 3 - Actualizacion codigo alojamiento a null', null, 'Edificio 1', 'Ctr. A-392, km 1, 5', '5', 8, 4, 'T', false);
    pruebas_alojamientos.eliminar('Prueba alojamiento 4 - Eliminar alojamiento', cod_alj, true);
    
    pruebas_inscripciones.inicializar;
    cod_act := SEC_OID_ACT.currval;
    pruebas_inscripciones.insertar('Prueba Inscripcion 1 - Insertar inscripcion', '23653221H', cod_act, TO_DATE('01-03-2011','DD-MM-YYYY'), 'manueboliva@gmail.com', true);
    cod_act := SEC_OID_ACT.currval;
    pruebas_inscripciones.insertar('Prueba Inscripcion 2 - Insertar fecha y correo inscripcion a null',  '23653221H', cod_act, null, null, false);
    pruebas_inscripciones.actualizar('Prueba Inscripcion 3 - Actualizacion inscripcion', cod_ins, '38548694H', cod_act, TO_DATE('01-03-2011','DD-MM-YYYY'), 'manueboliva@gmail.com', true);
    pruebas_inscripciones.actualizar('Prueba Inscripcion 4 - Actualizacion correo inscripcion a null', cod_ins, '23653221H', cod_act, TO_DATE('01-03-2011','DD-MM-YYYY'), null, false);
    pruebas_inscripciones.eliminar('Pruebas Inscripcion 5 - Eliminar inscripcion', cod_ins, true);
    
    pruebas_citas_medicas.inicializar;
    pruebas_citas_medicas.insertar('Prueba Cita Medica 1 - Insertar cita', '13264987L', 'Jesús Postigo', TO_DATE('01-03-2011','DD-MM-YYYY'), 'Hospital Virgen de la Macarena', true);
    cod_cm := SEC_OID_CM.currval;
    pruebas_citas_medicas.insertar('Prueba Cita Medica 2 - Insertar cita con lugar null',  '13264987L', 'Jesús Postigo', TO_DATE('01-03-2011','DD-MM-YYYY'), null, false);
    pruebas_citas_medicas.actualizar('Prueba Cita Medica 3 - Actualizar lugar cita', cod_cm, '13264987L', 'Jesús Postigo', TO_DATE('01-03-2011','DD-MM-YYYY'), 'Hospital San Juan de Dios', true);
    pruebas_citas_medicas.actualizar('Prueba Cita Medica 4 - Actualizar DNI cita a null', cod_cm, null, 'Jesús Postigo', TO_DATE('01-03-2011','DD-MM-YYYY'), 'Hospital Virgen de la Macarena', false);    
    
    pruebas_citas_medicas.eliminar('Pruebas Cita Medica 5 - Eliminar cita', cod_cm, true);
    
    pruebas_informes.inicializar;
    pruebas_informes.insertar('Prueba Informe 1', cod_cm, '12358964N', 'Psicológico', 'Francisco Alejo', TO_DATE('01-03-2011','DD-MM-YYYY'), 
    'Plaza Olimpia, num 27 - 1º', null, true);
    cod_inf := SEC_OID_INF.currval;
    cod_cm := SEC_OID_CM.currval;
    pruebas_informes.insertar('Prueba Informe 2',  cod_cm, '12358964N', 'Psicológico', null, null,
    'Plaza Olimpia, num 27 - 1º', null, false);
    pruebas_informes.actualizar('Prueba Informe 3', cod_inf, cod_cm, '12358964N', 'Psicológico', 'Francisco Alejo', TO_DATE('01-03-2011','DD-MM-YYYY'), 
    'Plaza Olimpia, num 27 - 1º', 'No procede', true);
    pruebas_informes.actualizar('Prueba Informe 4', cod_inf, cod_cm, '12358964N', 'Psicológico', 'Francisco Alejo', TO_DATE('01-03-2011','DD-MM-YYYY'), 
    null, null, false);
    pruebas_informes.eliminar('Pruebas Informe 5', cod_inf, true);
    
    PRUEBAS_PRESTAMOS.inicializar;
    PRUEBAS_PRESTAMOS.insertar('Prueba Prestamo 1', '16594322M', TO_DATE('01-03-2011','DD-MM-YYYY'), TO_DATE('15-03-2011','DD-MM-YYYY'), 'T', 'Alejandro Millán', true);
    cod_pre := SEC_OID_PRE.currval;
    PRUEBAS_PRESTAMOS.insertar('Prueba Prestamo 2',  '16594322M', TO_DATE('01-03-2011','DD-MM-YYYY'), null, 'VERDAD', 'Alejandro Millán', false);
    pruebas_PRESTAMOS.actualizar('Prueba Prestamo 3',cod_pre, '16594322M', TO_DATE('01-03-2011','DD-MM-YYYY'), TO_DATE('26-03-2011','DD-MM-YYYY'), 'T', 'Alejandro Millán', true);
    pruebas_PRESTAMOS.actualizar('Prueba Prestamo 4',cod_pre, '16594322M', null, TO_DATE('15-03-2011','DD-MM-YYYY'), 'T', 'Alejandro Millán', false);    
    
    pruebas_PRESTAMOS.eliminar('Pruebas Informe 5', cod_pre, true);
    
    PRUEBAS_MATERIALES_PRESTADOS.inicializar;
    PRUEBAS_MATERIALES_PRESTADOS.insertar('Prueba Material Prestado 1', 'Ordenador Acer 1', 'T', 'BIEN', 
    '1', 'Electrónica', true);
    cod_mpr := SEC_OID_MPR.currval;
    PRUEBAS_MATERIALES_PRESTADOS.insertar('Prueba Material Prestado 2',  'Ordenador Acer 1', 'VERDAD', 'BIEN', 
    '1', 'Electrónica', false);
    pruebas_MATERIALES_PRESTADOS.actualizar('Prueba Material Prestado 3', cod_mpr, 'Ordenador Acer 1', 'T', 'BIEN', 
    '1', 'Electrónica', true);
    pruebas_MATERIALES_PRESTADOS.actualizar('Prueba Material Prestado 4', cod_mpr, 'Ordenador Acer 1', 'FALSO', 'BIEN', 
    '1', 'Electrónica', false);    
    
    pruebas_MATERIALES_PRESTADOS.eliminar('Pruebas Informe 5', cod_mpr, true);
    
    PRUEBAS_ESTANCIAS.inicializar;
    PRUEBAS_ESTANCIAS.insertar('Prueba Estancias 1', '46953127L', cod_alj, TO_DATE('01-03-2011','DD-MM-YYYY'), null, true);
    cod_est := SEC_OID_EST.currval;
    PRUEBAS_ESTANCIAS.insertar('Prueba Estancias 2',  '46953127L', cod_alj, null, null, false);
    pruebas_ESTANCIAS.actualizar('Prueba Estancias 3', cod_est, '46953127L', cod_alj, TO_DATE('01-03-2012','DD-MM-YYYY'), null, true);
    pruebas_ESTANCIAS.actualizar('Prueba Estancias 4', cod_est, '46953127L', cod_alj, null, null, false);    
    
    pruebas_ESTANCIAS.eliminar('Pruebas Estancias 5', cod_est, true);
    
END;
