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
    cod_ins := SEC_OID_INS.currval;
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
    
    /*pruebas_informes.inicializar;
    pruebas_informes.insertar('Prueba Informe 1', cod_cm, '12358964N', 'Psicológico', 'Francisco Alejo', TO_DATE('01-03-2011','DD-MM-YYYY'), 
    'Plaza Olimpia, num 27 - 1ş', null, true);
    cod_inf := SEC_OID_INF.currval;
    cod_cm := SEC_OID_CM.currval;
    pruebas_informes.insertar('Prueba Informe 2',  cod_cm, '12358964N', 'Psicológico', null, null, null, false);
    pruebas_informes.actualizar('Prueba Informe 3', cod_inf, cod_cm, '12358964N', 'Psicológico', 'Francisco Alejo', TO_DATE('01-03-2011','DD-MM-YYYY'), 
    'Plaza Olimpia, num 27 - 1ş', 'No procede', true);
    pruebas_informes.actualizar('Prueba Informe 4', cod_inf, cod_cm, '12358964N', 'Psicológico', 'Francisco Alejo', TO_DATE('01-03-2011','DD-MM-YYYY'), 
    null, null, false);
    pruebas_informes.eliminar('Pruebas Informe 5', cod_inf, true);
    */
END;
/

--------USUARIOS------------------------------------------------------------------------------
EXECUTE NUEVO_USUARIO('DNI1', 'NOMBRE1', 'AP1', 'OB1', 'CN1','MI1','EP1','EM1',1,1 );
EXECUTE NUEVO_USUARIO('DNI2', 'NOMBRE2', 'AP2', 'OB2', 'CN2','MI2','EP2','EM2',2,2 );
EXECUTE NUEVO_USUARIO('DNI3', 'NOMBRE3', 'AP3', 'OB3', 'CN3','MI3','EP3','EM3',3,3 );
EXECUTE NUEVO_USUARIO('DNI4', 'NOMBRE4', 'AP4', 'OB4', 'CN4','MI4','EP4','EM4',4,4 );

INSERT INTO USUARIOS(DNI,NOMBRE, APELLIDOS, OBSERVACIONES, CONTACTO, MOTIVO_INGRESO, ESTADO_PSICOLOGICO, 
	ESTADO_MEDICO, SANCIONES, PREMIOS)
VALUES ('DNI1', 'NOMBRE1', 'AP1', 'OB1', 'CN1','MI1','EP1','EM1',1,1);

INSERT INTO USUARIOS(DNI,NOMBRE, APELLIDOS, OBSERVACIONES, CONTACTO, MOTIVO_INGRESO, ESTADO_PSICOLOGICO, 
	ESTADO_MEDICO, SANCIONES, PREMIOS)
VALUES ('DNI2', 'NOMBRE2', 'AP2', 'OB2', 'CN2','MI2','EP2','EM2',2,2);

INSERT INTO USUARIOS(DNI,NOMBRE, APELLIDOS, OBSERVACIONES, CONTACTO, MOTIVO_INGRESO, ESTADO_PSICOLOGICO, 
	ESTADO_MEDICO, SANCIONES, PREMIOS)
VALUES ('DNI3', 'NOMBRE3', 'AP3', 'OB3', 'CN3','MI3','EP3','EM3',3,3);

INSERT INTO USUARIOS(DNI,NOMBRE, APELLIDOS, OBSERVACIONES, CONTACTO, MOTIVO_INGRESO, ESTADO_PSICOLOGICO, 
	ESTADO_MEDICO, SANCIONES, PREMIOS)
VALUES ('DNI4', 'NOMBRE4', 'AP4', 'OB4', 'CN4','MI4','EP4','EM4',4,4);
-------------------------------------------UNIDADES--------------------------------------------------
EXECUTE NUEVA_UNIDAD('COD1', 'E1' );
EXECUTE NUEVA_UNIDAD('COD2', 'E2' );
EXECUTE NUEVA_UNIDAD('COD3', 'E3' );
EXECUTE NUEVA_UNIDAD('COD4', 'E4' );


INSERT INTO UNIDADES(OID_PRE,OID_MPR, CODIGO_IDENTIFICACION, ESTADO_EJEMPLAR)
VALUES('COD1', 'E1');

