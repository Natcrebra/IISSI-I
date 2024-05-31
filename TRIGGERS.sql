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
        (-20600, :NEW.SANCIONES ||'NO SE PUEDEN TENER MAS DE 5 SANCIONES');
        
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
    BEFORE UPDATE OF OID_ACT ON ACTIVIDADES
FOR EACH ROW
DECLARE
NUMERO_ASISTENTES NUMBER(10);
BEGIN
    SELECT NUMERO_ASISTENTES INTO NUMERO_ASISTENTES FROM ACTIVIDADES;    
     IF (NUMERO_ASISTENTES <10)
     THEN RAISE_APPLICATION_ERROR(-20603,:NEW.NUMERO_ASISTENTES ||
     'SOLO PUEDEN CREARSE ACTIVIDADES CON AL MENOS 10 ASISTENTES');
    END IF;
END RN4_CREACION_ACTIVIDADES;
/

/*?	RN-5: Restricciones para apuntarse a una actividad.
Como monitora, quiero que el sistema no permita apuntarse a una actividad a
alguien después con más de tres sanciones por mala conducta.

*/
CREATE OR REPLACE TRIGGER RN5_INSCRIPCION_ACTIVIDAD
    BEFORE UPDATE OF OID_INS ON INSCRIPCIONES
FOR EACH ROW
DECLARE
    NUMERO_SANCIONES NUMBER(10);
BEGIN
    SELECT SANCIONES INTO NUMERO_SANCIONES FROM USUARIOS;
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
BEFORE UPDATE OF OID_MPR ON MATERIALES_PRESTADOS
FOR EACH ROW
DECLARE DISPONIBILIDAD_MATERIAL VARCHAR2(50); 
BEGIN
    SELECT DISPONIBILIDAD INTO DISPONIBILIDAD_MATERIAL FROM MATERIALES_PRESTADOS;
    IF (DISPONIBILIDAD_MATERIAL = 'F')
    THEN RAISE_APPLICATION_ERROR(-20603, :NEW.OID_MPR ||
    'NO PUEDEN REALIZARSE PRESTAMOS DE MATERIALES NO DISPONIBLES');

    END IF;
END  RN8_DISPONIBILIDAD_PRESTAMOS;
/

/*?	RN-8: Control de préstamos.
					Como encargado de préstamos,
quiero que nadie pueda tener dos préstamos al mismo tiempo,
para controlar mejor el inventario.
*/

CREATE OR REPLACE TRIGGER RN7_CONTROL_PRETAMOS

    BEFORE UPDATE OF OID_PRE ON PRESTAMOS
FOR EACH ROW
BEGIN
    IF :NEW.OID_PRE = 2
    THEN RAISE_APPLICATION_ERROR 
    (-20604, :NEW.OID_PRE ||'NO SE PUEDEN TENER DOS PRESTAMOS SIMULTANEAMENTE');
    END IF;
    
END RN7_CONTROL_PRESTAMOS;
/

