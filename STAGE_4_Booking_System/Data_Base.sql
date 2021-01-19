CREATE DATABASE  IF NOT EXISTS `db_bus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_bus`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_bus
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_credential`
--

DROP TABLE IF EXISTS `tbl_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_credential` (
  `USER_id` int(11) NOT NULL,
  `CREDENTIAL_hashed_password` char(200) NOT NULL,
  `CREDENTIAL_create_date` date NOT NULL,
  PRIMARY KEY (`USER_id`),
  UNIQUE KEY `USER_id_UNIQUE` (`USER_id`),
  CONSTRAINT `USER_id_IN_tbl_CRDENTIAL` FOREIGN KEY (`USER_id`) REFERENCES `tbl_user` (`USER_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_credential`
--

LOCK TABLES `tbl_credential` WRITE;
/*!40000 ALTER TABLE `tbl_credential` DISABLE KEYS */;
INSERT INTO `tbl_credential` VALUES (1,'pfNFnTx50OjhU','2019-06-06'),(2,'brpgOmotwsnkA','2019-06-07'),(3,'brCHXrfmx/hRs','2019-06-08'),(4,'broklWTNGanYM','2019-06-09'),(5,'brrQ/CUvMgDMI','2019-06-10'),(6,'brCAXrfmx/hRs','2019-06-11'),(7,'bretXExZ676DI','2019-06-12'),(8,'brhAsn.S9pHfM','2019-06-13'),(9,'brv2uIUQT8QN2','2019-06-14'),(10,'100','2021-01-03'),(11,'h','2021-01-03'),(12,'kkkkkkkkkkkk123','2021-01-03'),(14,'14','2021-01-03'),(15,'llllllllllll123','2021-01-03'),(16,'123qaaaaaaaaaaaaa','2021-01-03'),(17,'kkkkkkkkk15','2021-01-03'),(18,'password1234','2021-01-05'),(19,'password123','2021-01-03'),(20,'password123','2021-01-03'),(21,'poddsa123','2021-01-04'),(22,'abcabc123','2021-01-04'),(23,'abcabc123','2021-01-06');
/*!40000 ALTER TABLE `tbl_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seat`
--

DROP TABLE IF EXISTS `tbl_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seat` (
  `SEAT_id` varchar(64) NOT NULL,
  PRIMARY KEY (`SEAT_id`),
  UNIQUE KEY `SEAT_id_UNIQUE` (`SEAT_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seat`
--

LOCK TABLES `tbl_seat` WRITE;
/*!40000 ALTER TABLE `tbl_seat` DISABLE KEYS */;
INSERT INTO `tbl_seat` VALUES ('10A'),('10B'),('10C'),('10D'),('1A'),('1B'),('1C'),('1D'),('2A'),('2B'),('2C'),('2D'),('3A'),('3B'),('3C'),('3D'),('4A'),('4B'),('4C'),('4D'),('5A'),('5B'),('5C'),('5D'),('6A'),('6B'),('6C'),('6D'),('7A'),('7B'),('7C'),('7D'),('8A'),('8B'),('8C'),('8D'),('9A'),('9B'),('9C'),('9D');
/*!40000 ALTER TABLE `tbl_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_station`
--

DROP TABLE IF EXISTS `tbl_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_station` (
  `STATION_id` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_name` varchar(100) NOT NULL,
  `STATION_location_marker` int(11) NOT NULL,
  `STATION_time_marker` int(11) NOT NULL,
  PRIMARY KEY (`STATION_id`),
  UNIQUE KEY `Sta_id_UNIQUE` (`STATION_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_station`
--

LOCK TABLES `tbl_station` WRITE;
/*!40000 ALTER TABLE `tbl_station` DISABLE KEYS */;
INSERT INTO `tbl_station` VALUES (1,'台北',1,0),(2,'桃園',3,20),(3,'新竹',4,30),(4,'台中',8,60),(5,'高雄',15,120);
/*!40000 ALTER TABLE `tbl_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ticket`
--

DROP TABLE IF EXISTS `tbl_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_ticket` (
  `TICKET_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_id` int(11) NOT NULL,
  `SEAT_id` varchar(3) NOT NULL,
  `TRAIN_id` int(11) NOT NULL,
  `STATION_id_arrival_station` int(11) NOT NULL,
  `STATION_id_departure_station` int(11) NOT NULL,
  `TICKET_train_date` date NOT NULL,
  `TICKET_price` int(11) NOT NULL,
  `TICKET_book_time` datetime NOT NULL,
  `TICKET_pay_time` datetime DEFAULT NULL,
  PRIMARY KEY (`TICKET_id`),
  KEY `SEAT_id_IN_tbl_TICKET_idx` (`SEAT_id`),
  KEY `TRAIN_id_IN_tbl_TICKET_idx` (`TRAIN_id`),
  KEY `TICKET_departure_station_TO_tbl_STATION_idx` (`STATION_id_departure_station`),
  KEY `STATION_id_arrival_station_IN_tbl_TICKET_idx` (`STATION_id_arrival_station`),
  KEY `USER_id_IN_tbl_TICKET` (`USER_id`),
  CONSTRAINT `SEAT_id_IN_tbl_TICKET` FOREIGN KEY (`SEAT_id`) REFERENCES `tbl_seat` (`SEAT_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STATION_id_arrival_station_IN_tbl_TICKET` FOREIGN KEY (`STATION_id_arrival_station`) REFERENCES `tbl_station` (`STATION_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STATION_id_departure_station_IN_tbl_TICKET` FOREIGN KEY (`STATION_id_departure_station`) REFERENCES `tbl_station` (`STATION_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TRAIN_id_IN_tbl_TICKET` FOREIGN KEY (`TRAIN_id`) REFERENCES `tbl_train` (`TRAIN_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USER_id_IN_tbl_TICKET` FOREIGN KEY (`USER_id`) REFERENCES `tbl_user` (`USER_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket`
--

LOCK TABLES `tbl_ticket` WRITE;
/*!40000 ALTER TABLE `tbl_ticket` DISABLE KEYS */;
INSERT INTO `tbl_ticket` VALUES (1,1,'1D',1,2,1,'2020-06-10',200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(2,1,'3B',1,5,2,'2020-06-10',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(3,2,'2A',2,4,2,'2020-06-10',500,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(4,2,'2A',2,4,3,'2020-06-12',400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(5,3,'3D',3,5,1,'2020-06-13',1400,'2020-06-12 20:30:00','2020-06-13 07:35:00'),(6,4,'4B',3,3,2,'2020-06-13',100,'2020-06-12 14:30:00','2020-06-12 17:35:00'),(7,5,'1A',4,2,5,'2020-06-15',1200,'2020-06-15 10:22:00',NULL),(8,6,'2A',4,1,5,'2020-06-15',1400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(9,7,'5A',5,2,4,'2020-06-16',500,'2020-06-12 10:31:00',NULL),(10,7,'5B',5,2,4,'2020-06-16',500,'2020-06-11 10:31:00',NULL),(11,7,'5C',5,2,4,'2020-06-16',500,'2020-06-11 10:31:00','2020-06-11 11:35:00'),(12,8,'6C',6,2,3,'2020-06-16',500,'2020-06-16 10:30:00','2020-06-16 10:36:00'),(13,23,'1A',2,2,1,'2021-01-14',200,'2021-01-07 16:55:50',NULL),(14,23,'10A',2,2,1,'2021-01-14',200,'2021-01-07 17:01:32',NULL);
/*!40000 ALTER TABLE `tbl_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_train`
--

DROP TABLE IF EXISTS `tbl_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_train` (
  `TRAIN_id` int(11) NOT NULL,
  `STATION_id_departure_station` int(11) NOT NULL,
  `TRAIN_arrival_time` time DEFAULT NULL,
  `TRAIN_departure_time` time DEFAULT NULL,
  `TRAIN_off_date` date DEFAULT NULL,
  `TRAIN_on_date` date NOT NULL,
  PRIMARY KEY (`TRAIN_id`,`STATION_id_departure_station`),
  KEY `TRAIN_departure_station_TO_tbl_STATION_idx` (`STATION_id_departure_station`),
  CONSTRAINT `STATION_id_departure_station_IN_tbl_TRAIN` FOREIGN KEY (`STATION_id_departure_station`) REFERENCES `tbl_station` (`STATION_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_train`
--

LOCK TABLES `tbl_train` WRITE;
/*!40000 ALTER TABLE `tbl_train` DISABLE KEYS */;
INSERT INTO `tbl_train` VALUES (1,1,NULL,'07:00:00','2020-06-17','2020-01-01'),(1,2,'07:20:00','07:22:00','2020-06-17','2020-01-01'),(1,3,'07:32:00','07:34:00','2020-06-17','2020-01-01'),(1,4,'08:04:00','08:06:00','2020-06-17','2020-01-01'),(1,5,'09:06:00',NULL,'2020-06-17','2020-01-01'),(2,1,NULL,'10:00:00',NULL,'2020-01-01'),(2,2,'10:20:00','10:22:00',NULL,'2020-01-01'),(2,3,'10:32:00','10:34:00',NULL,'2020-01-01'),(2,4,'11:04:00',NULL,NULL,'2020-01-01'),(3,1,NULL,'13:00:00',NULL,'2020-02-01'),(3,2,'13:20:00','13:22:00',NULL,'2020-02-01'),(3,3,'13:32:00','13:34:00',NULL,'2020-02-01'),(3,4,'14:04:00','14:06:00',NULL,'2020-02-01'),(3,5,'15:06:00',NULL,NULL,'2020-02-01'),(4,1,'10:06:00',NULL,NULL,'2020-02-01'),(4,2,'09:44:00','09:46:00',NULL,'2020-02-01'),(4,3,'09:32:00','09:34:00',NULL,'2020-02-01'),(4,4,'09:00:00','09:02:00',NULL,'2020-02-01'),(4,5,NULL,'08:00:00',NULL,'2020-02-01'),(5,1,'13:04:00',NULL,NULL,'2020-02-01'),(5,2,'12:42:00','12:44:00',NULL,'2020-02-01'),(5,3,'12:30:00','12:32:00',NULL,'2020-02-01'),(5,4,NULL,'12:00:00',NULL,'2020-02-01'),(6,1,'19:06:00',NULL,NULL,'2020-01-01'),(6,2,'18:44:00','18:46:00',NULL,'2020-01-01'),(6,3,'18:32:00','18:34:00',NULL,'2020-01-01'),(6,4,'18:00:00','18:02:00',NULL,'2020-01-01'),(6,5,NULL,'17:00:00',NULL,'2020-01-01');
/*!40000 ALTER TABLE `tbl_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_user` (
  `USER_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_email` varchar(200) NOT NULL,
  `USER_register_date` date NOT NULL,
  `USER_delete` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`USER_id`),
  UNIQUE KEY `User_id_UNIQUE` (`USER_id`),
  UNIQUE KEY `USER_email_UNIQUE` (`USER_email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Marvel_Steve@gmail.com','2019-06-06','F'),(2,'Marvel_Tony@gmail.com','2019-06-07','F'),(3,'Marvel_Thor@gmail.com','2019-06-08','F'),(4,'Marvel_Peter@gmail.com','2019-06-09','F'),(5,'Marvel_David @gmail.com','2019-06-10','F'),(6,'Marvel_Natasha@gmail.com','2019-06-11','F'),(7,'Marvel_Wanda@gmail.com','2019-06-12','F'),(8,'Marvel_Carol@gmail.com','2019-06-13','F'),(9,'Marvel_Stephen@gmail.com','2019-06-14','F'),(10,'10','2019-06-15','T'),(11,'a','2021-01-03','F'),(12,'106409523@ncu.edu.tw','2021-01-03','F'),(14,'14','2021-01-03','T'),(15,'aaaa@gmail.com','2021-01-03','F'),(16,'colin100113@yahoo.com.tw','2021-01-03','F'),(17,'aaaaaaaaa@huh.com','2021-01-03','F'),(18,'username@ncu.com','2021-01-03','F'),(19,'ff@dd.com','2021-01-03','F'),(20,'kkkk@kk.com','2021-01-03','F'),(21,'aaaaaaaaaall@jiji.com','2021-01-04','F'),(22,'colin100112@gmail.com','2021-01-04','F'),(23,'colin100113@gmail.com','2021-01-06','F');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_bus'
--

--
-- Dumping routines for database 'db_bus'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BookTicket`(

in in_user_id int(10),
in in_train_id int(11),
in in_departure_station int,
in in_arrival_station int,
in in_seat_id varchar(64),
in in_train_date date,

out num_row int(100)

)
BEGIN

declare price int;

if (select USER_delete from tbl_USER where USER_id = in_user_id) = 'F'												-- 帳號沒被刪除
then


set price = abs(((select STATION_location_marker from tbl_STATION where STATION_id = in_departure_station)-			-- 算價錢
	(select STATION_location_marker from tbl_STATION where STATION_id = in_arrival_station))*100);
    
insert into tbl_TICKET													
	values(null,in_user_id,in_seat_id,in_train_id,in_arrival_station,in_departure_station,in_train_date,price,sysdate(),null);

select 																												-- result set
	TICKET_id as ticket_id,
    USER_id as user_id,
    TRAIN_id as train_id,
    STATION_id_departure_station as departure_station,
    STATION_id_arrival_station as arrival_station,
    SEAT_id as seat_id,
    TICKET_book_time as book_time,
    TICKET_train_date as train_date
from 
	tbl_TICKET
where
	USER_id = in_user_id and
    SEAT_id = in_seat_id and
    TRAIN_id = in_train_id and
    STATION_id_departure_station = in_departure_station and
    TICKET_train_date = in_train_date;
    
    
    
select count(TICKET_id) into num_row																				-- output
from 
	tbl_TICKET
where
	USER_id = in_user_id and
    SEAT_id = in_seat_id and
    TRAIN_id = in_train_id and
    STATION_id_departure_station = in_departure_station and
    TICKET_train_date = in_train_date;

else 																												-- 帳號刪除則不能訂票
set num_row = 0;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteUserByUserID`(

	in in_user_id int(10),
	out affected_row_num int(100)
)
BEGIN
																				-- 檢查是否真的有這個 user id
    if exists (select USER_id from tbl_USER where USER_id = in_user_id) then 
    	if exists (																-- 輸入的id存在 -> 檢查該user id是否有票
			select USER_id 														
			from tbl_USER inner join tbl_TICKET using (USER_id)
			where USER_id = in_user_id)
		then																
			set affected_row_num = row_count(); -- 0
		else																	-- 有此id且沒票 -> 開始刪除
			update tbl_USER
				set
                USER_email = in_user_id,



                USER_delete = 'T'
                where
                USER_id = in_user_id;
			set affected_row_num = row_count();
			update tbl_CREDENTIAL
				set
                CREDENTIAL_hashed_password = in_user_id
                where USER_id = in_user_id;
			set affected_row_num = affected_row_num + row_count();
		end if;
	else																		-- 輸入的id不存在 -> output = 0
		set affected_row_num = row_count();
	end if;
        
                
                
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_bookticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Delete_bookticket`(

in in_user_id int(10),
in in_ticket_id int(11),					
out affected_row_num int(100)		

)
BEGIN
    


	if (select TICKET_pay_time												
		from tbl_TICKET
		where TICKET_id = in_ticket_id)is null 									-- 判斷還沒付錢
	then
		delete from tbl_TICKET 
		where 
			TICKET_id = in_ticket_id and
			USER_id = in_user_id;
	end if;

	set affected_row_num = row_count();



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAllTrain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllTrain`(
out num_row int(100)
)
BEGIN
SELECT * FROM tbl_train;
select																						-- out put
	count(TRAIN_id) into num_row
from
	tbl_train;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetNowTrain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetNowTrain`(
out num_row int(100)
)
BEGIN
SELECT * FROM tbl_train where date(TRAIN_off_date) >= ( CURDATE() ) or TRAIN_off_date is null ;
select																						-- out put
	count(TRAIN_id) into num_row
from
	tbl_train
where 
	date(TRAIN_off_date) >= ( CURDATE() ) or TRAIN_off_date is null;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetPaidTicketByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetPaidTicketByUser`(

in in_userID int(10),
out num_row int(100)

)
BEGIN

select																						-- result set
	TICKET_id as ticket_id,
    USER_id as userID,
    TRAIN_id as train_id,
    SEAT_id as seat_id,
    TICKET_book_time as book_time,
    TICKET_pay_time as pay_time
from
	tbl_TICKET
where 
	USER_id = in_userID and
    TICKET_pay_time is not null;

select																						-- out put
	count(TICKET_id) into num_row
from
	tbl_TICKET
where 
	USER_id = in_userID and
    TICKET_pay_time is not null;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetStation`(
	out num_row int
)
BEGIN
																				-- result set
	select
		STATION_id AS station_id,
        STATION_name AS station_name
	from tbl_STATION ;
																				-- output
    select
		count(STATION_id) INTO num_row
	from tbl_STATION;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetTicketByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetTicketByUser`(

in in_userID int(10),
out num_row int(100)


)
BEGIN
select																						-- result set
	TICKET_id as ticket_id,
    TICKET_price as price,
    TICKET_train_date as train_date,
    TRAIN_id as train_id,
    SEAT_id as seat_id,
    STATION_id_departure_station as departure,
    STATION_id_arrival_station as arrival,
    TICKET_book_time as book_time,
    TICKET_pay_time as pay_time
from
	tbl_TICKET
where 
	USER_id = in_userID ;

select																						-- out put
	count(TICKET_id) into num_row
from
	tbl_TICKET
where 
	USER_id = in_userID ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PayTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_PayTicket`(
in in_user_id int(10),
in in_ticket_id int(11),
out affected_row_num int(100) 


)
BEGIN
declare book_time datetime;
declare train_date date;
declare departure_time time;

select																				
	i.TICKET_book_time,
	i.TICKET_train_date,
    r.TRAIN_departure_time 
into book_time,train_date,departure_time
from
	tbl_TICKET i
inner join 
	tbl_TRAIN r
using(TRAIN_id,STATION_id_departure_station)
where
	i.TICKET_id = in_ticket_id;


if 																							-- 判斷是否符合商業邏輯(3天內包含當天、發車前30分鐘不能付款)
	date(book_time) >= ( CURDATE() - INTERVAL 2 DAY ) 
    
then
	update tbl_TICKET																		-- 符合商業邏輯->update tbl_ticket
		set TICKET_pay_time = SYSDATE()
		where TICKET_id = in_ticket_id;
	set affected_row_num = row_count();
else 
delete from tbl_TICKET where TICKET_id = in_ticket_id;										-- 不符合商業邏輯->將票刪掉
set affected_row_num = 101;
end if;



    
    
    
    
    
	







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_QueryTicketWithSeatManagement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_QueryTicketWithSeatManagement`(

in in_departure_time datetime,													-- 我做的是datetime版本
in in_departure_station int,
in in_arrival_station int,
out num_row int(100)

)
BEGIN


declare price int;


if date(in_departure_time) <= ( CURDATE() + INTERVAL 13 DAY ) then
																				-- 為了增加可讀性，我把步驟拆成幾個temporary table 比較好說明

drop table if exists dep_st;
CREATE TEMPORARY TABLE dep_st (TRAIN_id int,TRAIN_departure_time time); 		-- 1.這個table找出會經過使用者指定的出發站的車次																	
INSERT INTO dep_st 
	SELECT TRAIN_id,TRAIN_departure_time
    FROM tbl_TRAIN
	where TRAIN_on_date < date(in_departure_time) and
		(TRAIN_off_date > date(in_departure_time) or
		TRAIN_off_date is null) and 
		STATION_id_departure_station = in_departure_station and
        TRAIN_departure_time >= time(in_departure_time);


drop table if exists ari_st;					
CREATE TEMPORARY TABLE ari_st (TRAIN_id int,TRAIN_arrival_time time); 			-- 2.這個table找出會經過使用者指定的抵達站的車次
INSERT INTO ari_st 
	SELECT TRAIN_id,TRAIN_arrival_time
    FROM tbl_TRAIN
	where TRAIN_on_date < date(in_departure_time) and
		(TRAIN_off_date > date(in_departure_time) or
		TRAIN_off_date is null) and 
		STATION_id_departure_station = in_arrival_station;


drop table if exists avi_seat;													-- 3.這個table透過 1 intersect 2 找出符合使用者要求的車次和座位(還沒扣掉被訂走的)
CREATE TEMPORARY TABLE avi_seat 
	(TRAIN_id int,SEAT_id varchar(64),TRAIN_departure_time time,TRAIN_arrival_time time); 		
INSERT INTO avi_seat 
	select a.TRAIN_id,SEAT_id,a.TRAIN_departure_time,b.TRAIN_arrival_time
	from
		dep_st a
	inner join 
		ari_st b
	USING(TRAIN_id)
	cross join 
		tbl_SEAT;


if in_departure_station<in_arrival_station then									-- 4. 這邊則query出已經被訂走的車位(分正向和逆向的車討論)

	set price = ((select STATION_location_marker from tbl_STATION where STATION_id = in_arrival_station)-
	(select STATION_location_marker from tbl_STATION where STATION_id = in_departure_station))*100;
    
	drop table if exists not_avi;
	CREATE TEMPORARY TABLE not_avi (TRAIN_id int,SEAT_id varchar(64)); 										
	INSERT INTO not_avi 
		SELECT i.TRAIN_id,i.SEAT_id
		FROM tbl_TICKET i
		inner join
			tbl_TRAIN r
		on 
			r.STATION_id_departure_station<i.STATION_id_arrival_station
			and r.STATION_id_departure_station>=i.STATION_id_departure_station 
			and i.TRAIN_id=r.TRAIN_id
			and i.TICKET_train_date = date(in_departure_time)
			and in_departure_station <= r.STATION_id_departure_station 
			and r.STATION_id_departure_station<in_arrival_station;
            
else
	set price = ((select STATION_location_marker from tbl_STATION where STATION_id = in_departure_station)-
	(select STATION_location_marker from tbl_STATION where STATION_id = in_arrival_station))*100;
    
	drop table if exists not_avi;
	CREATE TEMPORARY TABLE not_avi (TRAIN_id int,SEAT_id varchar(64)); 		
	INSERT INTO not_avi 
		SELECT i.TRAIN_id,i.SEAT_id
		FROM tbl_TICKET i
		inner join
			tbl_TRAIN r
		on 
			r.STATION_id_departure_station>i.STATION_id_arrival_station
			and r.STATION_id_departure_station<=i.STATION_id_departure_station 
			and i.TRAIN_id=r.TRAIN_id
			and i.TICKET_train_date = date(in_departure_time)
			and in_departure_station >= r.STATION_id_departure_station 
			and r.STATION_id_departure_station>in_arrival_station;
end if;


select																			-- 最後我們將3 minus 4 得到符合條件而且還沒被訂走的車次座位
	v.TRAIN_id as train_id,
    in_departure_station AS departure_station,
    in_arrival_station as arrival_station,
    v.SEAT_id as seat_id,
    v.TRAIN_departure_time as departure_time,
    v.TRAIN_arrival_time as arrival_time,
    price as price
from
	avi_seat v
left join
	not_avi n
USING(SEAT_id,TRAIN_id)
where n.TRAIN_id is null and
	v.TRAIN_departure_time < v.TRAIN_arrival_time
order by v.TRAIN_id ASC,v.seat_id ASC;

select 
	count(train_id) into num_row
from
	avi_seat v
left join
	not_avi n
USING(SEAT_id,TRAIN_id)
where n.TRAIN_id is null and
	v.TRAIN_departure_time < v.TRAIN_arrival_time;

else

set num_row = 0 ;
 
 end if;
 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegisterUser`(

    in in_email varchar(200),
    in in_hashedPwd char(200),
    out row_num int(100)
    
)
BEGIN
	
																				-- 檢查email是否已經存在，存在則回傳0
	if exists (select USER_id from tbl_USER where USER_email = in_email) then		
		set row_num = 0;
        
	else
																				-- email尚未存在 -> insert 進入tbl_USER
		insert into tbl_USER
        values (
			null, 
            in_email,
            curdate(),
            'F'
		);
																				-- 檢查 insert 進入 tbl_USER 有無成功
		set row_num = (select USER_id from tbl_USER where USER_email = in_email) ;
		if exists (select row_num) then
																				-- insert 進入 tbl_USER 成功 -> insert hashedpwd 進入 tbl_CREDENTIAL
			insert into tbl_CREDENTIAL
			value ( 
				row_num,
				in_hashedPwd,
				curdate()
			);
			
		end if;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ResetNewPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ResetNewPassword`(
	in in_userID int(10),
    in in_hashedPwd char(200),
    out affected_row_num int(100)
)
BEGIN


    
    update tbl_CREDENTIAL
		set CREDENTIAL_hashed_password = in_hashedPwd,
			CREDENTIAL_create_date = curdate()
        where USER_id = in_userID;
    set affected_row_num = row_count();
    
    
    
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TrainManagement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_TrainManagement`(
in in_train_id int,
in in_off_date date,
in in_departure_time time,
in in_departure_station varchar(100),
in in_arrival_station varchar(100),
in in_on_date date,
out affected_row_num int(100)
)
BEGIN
declare new_tr_id int;
declare num_of_stop int;
declare time_mk_last int;
declare loc_mk_last int;
declare time_mk_this int;
declare dep_time_last time;
declare counter int;
set affected_row_num = 0;


if date(in_off_date) >= ( CURDATE() + INTERVAL 13 DAY ) and									-- 判斷是否符合business rules(14天內不能改)
	date(in_on_date) >= ( CURDATE() + INTERVAL 13 DAY ) then
    
    set new_tr_id = 1+(SELECT TRAIN_id FROM tbl_TRAIN ORDER BY TRAIN_id DESC LIMIT 1);		-- 新車的id
    
    if in_arrival_station > in_departure_station then										-- 正向的車
    
		set num_of_stop = 1+in_arrival_station - in_departure_station;						-- 新車共停幾站
    
		insert into tbl_TRAIN																-- 先insert出發站(arrival time要為null)
			value(new_tr_id,in_departure_station,null,in_departure_time,null,in_on_date);
		set dep_time_last = in_departure_time;
        
        set affected_row_num = affected_row_num+row_count();
		
		select STATION_time_marker															-- 紀錄出發站time marker
		into time_mk_last
		from tbl_STATION
		where STATION_id = (in_departure_station);
	
		set counter = 1;
		insert_loop: LOOP																	-- 這個loop最多3次
																							-- 用來輸入中間站(如果只有兩站則不會進入這個loop)
			if counter >= num_of_stop-1 then
				leave insert_loop;
			end if;
            
			select STATION_time_marker
			into time_mk_this
			from tbl_STATION
			where STATION_id = (in_departure_station + counter);
            
			insert into tbl_TRAIN
				value(new_tr_id,
					(in_departure_station+counter),
					(dep_time_last + interval (time_mk_this-time_mk_last) minute),
					(dep_time_last + interval (time_mk_this-time_mk_last+2) minute),
					null,
					in_on_date);
			set affected_row_num = affected_row_num+row_count();
            
			set dep_time_last = dep_time_last + interval (time_mk_this-time_mk_last+2) minute;    
			set time_mk_last = time_mk_this;
			set counter = counter+1;
		end loop;
        
		select 																				-- insert 終點站 (departure time要為null)
			STATION_time_marker
		into 
			time_mk_this
		from
			tbl_STATION
		where 
			STATION_id = (in_departure_station + num_of_stop-1);
            
		insert into tbl_TRAIN
		value(new_tr_id,
			(in_departure_station+counter),
			(dep_time_last + interval (time_mk_this-time_mk_last) minute),
			null,
			null,
			in_on_date);
		set affected_row_num = affected_row_num+row_count();

	else																					-- 接下來基本上一樣，只是是逆向的車		
		set num_of_stop = 1+in_departure_station - in_arrival_station;				
    
		insert into tbl_TRAIN																
			value(new_tr_id,in_departure_station,null,in_departure_time,null,in_on_date);
		set dep_time_last = in_departure_time;
        
        set affected_row_num = affected_row_num+row_count();
		
		select STATION_time_marker											
		into time_mk_last
		from tbl_STATION
		where STATION_id = (in_departure_station);
	
		set counter = 1;
		insert_loop: LOOP																	
																				
			if counter >= num_of_stop-1 then
				leave insert_loop;
			end if;
            
			select STATION_time_marker
			into time_mk_this
			from tbl_STATION
			where STATION_id = (in_departure_station - counter);
            
			insert into tbl_TRAIN
				value(new_tr_id,
					(in_departure_station-counter),
					(dep_time_last + interval (time_mk_last-time_mk_this) minute),
					(dep_time_last + interval (time_mk_last-time_mk_this+2) minute),
					null,
					in_on_date);
			set affected_row_num = affected_row_num+row_count();
            
			set dep_time_last = dep_time_last + interval (time_mk_last-time_mk_this+2) minute;    
			set time_mk_last = time_mk_this;
			set counter = counter+1;
		end loop;
        
		select STATION_time_marker	
		into time_mk_this
		from tbl_STATION
		where STATION_id = (in_departure_station - num_of_stop+1);
            
		insert into tbl_TRAIN																			
		value(new_tr_id,
			(in_departure_station-counter),
			(dep_time_last + interval (time_mk_last-time_mk_this) minute),
			null,
			null,
			in_on_date);
		set affected_row_num = affected_row_num+row_count();



 end if;
 
 
 
	update tbl_TRAIN																		-- 最後將舊車設off time
	set TRAIN_off_date = in_off_date
	where TRAIN_id = in_train_id;
    set affected_row_num = affected_row_num+row_count();
    
    select new_tr_id as train_id,
		in_departure_time as departure_time,
        dep_time_last + interval (abs(time_mk_this-time_mk_last)) minute as arrival_time,
        in_departure_station as departure_station,
        in_arrival_station as arrival_station,
        in_on_date as on_date,
        null as off_date;


	

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UserLogin`(
	in in_email varchar(200),
	in in_hashedPwd char(200),
    out row_num int(100) -- user id
)
BEGIN
	set row_num = 0;																						-- 預設
	select
    USER_id into row_num 
	from
		(tbl_USER
		inner join  
        tbl_CREDENTIAL
        using(USER_id))
	where USER_email = in_email and CREDENTIAL_hashed_password = in_hashedPwd and USER_delete = 'F';		-- 已刪除的帳號不能log in
    
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

-- Dump completed on 2021-01-07 21:52:25