INSERT INTO UNIDADES(OID_PRE,OID_MPR, CODIGO_IDENTIFICACION, ESTADO_EJEMPLAR)
VALUES('COD2', 'E2');


INSERT INTO UNIDADES(OID_PRE,OID_MPR, CODIGO_IDENTIFICACION, ESTADO_EJEMPLAR)
VALUES('COD3', 'E3');


INSERT INTO UNIDADES(OID_PRE,OID_MPR, CODIGO_IDENTIFICACION, ESTADO_EJEMPLAR)
VALUES('COD4', 'E4');

-----------------------PRESTAMOS------------------------------------------------------------------
EXECUTE NUEVO_PERSTAMO('DNI1', 'FI1', 'FF1','T', 'NE1' );
EXECUTE NUEVO_PRESTAMO('DNI2', 'FI2', 'FF2','F', 'NE2'  );
EXECUTE NUEVO_PRESTAMO('DNI3', 'FI3', 'FF3','T', 'NE3'  );
EXECUTE NUEVO_PRESTAMO('DNI4', 'FI4', 'FF4','F', 'NE4'  );

INSERT INTO PRESTAMOS(OID_PRE, DNI,FECHA_INICIO,FECHA_FIN,DEVOLUCION,NOMBRE_ENCARGADO)
VALUES ('DNI1', 'FI1', 'FF1','T', 'NE1');
INSERT INTO PRESTAMOS(OID_PRE, DNI,FECHA_INICIO,FECHA_FIN,DEVOLUCION,NOMBRE_ENCARGADO)
VALUES ('DNI2', 'FI2', 'FF2','F', 'NE2' );
INSERT INTO PRESTAMOS(OID_PRE, DNI,FECHA_INICIO,FECHA_FIN,DEVOLUCION,NOMBRE_ENCARGADO)
VALUES ('DNI3', 'FI3', 'FF3','T', 'NE3' );
INSERT INTO PRESTAMOS(OID_PRE, DNI,FECHA_INICIO,FECHA_FIN,DEVOLUCION,NOMBRE_ENCARGADO)
VALUES ('DNI4', 'FI4', 'FF4','F', 'NE4' );

----------------------------------------MATERIAL_PRESTADO-----------------------------------------------
EXECUTE NUEVO_MATERIAL_PRESTADO('N1', 'D1', 'T',1, 'T1' );
EXECUTE NUEVO_MATERIAL_PRESTADO('N2', 'D2', 'F',2, 'T2'  );
EXECUTE NUEVO_MATERIAL_PRESTADO('N3', 'D3', 'T',3, 'T3'  );
EXECUTE NUEVO_MATERIAL_PRESTADO('N4', 'D4', 'F',4, 'T4'  );

INSERT INTO MATERIALES_PRESTADOS(OID_MPR,NOMBRE,DISPONIBILIDAD,ESTADO_DEVOLUCION,CANTIDAD,TIPO)
VALUES('N1', 'D1', 'T',1, 'T1');
INSERT INTO MATERIALES_PRESTADOS(OID_MPR,NOMBRE,DISPONIBILIDAD,ESTADO_DEVOLUCION,CANTIDAD,TIPO)
VALUES('N2', 'D2', 'F',2, 'T2');
INSERT INTO MATERIALES_PRESTADOS(OID_MPR,NOMBRE,DISPONIBILIDAD,ESTADO_DEVOLUCION,CANTIDAD,TIPO)
VALUES('N3', 'D3', 'T',3, 'T3');
INSERT INTO MATERIALES_PRESTADOS(OID_MPR,NOMBRE,DISPONIBILIDAD,ESTADO_DEVOLUCION,CANTIDAD,TIPO)
VALUES('N4', 'D4', 'F',4, 'T4');


---------------------------INSCRIPCIONES--------------------------------------------------------------
EXECUTE NUEVA_INSCRIPCION('DNI1', 'F1', 'C1');
EXECUTE NUEVA_INSCRIPCION('DNI2', 'F2', 'C2'  );
EXECUTE NUEVA_INSCRIPCION('DNI3', 'F3', 'C3' );
EXECUTE NUEVA_INSCRIPCION('DNI4', 'F4', 'C4' );

