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