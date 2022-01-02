SISTEMA NOTAS
MODULOS ROL
CRUD COMPLETO
CRUD USUARIOS LISTO
FALTA MODIFICAR CORREO, Y ROL

/* dia 06-10-2021-*/
modulo sedes
modulo docentes listar
revisar ingresar docente


CREATE  PROCEDURE `SP_REGISTRAR_DOCENTE`(IN `DOCUMENTO` CHAR(50),IN `TIPO_DOCUMENTO` VARCHAR(200),    IN `NOMBRES` VARCHAR(50),
 IN `APELLIDOS` VARCHAR(50),IN `DIRECCION` VARCHAR(100),IN `BARRIO` VARCHAR(100),IN `TELEFONO` VARCHAR(100),IN `SEXO` VARCHAR(100),
  IN FNACIMIENTO DATE,IN IDPROFESION INT, IN `IDSEDE` INT, 
  IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT,IN `EMAIL` VARCHAR(100))
BEGIN
DECLARE  CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);
IF @CANTIDADU = 0 THEN
    SET @CANTIDADME:=(SELECT COUNT(*) FROM docentes WHERE `documento` =DOCUMENTO);
    IF @CANTIDADME = 0 THEN
        INSERT INTO usuario(usuario_nombre,`usuario_password`, `rol_id`,usuario_estatus,
            usuario_email,usuario_intento)
        VALUES(USUARIO,CONTRASENA, ROL,'INACTIVO',EMAIL,0);
        INSERT INTO docentes(`documento`,`tipo_documento`,`nombres`,`apellidos`,`direccion`,
        `barrio`, `telefono`, `sexo`,`fecha_nacimiento`,`idprofesion`,`idsede`,
        `idusuario`,`estatus`)
        VALUES(DOCUMENTO,TIPO_DOCUMENTO,NOMBRES,APELLIDOS,DIRECCION,
            BARRIO,TELEFONO,SEXO,FNACIMIENTO,IDPROFESION,IDSEDE ,
        (SELECT MAX(usuario_id) FROM usuario),'ACTIVO');
        SELECT 1;
    ELSE
    SELECT 2;
    END IF;
    ELSE 
    SELECT 2;
END IF;
END



/*LISTADO DE MATRICULAS*/
SELECT
    `matriculas`.`id`
    , `matriculas`.`documento`
    , CONCAT_WS (' ', `estudiantes`.`nombres`     , `estudiantes`.`apellidos` ) AS estudiante
    , `matriculas`.`idsede`
    , `sedes`.`sede_nombre`
    , `matriculas`.`idprograma`
    , `programa`.`nombre_programa`
    , `matriculas`.`idsemestre`
    , `semestre`.`numero`
    , `matriculas`.`idjornada`
    , `jornada`.`nombre_jornada`
    , `matriculas`.`fecha_ingreso`
     
    , `matriculas`.`estatus`
FROM
    `matriculas`
    INNER JOIN `estudiantes` 
        ON (`matriculas`.`documento` = `estudiantes`.`documento`)
    INNER JOIN `sedes` 
        ON (`matriculas`.`idsede` = `sedes`.`sede_id`)
    INNER JOIN `jornada` 
        ON (`matriculas`.`idjornada` = `jornada`.`id`)
    INNER JOIN `programa` 
        ON (`matriculas`.`idprograma` = `programa`.`programa_id`)
    INNER JOIN `semestre` 
        ON (`matriculas`.`idsemestre` = `semestre`.`id`);



        /*ASIGNACION DE MODULOS*/
        SELECT
    `distribucion_modulo`.`idprograma`
    , `programa`.`nombre_programa`
    , `distribucion_modulo`.`idasignatura`
    , `asignaturas`.`nombre_modulo`
    , `asignaturas`.`cant_horas`
    , `distribucion_modulo`.`idsemestre`
    , `semestre`.`numero`
    , `distribucion_modulo`.`iddocente`
    , `docentes`.`id`
    ,CONCAT_WS ( ' ',  `docentes`.`nombres`   , `docentes`.`apellidos` ) AS tutor
FROM
    `distribucion_modulo`
    INNER JOIN `programa` 
        ON (`distribucion_modulo`.`idprograma` = `programa`.`programa_id`)
    INNER JOIN `semestre` 
        ON (`distribucion_modulo`.`idsemestre` = `semestre`.`id`)
    INNER JOIN `asignaturas` 
        ON (`distribucion_modulo`.`idasignatura` = `asignaturas`.`id`)
    INNER JOIN `docentes` 
        ON (`distribucion_modulo`.`iddocente` = `docentes`.`id`);







        CREATE PROCEDURE SP_LISTAR_DISTRI_MODULOS(IN IDPROGRAMA INT, IN IDSEMESTRE INT)


SELECT
    `dm`.`idprograma`
    , `pr`.`nombre_programa`
    , `dm`.`idasignatura`
    , `as`.`nombre_modulo`
    , `as`.`cant_horas`
    , `dm`.`idsemestre`
    , `sm`.`numero`
    , `dm`.`fregistro`
FROM
    `distribucion_modulo` AS `dm`
    INNER JOIN `asignaturas` AS `as` 
        ON (`dm`.`idasignatura` = `as`.`id`)
    INNER JOIN `programa` AS `pr`
        ON (`dm`.`idprograma` = `pr`.`programa_id`)
    INNER JOIN `semestre` AS `sm`
        ON (`dm`.`idsemestre` = `sm`.`id`)
               WHERE `dm`.`idprograma` = IDPROGRAMA AND  `dm`.`idsemestre` =IDSEMESTRE
        ORDER BY  pr.`nombre_programa`,    `nombre_modulo` ASC 



        /* distribuir  programas a docentes*/
        SELECT
    `dp`.`idPrograma`
    , `pr`.`nombre_programa`
    , `pr`.`idsede`
    , `sd`.`sede_nombre`
    , `dp`.`idDocente`
    , `dc`.`nombres`
    , `dc`.`apellidos`
FROM
    `distribucion_programas` AS `dp`
    INNER JOIN `programa` AS `pr` 
        ON (`dp`.`idPrograma` = `pr`.`programa_id`)
    INNER JOIN `docentes` AS `dc`
        ON (`dp`.`idDocente` = `dc`.`id`)
    INNER JOIN `sedes` AS `sd`
        ON (`pr`.`idsede` = `sd`.`sede_id`)
        ORDER BY pr.`nombre_programa` , dc.`nombres` , dc.`apellidos` ASC