INSERT INTO INSCRIPCIONES(OID_INS, DNI, OID_ACT, FECHA, CORREO_ELECTRONICO)
VALUES('DNI1', 'F1', 'C1');
INSERT INTO INSCRIPCIONES(OID_INS, DNI, OID_ACT, FECHA, CORREO_ELECTRONICO)
VALUES('DNI2', 'F2', 'C2');
INSERT INTO INSCRIPCIONES(OID_INS, DNI, OID_ACT, FECHA, CORREO_ELECTRONICO)
VALUES('DNI3', 'F3', 'C3');
INSERT INTO INSCRIPCIONES(OID_INS, DNI, OID_ACT, FECHA, CORREO_ELECTRONICO)
VALUES('DNI4', 'F4', 'C4');

-------------------------------------------INFORMES-------------------------------------------------------
EXECUTE NUEVO_INFORME('DN1', 'T1', 'R1', 'F1', 'L1', 'OB1');
EXECUTE NUEVO_INFORME('DN2', 'T2', 'R2', 'F2', 'L2', 'OB2' );
EXECUTE NUEVO_INFORME('DN3', 'T3', 'R3', 'F3', 'L3', 'OB3' );
EXECUTE NUEVO_INFORME('DN4', 'T4', 'R4', 'F4', 'L4', 'OB4');

INSERT INTO INFORMES(OID_INF,OID_CM,DNI,TIPO,RESPONSABLE,FECHA,LUGAR,OBSERVACIONES)
VALUES('DN1', 'T1', 'R1', 'F1', 'L1', 'OB1');
INSERT INTO INFORMES(OID_INF,OID_CM,DNI,TIPO,RESPONSABLE,FECHA,LUGAR,OBSERVACIONES)
VALUES('DN2', 'T2', 'R2', 'F2', 'L2', 'OB2');
INSERT INTO INFORMES(OID_INF,OID_CM,DNI,TIPO,RESPONSABLE,FECHA,LUGAR,OBSERVACIONES)
VALUES('DN3', 'T3', 'R3', 'F3', 'L3', 'OB3' );
INSERT INTO INFORMES(OID_INF,OID_CM,DNI,TIPO,RESPONSABLE,FECHA,LUGAR,OBSERVACIONES)
VALUES('DN4', 'T4', 'R4', 'F4', 'L4', 'OB4' );

----------------------------------------ESTANCIAS-------------------------------------------------------
EXECUTE NUEVA_ESTANCIA('DN1', 'FE1', 'FS1');
EXECUTE NUEVA_ESTANCIA('DN2', 'FE2', 'FS2' );
EXECUTE NUEVA_ESTANCIA('DN3', 'FE3', 'FS3' );
EXECUTE NUEVA_ESTANCIA('DN4', 'FE4', 'FS4');

INSERT INTO ESTANCIAS (OID_EST,DNI,OID_ALJ,FECHA_ENTRADA,FECHA_SALIDA)
VALUES('DN1', 'FE1', 'FS1');
INSERT INTO ESTANCIAS (OID_EST,DNI,OID_ALJ,FECHA_ENTRADA,FECHA_SALIDA)
VALUES('DN2', 'FE2', 'FS2');
INSERT INTO ESTANCIAS (OID_EST,DNI,OID_ALJ,FECHA_ENTRADA,FECHA_SALIDA)
VALUES('DN3', 'FE3', 'FS3');
INSERT INTO ESTANCIAS (OID_EST,DNI,OID_ALJ,FECHA_ENTRADA,FECHA_SALIDA)
VALUES('DN4', 'FE4', 'FS4');

-----------------------------------CITAS_MEDICAS---------------------------------------------------
EXECUTE NUEVA_CITA_MEDICA('DN1', 'DOC1', 'F1','L1');
EXECUTE NUEVA_CITA_MEDICA('DN2', 'DOC2', 'F2','L2');
EXECUTE NUEVA_CITA_MEDICA('DN3', 'DOC3', 'F3','L3' );
EXECUTE NUEVA_CITA_MEDICA('DN4', 'DOC4', 'F4','L4');

