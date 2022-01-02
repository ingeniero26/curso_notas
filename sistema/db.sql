/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.6-MariaDB : Database - sis_notas2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sis_notas2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sis_notas2`;

/*Table structure for table `asignaturas` */

DROP TABLE IF EXISTS `asignaturas`;

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` char(100) DEFAULT NULL,
  `cant_horas` char(50) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `asignaturas` */

insert  into `asignaturas`(`id`,`nombre_modulo`,`cant_horas`,`fregistro`,`estatus`) values (1,'Introduccion a la universidad','10','2021-10-11 11:43:03','ACTIVO'),(2,'Programacion I','10','2021-10-11 15:51:38','ACTIVO'),(3,'base dedatos','4','2021-10-11 12:02:58','ACTIVO'),(4,'ingles','4','2021-10-11 12:03:00','ACTIVO'),(5,'ingles II','4','2021-10-11 12:03:03','ACTIVO'),(6,'Desarrollo de software','5','2021-10-11 12:37:02','ACTIVO'),(7,'JAVA 2','12','2021-10-11 12:36:59','ACTIVO'),(8,'Logistica I','5','2021-10-11 12:37:06','ACTIVO'),(9,'PROGRAMACION','5','2021-10-11 12:34:04','ACTIVO'),(10,'INGLES 3','15','2021-10-11 12:34:28','ACTIVO'),(11,'Diseño web','20','2021-10-11 15:50:45','ACTIVO'),(12,'Matematicas 1','5','2021-10-17 13:29:58',NULL),(13,'Arquitectura del pc','5','2021-11-26 19:33:11','ACTIVO'),(14,'Diseño 1','20','2021-10-17 16:50:18','ACTIVO'),(15,'Matematicas II','20','2021-11-26 19:33:00','ACTIVO');

/*Table structure for table `calificaciones` */

DROP TABLE IF EXISTS `calificaciones`;

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idMatricula` int(11) NOT NULL,
  `idasignatura` int(11) DEFAULT NULL,
  `nota` double DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idasignatura` (`idasignatura`),
  KEY `idMatricula` (`idMatricula`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`idasignatura`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`idMatricula`) REFERENCES `matriculas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calificaciones` */

/*Table structure for table `distribucion_modulo` */

DROP TABLE IF EXISTS `distribucion_modulo`;

