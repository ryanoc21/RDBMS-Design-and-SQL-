-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Aircraft`
--

DROP TABLE IF EXISTS `Aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircraft` (
  `idAircraft` int NOT NULL,
  `Manufacturer` varchar(45) NOT NULL,
  `Model` varchar(45) NOT NULL,
  `max_capacity` int NOT NULL,
  `Hangar_idHangar` int NOT NULL,
  PRIMARY KEY (`idAircraft`),
  KEY `fk_Aircraft_Hangar1_idx` (`Hangar_idHangar`),
  CONSTRAINT `fk_Aircraft_Hangar1` FOREIGN KEY (`Hangar_idHangar`) REFERENCES `Hangar` (`idHangar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft`
--

LOCK TABLES `Aircraft` WRITE;
/*!40000 ALTER TABLE `Aircraft` DISABLE KEYS */;
INSERT INTO `Aircraft` VALUES (1,'Boeing','737-800',162,1),(2,'Boeing','737-800',162,2),(3,'Boeing','737-800',162,3),(4,'Boeing','737-800',162,4),(5,'Boeing','737-800',162,5),(6,'Boeing','737-800',162,6),(7,'Boeing','737-800',162,7),(8,'Boeing','737-800',162,8),(9,'Boeing','737-800',162,9),(10,'Boeing','737-800',162,9),(11,'Boeing','737-800',162,10),(12,'Boeing','737-800',162,11),(13,'Boeing','737-800',162,12),(14,'Boeing','737-800',162,13),(15,'Boeing','737-800',162,14),(16,'Boeing','737-800',162,15),(17,'Boeing','737-800',162,16),(18,'Boeing','737-800',162,17),(19,'Boeing','737-800',162,17),(20,'Boeing','737-800',162,18),(21,'Boeing','737-800',162,11),(22,'Boeing','737-800',162,18),(23,'Boeing','737-800',162,20),(24,'Boeing','737-800',162,20),(25,'Boeing','737-800',162,2),(26,'Boeing','737-800',162,3),(27,'Boeing','737-800',162,14),(28,'Boeing','737-800',162,13),(29,'Boeing','737-800',162,2),(30,'Boeing','737-800',162,7);
/*!40000 ALTER TABLE `Aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airport` (
  `IATA` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('ALC','Alicante Airport','Alicante','Spain'),('AMS','Schiphol','Amsterdam','Netherlands'),('ATH','Athens Airport','Athens','Greece'),('BGY','Milan Bergamot Airport','Milan','Italy'),('BRU','Brussells Airport','Brussels','Belgium'),('BUD','Budapest Airport','Budapest','Hungary'),('CDG','Charles De Gaulle','Paris','France'),('CPH','Copenhagen Airport','Copenhagen','Denmark'),('DUB','Dublin Airport','Dublin','Ireland'),('FRA','Frankfurt Airport','Frankfurt','Germany'),('GLA','Glasgow Airport','Glasgow','UK'),('HEL','Helsinki Airport','Helsinki','Finland'),('IST','Istanbul Airport','Istanbul','Turkey'),('LGW','London Gatwick Airport','London','UK'),('LRH','Heathrow','London','UK'),('MAN','Manchester Airport','Manchester','UK'),('MUC','Munich Airport','Munich','Germany'),('OSL','Oslo Airport','Norway','Norway'),('STN','Stanstead Airport','London','UK'),('ZRH','Zurich Airport','Zurich','Switzerland');
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boarding_Pass`
--