INSERT INTO CITAS_MEDICAS(OID_CM,DNI,DOCTOR,FECHA,LUGAR)
VALUES('DN1', 'DOC1', 'F1','L1');
INSERT INTO CITAS_MEDICAS(OID_CM,DNI,DOCTOR,FECHA,LUGAR)
VALUES('DN2', 'DOC2', 'F2','L2');
INSERT INTO CITAS_MEDICAS(OID_CM,DNI,DOCTOR,FECHA,LUGAR)
VALUES('DN3', 'DOC3', 'F3','L3');
INSERT INTO CITAS_MEDICAS(OID_CM,DNI,DOCTOR,FECHA,LUGAR)
VALUES('DN4', 'DOC4', 'F4','L4');

-----------------------------------ALOJAMIENTOS-----------------------------------------------
EXECUTE NUEVO_ALOJAMIENTO('U1', 'D1', 'R1',1, 1, 'T');
EXECUTE NUEVO_ALOJAMIENTO('U2', 'D2', 'R2',2, 2, 'F');
EXECUTE NUEVO_ALOJAMIENTO('U3', 'D3', 'R3',3, 3, 'T');
EXECUTE NUEVO_ALOJAMIENTO('U4', 'D4', 'R4',4, 4, 'F');

INSERT INTO ALOJAMIENTOS(OID_ALJ,UBICACION,DIRECCION,RESIDENTES,NUMERO_RESIDENTES,NUMERO_HABITACION,DISPONIBILIDAD)
VALUES('U1', 'D1', 'R1',1, 1, 'T');
INSERT INTO ALOJAMIENTOS(OID_ALJ,UBICACION,DIRECCION,RESIDENTES,NUMERO_RESIDENTES,NUMERO_HABITACION,DISPONIBILIDAD)
VALUES('U2', 'D2', 'R2',2, 2, 'F');
INSERT INTO ALOJAMIENTOS(OID_ALJ,UBICACION,DIRECCION,RESIDENTES,NUMERO_RESIDENTES,NUMERO_HABITACION,DISPONIBILIDAD)
VALUES('U3', 'D3', 'R3',3, 3, 'T');
INSERT INTO ALOJAMIENTOS(OID_ALJ,UBICACION,DIRECCION,RESIDENTES,NUMERO_RESIDENTES,NUMERO_HABITACION,DISPONIBILIDAD)
VALUES('U4', 'D4', 'R4',4, 4, 'F');

----------------------------------------------ACTIVIDADES------------------------------------------------
EXECUTE NUEVA_ACTIVIDAD('L1', 'F1', 1,'C1');
EXECUTE NUEVA_ACTIVIDAD('L2', 'F2', 2,'C2');
EXECUTE NUEVA_ACTIVIDAD('L3', 'F3', 3,'C3');
EXECUTE NUEVA_ACTIVIDAD('L4', 'F4', 4,'C4');

INSERT INTO ACTIVIDADES(OID_ACT,LUGAR,FECHA,NUMERO_ASISTENTES,CALIFICACIONES)
VALUES('L1', 'F1', 1,'C1');
INSERT INTO ACTIVIDADES(OID_ACT,LUGAR,FECHA,NUMERO_ASISTENTES,CALIFICACIONES)
VALUES('L2', 'F2', 2,'C2');
INSERT INTO ACTIVIDADES(OID_ACT,LUGAR,FECHA,NUMERO_ASISTENTES,CALIFICACIONES)
VALUES('L3', 'F3', 3,'C3');
INSERT INTO ACTIVIDADES(OID_ACT,LUGAR,FECHA,NUMERO_ASISTENTES,CALIFICACIONES)
VALUES('L4', 'F4', 4,'C4');

----------------------------------------------PRUEBAS DE TABLAS------------------------------------------------