CREATE TABLE `distribucion_modulo` (
  `idprograma` int(11) NOT NULL,
  `idasignatura` int(11) NOT NULL,
  `idsemestre` int(11) NOT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ASIGNADO') DEFAULT 'ASIGNADO',
  KEY `distribucion_modulo_ibfk_1` (`idasignatura`),
  KEY `distribucion_modulo_ibfk_3` (`idsemestre`),
  KEY `idprograma` (`idprograma`),
  CONSTRAINT `distribucion_modulo_ibfk_1` FOREIGN KEY (`idprograma`) REFERENCES `programa` (`programa_id`),
  CONSTRAINT `distribucion_modulo_ibfk_2` FOREIGN KEY (`idasignatura`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `distribucion_modulo_ibfk_4` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `distribucion_modulo` */

insert  into `distribucion_modulo`(`idprograma`,`idasignatura`,`idsemestre`,`fregistro`,`estatus`) values (1,1,1,'2021-10-17 14:52:50','ASIGNADO'),(2,4,1,'2021-10-17 14:52:53','ASIGNADO'),(2,5,2,'2021-10-17 14:52:55','ASIGNADO'),(6,2,1,'2021-10-17 14:53:03','ASIGNADO'),(6,3,2,'2021-10-17 13:13:51',NULL),(6,7,3,'2021-10-17 13:14:05',NULL),(6,4,1,'2021-10-17 13:30:55',NULL),(6,12,1,'2021-10-17 13:31:18',NULL),(6,14,1,'2021-10-17 13:31:34',NULL),(6,10,1,'2021-10-17 14:01:02',NULL),(6,7,2,'2021-10-17 14:01:19',NULL),(2,1,1,'2021-10-17 20:59:22',NULL),(2,8,3,'2021-10-17 21:01:09','ASIGNADO'),(2,10,4,'2021-10-17 21:04:49','ASIGNADO'),(10,1,1,'2021-10-18 16:18:30','ASIGNADO'),(6,9,3,'2021-11-26 19:26:25','ASIGNADO'),(5,14,4,'2021-11-26 19:56:22','ASIGNADO');

/*Table structure for table `distribucion_programas` */

DROP TABLE IF EXISTS `distribucion_programas`;

CREATE TABLE `distribucion_programas` (
  `idPrograma` int(11) NOT NULL,
  `idDocente` char(50) NOT NULL,
  `estatus` enum('ASIGNADO') DEFAULT 'ASIGNADO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `idDocente` (`idDocente`),
  KEY `idPrograma` (`idPrograma`),
  CONSTRAINT `distribucion_programas_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`id`),
  CONSTRAINT `distribucion_programas_ibfk_2` FOREIGN KEY (`idPrograma`) REFERENCES `programa` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `distribucion_programas` */

insert  into `distribucion_programas`(`idPrograma`,`idDocente`,`estatus`,`fregistro`) values (6,'1070813753','ASIGNADO','2021-10-18 14:51:55'),(3,'1234567812','ASIGNADO','2021-10-18 14:51:55'),(1,'2345454545','ASIGNADO','2021-10-18 14:51:55'),(4,'10478977776','ASIGNADO','2021-10-18 15:18:08'),(2,'1070813753',NULL,'2021-10-18 15:17:55'),(10,'1047897777','ASIGNADO','2021-10-19 14:10:48'),(12,'10478977776','ASIGNADO','2021-11-26 19:53:10'),(10,'10478977776','ASIGNADO','2021-11-26 19:54:48');

/*Table structure for table `docentes` */

DROP TABLE IF EXISTS `docentes`;

CREATE TABLE `docentes` (
  `id` char(50) CHARACTER SET latin1 NOT NULL,
  `tipo_documento` enum('CEDULA','PASAPORTE','TI') CHARACTER SET latin1 DEFAULT NULL,
  `nombres` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` char(100) CHARACTER SET latin1 DEFAULT NULL,
  `barrio` char(250) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` char(100) CHARACTER SET latin1 DEFAULT NULL,
  `sexo` enum('MASCULINO','FEMENINO') CHARACTER SET latin1 DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `idprofesion` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docentes_ibfk_1` (`idusuario`),
  KEY `idprofesion` (`idprofesion`),
  CONSTRAINT `docentes_ibfk_3` FOREIGN KEY (`idprofesion`) REFERENCES `profesion` (`profesion_id`),
  CONSTRAINT `docentes_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `docentes` */

insert  into `docentes`(`id`,`tipo_documento`,`nombres`,`apellidos`,`direccion`,`barrio`,`telefono`,`sexo`,`fecha_nacimiento`,`idprofesion`,`idusuario`,`fregistro`,`estatus`) values ('1047897777','CEDULA','ANA','DOMINGUEZ','KRA 23','cartagena','1321321321','FEMENINO','2000-02-19',2,28,'2021-10-19 13:48:57','ACTIVO'),('10478977776','CEDULA','DENIS','hernandez','KRA 45','cartagena','1321321321','MASCULINO','2021-10-01',1,11,'2021-10-08 18:30:08','ACTIVO'),('1070813753','CEDULA','JERSON ','BATISTA','KRA 45','CENTRO','3014587777','MASCULINO','1989-06-14',1,1,'2021-10-08 18:30:16','ACTIVO'),('1234567812','CEDULA','KAREN','hernandez','KRA 45','FDFSD','1321321321','FEMENINO','2021-10-09',4,12,'2021-11-27 09:50:37','ACTIVO'),('2345454545','CEDULA','pedro','BATISTA','YTYT','centro','565','MASCULINO','0000-00-00',1,10,'2021-10-08 18:30:21','INACTIVO'),('45789963','CEDULA','DENIS','BATISTA','KRA 45','cartagena','1321321321','MASCULINO','2021-09-30',3,29,'2021-10-22 20:24:19','INACTIVO');

/*Table structure for table `estudiantes` */

DROP TABLE IF EXISTS `estudiantes`;

CREATE TABLE `estudiantes` (
  `nombres` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tipo_documento` enum('CEDULA','TI','REGISTRO_CIVIL','PASAPORTE') CHARACTER SET latin1 DEFAULT NULL,
  `documento` varchar(50) CHARACTER SET latin1 NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('MASCULINO','FEMENINO') CHARACTER SET latin1 DEFAULT NULL,
  `estado_civil` enum('CASADO','SOLTERO','CASADA','SOLTERA','UNION_LIBRE','VIUDO') CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `departamento` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tipo_vivienda` enum('PROPIA','FAMILIAR','ALQUILADA') CHARACTER SET latin1 DEFAULT NULL,
  `estrato` int(2) DEFAULT NULL,
  `tipo_poblacion` enum('AFRO','RAIZAL','INDIGENA','DESPLAZADO','OTRO') DEFAULT NULL,
  `eps` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `sisben` char(5) CHARACTER SET latin1 DEFAULT NULL,
  `formacion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ocupacion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`documento`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `estudiantes` */

insert  into `estudiantes`(`nombres`,`apellidos`,`tipo_documento`,`documento`,`fecha_nacimiento`,`sexo`,`estado_civil`,`direccion`,`departamento`,`ciudad`,`telefono`,`tipo_vivienda`,`estrato`,`tipo_poblacion`,`eps`,`sisben`,`formacion`,`ocupacion`,`idusuario`,`fregistro`,`estatus`) values ('Jerson','Batista','CEDULA','104787777','1999-02-10','MASCULINO','CASADO','k56','BOLIVAR','carmen de bolivar','32132132132','ALQUILADA',1,'DESPLAZADO','MUTUAL','1','estudiante','desempleado',1,'2021-10-10 18:43:57','ACTIVO'),('PEDRO','Vega','CEDULA','123456789','2021-10-11','MASCULINO','CASADO','KRA 45','BOLIVAR','CARMEN DE BOLIVAR','123132132132','',1,'DESPLAZADO','0','nivel','administrador','administrador',25,'2021-10-11 11:39:34','ACTIVO'),('PROVEEDOR','Vega','CEDULA','12451245','2021-10-11','MASCULINO','SOLTERO','KRA 45','BOLIVAR','CARMEN DE BOLIVAR','123132132132','',1,'AFRO','0','nivel','administrador','administrador',24,'2021-10-11 09:27:00','ACTIVO'),('ALCIRA','VEGA','TI','321654987','2021-10-11','FEMENINO','SOLTERA','BOGOTA','BOLIVAR','CARMEN DE BOLIVAR','123132132132','',1,'DESPLAZADO','0','nivel','administrador','administrador',26,'2021-10-11 14:52:27','ACTIVO'),('PRUEBA','BATISTA','CEDULA','32323','2021-10-11','MASCULINO','SOLTERO','el centro','BOLIVAR','SAN JACINTO','565666','PROPIA',1,'AFRO','','','','XX',22,'2021-10-11 09:27:14','ACTIVO'),('JUAN','VEGA','CEDULA','3256325698','2021-10-17','MASCULINO','SOLTERO','KRA 45','BOLIVAR','CARMEN DE BOLIVAR','123132132132','',1,'AFRO','0','nivel','administrador','administrador',27,'2021-10-17 11:33:30','ACTIVO'),('x','x','','x','2021-10-20','MASCULINO','SOLTERO','YTYT','','0','565','PROPIA',1,'AFRO','','1','XX','XX',21,'2021-10-10 22:06:46','ACTIVO');

/*Table structure for table `jornada` */

DROP TABLE IF EXISTS `jornada`;

CREATE TABLE `jornada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_jornada` char(50) CHARACTER SET latin1 DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `jornada` */

insert  into `jornada`(`id`,`nombre_jornada`,`fregistro`,`estatus`) values (2,'Mañana','2021-10-10 12:31:06','ACTIVO'),(3,'Virtual','2021-10-18 16:17:07','ACTIVO'),(4,'Tarde','2021-10-10 12:40:04','ACTIVO'),(5,'Sabatina','2021-10-18 16:16:10','ACTIVO'),(6,'Dominical','2021-10-18 16:16:19','ACTIVO'),(7,'Nocturna','2021-10-18 16:16:27','ACTIVO');

/*Table structure for table `matriculas` */

DROP TABLE IF EXISTS `matriculas`;

CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) NOT NULL,
  `idsede` int(11) DEFAULT NULL,
  `idprograma` int(11) NOT NULL,
  `idsemestre` int(11) DEFAULT NULL,
  `idjornada` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `nombre_ref` varchar(100) DEFAULT NULL,
  `apellidos_ref` varchar(100) DEFAULT NULL,
  `parentesco` varchar(100) DEFAULT NULL,
  `direccion_ref` varchar(100) DEFAULT NULL,
  `telefono_ref` varchar(100) DEFAULT NULL,
  `correo_ref` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('MATRICULADO','RETIRADO','GRADUADO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idprograma` (`idprograma`),
  KEY `documento` (`documento`),
  KEY `idsemestre` (`idsemestre`),
  KEY `idsede` (`idsede`),
  KEY `idjornada` (`idjornada`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`idprograma`) REFERENCES `programa` (`programa_id`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`documento`) REFERENCES `estudiantes` (`documento`),
  CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`),
  CONSTRAINT `matriculas_ibfk_4` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`sede_id`),
  CONSTRAINT `matriculas_ibfk_5` FOREIGN KEY (`idjornada`) REFERENCES `jornada` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `matriculas` */

insert  into `matriculas`(`id`,`documento`,`idsede`,`idprograma`,`idsemestre`,`idjornada`,`fecha_ingreso`,`nombre_ref`,`apellidos_ref`,`parentesco`,`direccion_ref`,`telefono_ref`,`correo_ref`,`fregistro`,`estatus`) values (2,'x',1,1,1,2,'2021-10-10','Pedro Vega','vega','padre','tyr','556','mmm22323@gmail.com','2021-10-10 22:06:46','MATRICULADO'),(3,'32323',1,1,1,2,'2021-10-11','Pedro Vega','vega','padre','tyr','556','mmm2221@gmail.com','2021-10-11 08:40:40','MATRICULADO'),(4,'12451245',1,1,1,2,'2021-10-11','fran','vega','probando','probando','1321321321','probando1111@gmail.om','2021-10-11 09:23:58','MATRICULADO'),(5,'123456789',2,6,1,4,'2021-10-11','probando','probando','probando','probando','45345','probando121212114455@gmail.om','2021-10-11 11:39:35','MATRICULADO'),(6,'104787777',2,5,2,2,'2021-10-01','JUAN','JUAN','PADRE','XX','555555',NULL,'2021-10-11 11:41:53','MATRICULADO'),(7,'321654987',2,2,1,4,'2021-10-11','probando','probando','padre','probando','probando','probando','2021-10-11 14:52:27','MATRICULADO'),(8,'3256325698',1,1,1,4,'2021-10-17','probando','probando','probando','probando','32544444','probando12121212121111@gmail.om','2021-10-17 11:33:30','MATRICULADO');

/*Table structure for table `profesion` */

DROP TABLE IF EXISTS `profesion`;

CREATE TABLE `profesion` (
  `profesion_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`profesion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `profesion` */

insert  into `profesion`(`profesion_id`,`nombre_profesion`,`fregistro`,`estatus`) values (1,'Ingeniero de sistemas','2021-10-07 00:00:00','ACTIVO'),(2,'Medico Profesional','2021-10-07 15:49:53','ACTIVO'),(3,'Mecánico','2021-10-08 10:04:36','ACTIVO'),(4,'Psicologo','2021-10-09 11:51:33','ACTIVO');

/*Table structure for table `programa` */

DROP TABLE IF EXISTS `programa`;

CREATE TABLE `programa` (
  `programa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_programa` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `idsede` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`programa_id`),
  KEY `idsede` (`idsede`),
  CONSTRAINT `programa_ibfk_1` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`sede_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `programa` */

insert  into `programa`(`programa_id`,`nombre_programa`,`idsede`,`fregistro`,`estatus`) values (1,'Aux de Enfermeria',1,'2021-10-06 12:14:01','ACTIVO'),(2,'Caja  Registradora',2,'2021-10-06 12:14:41','ACTIVO'),(3,'Caja Registradora ',1,'2021-10-06 12:14:59','ACTIVO'),(4,'desarrollo web',1,'2021-10-06 14:10:00','ACTIVO'),(5,'Diseño Grafico',1,'2021-10-07 08:51:22','ACTIVO'),(6,'Desarrollo de software',2,'2021-10-06 15:00:15','ACTIVO'),(10,'Atencion Primera Infancia',1,'2021-10-18 16:12:46','ACTIVO'),(12,'Atencion Primera Infancia',2,'2021-10-18 16:14:40','ACTIVO');

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

insert  into `rol`(`id`,`nombre_rol`,`fregistro`,`estatus`) values (1,'Administrador','2021-10-04 18:48:07','ACTIVO'),(2,'Docente','2021-10-04 19:31:51','ACTIVO'),(3,'Estudiante','2021-10-05 09:10:11','ACTIVO'),(4,'Coordinador','2021-10-05 09:09:49','ACTIVO');

/*Table structure for table `sedes` */

DROP TABLE IF EXISTS `sedes`;

CREATE TABLE `sedes` (
  `sede_id` int(11) NOT NULL AUTO_INCREMENT,
  `sede_nombre` varchar(100) DEFAULT NULL,
  `sede_ciudad` varchar(255) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`sede_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `sedes` */

insert  into `sedes`(`sede_id`,`sede_nombre`,`sede_ciudad`,`fregistro`,`estatus`) values (1,'SEDE PRINCIPAL','CARMEN DE BOLIVAR','2021-10-06 08:15:03','ACTIVO'),(2,'SEDE NO 2','SAN JACINTO','2021-10-06 12:01:02','ACTIVO');

/*Table structure for table `semestre` */

DROP TABLE IF EXISTS `semestre`;

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(5) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `semestre` */

insert  into `semestre`(`id`,`numero`,`fregistro`,`estatus`) values (1,'I','2021-10-08 13:53:49','ACTIVO'),(2,'II','2021-10-08 13:53:51','ACTIVO'),(3,'III','2021-10-11 12:39:16','ACTIVO'),(4,'IV','2021-10-08 13:54:06','ACTIVO');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(100) DEFAULT NULL,
  `usuario_password` varchar(250) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `usuario_email` varchar(100) DEFAULT NULL,
  `usuario_intento` int(11) DEFAULT NULL,
  `usuario_imagen` varchar(250) DEFAULT NULL,
  `usuario_fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_nombre` (`usuario_nombre`),
  UNIQUE KEY `usuario_email` (`usuario_email`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`usuario_id`,`usuario_nombre`,`usuario_password`,`rol_id`,`usuario_estatus`,`usuario_email`,`usuario_intento`,`usuario_imagen`,`usuario_fregistro`) values (1,'admin','$2y$10$sjwjZzTM9eD6Y6SWWDwe3uCg.tyn5x0oaa6bgF.aADk/./6hF87Qq',1,'ACTIVO','ingjerson@gmail.com',0,'controlador/usuario/img/IMG810202175644.jpg','2021-10-08 07:56:45'),(10,'probando222','123',2,'INACTIVO','probando@gmail.com',0,NULL,'2021-10-08 09:48:34'),(11,'admin45','$2y$10$b1/c9KCgmQRrtwY2r5ia7uW6XNVIRO8RlsUz.l1Ga2jWB2DsbrCGG',2,'ACTIVO','prueba21@gmail.com',0,'controlador/usuario/img/IMG26112021194249.jpeg','2021-11-26 19:42:50'),(12,'karen3221','$2y$10$oCe4olE4W9aD0.QJsxPIK.H6k4I8Gh4dd7oj45lP08NtUJ4l87iO6',3,'INACTIVO','prueba201111@gmail.com',0,NULL,'2021-10-09 12:11:57'),(21,'probando20023232','123',3,'ACTIVO','prueba3234234@gmail.com',0,NULL,'2021-10-10 22:06:46'),(22,'523652365','123',3,'ACTIVO','prueba324@gmail.com',0,NULL,'2021-10-11 08:40:40'),(24,'12451245','$2y$10$p0MmjWpWt6Tm54dYlTUBmOEXGUHX/eGuO99D12.7e5XQbw8eaw0YC',3,'ACTIVO','prueba2011@gmail.com',0,NULL,'2021-10-11 09:23:58'),(25,'123456789','$2y$10$Mmv65gS3ts8.Jk3to0Th0OizCls31tKCl8FHMRttp7XErAsOKcMZ.',3,'ACTIVO','prueba2033@gmail.com',0,NULL,'2021-10-11 11:39:34'),(26,'321654987','$2y$10$TZ9AbCFl/5BxV0ayKYCvmO/SyVIhtk0PT2y0Cl9k3qL/111PaD8Xe',3,'ACTIVO','denis321654987@gmail.com',0,NULL,'2021-10-11 14:52:27'),(27,'3256325698','$2y$10$ew1jGxMSibGfHu7mXx/eTeTQrq08eHhs2sBX9YsjIK7W8m2WvHvoq',3,'ACTIVO','JUAN@GMAIL.COM',0,NULL,'2021-10-17 11:33:30'),(28,'1047897777','$2y$10$z6WQwO2IPGdTD.CPYl46lOYoecipz.zBOcXNBOd9xWMJwiB1ZZc4O',2,'ACTIVO','1047897777@GMAIL.COM',0,NULL,'2021-10-22 20:23:15'),(29,'45789963','$2y$10$Wu2dWhWzIau937oBsi3tCeE2IRaF6asDgZcGASSESeK9Jf9ivz1pu',2,'ACTIVO','denis12365@gmail.com',0,NULL,'2021-10-22 20:24:52');

/* Procedure structure for procedure `SP_LISTAR_COMBO_PROGRAMAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_PROGRAMAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PROGRAMAS`(IN IDSEDE INT)
select `programa_id`, `nombre_programa` from programa
where `programa`.`idsede`=IDSEDE */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_DISTRI_MODULOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_DISTRI_MODULOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DISTRI_MODULOS`(IN `IDPROGRAMA` INT, IN `IDSEMESTRE` INT)
SELECT
    `dm`.`idprograma`
    , `pr`.`nombre_programa`
    , `dm`.`idasignatura`
    , `as`.`nombre_modulo`
    , `as`.`cant_horas`
    , `dm`.`idsemestre`
    , `sm`.`numero`
    , `dm`.`fregistro`
    ,dm.estatus
FROM
    `distribucion_modulo` AS `dm`
    INNER JOIN `asignaturas` AS `as` 
        ON (`dm`.`idasignatura` = `as`.`id`)
    INNER JOIN `programa` AS `pr`
        ON (`dm`.`idprograma` = `pr`.`programa_id`)
    INNER JOIN `semestre` AS `sm`
        ON (`dm`.`idsemestre` = `sm`.`id`)
               WHERE `dm`.`idprograma` = IDPROGRAMA AND  `dm`.`idsemestre` =IDSEMESTRE
        order by  pr.`nombre_programa`,    `nombre_modulo` asc */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_DOCENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_DOCENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DOCENTE`()
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=0;

SELECT
@CANTIDAD:=@CANTIDAD+1 AS posicion,

    `docentes`.`id`
    , docentes.`tipo_documento`
    ,CONCAT_WS(' ', `docentes`.`nombres`    , `docentes`.`apellidos` ) AS docente
    , `docentes`.`direccion`
    , `docentes`.`barrio`
    , `docentes`.`telefono`
    , `docentes`.`sexo`
 
    , `docentes`.`fecha_nacimiento`
    , `docentes`.`idprofesion`
    , `profesion`.`nombre_profesion`
   
    , `docentes`.`fregistro`
    , `docentes`.`estatus`
FROM
    `docentes`
    INNER JOIN `profesion` 
        ON (`docentes`.`idprofesion` = `profesion`.`profesion_id`);
  
       
 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ESTUDIANTES2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ESTUDIANTES2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ESTUDIANTES2`()
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=0;

SELECT
@CANTIDAD:=@CANTIDAD+1 AS posicion,

    CONCAT_WS(' ',`estudiantes`.`nombres`  , `estudiantes`.`apellidos`) AS estudiante
    , `estudiantes`.`tipo_documento`
    , `estudiantes`.`documento`
    , `estudiantes`.`fecha_nacimiento`
    , `estudiantes`.`sexo`
    , `estudiantes`.`estado_civil`
    , `estudiantes`.`direccion`
    , `estudiantes`.`departamento`
    , `estudiantes`.`ciudad`
    , `estudiantes`.`telefono`
    , `estudiantes`.`tipo_vivienda`
    , `estudiantes`.`estrato`
    , `estudiantes`.`tipo_poblacion`
    , `estudiantes`.`eps`
    , `estudiantes`.`sisben`
    , `estudiantes`.`formacion`
    , `estudiantes`.`ocupacion`
    ,CONCAT_WS(' ',  `matriculas`.`nombre_ref`   , `matriculas`.`apellidos_ref` ) AS referencia
    , `matriculas`.`parentesco`
    , `matriculas`.`direccion_ref`
    , `matriculas`.`telefono_ref`
    , `matriculas`.`correo_ref`
    , `estudiantes`.`fregistro`
    , `estudiantes`.`estatus`
FROM
    `matriculas`
    INNER JOIN `estudiantes` 
        ON (`matriculas`.`documento` = `estudiantes`.`documento`);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_PROGRAMAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_PROGRAMAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROGRAMAS`(IN IDSEDE INT)
SELECT
    `programa`.`programa_id`
    , `programa`.`nombre_programa`
    , `programa`.`idsede`
    , `sedes`.`sede_nombre`
    , `programa`.`fregistro`
    , `programa`.`estatus`
FROM
    `programa`
    INNER JOIN `sedes` 
        ON (`programa`.`idsede` = `sedes`.`sede_id`)
        where `programa`.`idsede` = IDSEDE */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO`()
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=0;

SELECT
@CANTIDAD:=@CANTIDAD+1 AS posicion,
    `usuario`.`usuario_id`
    , `usuario`.`usuario_nombre`
    , `usuario`.`rol_id`
    , `rol`.`nombre_rol`
    , `usuario`.`usuario_estatus`
    , `usuario`.`usuario_email`
    , `usuario`.`usuario_intento`
   
    , `usuario`.`usuario_imagen`
    , `usuario`.`usuario_fregistro`
FROM
    `usuario`
    INNER JOIN `rol` 
        ON (`usuario`.`rol_id` = `rol`.`id`);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MATRICULAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MATRICULAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MATRICULAS`(IN IDPROGRAMA INT, IN IDSEMESTRE INT, IN IDJORNADA INT)
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
        ON (`matriculas`.`idsemestre` = `semestre`.`id`)
        where `matriculas`.`idprograma`   = IDPROGRAMA
         and `matriculas`.`idsemestre`  =IDSEMESTRE
          and `matriculas`.`idjornada` = IDJORNADA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_FOTO_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_FOTO_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FOTO_USUARIO`(IN idusuario INT, IN foto VARCHAR(250))
BEGIN 
UPDATE usuario SET 
usuario_imagen =foto
WHERE usuario_id =idusuario;
SELECT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_PROFESION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_PROFESION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PROFESION`(IN `ID` INT, IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), IN `ESTATUS` VARCHAR(15))
BEGIN
DECLARE CANTIDAD INT;
IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN
	UPDATE `profesion` SET
	`estatus`=ESTATUS
	WHERE `profesion_id` = ID;
SELECT 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM `profesion` WHERE `nombre_profesion`=NOMBRE_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE profesion SET
`estatus`=ESTATUS,
`nombre_profesion`=NOMBRE_NUEVO
WHERE `profesion_id` = ID;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ROL`(IN `IDROL` INT, IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), IN `ESTATUS_ROL` VARCHAR(15))
BEGIN
DECLARE CANTIDAD INT;
IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN
	UPDATE rol SET
	estatus=ESTATUS_ROL
	WHERE id = IDROL;
SELECT 1;
ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE `nombre_rol`=NOMBRE_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE rol SET
estatus=ESTATUS_ROL,
`nombre_rol`=NOMBRE_NUEVO

WHERE id = IDROL;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;



END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_SEDES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_SEDES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_SEDES`(IN `ID` INT, IN `SEDE_ACTUAL` VARCHAR(250),
 IN `SEDE_NUEVO` VARCHAR(250), CIUDAD_EDT VARCHAR(100))
BEGIN
DECLARE CANTIDAD INT;
IF SEDE_ACTUAL = SEDE_NUEVO THEN
    UPDATE sedes SET
sede_ciudad=CIUDAD_EDT
WHERE sede_id = ID;
SELECT 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM sedes WHERE sede_nombre=SEDE_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE sedes SET
sede_nombre=SEDE_NUEVO,
`sede_ciudad`=CIUDAD_EDT
WHERE sede_id = ID;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_Asignatura` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_Asignatura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_Asignatura`(IN `NOMBRE` VARCHAR(50), IN `CANTIDAD_HORAS` VARCHAR(50))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `asignaturas` WHERE `nombre_modulo`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO `asignaturas`(`nombre_modulo`,`cant_horas`, `estatus`)
VALUES (NOMBRE,CANTIDAD_HORAS,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_DOCENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_DOCENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DOCENTE`(IN `CEDULA` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(50), IN `NOMBRES` CHAR(100), IN `APELLIDOS` VARCHAR(200), IN `DIRECCION` CHAR(100), IN `BARRIO` CHAR(100), IN `TELEFONO` VARCHAR(100), IN `SEXO` VARCHAR(100), IN `FECHA_NAC` DATE, IN `IDPROFESION` INT, IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT, IN `CORREO` CHAR(100))
BEGIN
DECLARE  CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);
IF @CANTIDADU = 0 THEN
    SET @CANTIDADME:=(SELECT COUNT(*) FROM docentes WHERE `id` =CEDULA);
    IF @CANTIDADME = 0 THEN
        INSERT INTO usuario(usuario_nombre,usuario_password, rol_id,usuario_estatus,
            usuario_email,usuario_intento)
        VALUES(USUARIO,CONTRASENA, ROL,'INACTIVO',CORREO,0);
        INSERT INTO docentes(`id`,`tipo_documento`,`nombres`,`apellidos`,
        `direccion`, `barrio`, `telefono`,`sexo`,`fecha_nacimiento`,`idprofesion`,
        `idusuario`,`estatus`)
        VALUES(CEDULA,TIPO_DOCUMENTO,NOMBRES,APELLIDOS,DIRECCION,BARRIO,
            TELEFONO,SEXO, FECHA_NAC ,IDPROFESION,
        (SELECT MAX(usuario_id) FROM usuario),'INACTIVO');
        SELECT 1;
    ELSE
    SELECT 2;
    END IF;
    ELSE 
    SELECT 2;
END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ESTUDIANTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ESTUDIANTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ESTUDIANTE`(IN `NOMBRE` VARCHAR(50), IN `APELLIDOS` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(200), IN `NUMERO` CHAR(20), IN `FEC_NAC` DATE, IN `SEXO` VARCHAR(50), IN `ESTADO_CIVIL` VARCHAR(100), IN `DIRECCION` VARCHAR(100), IN `DEPARTAMENTO` VARCHAR(100), IN `CIUDAD` VARCHAR(100), IN `TELEFONO` VARCHAR(100), IN `TIPO_VIVIENDA` VARCHAR(50), IN `ESTRATO` INT, IN `GRUPO_POBLACION` VARCHAR(100), IN `EPS` INT, IN `SISBEN` VARCHAR(100), IN `FORMACION` VARCHAR(200), IN `OCUPACION` VARCHAR(100), IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT, IN `EMAIL` VARCHAR(100), IN `IDSEDE` INT, IN `IDPROGRAMA` INT, IN `IDSEMESTRE` INT, IN `IDJORNADA` INT, IN `FECHA_MAT` DATE, IN `NOMBRE_REF` VARCHAR(100), IN `APELLIDO_REF` VARCHAR(100), IN `PARENTESCO` VARCHAR(100), IN `DIRECCION_REF` VARCHAR(100), IN `TELEFONO_REF` VARCHAR(100), IN `CORREO_REF` VARCHAR(100))
BEGIN
DECLARE  CANTIDADU INT;
DECLARE CANTIDADME INT;
SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);
IF @CANTIDADU = 0 THEN
    SET @CANTIDADME:=(SELECT COUNT(*) FROM estudiantes WHERE documento =NUMERO);
    IF @CANTIDADME = 0 THEN
        INSERT INTO usuario(usuario_nombre,usuario_password, rol_id,usuario_estatus,
            usuario_email,usuario_intento)
        VALUES(USUARIO,CONTRASENA, ROL,'ACTIVO',EMAIL,0);
        INSERT INTO estudiantes(nombres,apellidos,tipo_documento,
        documento, `fecha_nacimiento`, sexo, estado_civil, direccion, `departamento`, ciudad,
        telefono,tipo_vivienda,estrato,tipo_poblacion,eps,`sisben`,
        formacion,ocupacion, `idusuario`,`estatus`)
        VALUES(NOMBRE,APELLIDOS,TIPO_DOCUMENTO,NUMERO,FEC_NAC,SEXO,ESTADO_CIVIL,
            DIRECCION,DEPARTAMENTO,CIUDAD,TELEFONO,
            TIPO_VIVIENDA,ESTRATO,GRUPO_POBLACION,EPS,SISBEN, FORMACION,OCUPACION
           ,
        (SELECT MAX(usuario_id) FROM usuario),'ACTIVO');
		
		INSERT INTO matriculas(documento,idsede,`idprograma`,
            idsemestre,idjornada,`fecha_ingreso`,`nombre_ref`,`apellidos_ref`,`parentesco`,`direccion_ref`,`telefono_ref`,`correo_ref`,`estatus`)
		VALUES (NUMERO,IDSEDE,IDPROGRAMA,IDSEMESTRE,IDJORNADA, 
		FECHA_MAT,NOMBRE_REF,APELLIDO_REF,PARENTESCO,DIRECCION_REF,TELEFONO_REF,CORREO_REF,'MATRICULADO');
        SELECT 1;
    ELSE
    SELECT 2;
    END IF;
    ELSE 
    SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_JORNADA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_JORNADA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_JORNADA`(IN `NOMBRE` VARCHAR(200))
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `jornada` WHERE `nombre_jornada` = NOMBRE);
IF @CANTIDAD = 0 THEN
INSERT INTO `jornada` (`nombre_jornada`, `estatus`)
VALUES (NOMBRE,'ACTIVO');
SELECT 1;
ELSE
SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PROFESION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PROFESION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROFESION`(IN NOMBRE VARCHAR(50))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM `profesion` WHERE `nombre_profesion`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO profesion(`nombre_profesion`,`estatus`)
VALUES (NOMBRE,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PROGRAMA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PROGRAMA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROGRAMA`( IN `NOM_PROGRAMA` VARCHAR(100),IN `IDSEDE` INT)
BEGIN

INSERT INTO programa(`nombre_programa`,`idsede`, estatus)
VALUES (NOM_PROGRAMA,IDSEDE,'ACTIVO');

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ROL`(IN NOMBRE VARCHAR(50))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE `nombre_rol`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO rol(`nombre_rol`,`estatus`)
VALUES (NOMBRE,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_SEDES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_SEDES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_SEDES`(IN `NOMBRE` VARCHAR(50), IN `NOM_CIUDAD` VARCHAR(100))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM sedes WHERE `sede_nombre`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO sedes(`sede_nombre`,`sede_ciudad`,estatus)
VALUES (NOMBRE,NOM_CIUDAD,'ACTIVO');
SELECT 1;
 ELSE 
 SELECT 2;
 END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(100), 
IN PASS VARCHAR(250),IN IDROL INT, IN CORREO VARCHAR(100), IN SEXO CHAR(5),
 IN RUTA VARCHAR(255))
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO 
OR usuario_email =CORREO);
IF @CANTIDAD =0 THEN
INSERT INTO `usuario` (`usuario_nombre`,`usuario_password`,`rol_id`,`usuario_estatus`,`usuario_email`, `usuario_intento`,   
`usuario_imagen`) VALUES(USUARIO,PASS,IDROL,'ACTIVO',CORREO,0,RUTA);
SELECT 1;
ELSE 
SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_TRAER_DATOS_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_TRAER_DATOS_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN `ID` INT)
SELECT
    `usuario`.`usuario_id`
    , `usuario`.`usuario_nombre`
    , `usuario`.`usuario_password`
    , `usuario`.`rol_id`
    , `rol`.`nombre_rol`
    , `usuario`.`usuario_estatus`
    , `usuario`.`usuario_email`
    , `usuario`.`usuario_intento`
    ,usuario.usuario_sexo
    , `usuario`.`usuario_imagen`
    , `usuario`.`usuario_fregistro`
FROM
    `usuario`
    INNER JOIN `rol` 
        ON (`usuario`.`rol_id` = `rol`.`id`)
        where `usuario_id` =ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_VERIFICAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_VERIFICAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO varchar(50))
select * from usuario 
where usuario_nombre =USUARIO */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
