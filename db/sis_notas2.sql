/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : sis_notas2

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 02/01/2022 16:28:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asignaturas
-- ----------------------------
DROP TABLE IF EXISTS `asignaturas`;
CREATE TABLE `asignaturas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_modulo` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cant_horas` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asignaturas
-- ----------------------------
INSERT INTO `asignaturas` VALUES (1, 'Introduccion a la universidad', '10', '2021-10-11 11:43:03', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (2, 'Programacion I', '10', '2021-10-11 15:51:38', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (3, 'base dedatos', '4', '2021-10-11 12:02:58', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (4, 'ingles', '4', '2021-10-11 12:03:00', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (5, 'ingles II', '4', '2021-10-11 12:03:03', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (6, 'Desarrollo de software', '5', '2021-10-11 12:37:02', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (7, 'JAVA 2', '12', '2021-10-11 12:36:59', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (8, 'Logistica I', '5', '2021-10-11 12:37:06', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (9, 'PROGRAMACION', '5', '2021-10-11 12:34:04', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (10, 'INGLES 3', '15', '2021-10-11 12:34:28', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (11, 'Diseño web', '20', '2021-10-11 15:50:45', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (12, 'Matematicas 1', '5', '2021-10-17 13:29:58', NULL);
INSERT INTO `asignaturas` VALUES (13, 'Arquitectura del pc', '5', '2021-11-26 19:33:11', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (14, 'Diseño 1', '20', '2021-10-17 16:50:18', 'ACTIVO');
INSERT INTO `asignaturas` VALUES (15, 'Matematicas II', '20', '2021-11-26 19:33:00', 'ACTIVO');

-- ----------------------------
-- Table structure for calificaciones
-- ----------------------------
DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE `calificaciones`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idMatricula` int NOT NULL,
  `idasignatura` int NULL DEFAULT NULL,
  `nota` double NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('CALIFICADO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idasignatura`(`idasignatura`) USING BTREE,
  INDEX `idMatricula`(`idMatricula`) USING BTREE,
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`idasignatura`) REFERENCES `asignaturas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`idMatricula`) REFERENCES `matriculas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calificaciones
-- ----------------------------
INSERT INTO `calificaciones` VALUES (1, 7, 1, 4.3, '2021-12-16 08:14:59', 'CALIFICADO');
INSERT INTO `calificaciones` VALUES (2, 3, 1, 4, '2021-12-30 20:07:19', NULL);
INSERT INTO `calificaciones` VALUES (3, 3, 1, 5, '2021-12-30 20:07:26', NULL);
INSERT INTO `calificaciones` VALUES (4, 4, 1, 3.6, '2021-12-30 20:08:09', NULL);
INSERT INTO `calificaciones` VALUES (5, 4, 1, 3.7, '2021-12-30 20:08:19', NULL);
INSERT INTO `calificaciones` VALUES (6, 4, 1, 2, '2021-12-30 20:08:24', NULL);
INSERT INTO `calificaciones` VALUES (7, 9, 8, 3.6, '2021-12-30 20:14:14', NULL);
INSERT INTO `calificaciones` VALUES (8, 9, 8, 3.8, '2021-12-30 20:14:21', NULL);
INSERT INTO `calificaciones` VALUES (9, 9, 8, 3.6, '2021-12-30 20:14:26', NULL);
INSERT INTO `calificaciones` VALUES (10, 9, 8, 1, '2021-12-30 20:14:30', NULL);
INSERT INTO `calificaciones` VALUES (11, 9, 8, 5, '2021-12-30 20:14:33', NULL);