DROP TABLE IF EXISTS `Boarding_Pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boarding_Pass` (
  `PassportNo` varchar(45) NOT NULL,
  `FlightNo` varchar(45) NOT NULL,
  `Departure_date` datetime NOT NULL,
  PRIMARY KEY (`PassportNo`,`FlightNo`,`Departure_date`),
  KEY `fk_Passenger_has_Flight_Instance_Flight_Instance1_idx` (`FlightNo`,`Departure_date`),
  KEY `fk_Passenger_has_Flight_Instance_Passenger1_idx` (`PassportNo`),
  CONSTRAINT `fk_Passenger_has_Flight_Instance_Flight_Instance1` FOREIGN KEY (`FlightNo`, `Departure_date`) REFERENCES `Flight_Instance` (`FlightNo`, `Departure_date`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Passenger_has_Flight_Instance_Passenger1` FOREIGN KEY (`PassportNo`) REFERENCES `Passenger` (`PassportNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boarding_Pass`
--

LOCK TABLES `Boarding_Pass` WRITE;
/*!40000 ALTER TABLE `Boarding_Pass` DISABLE KEYS */;
INSERT INTO `Boarding_Pass` VALUES ('AF2982469','TU001','2022-07-10 00:00:00'),('AP7408384','TU0017','2022-10-02 00:00:00'),('AS3776140','TU0014','2022-03-02 00:00:00'),('BP4510048','TU003','2022-05-08 00:00:00'),('BT4962330','TU008','2022-09-08 00:00:00'),('BT6016659','TU008','2022-02-13 00:00:00'),('CC5796115','TU004','2022-06-07 00:00:00'),('CL3389476','TU009','2022-03-02 00:00:00'),('CN6235232','TU009','2022-10-05 00:00:00'),('CT0016720','TU005','2022-12-10 00:00:00'),('EI8474426','TU0016','2022-03-09 00:00:00'),('EL9533864','TU0012','2022-12-03 00:00:00'),('EQ9369353','TU009','2022-05-02 00:00:00'),('ER4551411','TU0014','2022-05-05 00:00:00'),('FB1608808','TU0020','2022-03-11 00:00:00'),('FB8875794','TU0017','2022-09-05 00:00:00'),('FE5608971','TU001','2022-07-07 00:00:00'),('FF9071434','TU0020','2022-01-07 00:00:00'),('FH5917087','TU008','2022-12-04 00:00:00'),('FN2066351','TU002','2022-12-12 00:00:00'),('FZ1153077','TU0014','2022-11-08 00:00:00'),('GC5876997','TU0019','2022-11-08 00:00:00'),('GN7700598','TU004','2022-12-10 00:00:00'),('GT9835460','TU0014','2022-10-10 00:00:00'),('GX6244666','TU0013','2022-02-08 00:00:00'),('HP2172628','TU002','2022-01-02 00:00:00'),('HZ4529852','TU0020','2022-01-02 00:00:00'),('IB3240848','TU0013','2022-06-06 00:00:00'),('IE6672373','TU0016','2022-03-11 00:00:00'),('IF8244389','TU0018','2022-08-06 00:00:00'),('IN0437089','TU0017','2022-12-11 00:00:00'),('IO5794468','TU001','2022-05-10 00:00:00'),('IP0253196','TU0011','2022-07-07 00:00:00'),('IP1527914','TU008','2022-10-05 00:00:00'),('IZ5383986','TU007','2022-01-12 00:00:00'),('JD7192514','TU006','2022-12-03 00:00:00'),('JD9838712','TU002','2022-02-13 00:00:00'),('JE0142220','TU0019','2022-09-08 00:00:00'),('JY5386100','TU002','2022-09-08 00:00:00'),('JZ3307430','TU0017','2022-04-01 00:00:00'),('KO4374617','TU0018','2022-11-08 00:00:00'),('KQ0686083','TU0020','2022-10-13 00:00:00'),('KV8786861','TU006','2022-11-13 00:00:00'),('LE8882091','TU001','2022-02-07 00:00:00'),('LG7396597','TU005','2022-02-02 00:00:00'),('LH5238888','TU007','2022-12-03 00:00:00'),('LQ5251627','TU0010','2022-06-11 00:00:00'),('LR3726906','TU003','2022-05-04 00:00:00'),('LX0912803','TU003','2022-12-11 00:00:00'),('MF2818570','TU007','2022-09-02 00:00:00'),('MF7314473','TU0015','2022-04-03 00:00:00'),('MH2773996','TU001','2022-12-05 00:00:00'),('MO7265699','TU0010','2022-06-07 00:00:00'),('MW4774573','TU0012','2022-01-06 00:00:00'),('NF2754049','TU0018','2022-08-04 00:00:00'),('NL3816432','TU0010','2022-01-06 00:00:00'),('NY2843107','TU0018','2022-11-03 00:00:00'),('OE6744336','TU005','2022-11-03 00:00:00'),('ON4453823','TU008','2022-06-05 00:00:00'),('PA0411661','TU0014','2022-08-09 00:00:00'),('PG8441873','TU0019','2022-09-10 00:00:00'),('PK6733488','TU0011','2022-12-09 00:00:00'),('PQ6254327','TU001','2022-06-06 00:00:00'),('PR3358685','TU007','2022-10-03 00:00:00'),('PR6327468','TU0020','2022-08-03 00:00:00'),('PV2629580','TU007','2022-07-03 00:00:00'),('QG8389636','TU003','2022-03-04 00:00:00'),('QL4528189','TU009','2022-04-07 00:00:00'),('QN3819035','TU0020','2022-12-13 00:00:00'),('RL1656459','TU0012','2022-07-03 00:00:00'),('RW8694611','TU001','2022-01-13 00:00:00'),('RX0955839','TU0016','2022-01-06 00:00:00'),('SF1933064','TU006','2022-03-10 00:00:00'),('SY9656272','TU002','2022-06-10 00:00:00'),('TE8997305','TU002','2022-12-08 00:00:00'),('TQ4338501','TU008','2022-04-02 00:00:00'),('TV0160597','TU003','2022-12-06 00:00:00'),('TZ8295215','TU0012','2022-02-11 00:00:00'),('UH5124102','TU0011','2022-12-07 00:00:00'),('UP1125421','TU006','2022-08-08 00:00:00'),('UW0024985','TU005','2022-08-13 00:00:00'),('VE1891691','TU004','2022-01-02 00:00:00'),('VL0426654','TU0019','2022-01-06 00:00:00'),('VR1085618','TU0013','2022-07-02 00:00:00'),('VV6209308','TU001','2022-04-05 00:00:00'),('WD6728885','TU0013','2022-02-10 00:00:00'),('WK3526297','TU0019','2022-10-12 00:00:00'),('WO2469969','TU0014','2022-11-02 00:00:00'),('WQ7566531','TU009','2022-05-09 00:00:00'),('XF9468609','TU0020','2022-08-07 00:00:00'),('XN5420862','TU006','2022-10-04 00:00:00'),('XR3640326','TU005','2022-07-10 00:00:00'),('XZ7612399','TU0015','2022-04-02 00:00:00'),('YD0372516','TU004','2022-10-02 00:00:00'),('YH4678291','TU009','2022-05-07 00:00:00'),('YN2989474','TU009','2022-11-02 00:00:00'),('YU4550140','TU0019','2022-11-07 00:00:00'),('YY1053198','TU002','2022-04-02 00:00:00'),('YZ7866301','TU0020','2022-11-10 00:00:00'),('ZF8588747','TU0017','2022-08-05 00:00:00');
/*!40000 ALTER TABLE `Boarding_Pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cabin_crew`
--

DROP TABLE IF EXISTS `Cabin_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cabin_crew` (
  `idCabin_crew` varchar(45) NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `StreetNo` varchar(45) NOT NULL,
  `Street_name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`idCabin_crew`),
  KEY `crew_last_name` (`Last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cabin_crew`
--

LOCK TABLES `Cabin_crew` WRITE;
/*!40000 ALTER TABLE `Cabin_crew` DISABLE KEYS */;
INSERT INTO `Cabin_crew` VALUES ('C1','Delores','Gillyatt','925','Moose','Nässjö','Sājir'),('C10','Theo','Alasdair','9641','Kropf','Couva','Georgiyevka'),('C11','Paxton','Owthwaite','9111','Merrick','Yelenendorf','Đắk Mâm'),('C12','Amelita','Angelini','42538','Lighthouse Bay','Diapaga','Chalon-sur-Saône'),('C13','Charmane','Richardeau','9068','Westend','Stockholm','Makato'),('C14','Chandra','Scally','2224','Holmberg','Mechrá Belqsiri','Impalutao'),('C15','Justina','Klemmt','2780','Forest Run','Farkhah','Hoopstad'),('C16','Luciana','Gounet','95','Melrose','Partang','Toukh'),('C17','Valma','Mouland','56','Cherokee','Guandian','Ózd'),('C18','Edouard','Peak','678','Jenifer','Neochóri','Port Washington'),('C19','Colby','Brabin','525','Eastwood','Telnice','Santa Cruz'),('C2','Wilma','Upstell','080','Ilene','Heping','Sijunjung'),('C20','Ripley','Stops','9','Fisk','Xindu','Cambanugoy'),('C21','Harlene','Relfe','13','Susan','Barra Cheia','Fonadhoo'),('C22','Xymenes','Wagen','9042','Northwestern','Xinmen','Stoszowice'),('C23','Wilmer','Lghan','8','Maple Wood','Mērsrags','Yangce'),('C24','Glynnis','Portriss','52','Continental','Včelná','Mazhu'),('C25','Ingaborg','Pittoli','5525','Hintze','Falun','Cuevas'),('C3','Amory','Greenfield','613','International','Xitan','Deqing'),('C4','Torie','Nayshe','12852','5th','Qinglian','Erjia'),('C5','Lonni','Clavering','2','Melvin','Tibillo','Brooklyn'),('C6','Luca','Haydock','0794','Kings','Hicksville','Mykonos'),('C7','Cherye','Shury','442','Birchwood','Rzepiennik Strzyżewski','Duodaoshi'),('C8','Jocko','Buckenhill','41','Leroy','Honolulu','Businga'),('C9','Udall','Barrack','84','Bobwhite','Boston','Torbeyevo');
/*!40000 ALTER TABLE `Cabin_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight_Instance`
--

DROP TABLE IF EXISTS `Flight_Instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight_Instance` (
  `FlightNo` varchar(45) NOT NULL,
  `Departure_date` datetime NOT NULL,
  `Departure_time` varchar(45) NOT NULL,
  `Pilot_idPilot` varchar(45) NOT NULL,
  `Aircraft_idAircraft` int NOT NULL,
  `Cabin_crew_idCabin_crew` varchar(45) NOT NULL,
  PRIMARY KEY (`FlightNo`,`Departure_date`),
  KEY `fk_Flight_Instance_Pilot1_idx` (`Pilot_idPilot`),
  KEY `fk_Flight_Instance_Aircraft1_idx` (`Aircraft_idAircraft`),
  KEY `fk_Flight_Instance_Cabin_crew1_idx` (`Cabin_crew_idCabin_crew`),
  CONSTRAINT `fk_Flight_Instance_Aircraft1` FOREIGN KEY (`Aircraft_idAircraft`) REFERENCES `Aircraft` (`idAircraft`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Flight_Instance_Cabin_crew1` FOREIGN KEY (`Cabin_crew_idCabin_crew`) REFERENCES `Cabin_crew` (`idCabin_crew`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Flight_Instance_Flight_Route1` FOREIGN KEY (`FlightNo`) REFERENCES `Flight_Route` (`FlightNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Flight_Instance_Pilot1` FOREIGN KEY (`Pilot_idPilot`) REFERENCES `Pilot` (`idPilot`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight_Instance`
--

LOCK TABLES `Flight_Instance` WRITE;
/*!40000 ALTER TABLE `Flight_Instance` DISABLE KEYS */;
INSERT INTO `Flight_Instance` VALUES ('TU001','2022-01-13 00:00:00','06:37:28','P25',19,'C24'),('TU001','2022-02-07 00:00:00','16:48:25','P25',14,'C24'),('TU001','2022-04-05 00:00:00','19:55:13','P2',16,'C1'),('TU001','2022-05-10 00:00:00','13:18:24','P3',17,'C2'),('TU001','2022-06-06 00:00:00','16:13:10','P4',18,'C3'),('TU001','2022-07-07 00:00:00','04:44:56','P5',19,'C4'),('TU001','2022-07-10 00:00:00','05:56:24','P21',21,'C21'),('TU001','2022-12-05 00:00:00','00:27:20','P1',1,'C1'),('TU0010','2022-01-06 00:00:00','03:54:06','P10',10,'C10'),('TU0010','2022-06-07 00:00:00','15:32:43','P5',30,'C5'),('TU0010','2022-06-11 00:00:00','18:00:29','P17',11,'C16'),('TU0011','2022-07-07 00:00:00','23:17:28','P6',1,'C6'),('TU0011','2022-12-07 00:00:00','07:30:36','P11',11,'C11'),('TU0011','2022-12-09 00:00:00','16:45:26','P12',7,'C12'),('TU0012','2022-01-06 00:00:00','02:19:23','P15',29,'C14'),('TU0012','2022-02-11 00:00:00','18:42:22','P12',12,'C12'),('TU0012','2022-07-03 00:00:00','20:21:42','P20',9,'C19'),('TU0012','2022-12-03 00:00:00','01:23:05','P7',2,'C7'),('TU0013','2022-02-08 00:00:00','01:20:56','P2',21,'C1'),('TU0013','2022-02-10 00:00:00','02:32:31','P13',13,'C13'),('TU0013','2022-06-06 00:00:00','02:41:03','P19',8,'C18'),('TU0013','2022-07-02 00:00:00','00:02:32','P8',3,'C8'),('TU0014','2022-03-02 00:00:00','15:07:15','P15',14,'C14'),('TU0014','2022-05-05 00:00:00','18:43:22','P18',7,'C17'),('TU0014','2022-08-09 00:00:00','07:45:10','P9',4,'C9'),('TU0014','2022-10-10 00:00:00','10:47:16','P10',5,'C10'),('TU0014','2022-11-02 00:00:00','02:16:14','P1',20,'C25'),('TU0014','2022-11-08 00:00:00','19:59:53','P11',6,'C11'),('TU0015','2022-04-02 00:00:00','11:14:05','P14',15,'C15'),('TU0015','2022-04-03 00:00:00','03:03:17','P17',6,'C16'),('TU0016','2022-01-06 00:00:00','09:21:58','P16',16,'C16'),('TU0016','2022-03-09 00:00:00','14:14:06','P13',8,'C13'),('TU0016','2022-03-11 00:00:00','14:18:09','P3',22,'C2'),('TU0017','2022-04-01 00:00:00','23:13:32','P4',23,'C3'),('TU0017','2022-08-05 00:00:00','10:31:30','P23',7,'C22'),('TU0017','2022-09-05 00:00:00','09:35:44','P24',8,'C23'),('TU0017','2022-10-02 00:00:00','08:14:30','P25',9,'C24'),('TU0017','2022-12-11 00:00:00','15:32:42','P17',17,'C17'),('TU0018','2022-08-04 00:00:00','21:51:05','P21',10,'C20'),('TU0018','2022-08-06 00:00:00','15:25:03','P16',30,'C15'),('TU0018','2022-11-03 00:00:00','08:11:58','P18',18,'C18'),('TU0018','2022-11-08 00:00:00','14:17:16','P14',28,'C13'),('TU0019','2022-01-06 00:00:00','16:51:24','P9',23,'C8'),('TU0019','2022-09-08 00:00:00','20:34:27','P22',11,'C21'),('TU0019','2022-09-10 00:00:00','23:47:51','P19',19,'C19'),('TU0019','2022-10-12 00:00:00','00:07:34','P23',12,'C22'),('TU0019','2022-11-07 00:00:00','12:56:18','P10',24,'C9'),('TU0019','2022-11-08 00:00:00','01:44:03','P8',22,'C7'),('TU002','2022-01-02 00:00:00','00:19:38','P12',1,'C11'),('TU002','2022-02-13 00:00:00','06:12:12','P14',3,'C13'),('TU002','2022-04-02 00:00:00','07:09:06','P14',9,'C14'),('TU002','2022-06-10 00:00:00','12:41:49','P22',22,'C22'),('TU002','2022-09-08 00:00:00','06:02:14','P19',13,'C18'),('TU002','2022-12-08 00:00:00','07:39:17','P15',4,'C14'),('TU002','2022-12-12 00:00:00','13:35:06','P2',2,'C2'),('TU0020','2022-01-02 00:00:00','11:50:47','P24',13,'C23'),('TU0020','2022-01-07 00:00:00','06:16:08','P13',2,'C12'),('TU0020','2022-03-11 00:00:00','10:02:31','P1',15,'C25'),('TU0020','2022-08-03 00:00:00','03:45:31','P18',12,'C17'),('TU0020','2022-08-07 00:00:00','05:05:53','P20',20,'C20'),('TU0020','2022-10-13 00:00:00','09:12:26','P13',27,'C12'),('TU0020','2022-11-10 00:00:00','09:55:38','P12',26,'C11'),('TU0020','2022-12-13 00:00:00','03:28:14','P11',25,'C10'),('TU003','2022-03-04 00:00:00','03:27:48','P16',5,'C15'),('TU003','2022-05-04 00:00:00','22:00:19','P16',10,'C15'),('TU003','2022-05-08 00:00:00','10:19:30','P5',24,'C4'),('TU003','2022-12-06 00:00:00','13:39:06','P3',3,'C3'),('TU003','2022-12-11 00:00:00','09:58:08','P23',23,'C23'),('TU004','2022-01-02 00:00:00','18:22:48','P24',24,'C24'),('TU004','2022-06-07 00:00:00','02:28:35','P6',25,'C5'),('TU004','2022-10-02 00:00:00','02:42:19','P20',14,'C19'),('TU004','2022-12-10 00:00:00','00:27:22','P4',4,'C4'),('TU005','2022-02-02 00:00:00','22:25:52','P25',25,'C25'),('TU005','2022-07-10 00:00:00','16:53:00','P7',26,'C6'),('TU005','2022-08-13 00:00:00','21:12:40','P6',20,'C5'),('TU005','2022-11-03 00:00:00','03:39:47','P1',10,'C25'),('TU005','2022-12-10 00:00:00','21:49:58','P5',5,'C5'),('TU006','2022-03-10 00:00:00','12:23:57','P1',26,'C1'),('TU006','2022-08-08 00:00:00','04:43:48','P8',27,'C7'),('TU006','2022-10-04 00:00:00','04:27:57','P7',21,'C6'),('TU006','2022-11-13 00:00:00','10:15:09','P21',15,'C20'),('TU006','2022-12-03 00:00:00','22:31:29','P6',6,'C6'),('TU007','2022-01-12 00:00:00','15:18:08','P22',16,'C21'),('TU007','2022-07-03 00:00:00','16:43:20','P22',6,'C21'),('TU007','2022-09-02 00:00:00','02:17:34','P9',28,'C8'),('TU007','2022-10-03 00:00:00','23:09:39','P7',7,'C7'),('TU007','2022-12-03 00:00:00','12:42:40','P2',27,'C2'),('TU008','2022-02-13 00:00:00','14:41:37','P23',17,'C22'),('TU008','2022-04-02 00:00:00','22:21:13','P3',28,'C3'),('TU008','2022-06-05 00:00:00','13:06:08','P21',5,'C20'),('TU008','2022-09-08 00:00:00','07:37:46','P17',1,'C16'),('TU008','2022-10-05 00:00:00','19:48:48','P10',29,'C9'),('TU008','2022-12-04 00:00:00','14:05:39','P8',8,'C8'),('TU009','2022-03-02 00:00:00','23:38:42','P18',2,'C17'),('TU009','2022-04-07 00:00:00','15:14:43','P19',3,'C18'),('TU009','2022-05-02 00:00:00','03:00:03','P24',18,'C23'),('TU009','2022-05-07 00:00:00','22:16:38','P4',29,'C4'),('TU009','2022-05-09 00:00:00','17:42:07','P20',4,'C19'),('TU009','2022-10-05 00:00:00','15:25:48','P9',9,'C9'),('TU009','2022-11-02 00:00:00','04:06:26','P11',30,'C10');
/*!40000 ALTER TABLE `Flight_Instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight_Route`
--

DROP TABLE IF EXISTS `Flight_Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight_Route` (
  `FlightNo` varchar(45) NOT NULL,
  `Departure_airport` varchar(45) NOT NULL,
  `Arrival_airport` varchar(45) NOT NULL,
  PRIMARY KEY (`FlightNo`),
  KEY `fk_Flight_Route_Airport1_idx` (`Departure_airport`),
  KEY `fk_Flight_Route_Airport2_idx` (`Arrival_airport`),
  CONSTRAINT `fk_Flight_Route_Airport1` FOREIGN KEY (`Departure_airport`) REFERENCES `Airport` (`IATA`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Flight_Route_Airport2` FOREIGN KEY (`Arrival_airport`) REFERENCES `Airport` (`IATA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight_Route`
--

LOCK TABLES `Flight_Route` WRITE;
/*!40000 ALTER TABLE `Flight_Route` DISABLE KEYS */;
INSERT INTO `Flight_Route` VALUES ('TU001','LRH','DUB'),('TU0010','STN','ALC'),('TU0011','BGY','BUD'),('TU0012','BRU','CPH'),('TU0013','LGW','DUB'),('TU0014','DUB','LGW'),('TU0015','BRU','LGW'),('TU0016','ATH','LGW'),('TU0017','LGW','ATH'),('TU0018','LRH','BRU'),('TU0019','ZRH','DUB'),('TU002','AMS','DUB'),('TU0020','DUB','OSL'),('TU003','MUC','DUB'),('TU004','DUB','MUC'),('TU005','DUB','CDG'),('TU006','DUB','FRA'),('TU007','GLA','DUB'),('TU008','DUB','GLA'),('TU009','DUB','ATH');
/*!40000 ALTER TABLE `Flight_Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hangar`
--

DROP TABLE IF EXISTS `Hangar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hangar` (
  `idHangar` int NOT NULL,
  `Airport_IATA` varchar(45) NOT NULL,
  PRIMARY KEY (`idHangar`),
  KEY `fk_Hangar_Airport_idx` (`Airport_IATA`),
  CONSTRAINT `fk_Hangar_Airport` FOREIGN KEY (`Airport_IATA`) REFERENCES `Airport` (`IATA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hangar`
--

LOCK TABLES `Hangar` WRITE;
/*!40000 ALTER TABLE `Hangar` DISABLE KEYS */;
INSERT INTO `Hangar` VALUES (10,'ALC'),(2,'AMS'),(9,'ATH'),(13,'BGY'),(15,'BRU'),(12,'BUD'),(4,'CDG'),(14,'CPH'),(1,'DUB'),(5,'FRA'),(7,'GLA'),(16,'HEL'),(8,'IST'),(18,'LGW'),(20,'LRH'),(6,'MAN'),(3,'MUC'),(17,'OSL'),(11,'STN'),(19,'ZRH');
/*!40000 ALTER TABLE `Hangar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `PassportNo` varchar(45) NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `StreetNo` varchar(45) NOT NULL,
  `Street_name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`PassportNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES ('AF2982469','Tybi','Kleisle','8802','Merchant','Mutangyuan','China'),('AP7408384','Jany','Stait','10','Sunnyside','Idrinskoye','Russia'),('AS3776140','Jo-anne','Oakinfold','591','Vermont','Matangshan','China'),('BP4510048','Ellwood','Farlam','9748','Autumn Leaf','Gambiran','Indonesia'),('BT4962330','Lilla','Troop','36','Ryan','Fengshan','China'),('BT6016659','Shawna','Kemble','83963','Anniversary','Le Mans','France'),('CC5796115','Mariana','Philipart','7836','Holmberg','Solok Timur','Indonesia'),('CL3389476','Elmore','Carstairs','2777','Nova','Palmira','Panama'),('CN6235232','Stella','Klauer','7832','Kipling','Huacao','China'),('CT0016720','Desi','Deverille','57','Clove','San Lorenzo','Peru'),('EI8474426','Antoni','Jaulmes','3121','Dottie','Leskovec pri Krškem','Slovenia'),('EL9533864','Caron','Petracci','49','Portage','Huangbao','China'),('EQ9369353','Allister','Tumioto','6772','Ruskin','Verkhniy Rohachyk','Ukraine'),('ER4551411','Lauree','Ware','9','Victoria','Ngala','Nigeria'),('FB1608808','Starla','Brosius','789','Randy','Sydney','Australia'),('FB8875794','Etta','Mapes','3','Morrow','Ribas do Rio Pardo','Brazil'),('FE5608971','Pate','Bedinham','6','Everett','Hede','China'),('FF9071434','Hunter','Danilin','747','Rockefeller','Shāhīn Dezh','Iran'),('FH5917087','Willamina','Boliver','8158','Sunfield','Cinyawang','Indonesia'),('FN2066351','Shay','Risso','15','Dunning','Stuttgart','Germany'),('FZ1153077','Glynda','Dahmke','19022','Anderson','Firmat','Argentina'),('GC5876997','Lauri','Bigglestone','819','Dennis','Bordeaux','France'),('GN7700598','Shannah','Cianelli','634','South','Xiongguan','China'),('GT9835460','Gavan','Wrigley','0','Eastwood','Balekambang','Indonesia'),('GX6244666','Mozes','Grellis','22','Montana','Santa Fe','Philippines'),('HP2172628','Bryon','Gallaccio','467','Bowman','Baunu-Timbangan','Philippines'),('HZ4529852','Lura','Slateford','97','Browning','Kaliro','Uganda'),('IB3240848','Elset','Sandyford','295','Mcguire','Iberia','Peru'),('IE6672373','Rodolph','Winston','3221','Elmside','Khuzhir','Russia'),('IF8244389','Arty','Howler','55313','Onsgard','Huzhen','China'),('IN0437089','Gerri','Handling','95','Artisan','Beibei','China'),('IO5794468','Godiva','Kegan','7','Oneill','Awar-awar','Indonesia'),('IP0253196','Joshua','Smyth','11955','Debs','Sangke','China'),('IP1527914','Jesselyn','Dabell','370','Jay','Salam','Indonesia'),('IZ5383986','Gardiner','Scotchmor','3','Johnson','Borogontsy','Russia'),('JD7192514','Barty','Macieiczyk','3838','Ryan','Xing’an','China'),('JD9838712','Cliff','Krause','8','Corry','Santo Domingo de los Colorados','Ecuador'),('JE0142220','Charity','Howe','376','Bultman','Pasadena','United States'),('JY5386100','Karlyn','Arpur','17','Westend','Ros’','Belarus'),('JZ3307430','Pier','Tackett','4684','Dorton','Sanjing','China'),('KO4374617','Howey','Ickovitz','36179','Russell','Huandiqiao','China'),('KQ0686083','Chantalle','Toopin','7176','Sherman','Lampa','Indonesia'),('KV8786861','Krystyna','Treswell','5058','Summerview','Guatire','Venezuela'),('LE8882091','Sarita','Vannah','36055','Clemons','Talisay','Philippines'),('LG7396597','Kaine','Marlor','8999','Erie','Göteborg','Sweden'),('LH5238888','Wolfgang','Bevis','54653','Texas','San Salvador de Jujuy','Argentina'),('LQ5251627','Vince','Timmes','5','Lakeland','Anuling','Philippines'),('LR3726906','Kirsti','Daish','71','Jenna','Kvasice','Czech Republic'),('LX0912803','Giorgi','Bartke','70286','Rutledge','Louny','Czech Republic'),('MF2818570','Nalani','Whitehorn','149','Annamark','Manggekompo','Indonesia'),('MF7314473','Raphael','Kyneton','94564','Blue Bill Park','Knoxville','United States'),('MH2773996','Brinna','McKeevers','5449','Lien','Krasnolesnyy','Russia'),('MO7265699','Lauri','Peyton','05286','3rd','Pilcuyo','Peru'),('MW4774573','Hubey','Copeman','53359','Hudson','Raoshi','China'),('NF2754049','Kikelia','Lambole','8','Harbort','Bergerac','France'),('NL3816432','Dela','Cockerton','346','Portage','Novokuz’minki','Russia'),('NY2843107','Mead','Sage','0','International','La Virginia','Colombia'),('OE6744336','Ketty','Allitt','770','Arrowood','Staryy Togul','Russia'),('ON4453823','Fernando','Rizzone','485','Longview','Aldergrove','Canada'),('PA0411661','Sybyl','St. Quintin','9742','Sugar','Trollhättan','Sweden'),('PG8441873','Juieta','Jolly','56','Debra','Narail','Bangladesh'),('PK6733488','Lotty','O\'Heffernan','8785','Sherman','Āqchah','Afghanistan'),('PQ6254327','Kattie','Vreede','461','Warbler','Sauga','Estonia'),('PR3358685','Antonietta','Entwhistle','92','Hollow Ridge','Padaan','Indonesia'),('PR6327468','Hillel','Godby','52','Lotheville','Siekierczyn','Poland'),('PV2629580','Jeri','De Nisco','15803','Dawn','Núi Sập','Vietnam'),('QG8389636','Douglass','Teulier','70768','Arapahoe','Al Manzilah','Egypt'),('QL4528189','Moyra','Tanton','3','Eastlawn','Hadayang','China'),('QN3819035','Diannne','Borrington','84','Forster','Dandu','China'),('RL1656459','Mariann','Loughnan','93','Walton','Riachos','Portugal'),('RW8694611','Britta','Pechell','132','Fallview','Al Jahrā’','Kuwait'),('RX0955839','Kevyn','Bozier','3','Blackbird','Prainha de Baixo','Portugal'),('SF1933064','Renard','de Tocqueville','93','Glendale','El Calvario','Mexico'),('SY9656272','Amalle','Lude','683','Lakewood Gardens','Newport News','United States'),('TE8997305','Hermia','Vickerstaff','5018','Pennsylvania','Mâcon','France'),('TQ4338501','Cristionna','Beecheno','20','Hazelcrest','Jinggan','China'),('TV0160597','Gideon','Abbay','891','Pankratz','Plaisir','France'),('TZ8295215','Heinrik','Dredge','21362','Dottie','Karlshamn','Sweden'),('UH5124102','Lester','Prettyjohn','34286','Dwight','Avignon','France'),('UP1125421','Mayne','Filkin','30','Golf Course','Maying','China'),('UW0024985','Claudetta','Volonte','1720','Dovetail','Kraljevica','Croatia'),('VE1891691','Wilona','Whyler','6','Ridgeview','Amizmiz','Morocco'),('VL0426654','Penrod','Pruckner','1394','Del Mar','Kemang','Indonesia'),('VR1085618','Jarrett','Houndson','2','Esker','Jiuzihe','China'),('VV6209308','Linell','Houchen','09','Rowland','Kumanovo','Macedonia'),('WD6728885','Merwyn','Hubball','1','Lotheville','Cibitungmasjid','Indonesia'),('WK3526297','Kaylee','Prahm','08','Shopko','Zushi','Japan'),('WO2469969','Riki','Guisot','756','Mitchell','Bechyně','Czech Republic'),('WQ7566531','Gustave','Beechcraft','1','Saint Paul','Longtang','China'),('XF9468609','Agnese','Karle','0','Melby','Jinchang','China'),('XN5420862','Willie','Brandsen','7637','Charing Cross','Sidaraja','Indonesia'),('XR3640326','Winnah','Sirman','245','Harper','Banjar Dukuh','Indonesia'),('XZ7612399','Gay','Guillford','8','Farwell','Erie','United States'),('YD0372516','Bert','Swain','11','Golden Leaf','Yinping','China'),('YH4678291','Benita','Scarasbrick','0','Saint Paul','Yerofey Pavlovich','Russia'),('YN2989474','Cally','Ghidini','348','Graedel','Swan Hills','Canada'),('YU4550140','Adriaens','Claricoates','69925','Jackson','Kawm Umbū','Egypt'),('YY1053198','Gerry','Viall','121','High Crossing','Lysá nad Labem','Czech Republic'),('YZ7866301','Raquel','Orneles','9056','Sutherland','Delta del Tigre','Uruguay'),('ZF8588747','Audre','Pyvis','9906','Mitchell','Concepcion','Philippines');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pilot`
--

DROP TABLE IF EXISTS `Pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pilot` (
  `idPilot` varchar(45) NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `StreetNo` varchar(45) NOT NULL,
  `Street_name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Flight_hours` int NOT NULL,
  PRIMARY KEY (`idPilot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pilot`
--

LOCK TABLES `Pilot` WRITE;
/*!40000 ALTER TABLE `Pilot` DISABLE KEYS */;
INSERT INTO `Pilot` VALUES ('P1','Camey','Swindin','2621','Mallard','Şalākhid','Syria',5000),('P10','Ignacio','Rawcliffe','132','Victoria','Budapest','Hungary',6456),('P11','Orsa','Rotherforth','620','Lotheville','Vynohradivka','Ukraine',6547),('P12','Maren','Vallintine','7531','Algoma','Camingawan','Philippines',7688),('P13','Rollo','Meiklejohn','75','Manufacturers','Terang','Indonesia',8658),('P14','Rand','Jaan','89','Maple Wood','Huangtang','China',8543),('P15','Gottfried','Antonijevic','011','Fordem','Jinping','China',5217),('P16','Vassily','Bayley','70','Prentice','Jiahe','China',8768),('P17','Ariel','Jakubowicz','71','Transport','Gunem','Indonesia',6858),('P18','Tiertza','Maddock','345','Russell','Maymana','Afghanistan',8965),('P19','Tawnya','Gronow','74707','Montana','Storuman','Sweden',123),('P2','Land','Brisbane','590','Arrowood','Semerak','Indonesia',2000),('P20','Berni','McKevitt','0359','Manitowish','Strel\'na','Russia',345),('P21','Pearle','Garron','79','Summerview','Rybnoye','Russia',7657),('P22','Aura','Edes','829','Heath','Outjo','Namibia',4567),('P23','Abagael','Poller','3207','Marquette','Vologda','Russia',4567),('P24','Shaun','Mobley','8313','Hollow Ridge','Vakhrushi','Russia',6477),('P25','Wendye','Poyner','4','Becker','Foz Sousa','Portugal',4567),('P3','Arleyne','Foran','6','Cottonwood','Baimiao','China',1234),('P4','Mario','Davidovics','94093','Anderson','Basiao','Philippines',1092),('P5','Gwenore','MacGebenay','97','Garrison','Lanxi','China',2345),('P6','Franny','Dymott','1','Blaine','Felgueiras','Portugal',5436),('P7','Karen','Corsor','84','Tennessee','Vällingby','Sweden',10000),('P8','Mommy','McGinn','4461','Charing Cross','Plalar','Indonesia',4356),('P9','Nowell','Caddens','1432','Northridge','Ozimek','Poland',3454);
/*!40000 ALTER TABLE `Pilot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-18 10:37:57
