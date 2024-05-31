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









