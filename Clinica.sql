-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id_cajas` int(11) NOT NULL AUTO_INCREMENT,
  `total_efectivo` float DEFAULT NULL,
  `total_banco` float DEFAULT NULL,
  `total_mercado` float DEFAULT NULL,
  PRIMARY KEY (`id_cajas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (1,100,100,100);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carnet`
--

DROP TABLE IF EXISTS `carnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carnet` (
  `id_pacientes` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vigencia` date DEFAULT NULL,
  KEY `fk_pacientes_carnet_idx` (`id_pacientes`),
  CONSTRAINT `fk_pacientes_carnet` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carnet`
--

LOCK TABLES `carnet` WRITE;
/*!40000 ALTER TABLE `carnet` DISABLE KEYS */;
INSERT INTO `carnet` VALUES (1,'2019-01-27','2020-01-27'),(2,'2019-01-27','2020-01-27');
/*!40000 ALTER TABLE `carnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos`
--

DROP TABLE IF EXISTS `costos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costos` (
  `id_costos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `importe` float NOT NULL,
  PRIMARY KEY (`id_costos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos`
--

LOCK TABLES `costos` WRITE;
/*!40000 ALTER TABLE `costos` DISABLE KEYS */;
INSERT INTO `costos` VALUES (1,'Costo',90);
/*!40000 ALTER TABLE `costos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas` (
  `id_cuotas` int(100) NOT NULL AUTO_INCREMENT,
  `fecha_vencimiento` date NOT NULL,
  `mes` int(20) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `lugar_emision` varchar(20) NOT NULL,
  `id_pacientes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cuotas`),
  KEY `fk_cuotas_pacientes_idx` (`id_pacientes`),
  CONSTRAINT `fk_cuotas_pacientes` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
INSERT INTO `cuotas` VALUES (1,'2019-03-31',1,'2019-03-01',NULL,'Rosario',1),(2,'2018-08-31',1,'2018-08-01',NULL,'Rosario',1),(3,'2019-01-31',1,'2019-01-01',NULL,'Rosario',15),(4,'2018-05-31',5,'2018-05-01',NULL,'Rosario',1),(5,'2018-05-31',5,'2018-05-01',NULL,'Rosario',15);
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_medica`
--

DROP TABLE IF EXISTS `ficha_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_medica` (
  `id_visitas` int(100) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(50) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `recordatorio` varchar(100) DEFAULT NULL,
  `id_turnos` int(11) NOT NULL,
  PRIMARY KEY (`id_visitas`),
  KEY `fk_turnos_ficha_idx` (`id_turnos`),
  CONSTRAINT `fk_turnos_ficha` FOREIGN KEY (`id_turnos`) REFERENCES `turnos` (`id_turnos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_medica`
--

LOCK TABLES `ficha_medica` WRITE;
/*!40000 ALTER TABLE `ficha_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_profesionales`
--

DROP TABLE IF EXISTS `horarios_profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios_profesionales` (
  `id_horarios` int(11) NOT NULL AUTO_INCREMENT,
  `dia` varchar(20) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_profesionales` int(11) NOT NULL,
  PRIMARY KEY (`id_horarios`),
  KEY `fk_profesionales_hor_idx` (`id_profesionales`),
  CONSTRAINT `fk_profesionales_hor` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_profesionales`
--

LOCK TABLES `horarios_profesionales` WRITE;
/*!40000 ALTER TABLE `horarios_profesionales` DISABLE KEYS */;
INSERT INTO `horarios_profesionales` VALUES (1,'Lunes','07:00:00','11:00:00',NULL,1);
/*!40000 ALTER TABLE `horarios_profesionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_caja`
--

DROP TABLE IF EXISTS `movimientos_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_caja` (
  `id_mov` int(250) NOT NULL AUTO_INCREMENT,
  `fecha_movimiento` date NOT NULL,
  `tipo_movimiento` varchar(20) NOT NULL,
  `motivo` varchar(40) NOT NULL,
  `retencion` float DEFAULT NULL,
  `observacion` varchar(40) DEFAULT NULL,
  `forma_pago` varchar(20) NOT NULL,
  `fecha_cobro` date NOT NULL,
  `lugar_cobro` varchar(30) DEFAULT NULL,
  `numero_tarjeta` varchar(30) DEFAULT NULL,
  `nombre_tarjeta` varchar(20) DEFAULT NULL,
  `importe` float NOT NULL,
  `id_profesionales` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_proveedores` int(11) DEFAULT NULL,
  `id_pacientes` int(11) DEFAULT NULL,
  `id_cuotas` int(100) DEFAULT NULL,
  `id_cajas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mov`),
  KEY `fk_profesionales_mov_idx` (`id_profesionales`),
  KEY `fk_usuario_mov_idx` (`id_usuarios`),
  KEY `fk_paciente_mov_idx` (`id_pacientes`),
  KEY `fk_cuota_mov_idx` (`id_cuotas`),
  KEY `fk_caja_mov_idx` (`id_cajas`),
  KEY `fk_proveed_mov_idx` (`id_proveedores`),
  CONSTRAINT `fk_caja_mov` FOREIGN KEY (`id_cajas`) REFERENCES `caja` (`id_cajas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuota_mov` FOREIGN KEY (`id_cuotas`) REFERENCES `cuotas` (`id_cuotas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_mov` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesionales_mov` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveed_mov` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_mov` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_caja`
--

LOCK TABLES `movimientos_caja` WRITE;
/*!40000 ALTER TABLE `movimientos_caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `id_pacientes` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(40) DEFAULT NULL,
  `apellido` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `num_socio` int(20) DEFAULT NULL,
  `asociado` varchar(20) NOT NULL,
  `telefonos` varchar(40) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `localidad` varchar(20) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `sexo` varchar(20) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `saldo_pendiente` float DEFAULT NULL,
  `saldo_cuota` float DEFAULT NULL,
  `forma_pago` varchar(20) DEFAULT NULL,
  `vigencia_sepelio` date DEFAULT NULL,
  `tarjetas_numeros` varchar(40) DEFAULT NULL,
  `otros_datos` varchar(60) DEFAULT NULL,
  `ayuda_escolar` varchar(11) DEFAULT NULL,
  `dni_titular` varchar(20) DEFAULT NULL,
  `id_planes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pacientes`),
  KEY `fk_plan_idx` (`id_planes`),
  CONSTRAINT `fk_plan` FOREIGN KEY (`id_planes`) REFERENCES `planes` (`id_planes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'36581598','Manuale','Federico',1,'Si','3413502691','manualef@gmail.com','1992-02-25','Crespo y Urquiza','Rosario',2000,'Masculino','2019-01-27',NULL,NULL,NULL,'Débito automático','0000-00-00','2323','No','No','36581598',1),(2,'36490054','Manuale','Gisel',2,'Si','3413502691','manualef@gmail.com','1992-05-29','Crespo y Urquiza','Rosario',2000,'Femenino','2019-01-27',NULL,NULL,NULL,'Débito automático','0000-00-00','2323','','No','36581598',1),(15,'33333333','Sensori',' Claudia',3,'Si','3413502691','manualef@gmail.com','0000-00-00','Crespo y Urquiza','Rosario',2000,'Femenino','2019-01-28',NULL,NULL,NULL,'Efectivo','2023-01-28','','','No','33333333',2);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planes` (
  `id_planes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `monto` float NOT NULL,
  `servicios` varchar(60) NOT NULL,
  `id_costos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_planes`),
  KEY `fk_costos_idx` (`id_costos`),
  CONSTRAINT `fk_costos` FOREIGN KEY (`id_costos`) REFERENCES `costos` (`id_costos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'Familiar',130,'Emergencia',NULL),(2,'Individual',110,'Emergencia y Sepelio',NULL);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesionales`
--

DROP TABLE IF EXISTS `profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesionales` (
  `id_profesionales` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) NOT NULL,
  `apellido_nombre` varchar(20) NOT NULL,
  `telefonos` varchar(40) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `localidad` varchar(20) DEFAULT NULL,
  `codigo_postal` int(10) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `num_matricula` varchar(30) DEFAULT NULL,
  `sexo` varchar(20) NOT NULL,
  `especialidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_profesionales`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesionales`
--

LOCK TABLES `profesionales` WRITE;
/*!40000 ALTER TABLE `profesionales` DISABLE KEYS */;
INSERT INTO `profesionales` VALUES (1,'33333334','Adal Pedro Angel','3413502691','manualef@gmail.com','1983-01-01','Urquiza 324','Ricardone',2000,'2019-01-27','0000-00-00','23234','Masculino','Clinica General'),(2,'44444444','Ribas Maria Julia','','','0000-00-00','','',0,'2019-01-28',NULL,'','Femenino','Tocoginecóloga');
/*!40000 ALTER TABLE `profesionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Cuotas socios','','Mutual'),(2,'Impuestos y servicios','otros','Impuestos');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnos` (
  `id_turnos` int(100) NOT NULL AUTO_INCREMENT,
  `estado_turno` varchar(20) NOT NULL,
  `pago` varchar(10) NOT NULL,
  `tipo_turno` varchar(20) NOT NULL,
  `importe_adicional` float DEFAULT NULL,
  `id_costos` int(11) DEFAULT NULL,
  `id_pacientes` int(11) DEFAULT NULL,
  `id_profesionales` int(11) DEFAULT NULL,
  `color` varchar(100) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id_turnos`),
  KEY `fk_costos_turnos_idx` (`id_costos`),
  KEY `fk_paciente_turno_idx` (`id_pacientes`),
  KEY `fk_profes_turno_idx` (`id_profesionales`),
  CONSTRAINT `fk_costos_turnos` FOREIGN KEY (`id_costos`) REFERENCES `costos` (`id_costos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_turno` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profes_turno` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `apellido_nombre` varchar(40) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  `id_profesionales` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'RSofia','sofiRe','anastacia','Administrador',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'clinica'
--

--
-- Dumping routines for database 'clinica'
--
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_paciente`(in id int(11))
BEGIN
DELETE FROM carnet where id_pacientes=`id`; 
DELETE FROM pacientes where id_pacientes=`id`; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-26 16:15:59
