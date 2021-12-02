-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: agenciam
-- ------------------------------------------------------
-- Server version	5.7.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cdemograf`
--

DROP TABLE IF EXISTS `cdemograf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdemograf` (
  `id_Demo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_demo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Demo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdemograf`
--

LOCK TABLES `cdemograf` WRITE;
/*!40000 ALTER TABLE `cdemograf` DISABLE KEYS */;
INSERT INTO `cdemograf` VALUES (1,'Shounen'),(2,'Shoujo'),(3,'Seinen'),(4,'Josei'),(5,'Kodomo');
/*!40000 ALTER TABLE `cdemograf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdireccion`
--

DROP TABLE IF EXISTS `cdireccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdireccion` (
  `id_dir` int(11) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Inter` int(11) NOT NULL,
  `Ext` int(11) NOT NULL,
  `Col` varchar(45) NOT NULL,
  `no_post` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdireccion`
--

LOCK TABLES `cdireccion` WRITE;
/*!40000 ALTER TABLE `cdireccion` DISABLE KEYS */;
INSERT INTO `cdireccion` VALUES (2,'32',5,71,'Olivar del Conde','01400'),(3,'Salamanca',0,3,'Minas de Cristo','84758'),(4,'veinte',87,78,'San Antonio','85749'),(5,'89',5,93,'Lomas de Platero','49584'),(6,'67',9,8,'Tacubaya','94958');
/*!40000 ALTER TABLE `cdireccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceditorial`
--

DROP TABLE IF EXISTS `ceditorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ceditorial` (
  `id_Edit` int(11) NOT NULL AUTO_INCREMENT,
  `Editorial` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Edit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceditorial`
--