-- ----------------------------
-- Table structure for distribucion_modulo
-- ----------------------------
DROP TABLE IF EXISTS `distribucion_modulo`;
CREATE TABLE `distribucion_modulo`  (
  `idprograma` int NOT NULL,
  `idasignatura` int NOT NULL,
  `idsemestre` int NOT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ASIGNADO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'ASIGNADO',
  INDEX `distribucion_modulo_ibfk_1`(`idasignatura`) USING BTREE,
  INDEX `distribucion_modulo_ibfk_3`(`idsemestre`) USING BTREE,
  INDEX `idprograma`(`idprograma`) USING BTREE,
  CONSTRAINT `distribucion_modulo_ibfk_1` FOREIGN KEY (`idprograma`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `distribucion_modulo_ibfk_2` FOREIGN KEY (`idasignatura`) REFERENCES `asignaturas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `distribucion_modulo_ibfk_4` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of distribucion_modulo
-- ----------------------------
INSERT INTO `distribucion_modulo` VALUES (1, 1, 1, '2021-10-17 14:52:50', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (2, 4, 1, '2021-10-17 14:52:53', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (2, 5, 2, '2021-10-17 14:52:55', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (6, 2, 1, '2021-10-17 14:53:03', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (6, 3, 2, '2021-10-17 13:13:51', NULL);
INSERT INTO `distribucion_modulo` VALUES (6, 7, 3, '2021-10-17 13:14:05', NULL);
INSERT INTO `distribucion_modulo` VALUES (6, 4, 1, '2021-10-17 13:30:55', NULL);
INSERT INTO `distribucion_modulo` VALUES (6, 12, 1, '2021-10-17 13:31:18', NULL);
INSERT INTO `distribucion_modulo` VALUES (6, 14, 1, '2021-10-17 13:31:34', NULL);
INSERT INTO `distribucion_modulo` VALUES (6, 10, 1, '2021-10-17 14:01:02', NULL);
INSERT INTO `distribucion_modulo` VALUES (6, 7, 2, '2021-10-17 14:01:19', NULL);
INSERT INTO `distribucion_modulo` VALUES (2, 1, 1, '2021-10-17 20:59:22', NULL);
INSERT INTO `distribucion_modulo` VALUES (2, 8, 3, '2021-10-17 21:01:09', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (2, 10, 4, '2021-10-17 21:04:49', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (10, 1, 1, '2021-10-18 16:18:30', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (6, 9, 3, '2021-11-26 19:26:25', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (5, 14, 4, '2021-11-26 19:56:22', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (5, 3, 3, '2021-12-16 10:06:22', 'ASIGNADO');
INSERT INTO `distribucion_modulo` VALUES (13, 15, 1, '2021-12-30 20:20:16', 'ASIGNADO');

-- ----------------------------
-- Table structure for distribucion_programas
-- ----------------------------
DROP TABLE IF EXISTS `distribucion_programas`;
CREATE TABLE `distribucion_programas`  (
  `idPrograma` int NOT NULL,
  `idDocente` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estatus` enum('ASIGNADO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'ASIGNADO',
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `idDocente`(`idDocente`) USING BTREE,
  INDEX `idPrograma`(`idPrograma`) USING BTREE,
  CONSTRAINT `distribucion_programas_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `distribucion_programas_ibfk_2` FOREIGN KEY (`idPrograma`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of distribucion_programas
-- ----------------------------
INSERT INTO `distribucion_programas` VALUES (6, '1070813753', 'ASIGNADO', '2021-10-18 14:51:55');
INSERT INTO `distribucion_programas` VALUES (3, '1234567812', 'ASIGNADO', '2021-10-18 14:51:55');
INSERT INTO `distribucion_programas` VALUES (1, '2345454545', 'ASIGNADO', '2021-10-18 14:51:55');
INSERT INTO `distribucion_programas` VALUES (4, '10478977776', 'ASIGNADO', '2021-10-18 15:18:08');
INSERT INTO `distribucion_programas` VALUES (2, '1070813753', NULL, '2021-10-18 15:17:55');
INSERT INTO `distribucion_programas` VALUES (10, '1047897777', 'ASIGNADO', '2021-10-19 14:10:48');
INSERT INTO `distribucion_programas` VALUES (12, '10478977776', 'ASIGNADO', '2021-11-26 19:53:10');
INSERT INTO `distribucion_programas` VALUES (10, '10478977776', 'ASIGNADO', '2021-11-26 19:54:48');

-- ----------------------------
-- Table structure for docentes
-- ----------------------------
DROP TABLE IF EXISTS `docentes`;
CREATE TABLE `docentes`  (
  `id` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipo_documento` enum('CEDULA','PASAPORTE','TI') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombres` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `direccion` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barrio` char(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telefono` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sexo` enum('MASCULINO','FEMENINO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `idprofesion` int NULL DEFAULT NULL,
  `idusuario` int NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `docentes_ibfk_1`(`idusuario`) USING BTREE,
  INDEX `idprofesion`(`idprofesion`) USING BTREE,
  CONSTRAINT `docentes_ibfk_3` FOREIGN KEY (`idprofesion`) REFERENCES `profesion` (`profesion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `docentes_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of docentes
-- ----------------------------
INSERT INTO `docentes` VALUES ('1047897777', 'CEDULA', 'ANA', 'DOMINGUEZ', 'KRA 23', 'cartagena', '1321321321', 'FEMENINO', '2000-02-19', 2, 28, '2021-10-19 13:48:57', 'ACTIVO');
INSERT INTO `docentes` VALUES ('10478977776', 'CEDULA', 'DENIS', 'hernandez', 'KRA 45', 'cartagena', '1321321321', 'MASCULINO', '2021-10-01', 1, 11, '2021-10-08 18:30:08', 'ACTIVO');
INSERT INTO `docentes` VALUES ('1070813753', 'CEDULA', 'JERSON ', 'BATISTA', 'KRA 45', 'CENTRO', '3014587777', 'MASCULINO', '1989-06-14', 1, 1, '2021-10-08 18:30:16', 'ACTIVO');
INSERT INTO `docentes` VALUES ('1234567812', 'CEDULA', 'KAREN', 'hernandez', 'KRA 45', 'FDFSD', '1321321321', 'FEMENINO', '2021-10-09', 4, 12, '2021-11-27 09:50:37', 'ACTIVO');
INSERT INTO `docentes` VALUES ('12578888888', 'CEDULA', 'DIANA SOFIA', 'GARCIA', 'EL CARMEN DE BOLIVAR', 'cartagena', '1321321321', 'FEMENINO', '2021-12-28', 2, 30, '2021-12-29 13:21:47', 'INACTIVO');
INSERT INTO `docentes` VALUES ('2345454545', 'CEDULA', 'pedro', 'BATISTA', 'YTYT', 'centro', '565', 'MASCULINO', '0000-00-00', 1, 10, '2021-10-08 18:30:21', 'INACTIVO');
INSERT INTO `docentes` VALUES ('45789963', 'CEDULA', 'DENIS', 'BATISTA', 'KRA 45', 'cartagena', '1321321321', 'MASCULINO', '2021-09-30', 3, 29, '2021-10-22 20:24:19', 'INACTIVO');

-- ----------------------------
-- Table structure for estudiantes
-- ----------------------------
DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE `estudiantes`  (
  `nombres` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_documento` enum('CEDULA','TI','REGISTRO_CIVIL','PASAPORTE') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `documento` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `sexo` enum('MASCULINO','FEMENINO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado_civil` enum('CASADO','SOLTERO','CASADA','SOLTERA','UNION_LIBRE','VIUDO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `departamento` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telefono` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_vivienda` enum('PROPIA','FAMILIAR','ALQUILADA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estrato` int NULL DEFAULT NULL,
  `tipo_poblacion` enum('AFRO','RAIZAL','INDIGENA','DESPLAZADO','OTRO') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eps` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sisben` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `formacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ocupacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idusuario` int NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`documento`) USING BTREE,
  INDEX `idusuario`(`idusuario`) USING BTREE,
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estudiantes
-- ----------------------------
INSERT INTO `estudiantes` VALUES ('Jerson', 'Batista', 'CEDULA', '104787777', '1999-02-10', 'MASCULINO', 'CASADO', 'k56', 'BOLIVAR', 'carmen de bolivar', '32132132132', 'ALQUILADA', 1, 'DESPLAZADO', 'MUTUAL', '1', 'estudiante', 'desempleado', 1, NULL, '2021-10-10 18:43:57', 'ACTIVO');
INSERT INTO `estudiantes` VALUES ('JAIMITO', 'Batista', 'CEDULA', '123456789', '2021-10-11', 'MASCULINO', 'CASADO', 'KRA 45', 'BOLIVAR', 'CARMEN DE BOLIVAR', '123132132132', 'PROPIA', 1, 'DESPLAZADO', 'FAMISAR', '2', 'administrador', 'administrador', 25, NULL, '2021-12-28 14:44:01', 'ACTIVO');
INSERT INTO `estudiantes` VALUES ('PROVEEDOR', 'Vega', 'CEDULA', '12451245', '2021-10-11', 'MASCULINO', 'SOLTERO', 'KRA 45', 'BOLIVAR', 'CARMEN DE BOLIVAR', '123132132132', 'PROPIA', 1, 'AFRO', 'MUTUAL', '2', 'administrador', 'administrador', 24, NULL, '2021-12-28 14:41:59', 'ACTIVO');
INSERT INTO `estudiantes` VALUES ('ALCIRA', 'VEGA', 'CEDULA', '321654987', '2021-10-11', 'FEMENINO', 'SOLTERA', 'BOGOTA', 'BOLIVAR', 'CARMEN DE BOLIVAR', '123132132132', 'FAMILIAR', 1, 'DESPLAZADO', 'MUTUAL', '2', 'administrador', 'administrador', 26, NULL, '2021-12-28 14:40:43', 'ACTIVO');
INSERT INTO `estudiantes` VALUES ('PRUEBA', 'BATISTA', 'CEDULA', '32323', '2021-10-11', 'MASCULINO', 'SOLTERO', 'el centro', 'BOLIVAR', 'SAN JACINTO', '565666', 'PROPIA', 1, 'AFRO', 'NUEVA EPS', '1', 'Comerciante', 'Comerciante', 22, NULL, '2021-12-28 09:02:32', 'ACTIVO');
INSERT INTO `estudiantes` VALUES ('JUAN', 'VEGA', 'CEDULA', '3256325698', '2021-10-17', 'MASCULINO', 'SOLTERO', 'KRA 45', 'BOLIVAR', 'CARMEN DE BOLIVAR', '123132132132', 'PROPIA', 1, 'AFRO', 'NUEVA EPS', '1', 'administrador', 'administrador', 27, NULL, '2021-12-28 14:43:02', 'ACTIVO');
INSERT INTO `estudiantes` VALUES ('KAREN', 'Tovar', 'CEDULA', '986532544', '2021-12-30', 'FEMENINO', 'CASADA', 'KRA 45', 'BOLIVAR', 'CARMEN DE BOLIVAR', '123132132132', 'PROPIA', 1, 'AFRO', '0', '1', 'administrador', 'administrador', 31, NULL, '2021-12-30 20:13:28', 'ACTIVO');

-- ----------------------------
-- Table structure for jornada
-- ----------------------------
DROP TABLE IF EXISTS `jornada`;
CREATE TABLE `jornada`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_jornada` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jornada
-- ----------------------------
INSERT INTO `jornada` VALUES (2, 'Mañana', '2021-10-10 12:31:06', 'ACTIVO');
INSERT INTO `jornada` VALUES (3, 'Virtual', '2021-10-18 16:17:07', 'ACTIVO');
INSERT INTO `jornada` VALUES (4, 'Tarde', '2021-10-10 12:40:04', 'ACTIVO');
INSERT INTO `jornada` VALUES (5, 'Sabatina', '2021-10-18 16:16:10', 'ACTIVO');
INSERT INTO `jornada` VALUES (6, 'Dominical', '2021-10-18 16:16:19', 'ACTIVO');
INSERT INTO `jornada` VALUES (7, 'Nocturna', '2021-10-18 16:16:27', 'ACTIVO');

-- ----------------------------
-- Table structure for matriculas
-- ----------------------------
DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE `matriculas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idsede` int NULL DEFAULT NULL,
  `idprograma` int NOT NULL,
  `idsemestre` int NULL DEFAULT NULL,
  `idjornada` int NULL DEFAULT NULL,
  `fecha_ingreso` date NULL DEFAULT NULL,
  `nombre_ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apellidos_ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parentesco` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `direccion_ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telefono_ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `correo_ref` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('MATRICULADO','RETIRADO','GRADUADO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idprograma`(`idprograma`) USING BTREE,
  INDEX `documento`(`documento`) USING BTREE,
  INDEX `idsemestre`(`idsemestre`) USING BTREE,
  INDEX `idsede`(`idsede`) USING BTREE,
  INDEX `idjornada`(`idjornada`) USING BTREE,
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`idprograma`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`documento`) REFERENCES `estudiantes` (`documento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `matriculas_ibfk_4` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`sede_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `matriculas_ibfk_5` FOREIGN KEY (`idjornada`) REFERENCES `jornada` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of matriculas
-- ----------------------------
INSERT INTO `matriculas` VALUES (3, '32323', 1, 1, 1, 2, '2021-10-11', 'Pedro Vega', 'vega', 'padre', 'tyr', '556', 'mmm2221@gmail.com', '2021-10-11 08:40:40', 'MATRICULADO');
INSERT INTO `matriculas` VALUES (4, '12451245', 1, 1, 1, 2, '2021-10-11', 'fran', 'vega', 'probando', 'probando', '1321321321', 'probando1111@gmail.om', '2021-10-11 09:23:58', 'MATRICULADO');
INSERT INTO `matriculas` VALUES (5, '123456789', 2, 6, 1, 4, '2021-10-11', 'probando', 'probando', 'probando', 'probando', '45345', 'probando121212114455@gmail.om', '2021-10-11 11:39:35', 'MATRICULADO');
INSERT INTO `matriculas` VALUES (6, '104787777', 2, 5, 2, 2, '2021-10-01', 'JUAN', 'JUAN', 'PADRE', 'XX', '555555', NULL, '2021-10-11 11:41:53', 'MATRICULADO');
INSERT INTO `matriculas` VALUES (7, '321654987', 2, 2, 1, 4, '2021-10-11', 'probando', 'probando', 'padre', 'probando', 'probando', 'probando', '2021-10-11 14:52:27', 'MATRICULADO');
INSERT INTO `matriculas` VALUES (8, '3256325698', 1, 1, 1, 4, '2021-10-17', 'probando', 'probando', 'probando', 'probando', '32544444', 'probando12121212121111@gmail.om', '2021-10-17 11:33:30', 'MATRICULADO');
INSERT INTO `matriculas` VALUES (9, '986532544', 2, 2, 3, 3, '2021-12-30', 'JOSEFA', 'vega', 'padre', '3434', '1321321321', 'probando12121212E121@gmail.om', '2021-12-30 20:13:29', 'MATRICULADO');

-- ----------------------------
-- Table structure for profesion
-- ----------------------------
DROP TABLE IF EXISTS `profesion`;
CREATE TABLE `profesion`  (
  `profesion_id` int NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`profesion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profesion
-- ----------------------------
INSERT INTO `profesion` VALUES (1, 'Ingeniero de sistemas', '2021-10-07 00:00:00', 'ACTIVO');
INSERT INTO `profesion` VALUES (2, 'Medico Profesional', '2021-10-07 15:49:53', 'ACTIVO');
INSERT INTO `profesion` VALUES (3, 'Mecánico', '2021-10-08 10:04:36', 'ACTIVO');
INSERT INTO `profesion` VALUES (4, 'Psicologo', '2021-10-09 11:51:33', 'ACTIVO');

-- ----------------------------
-- Table structure for programa
-- ----------------------------
DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa`  (
  `programa_id` int NOT NULL AUTO_INCREMENT,
  `nombre_programa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idsede` int NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`programa_id`) USING BTREE,
  INDEX `idsede`(`idsede`) USING BTREE,
  CONSTRAINT `programa_ibfk_1` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`sede_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES (1, 'Aux de Enfermeria', 1, '2021-10-06 12:14:01', 'ACTIVO');
INSERT INTO `programa` VALUES (2, 'Caja  Registradora', 2, '2021-10-06 12:14:41', 'ACTIVO');
INSERT INTO `programa` VALUES (3, 'Caja Registradora ', 1, '2021-10-06 12:14:59', 'ACTIVO');
INSERT INTO `programa` VALUES (4, 'desarrollo web', 1, '2021-10-06 14:10:00', 'ACTIVO');
INSERT INTO `programa` VALUES (5, 'Diseño Grafico', 1, '2021-10-07 08:51:22', 'ACTIVO');
INSERT INTO `programa` VALUES (6, 'Desarrollo de software', 2, '2021-10-06 15:00:15', 'ACTIVO');
INSERT INTO `programa` VALUES (10, 'Atencion Primera Infancia', 1, '2021-10-18 16:12:46', 'ACTIVO');
INSERT INTO `programa` VALUES (12, 'Atencion Primera Infancia', 2, '2021-10-18 16:14:40', 'ACTIVO');
INSERT INTO `programa` VALUES (13, 'Mecanica', 1, '2021-12-30 20:18:57', 'ACTIVO');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nombre_rol`(`nombre_rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'Administrador', '2021-10-04 18:48:07', 'ACTIVO');
INSERT INTO `rol` VALUES (2, 'Docente', '2021-10-04 19:31:51', 'ACTIVO');
INSERT INTO `rol` VALUES (3, 'Estudiante', '2021-10-05 09:10:11', 'ACTIVO');
INSERT INTO `rol` VALUES (4, 'Coordinador', '2021-10-05 09:09:49', 'ACTIVO');

-- ----------------------------
-- Table structure for sedes
-- ----------------------------
DROP TABLE IF EXISTS `sedes`;
CREATE TABLE `sedes`  (
  `sede_id` int NOT NULL AUTO_INCREMENT,
  `sede_nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sede_ciudad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sede_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sedes
-- ----------------------------
INSERT INTO `sedes` VALUES (1, 'SEDE PRINCIPAL', 'CARMEN DE BOLIVAR', '2021-10-06 08:15:03', 'ACTIVO');
INSERT INTO `sedes` VALUES (2, 'SEDE NO 2', 'SAN JACINTO', '2021-10-06 12:01:02', 'ACTIVO');

-- ----------------------------
-- Table structure for semestre
-- ----------------------------
DROP TABLE IF EXISTS `semestre`;
CREATE TABLE `semestre`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of semestre
-- ----------------------------
INSERT INTO `semestre` VALUES (1, 'I', '2021-10-08 13:53:49', 'ACTIVO');
INSERT INTO `semestre` VALUES (2, 'II', '2021-10-08 13:53:51', 'ACTIVO');
INSERT INTO `semestre` VALUES (3, 'III', '2021-10-11 12:39:16', 'ACTIVO');
INSERT INTO `semestre` VALUES (4, 'IV', '2021-10-08 13:54:06', 'ACTIVO');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario_password` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rol_id` int NULL DEFAULT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario_intento` int NULL DEFAULT NULL,
  `usuario_imagen` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usuario_fregistro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`usuario_id`) USING BTREE,
  UNIQUE INDEX `usuario_nombre`(`usuario_nombre`) USING BTREE,
  UNIQUE INDEX `usuario_email`(`usuario_email`) USING BTREE,
  INDEX `rol_id`(`rol_id`) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 'admin', '$2y$10$sjwjZzTM9eD6Y6SWWDwe3uCg.tyn5x0oaa6bgF.aADk/./6hF87Qq', 1, 'ACTIVO', 'ingjerson@gmail.com', 0, 'controlador/usuario/img/IMG810202175644.jpg', '2021-10-08 07:56:45');
INSERT INTO `usuario` VALUES (10, 'probando222', '123', 2, 'INACTIVO', 'probando@gmail.com', 0, NULL, '2021-10-08 09:48:34');
INSERT INTO `usuario` VALUES (11, 'admin45', '$2y$10$b1/c9KCgmQRrtwY2r5ia7uW6XNVIRO8RlsUz.l1Ga2jWB2DsbrCGG', 2, 'ACTIVO', 'prueba21@gmail.com', 0, 'controlador/usuario/img/IMG26112021194249.jpeg', '2021-11-26 19:42:50');
INSERT INTO `usuario` VALUES (12, 'karen3221', '$2y$10$oCe4olE4W9aD0.QJsxPIK.H6k4I8Gh4dd7oj45lP08NtUJ4l87iO6', 3, 'INACTIVO', 'prueba201111@gmail.com', 0, NULL, '2021-10-09 12:11:57');
INSERT INTO `usuario` VALUES (21, 'probando20023232', '123', 3, 'ACTIVO', 'prueba3234234@gmail.com', 0, NULL, '2021-10-10 22:06:46');
INSERT INTO `usuario` VALUES (22, '523652365', '123', 3, 'ACTIVO', 'prueba324@gmail.com', 0, NULL, '2021-10-11 08:40:40');
INSERT INTO `usuario` VALUES (24, '12451245', '$2y$10$p0MmjWpWt6Tm54dYlTUBmOEXGUHX/eGuO99D12.7e5XQbw8eaw0YC', 3, 'ACTIVO', 'prueba2011@gmail.com', 0, NULL, '2021-10-11 09:23:58');
INSERT INTO `usuario` VALUES (25, '123456789', '$2y$10$Mmv65gS3ts8.Jk3to0Th0OizCls31tKCl8FHMRttp7XErAsOKcMZ.', 3, 'ACTIVO', 'prueba2033@gmail.com', 0, NULL, '2021-10-11 11:39:34');
INSERT INTO `usuario` VALUES (26, '321654987', '$2y$10$TZ9AbCFl/5BxV0ayKYCvmO/SyVIhtk0PT2y0Cl9k3qL/111PaD8Xe', 3, 'ACTIVO', 'denis321654987@gmail.com', 0, NULL, '2021-10-11 14:52:27');
INSERT INTO `usuario` VALUES (27, '3256325698', '$2y$10$ew1jGxMSibGfHu7mXx/eTeTQrq08eHhs2sBX9YsjIK7W8m2WvHvoq', 3, 'ACTIVO', 'JUAN@GMAIL.COM', 0, NULL, '2021-10-17 11:33:30');
INSERT INTO `usuario` VALUES (28, '1047897777', '$2y$10$z6WQwO2IPGdTD.CPYl46lOYoecipz.zBOcXNBOd9xWMJwiB1ZZc4O', 2, 'ACTIVO', '1047897777@GMAIL.COM', 0, NULL, '2021-10-22 20:23:15');
INSERT INTO `usuario` VALUES (29, '45789963', '$2y$10$Wu2dWhWzIau937oBsi3tCeE2IRaF6asDgZcGASSESeK9Jf9ivz1pu', 2, 'ACTIVO', 'denis12365@gmail.com', 0, NULL, '2021-10-22 20:24:52');
INSERT INTO `usuario` VALUES (30, 'dianag123', '$2y$10$u/9e/JP4Njkpbii3UrYZpeC89qCf.Nyo1Y5iu85IZrJcLytYmySIa', 2, 'INACTIVO', 'diana2015@gmail.com', 0, NULL, '2021-12-28 20:46:17');
INSERT INTO `usuario` VALUES (31, '986532544', '$2y$10$iJKt.rHRI/e4XKZoE9A9teH.HFcawZ68YlSoPVa07ik/T0uFZ/pHa', 3, 'ACTIVO', 'prueba21TTT@gmail.com', 0, NULL, '2021-12-30 20:13:28');

-- ----------------------------
-- Procedure structure for SP_EDITAR_DOCENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_DOCENTE`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_DOCENTE`(IN IDDOCENTE VARCHAR(50),IN TIPO_DOC VARCHAR(50),IN NOMBRES VARCHAR(100),
IN APELLIDOS VARCHAR(100),IN DIRECCION VARCHAR(100),IN BARRIO VARCHAR(100),IN TELEFONO VARCHAR(100),IN SEXO_DOC VARCHAR(50),IN FECHA_NAC DATE,IN IDPROFESION INT)
update docentes set
tipo_documento=TIPO_DOC,
nombres =NOMBRES,
apellidos=APELLIDOS,
docentes.direccion =DIRECCION,
docentes.barrio =BARRIO,
docentes.telefono = TELEFONO,
docentes.sexo =SEXO_DOC,
docentes.fecha_nacimiento = FECHA_NAC,
docentes.idprofesion = IDPROFESION 
where  id =IDDOCENTE
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_EDITAR_ESTUDIANTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTUDIANTE`;
delimiter ;;
CREATE PROCEDURE `SP_EDITAR_ESTUDIANTE`(IN IDESTUDIANTE VARCHAR(50),IN NOMBRE VARCHAR(100),
IN APELLIDOS VARCHAR(100),IN TIPO_DOC VARCHAR(50),
IN FECHA_NAC DATE,IN SEXO_EST VARCHAR(50),IN ESTADO_CIVIL VARCHAR(100),IN DIRECCION VARCHAR(100),IN DEPARTAMENTO VARCHAR(100),IN CIUDAD VARCHAR(100),IN TELEFONO VARCHAR(100),
IN TIPO_VIVIENDA VARCHAR(100),IN ESTRATO INT,
IN GRUPO_POBLACION VARCHAR(100),IN EPS_NOMBRE VARCHAR(100),
IN SISBEN VARCHAR(100),IN FORMACION VARCHAR(100),
IN OCUPACION VARCHAR(100))
update estudiantes set
nombres =NOMBRE,
apellidos=APELLIDOS,
tipo_documento=TIPO_DOC,
estudiantes.fecha_nacimiento =FECHA_NAC,
estudiantes.sexo =SEXO_EST,
estudiantes.estado_civil =ESTADO_CIVIL,
estudiantes.direccion =DIRECCION,
estudiantes.departamento =DEPARTAMENTO,
estudiantes.ciudad =CIUDAD,
estudiantes.telefono =TELEFONO,
estudiantes.tipo_vivienda =TIPO_VIVIENDA,
estudiantes.estrato =ESTRATO,
estudiantes.tipo_poblacion =GRUPO_POBLACION,
estudiantes.eps =EPS_NOMBRE,
estudiantes.sisben =SISBEN,
estudiantes.formacion = FORMACION,
estudiantes.ocupacion =OCUPACION
where  documento =IDESTUDIANTE
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_COMBO_PROGRAMAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PROGRAMAS`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_COMBO_PROGRAMAS`(IN IDSEDE INT)
select `programa_id`, `nombre_programa` from programa
where `programa`.`idsede`=IDSEDE
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DISTRI_MODULOS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DISTRI_MODULOS`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DISTRI_MODULOS`(IN `IDPROGRAMA` INT, IN `IDSEMESTRE` INT)
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
        order by  pr.`nombre_programa`,    `nombre_modulo` asc
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_DOCENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_DOCENTE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_DOCENTE`()
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
  
       
 END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_ESTUDIANTES2
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_ESTUDIANTES2`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_ESTUDIANTES2`()
SELECT
    `estudiantes`.`nombres`  , `estudiantes`.`apellidos`    , `estudiantes`.`tipo_documento`
    , `estudiantes`.`documento`    , `estudiantes`.`fecha_nacimiento`
    , `estudiantes`.`sexo`    , `estudiantes`.`estado_civil`
    , `estudiantes`.`direccion`    , `estudiantes`.`departamento`
    , `estudiantes`.`ciudad`    , `estudiantes`.`telefono`
    , `estudiantes`.`tipo_vivienda`    , `estudiantes`.`estrato`
    , `estudiantes`.`tipo_poblacion`    , `estudiantes`.`eps`
    , `estudiantes`.`sisben`    , `estudiantes`.`formacion`
    , `estudiantes`.`ocupacion`		,matriculas.fecha_ingreso
    ,  `matriculas`.`nombre_ref`   , `matriculas`.`apellidos_ref` 
    , `matriculas`.`parentesco`     , `matriculas`.`direccion_ref`
    , `matriculas`.`telefono_ref`    , `matriculas`.`correo_ref`
    , `estudiantes`.`fregistro`    , `estudiantes`.`estatus`
FROM
    `matriculas`
    INNER JOIN `estudiantes`         ON (`matriculas`.`documento` = `estudiantes`.`documento`)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_PROGRAMAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_PROGRAMAS`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_PROGRAMAS`(IN IDSEDE INT)
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
        where `programa`.`idsede` = IDSEDE
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_USUARIO`()
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MATRICULAS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MATRICULAS`;
delimiter ;;
CREATE PROCEDURE `SP_MATRICULAS`(IN IDPROGRAMA INT, IN IDSEMESTRE INT, IN IDJORNADA INT)
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
          and `matriculas`.`idjornada` = IDJORNADA
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_FOTO_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_FOTO_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_FOTO_USUARIO`(IN idusuario INT, IN foto VARCHAR(250))
BEGIN 
UPDATE usuario SET 
usuario_imagen =foto
WHERE usuario_id =idusuario;
SELECT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_PROFESION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PROFESION`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_PROFESION`(IN `ID` INT, IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), IN `ESTATUS` VARCHAR(15))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_ROL`(IN `IDROL` INT, IN `NOMBRE_ACTUAL` VARCHAR(250), IN `NOMBRE_NUEVO` VARCHAR(250), IN `ESTATUS_ROL` VARCHAR(15))
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



END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_SEDES
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_SEDES`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_SEDES`(IN `ID` INT, IN `SEDE_ACTUAL` VARCHAR(250),
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_Asignatura
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_Asignatura`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_Asignatura`(IN `NOMBRE` VARCHAR(50), IN `CANTIDAD_HORAS` VARCHAR(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_DOCENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DOCENTE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_DOCENTE`(IN `CEDULA` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(50), IN `NOMBRES` CHAR(100), IN `APELLIDOS` VARCHAR(200), IN `DIRECCION` CHAR(100), IN `BARRIO` CHAR(100), IN `TELEFONO` VARCHAR(100), IN `SEXO` VARCHAR(100), IN `FECHA_NAC` DATE, IN `IDPROFESION` INT, IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT, IN `CORREO` CHAR(100))
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

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ESTUDIANTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ESTUDIANTE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_ESTUDIANTE`(IN `NOMBRE` VARCHAR(50), IN `APELLIDOS` VARCHAR(50), IN `TIPO_DOCUMENTO` VARCHAR(200), IN `NUMERO` CHAR(20), IN `FEC_NAC` DATE, IN `SEXO` VARCHAR(50), IN `ESTADO_CIVIL` VARCHAR(100), IN `DIRECCION` VARCHAR(100), IN `DEPARTAMENTO` VARCHAR(100), IN `CIUDAD` VARCHAR(100), IN `TELEFONO` VARCHAR(100), IN `TIPO_VIVIENDA` VARCHAR(50), IN `ESTRATO` INT, IN `GRUPO_POBLACION` VARCHAR(100), IN `EPS` INT, IN `SISBEN` VARCHAR(100), IN `FORMACION` VARCHAR(200), IN `OCUPACION` VARCHAR(100), IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT, IN `EMAIL` VARCHAR(100), IN `IDSEDE` INT, IN `IDPROGRAMA` INT, IN `IDSEMESTRE` INT, IN `IDJORNADA` INT, IN `FECHA_MAT` DATE, IN `NOMBRE_REF` VARCHAR(100), IN `APELLIDO_REF` VARCHAR(100), IN `PARENTESCO` VARCHAR(100), IN `DIRECCION_REF` VARCHAR(100), IN `TELEFONO_REF` VARCHAR(100), IN `CORREO_REF` VARCHAR(100))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_JORNADA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_JORNADA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_JORNADA`(IN `NOMBRE` VARCHAR(200))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PROFESION
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROFESION`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PROFESION`(IN NOMBRE VARCHAR(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_PROGRAMA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROGRAMA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_PROGRAMA`(IN `NOM_PROGRAMA` VARCHAR(100),IN `IDSEDE` INT)
BEGIN

INSERT INTO programa(`nombre_programa`,`idsede`, estatus)
VALUES (NOM_PROGRAMA,IDSEDE,'ACTIVO');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ROL`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_ROL`(IN NOMBRE VARCHAR(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_SEDES
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_SEDES`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_SEDES`(IN `NOMBRE` VARCHAR(50), IN `NOM_CIUDAD` VARCHAR(100))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(100), 
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_DATOS_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN `ID` INT)
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
        where `usuario_id` =ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO varchar(50))
select * from usuario 
where usuario_nombre =USUARIO
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