create or replace PACKAGE BODY PRUEBAS_USUARIOS AS

  PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM usuarios;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, OBSERVACIONES VARCHAR2, CONTACTO VARCHAR2,
            MOTIVO_INGRESO VARCHAR2, ESTADO_PSICOLOGICO VARCHAR2, ESTADO_MEDICO VARCHAR2, SANCIONES NUMBER, PREMIOS NUMBER,
            salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  usuario usuarios%ROWTYPE;
  w_DNI VARCHAR2;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    INSERT INTO usuarios VALUES (DNI, w_nombre, w_apellidos, w_observaciones, w_contacto, w_motivo_ingreso, w_estado_psicologico,
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

  PROCEDURE actualizar (nombre_prueba VARCHAR2, DNI VARCHAR2, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, OBSERVACIONES VARCHAR2, CONTACTO VARCHAR2,
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

  PROCEDURE eliminar (nombre_prueba VARCHAR2, DNI VARCHAR2, salidaEsperada BOOLEAN) AS
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
/

create or replace PACKAGE BODY PRUEBAS_ACTIVIDADES AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM actividades;
  END inicializar;
  
  


  PROCEDURE insertar (nombre_prueba VARCHAR2, LUGAR VARCHAR2, FECHA DATE, NUMERO_ASISTENTES NUMBER, CALIFICACIONES VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  actividad actividades%ROWTYPE;
  w_oid_act NUMBER;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nuevo_actividad(w_lugar, w_fecha, w_numero_asistente, w_calificaciones);
       w_oid_act := oid_act.currval;
    SELECT * INTO actividad FROM actividades WHERE OID_ACT = w_oid_act;
    IF (actividad.LUGAR<>w_LUGAR OR actividad.FECHA<>w_FECHA OR actividad.NUMERO_ASISTENTES<>w_NUMERO_ASISTENTES OR actividad.CALIFICACIONES<>w_CALIFICACIONES) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, OID_ACT NUMBER, LUGAR VARCHAR2, FECHA DATE, NUMERO_ASISTENTES NUMBER, CALIFICACIONES VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  actividad actividades%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE actividades SET LUGAR=w_LUGAR, FECHA=w_FECHA, NUMERO_ASISTENTES=w_NUMERO_ASISTENTES,
    CALIFICACIONES=w_CALIFICACIONES WHERE OID_ACT = w_OID_ACT;

    SELECT * INTO actividad FROM actividades WHERE OID_ACT = w_OID_ACT;
    IF (actividad.LUGAR<>w_LUGAR OR actividad.FECHA<>w_FECHA OR actividad.NUMERO_ASISTENTES<>w_NUMERO_ASISTENTES OR actividad.CALIFICACIONES<>w_CALIFICACIONES) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, OID_ACT VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_actividades INTEGER;
  BEGIN
    
    DELETE FROM actividades WHERE OID_ACT = w_OID_ACT;
    
    SELECT COUNT(*) INTO n_actividades FROM actividades WHERE OID_ACT = w_OID_ACT;
         IF (n_actividades<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_ACTIVIDADES;
  /
  
  
  
  
  
  
  create or replace PACKAGE BODY PRUEBAS_INSCRIPCIONES AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM inscripciones;
  END inicializar;
  
  


  PROCEDURE insertar (nombre_prueba VARCHAR2, DNI VARCHAR2, OID_ACT NUMBER, FECHA DATE, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  inscripcion inscripciones%ROWTYPE;
  w_oid_ins NUMBER;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nueva_inscripción(w_dni, w_oid_act, w_fecha);
       w_oid_ins := oid_ins.currval;
    SELECT * INTO inscripcion FROM inscripciones WHERE OID_INS = w_oid_ins;
    IF (inscripcion.DNI<>w_DNI OR inscripcion.OID_ACT<>w_OID_ACT OR inscripcion.FECHA<>w_FECHA) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, OID_INS NUMBER, DNI VARCHAR2, OID_ACT NUMBER, FECHA DATE, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  inscripcion inscripciones%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE inscripciones SET DNI=w_DNI, OID_ACT=w_OID_ACT, FECHA= W_FECHA WHERE OID_INS = w_OID_INS;

    SELECT * INTO inscripcion FROM inscripciones WHERE OID_INS = w_OID_INS;
    IF (inscripcion.DNI<>w_DNI OR inscripcion.OID_ACT<>w_OID_ACT OR inscripcion.FECHA<>w_FECHA) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, OID_INS NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_inscripciones INTEGER;
  BEGIN
    
    DELETE FROM inscripciones WHERE OID_INS = w_OID_INS;
    
    SELECT COUNT(*) INTO n_inscripciones FROM inscripciones WHERE OID_INS = w_OID_INS;
         IF (n_inscripciones<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_INSCRIPCIONES;
  /
  
  
    create or replace PACKAGE BODY PRUEBAS_CITAS_MEDICAS AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM citas_medicas;
  END inicializar;
  
  


  PROCEDURE insertar (nombre_prueba VARCHAR2, DNI VARCHAR2, DOCTOR VARCHAR2, FECHA DATE, LUGAR VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  cita_medica citas_medicas%ROWTYPE;
  w_oid_cm NUMBER;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nueva_cita_medica(w_dni, w_doctor, w_fecha, w_lugar);
       w_oid_cm := oid_cm.currval;
    SELECT * INTO cita_medica FROM citas_medicas WHERE OID_CM = w_oid_cm;
    IF (cita_medica.DNI<>w_DNI OR cita_medica.DOCTOR<>w_DOCTOR OR cita_medica.FECHA<>w_FECHA OR cita_medica.LUGAR<>w_LUGAR) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, OID_CM NUMBER, DNI VARCHAR2, DOCTOR VARCHAR2, FECHA DATE, LUGAR VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  cita_medica citas_medicas%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE citas_medicas SET DNI=w_DNI, DOCTOR=w_DOCTOR, FECHA= W_FECHA, LUGAR=W_LUGAR WHERE OID_CM = w_OID_CM;

    SELECT * INTO cita_medica FROM citas_medicas WHERE OID_CM = w_OID_CM;
    IF (cita_medica.DNI<>w_DNI OR cita_medica.DOCTOR<>w_DOCTOR OR cita_medica.FECHA<>w_FECHA OR cita_medica.LUGAR<>w_LUGAR) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, OID_CM NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_citas_medicas INTEGER;
  BEGIN
    
    DELETE FROM citas_medicas WHERE OID_CM = w_OID_CM;
    
    SELECT COUNT(*) INTO n_citas_medicas FROM citas_medicas WHERE OID_CM = w_OID_CM;
         IF (n_citas_medicas<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_CITAS_MEDICAS;
  /
  
  create or replace PACKAGE BODY PRUEBAS_INFORMES AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM informes;
  END inicializar;
  
  
  
  PROCEDURE insertar (nombre_prueba VARCHAR2, OID_CM NUMBER, DNI VARCHAR2, TIPO VARCHAR2, RESPONSABLE VARCHAR2, FECHA DATE, LUGAR VARCHAR2, OBSERVACIONES LONG, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  informe informes%ROWTYPE;
  w_oid_inf NUMBER;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nuevo_informe(w_oid_cm, w_dni, w_tipo, w_responsable, w_fecha, w_lugar, w_observaciones);
       w_oid_inf := oid_inf.currval;
    SELECT * INTO informe FROM informes WHERE OID_INF = w_oid_inf;
    IF (informes.OID_CM<>w_OID_CM OR informes.DNI<>w_DNI OR informes.TIPO<>w_TIPO OR informes.RESPONSABLES<>w_RESPONSABLES OR informes.FECHA<>w_FECHA,
    informes.LUGAR<>w_LUGAR, informes.OBSERVACIONES<>w_OBSERVACIONES) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, 
  OID_INF NUMBER, OID_CM NUMBER, DNI VARCHAR2, TIPO VARCHAR2, RESPONSABLE VARCHAR2, FECHA DATE, LUGAR VARCHAR2, OBSERVACIONES LONG, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  informe informess%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE informes SET OID_CM=w_OID_CM, DNI=w_DNI, TIPO=w_TIPO,
    RESPONSABLE=w_RESPONSABLE, FECHA=w_FECHA, LUGAR=w_LUGAR,
    OBSERVACIONES=w_OBSERVACIONES WHERE OID_INF = w_OID_INF;

    SELECT * INTO informes FROM informes WHERE OID_INF = w_OID_INF;
    IF (informes.OID_CM<>w_OID_CM OR informes.DNI<>w_DNI OR informes.TIPO<>w_TIPO OR informes.RESPONSABLES<>w_RESPONSABLES OR informes.FECHA<>w_FECHA,
    informes.LUGAR<>w_LUGAR, informes.OBSERVACIONES<>w_OBSERVACIONES) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, OID_INF VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_informes INTEGER;
  BEGIN
    
    DELETE FROM informes WHERE OID_INF = w_OID_INF;
    
    SELECT COUNT(*) INTO n_informes FROM informes WHERE OID_INF = w_OID_INF;
         IF (n_informes<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_INFORMES;
  /
  
  create or replace PACKAGE BODY PRUEBAS_PRESTAMOS AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM prestamos;
  END inicializar;
  
  


  PROCEDURE insertar (nombre_prueba VARCHAR2, DNI VARCHAR2, FECHA_INICIO DATE, FECHA_FIN DATE, DEVOLUCION VARCHAR2, NOMBRE_ENCARGADO VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  prestamo prestamos%ROWTYPE;
  w_oid_pre NUMBER;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nuevo_prestamo(w_dni, w_fecha_inicio, w_fecha_fin, w_devolucion, w_nombre_encargado);
       w_oid_pre := oid_pre.currval;
    SELECT * INTO prestamo FROM prestamos WHERE OID_PRE = w_oid_pre;
    IF (prestamo.DNI<>w_DNI OR prestamo.FECHA_INICIO<>w_FECHA_INICIO OR prestamo.FECHA_FIN<>w_FECHA_FIN OR prestamo.DEVOLUCION<>w_DEVOLUCION, prestamo.NOMBRE_ENCARGADO<>w_NOMBRE_ENCARGADO) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, OID_PRE NUMBER, DNI VARCHAR2, FECHA_INICIO DATE, FECHA_FIN DATE, DEVOLUCION VARCHAR2, NOMBRE_ENCARGADO VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  prestamo prestamos%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE prestamos SET DNI=w_DNI, FECHA_INICIO=w_FECHA_INICIO, FECHA_FIN=w_FECHA_FIN, DEVOLUCION=w_DEVOLUCION, NOMBRE_ENCARGADO=w_NOMBRE_ENCARGADO 
    WHERE OID_PRE = w_OID_PRE;

    SELECT * INTO prestamo FROM prestamos WHERE OID_PRE = w_OID_PRE;
    IF (prestamo.DNI<>w_DNI OR prestamo.FECHA_INICIO<>w_FECHA_INICIO OR prestamo.FECHA_FIN<>w_FECHA_FIN OR prestamo.DEVOLUCION<>w_DEVOLUCION, prestamo.NOMBRE_ENCARGADO<>w_NOMBRE_ENCARGADO) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, OID_PRE VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_prestamos INTEGER;
  BEGIN
    
    DELETE FROM prestamos WHERE OID_PRE = w_OID_PRE;
    
    SELECT COUNT(*) INTO n_prestamos FROM prestamos WHERE OID_PRE = w_OID_PRE;
         IF (n_prestamos<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_PRESTAMOS;
  /
  


create or replace PACKAGE BODY PRUEBAS_MATERIALES_PRESTADOS AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM materiales_prestados;
  END inicializar;
  
  


  PROCEDURE insertar (nombre_prueba VARCHAR2, NOMBRE VARCHAR2, DISPONIBILIDAD VARCHAR2, ESTADO_DEVOLUCION VARCHAR2, CANTIDAD VARCHAR2, TIPO VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  material_prestado materiales_prestados%ROWTYPE;
  w_oid_mpr NUMBER;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nuevo_material_prestado(w_nombre, w_disponibilidad, w_estado_devolucion, w_cantidad, w_tipo);
       w_oid_mpr := oid_mpr.currval;
    SELECT * INTO material_prestado FROM materiales_prestados WHERE OID_MPR = w_oid_mpr;
    IF (material_prestado.NOMBRE<>w_NOMBRE OR material_prestado.DISPONIBILIDAD<>w_DISPONIBILIDAD OR material_prestado.ESTADO_DEVOLUCION<>w_ESTADO_DEVOLUCION OR material_prestado.CANTIDAD<>w_CANTIDAD,
        material_prestado.TIPO<>w_TIPO) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, OID_MPR NUMBER, NOMBRE VARCHAR2, DISPONIBILIDAD VARCHAR2, ESTADO_DEVOLUCION VARCHAR2, CANTIDAD VARCHAR2, TIPO VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  material_prestado materiales_prestados%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE material_prestado SET NOMBRE=w_NOMBRE, DISPONIBILIDAD=w_DISPONIBILIDAD, ESTADO_DEVOLUCION=w_ESTADO_DEVOLUCION, CANTIDAD=w_CANTIDAD, TIPO=w_TIPO WHERE OID_MPR = w_OID_MPR;

    SELECT * INTO material_prestado FROM materiales_prestados WHERE OID_MPR = w_OID_MPR;
    IF (material_prestado.NOMBRE<>w_NOMBRE OR material_prestado.DISPONIBILIDAD<>w_DISPONIBILIDAD OR material_prestado.ESTADO_DEVOLUCION<>w_ESTADO_DEVOLUCION OR material_prestado.CANTIDAD<>w_CANTIDAD,
        material_prestado.TIPO<>w_TIPO) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, OID_MPR VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_materiales_prestados INTEGER;
  BEGIN
    
    DELETE FROM materiales_prestados WHERE OID_MPR = w_OID_MPR;
    
    SELECT COUNT(*) INTO n_materiales_prestados FROM materiales_prestados WHERE OID_MPR = w_OID_MPR;
         IF (n_materiales_prestados<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_MATERIALES_PRESTADOS;
  /
  
  
  create or replace PACKAGE BODY PRUEBAS_UNIDADES AS
 PROCEDURE inicializar AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_USUARIOS.inicializar
    DELETE FROM unidades;
  END inicializar;
  
  


  PROCEDURE insertar (nombre_prueba VARCHAR2, OID_PRE NUMBER, OID_MPR NUMBER, ESTADO_EJEMPLAR VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  unidad unidades%ROWTYPE;
  w_codigo_identificacion VARCHAR2;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
      nueva_unidad(w_oid_pre, w_oid_mpr, w_codigo_identificacion, w_estado_ejemplar);
    SELECT * INTO unidad FROM unidades WHERE codigo_identificacion = w_codigo_identificacion;
    IF (unidad.OID_PRE<>w_OID_PRE OR unidad.OID_MPR<>w_OID_MPR OR unidad.ESTADO_EJEMPLAR<>w_ESTADO_EJEMPLAR) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END insertar;
  
  
  
  

  PROCEDURE actualizar (nombre_prueba VARCHAR2, OID_PRE NUMBER, OID_MPR NUMBER, CODIGO_IDENTIFICACION VARCHAR2, ESTADO_EJEMPLAR VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN:=true;
  unidad unidades%ROWTYPE;
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE PRUEBAS_DEPARTAMENTOS.insertar
    UPDATE unidad SET OID_PRE=w_OID_PRE, OID_MPR=w_OID_MPR, ESTADO_EJEMPLAR=w_ESTADO_EJEMPLAR WHERE CODIGO_IDENTIFICACION = w_CODIGO_IDENTIFICACION;

    SELECT * INTO unidad FROM unidades WHERE CODIGO_IDENTIFICACION = w_CODIGO_IDENTIFICACION;
    IF (unidad.OID_PRE<>w_OID_PRE OR unidad.OID_MPR<>w_OID_MPR OR unidad.ESTADO_EJEMPLAR<>w_ESTADO_EJEMPLAR) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
    dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;
  END actualizar;
  
  
  
  

  PROCEDURE eliminar (nombre_prueba VARCHAR2, CODIGO_IDENTIFICACION VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_unidades INTEGER;
  BEGIN
    
    DELETE FROM unidades WHERE CODIGO_IDENTIFICACION = w_CODIGO_IDENTIFICACION;
    
    SELECT COUNT(*) INTO n_unidades FROM unidades WHERE CODIGO_IDENTIFICACION = w_CODIGO_IDENTIFICACION;
         IF (n_unidades<>0) THEN
        salida := false;
    END IF;
    
    COMMIT WORK;
      dbms_output.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
        
         EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
        ROLLBACK;    
  END eliminar;
  END PRUEBAS_UNIDADES;
/