LOCK TABLES `ceditorial` WRITE;
/*!40000 ALTER TABLE `ceditorial` DISABLE KEYS */;
INSERT INTO `ceditorial` VALUES (1,'Panini'),(2,'Kamite');
/*!40000 ALTER TABLE `ceditorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cestado`
--

DROP TABLE IF EXISTS `cestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cestado` (
  `id_est` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cestado`
--

LOCK TABLES `cestado` WRITE;
/*!40000 ALTER TABLE `cestado` DISABLE KEYS */;
INSERT INTO `cestado` VALUES (1,'Finalizado'),(2,'Publicándose');
/*!40000 ALTER TABLE `cestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cgenero`
--

DROP TABLE IF EXISTS `cgenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cgenero` (
  `id_Genero` int(11) NOT NULL AUTO_INCREMENT,
  `nom_gen` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Genero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cgenero`
--

LOCK TABLES `cgenero` WRITE;
/*!40000 ALTER TABLE `cgenero` DISABLE KEYS */;
INSERT INTO `cgenero` VALUES (1,'Acción'),(2,'Drama'),(3,'Psicológico'),(4,'Romance'),(5,'Slice of Life'),(6,'Gore');
/*!40000 ALTER TABLE `cgenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cservicio`
--

DROP TABLE IF EXISTS `cservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cservicio` (
  `id_Ser` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ser` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Ser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cservicio`
--

LOCK TABLES `cservicio` WRITE;
/*!40000 ALTER TABLE `cservicio` DISABLE KEYS */;
INSERT INTO `cservicio` VALUES (1,'PayPal'),(2,'Efectivo'),(3,'Tarjeta');
/*!40000 ALTER TABLE `cservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcuenta`
--

DROP TABLE IF EXISTS `dcuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcuenta` (
  `id_cu` int(11) NOT NULL,
  `FKid_Usu` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `appat` varchar(45) NOT NULL,
  `apmat` varchar(45) NOT NULL,
  `Fnac` varchar(45) NOT NULL,
  `Curp` varchar(45) NOT NULL,
  `tel` int(10) NOT NULL,
  `FKid_dir` int(11) NOT NULL,
  PRIMARY KEY (`id_cu`),
  KEY `FKid_Usu` (`FKid_Usu`),
  KEY `FKid_dir` (`FKid_dir`),
  CONSTRAINT `dcuenta_ibfk_1` FOREIGN KEY (`FKid_Usu`) REFERENCES `usuario` (`id_Usu`),
  CONSTRAINT `dcuenta_ibfk_2` FOREIGN KEY (`FKid_dir`) REFERENCES `cdireccion` (`id_dir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcuenta`
--

LOCK TABLES `dcuenta` WRITE;
/*!40000 ALTER TABLE `dcuenta` DISABLE KEYS */;
INSERT INTO `dcuenta` VALUES (2,2,'Samuel','Sierra','Fierro','2002-10-17','hhhhhhhhhhhhhhhhhh',45454045,2),(3,3,'Pepe','Ortiz','Pinedo','1980-12-09','hhhhhhhhhhhhhhhhhh',93059749,3),(4,4,'Ramiro','Ramires','Raror','1996-01-19','hhhhhhhhhhhhhhhhhh',39859394,4),(5,5,'Elias','Flores','De la Peña','1945-04-05','hhhhhhhhhhhhhhhhhh',38459384,5),(6,6,'Mario','Martinez','Cros','1967-12-04','hhhhhhhhhhhhhhhhhh',98540394,6);
/*!40000 ALTER TABLE `dcuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id_com` int(11) NOT NULL AUTO_INCREMENT,
  `FKid_cu` int(11) NOT NULL,
  `FKnum_vent` int(11) NOT NULL,
  `FKprod` int(11) NOT NULL,
  PRIMARY KEY (`id_com`),
  KEY `FKnum_vent` (`FKnum_vent`),
  KEY `FKprod` (`FKprod`),
  KEY `FKid_cu` (`FKid_cu`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`FKnum_vent`) REFERENCES `ventas` (`num_vent`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`FKprod`) REFERENCES `mproduct` (`id_product`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `historial_ibfk_3` FOREIGN KEY (`FKid_cu`) REFERENCES `dcuenta` (`id_cu`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,2,1,4),(2,2,1,18),(3,2,1,5),(4,2,2,5),(5,2,2,12),(6,2,3,9),(7,6,4,20),(8,6,5,16),(9,6,5,9),(10,4,6,2),(11,4,7,6),(12,4,7,1),(13,4,7,9),(14,4,8,6),(15,4,8,1),(16,4,8,9),(17,4,8,11),(18,3,9,6),(19,3,9,3),(20,3,9,17),(21,3,9,15),(22,5,10,7),(23,5,10,8),(24,5,10,10),(25,5,11,19),(26,5,12,14),(27,5,13,9),(28,5,14,16),(29,5,15,4),(30,5,16,5),(31,2,17,3),(32,2,18,19),(33,4,19,8),(34,4,19,4),(35,6,20,18),(36,6,21,20),(37,2,22,1),(38,2,23,5),(39,2,24,7),(40,2,25,14),(41,2,26,4),(42,2,27,13);
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mproduct`
--

DROP TABLE IF EXISTS `mproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mproduct` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_prod` varchar(45) NOT NULL,
  `Descr_prod` varchar(500) NOT NULL,
  `FKid_est` int(11) NOT NULL,
  `FKid_edit` int(11) NOT NULL,
  `FKid_gen` int(11) NOT NULL,
  `FKid_demo` int(11) NOT NULL,
  `costo` float NOT NULL,
  `Stock` int(11) NOT NULL,
  `URL_img` varchar(1500) NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `FKid_est` (`FKid_est`),
  KEY `FKid_edit` (`FKid_edit`),
  KEY `FKid_gen` (`FKid_gen`),
  KEY `FKid_demo` (`FKid_demo`),
  CONSTRAINT `mproduct_ibfk_1` FOREIGN KEY (`FKid_est`) REFERENCES `cestado` (`id_est`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `mproduct_ibfk_2` FOREIGN KEY (`FKid_edit`) REFERENCES `ceditorial` (`id_Edit`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `mproduct_ibfk_3` FOREIGN KEY (`FKid_gen`) REFERENCES `cgenero` (`id_Genero`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `mproduct_ibfk_4` FOREIGN KEY (`FKid_demo`) REFERENCES `cdemograf` (`id_Demo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mproduct`
--

LOCK TABLES `mproduct` WRITE;
/*!40000 ALTER TABLE `mproduct` DISABLE KEYS */;
INSERT INTO `mproduct` VALUES (1,'One Punch Man','Un manga de un pelon super mamadisimo',1,1,1,1,75,19,'https://i.pinimg.com/originals/97/35/72/973572b8c447d996860f37587b288334.jpg'),(2,'Gantz','No lo he acabado pero hay chingo de sangre en este manga',1,1,6,3,75.5,149,'https://i.pinimg.com/originals/5e/f3/6a/5ef36ab163a7aa5db3431f8129c755fc.jpg'),(3,'Love so Life','Una niñera quiere con su jefe que le dobla la edad,  y tiene que cuidar a unos morrillos',1,2,5,2,65.5,114,'https://elrincondekisa.files.wordpress.com/2012/02/love-so-life-785301.jpg'),(4,'Evangelion','Un manga entretenido y divertido de robots gigantes que pelean contra angeles',1,1,1,1,89.08,116,'https://vignette.wikia.nocookie.net/evangelion/images/4/43/Portada_vol_1_Manga_De_Evangelion.png/revision/latest?cb=20160426034425&path-prefix=es'),(5,'Berserk','Un vato va matando demonios que se lo quieren comer de sacrificio',2,1,6,3,90,130,'https://vignette.wikia.nocookie.net/berserk/images/b/b1/Volume_1.jpg/revision/latest/scale-to-width-down/340?cb=20120703222721&path-prefix=es'),(6,'Boku no Hero','En un mundo de heroes nuestro protagonista es uno de los pocos que no tienen',2,1,1,1,78,117,'https://pm1.narvii.com/6681/66ccf65cd2d9225f77fa3dd27d3d08a7e287206e_hq.jpg'),(7,'Deadman Wonderland','Un grupo de personas encerradas en una prisión son capaces de controlar su sangre a voluntad',1,2,1,3,34.5,48,'https://i.pinimg.com/originals/80/5d/ba/805dbabb7cfe3e15d26cc20967cec925.jpg'),(8,'Stains Gate','Viajes en el tiempo XD',1,2,3,3,67.5,128,'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2015/02/444572-steinsgate-ya-tiene-portada-castellano.jpg?itok=PGQC1ano'),(9,'Kaichou wa Maid Sama','Es de romance al chile no me acuerdo de la trama hace tiempo que lo lei',1,1,4,2,56.5,81,'https://ramenparados.com/wp-content/uploads/2015/09/normal_kaichou11.jpg'),(10,'Shinjeki no Kyojin','Ya ha de saber de que trata',2,1,1,3,78.4,239,'https://pm1.narvii.com/6360/06cbeab9e98db5542c9ff86b36f41298bcf0343c_hq.jpg'),(11,'Another','Es de esos mangas que tienen sangre porque si pero igual esta chido',1,2,1,3,89.56,149,'https://2.bp.blogspot.com/-VbhR94ZQRKI/Uo5A4E5FdhI/AAAAAAAADWs/32L2ndTdPQc/s1600/another1.jpg'),(12,'Toradora','Una morra loca manipula a un vato sad',1,2,4,2,78.3,119,'https://3.bp.blogspot.com/-KhASfoY0XX0/Vp_IL9NssWI/AAAAAAAAGbo/-fsvXkwlkUU/s1600/Toradora%2521%2B1%2Bde%2BEditorial%2BKamite.jpg'),(13,'Ansatsu Kyoushitsu','Un profe entrena a su clase para ser asesinos',1,1,1,1,67.4,133,'https://vignette.wikia.nocookie.net/ansatsukyoshitsu/images/a/aa/AC_Vol1.png/revision/latest/scale-to-width-down/340?cb=20150103232527&path-prefix=es'),(14,'Kuroko no Basket','Es de deportes',1,1,5,1,67.34,125,'https://ramenparados.com/wp-content/uploads/2015/09/kurokonobasket011-300x444.jpg'),(15,'Private Prince','Este en verdad no se de que trata lo encontre en las imagenes',1,1,4,4,44.6,226,'https://images-na.ssl-images-amazon.com/images/I/51ibnHrtrBL.jpg'),(16,'Hitoribocchi','Una morra con ansiedad quiere hacer amigos',2,1,5,5,78.6,119,'https://otakuteca.com/images/books/cover/5cf0953f8377f.jpg'),(17,'Kimetsu no Yaiba','Matando demonios ando hoy',2,1,1,1,67.89,121,'https://pm1.narvii.com/6628/df7bd50d48a296531714a376d51c525b1c42e4a1_hq.jpg'),(18,'Shokugeki no Souma','De cocina',1,1,5,1,89.56,121,'https://vignette.wikia.nocookie.net/shokugekinosoma/images/7/73/Portada_Volumen_1.png/revision/latest/scale-to-width-down/340?cb=20160225201400&path-prefix=es'),(19,'Full Metal Alchemist','Unos alquimistas andan por ahi por muy muy lejano',1,1,1,1,56.67,143,'https://vignette.wikia.nocookie.net/fma/images/f/fc/FMA_1_-_JAP.jpg/revision/latest/scale-to-width-down/340?cb=20111229153216&path-prefix=es'),(20,'Death Note','Un lunático genocida se enfrenta a un indaptado social',1,1,3,1,56.7,21,'https://3.bp.blogspot.com/-lf-Mga28Y2U/TtA8foEYWdI/AAAAAAAABXI/MQZXFpTZeVo/s1600/1.jpg');
/*!40000 ALTER TABLE `mproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_Usu` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `Privi` binary(1) NOT NULL,
  PRIMARY KEY (`id_Usu`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'root','n0m3l0',_binary '0'),(2,'vocal','ewe',_binary '1'),(3,'pepemax','12345',_binary '1'),(4,'rrr','12345',_binary '1'),(5,'elir','12345',_binary '1'),(6,'Marin','12345',_binary '1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `num_vent` int(11) NOT NULL AUTO_INCREMENT,
  `FKid_Ser` int(11) NOT NULL,
  `Fech_compr` date NOT NULL,
  `CantVentas` int(11) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`num_vent`),
  KEY `FKid_Ser` (`FKid_Ser`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`FKid_Ser`) REFERENCES `cservicio` (`id_Ser`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'2020-05-31',25,2248),(2,2,'2020-05-31',2,168),(3,3,'2020-05-31',1,56),(4,1,'2020-05-31',1,56),(5,1,'2020-05-31',9,574),(6,2,'2020-05-31',1,75),(7,1,'2020-05-31',3,209),(8,2,'2020-05-31',4,298),(9,1,'2020-05-31',12,728),(10,2,'2020-05-31',4,214),(11,2,'2020-05-31',1,56),(12,2,'2020-05-31',1,67),(13,1,'2020-05-31',1,56),(14,2,'2020-05-31',1,78),(15,1,'2020-05-31',1,89),(16,2,'2020-05-31',1,90),(17,2,'2020-05-31',1,65),(18,2,'2020-05-31',1,56),(19,2,'2020-05-31',2,156),(20,2,'2020-05-31',1,89),(21,1,'2020-05-31',123,6974),(22,2,'2020-05-31',80,6000),(23,2,'2020-05-31',45,4050),(24,2,'2020-05-31',180,6210),(25,1,'2020-05-31',30,2020),(26,1,'2020-05-31',1,89),(27,1,'2020-05-31',1,67);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 23:29:13
