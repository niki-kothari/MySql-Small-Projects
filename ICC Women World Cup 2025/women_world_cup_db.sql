CREATE DATABASE  IF NOT EXISTS `women_world_cup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `women_world_cup`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: women_world_cup
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `match_results`
--

DROP TABLE IF EXISTS `match_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_results` (
  `match_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `match_type` text,
  `venue` text,
  `team1` text,
  `team2` text,
  `toss_winner` text,
  `toss_decision` text,
  `team1_score` text,
  `team2_score` text,
  `winner` text,
  `margin` text,
  `player_of_match` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_results`
--

LOCK TABLES `match_results` WRITE;
/*!40000 ALTER TABLE `match_results` DISABLE KEYS */;
INSERT INTO `match_results` VALUES (1,'2025-09-30','Group Stage','Guwahati','India','Sri Lanka','Sri Lanka','Field','269/8 (47 ov)','211 (45.4 ov)','India','59 runs (DLS)','Smriti Mandhana'),(2,'2025-10-01','Group Stage','Indore','Australia','New Zealand','Australia','Bat','326','237 (43.2 ov)','Australia','89 runs','Phoebe Litchfield'),(3,'2025-10-02','Group Stage','Colombo','Pakistan','Bangladesh','Pakistan','Bat','129','131/3 (31.1 ov)','Bangladesh','7 wickets','Nigar Sultana'),(4,'2025-10-03','Group Stage','Guwahati','South Africa','England','South Africa','Bat','69','72/3 (17.4 ov)','England','7 wickets','Marizanne Kapp'),(5,'2025-10-04','Group Stage','Indore','Sri Lanka','Australia','Australia','Bat','215/8','219/3 (32.2 ov)','Australia','7 wickets','Ellyse Perry'),(6,'2025-10-05','Group Stage','Visakhapatnam','India','Pakistan','India','Bat','295/8','239','India','56 runs','Harmanpreet Kaur'),(7,'2025-10-06','Group Stage','Colombo','New Zealand','South Africa','New Zealand','Bat','244','248/5 (49.1 ov)','South Africa','5 wickets','Laura Wolvaardt'),(8,'2025-10-07','Group Stage','Guwahati','Bangladesh','England','England','Field','118','119/2 (24.3 ov)','England','8 wickets','Sophie Ecclestone'),(9,'2025-10-08','Group Stage','Colombo','Australia','Pakistan','Australia','Bat','286/6','142','Australia','144 runs','Ashleigh Gardner'),(10,'2025-10-09','Group Stage','Indore','India','South Africa','India','Bat','185/8','190/3 (40.5 ov)','South Africa','7 wickets','Nadine de Klerk'),(11,'2025-10-10','Group Stage','Guwahati','New Zealand','Bangladesh','New Zealand','Bat','249','225','New Zealand','24 runs','Amelia Kerr'),(12,'2025-10-11','Group Stage','Colombo','England','Sri Lanka','Sri Lanka','Field','217','221/5 (43.3 ov)','Sri Lanka','5 wickets','Chamari Athapaththu'),(13,'2025-10-12','Group Stage','Navi Mumbai','India','Australia','Australia','Bat','330','333/5 (47.5 ov)','Australia','5 wickets','Tahlia McGrath'),(14,'2025-10-13','Group Stage','Visakhapatnam','Bangladesh','South Africa','South Africa','Bat','168/9','169/1 (30.4 ov)','South Africa','9 wickets','Tazmin Brits'),(15,'2025-10-14','Group Stage','Guwahati','Sri Lanka','New Zealand','New Zealand','Bat','202','205/3 (37.4 ov)','New Zealand','7 wickets','Sophie Devine'),(16,'2025-10-15','Group Stage','Colombo','England','Pakistan','England','Field','142','145/2 (26.2 ov)','England','8 wickets','Nat Sciver-Brunt'),(17,'2025-10-16','Group Stage','Visakhapatnam','Bangladesh','Australia','Australia','Field','128','129/0 (16.3 ov)','Australia','10 wickets','Alyssa Healy'),(18,'2025-10-17','Group Stage','Colombo','Sri Lanka','South Africa','South Africa','Bat','153','154/3 (31.2 ov)','South Africa','7 wickets','Marizanne Kapp'),(19,'2025-10-18','Group Stage','Colombo','Pakistan','New Zealand','New Zealand','Field','181','182/3 (39.2 ov)','New Zealand','7 wickets','Suzie Bates'),(20,'2025-10-19','Group Stage','Navi Mumbai','England','India','England','Field','231','235/5 (48.2 ov)','India','5 wickets','Smriti Mandhana'),(21,'2025-10-20','Group Stage','Colombo','Sri Lanka','Bangladesh','Bangladesh','Field','132','133/4 (28.1 ov)','Bangladesh','6 wickets','Fargana Hoque'),(22,'2025-10-21','Group Stage','Colombo','South Africa','Pakistan','South Africa','Bat','235','85','South Africa','150 runs','Ayabonga Khaka'),(23,'2025-10-22','Group Stage','Indore','England','Australia','Australia','Field','236','237/4 (39.1 ov)','Australia','6 wickets','Beth Mooney'),(24,'2025-10-23','Group Stage','Navi Mumbai','India','New Zealand','India','Bat','274','278/5 (48.3 ov)','New Zealand','5 wickets','Brooke Halliday'),(25,'2025-10-24','Group Stage','Colombo','Pakistan','Sri Lanka','NA','NA','18/0 (4.2 ov)','No result','No result','No result','NA'),(26,'2025-10-25','Group Stage','Indore','South Africa','Australia','South Africa','Bat','97','98/3 (16.5 ov)','Australia','7 wickets','Alana King'),(27,'2025-10-26','Group Stage','Visakhapatnam','New Zealand','England','New Zealand','Bat','168','172/2 (29.2 ov)','England','8 wickets','Heather Knight'),(28,'2025-10-26','Group Stage','Navi Mumbai','Bangladesh','India','Bangladesh','Bat','119/9 (27 ov)','57/0 (8.4 ov)','No result','No result','NA'),(29,'2025-10-29','Semi Final 1','Guwahati','South Africa','England','South Africa','Bat','319/7','194 (42.3 ov)','South Africa','125 runs','Laura Wolvaardt'),(30,'2025-10-30','Semi Final 2','Navi Mumbai','India','Australia','Australia','Bat','333','336/4 (48.2 ov)','India','6 wickets','Jemimah Rodrigues'),(31,'2025-11-02','Final','Navi Mumbai','India','South Africa','South Africa','Field','298/7','246 (45.3 ov)','India','52 runs','Shafali Verma');
/*!40000 ALTER TABLE `match_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_table`
--

DROP TABLE IF EXISTS `points_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_table` (
  `position` int DEFAULT NULL,
  `team` text,
  `matches` int DEFAULT NULL,
  `wins` int DEFAULT NULL,
  `losses` int DEFAULT NULL,
  `no_result` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `net_run_rate` double DEFAULT NULL,
  `qualification` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points_table`
--

LOCK TABLES `points_table` WRITE;
/*!40000 ALTER TABLE `points_table` DISABLE KEYS */;
INSERT INTO `points_table` VALUES (1,'Australia',7,6,1,0,12,1.452,'Qualified for Semi-Finals'),(2,'South Africa',7,5,2,0,10,0.673,'Qualified for Semi-Finals'),(3,'England',7,5,2,0,10,0.607,'Qualified for Semi-Finals'),(4,'India',7,4,3,1,9,-0.107,'Qualified for Semi-Finals'),(5,'New Zealand',7,3,4,0,6,-0.329,'Eliminated'),(6,'Bangladesh',7,3,4,1,7,-0.773,'Eliminated'),(7,'Sri Lanka',7,2,5,1,5,-0.995,'Eliminated'),(8,'Pakistan',7,0,7,1,1,-1.851,'Eliminated');
/*!40000 ALTER TABLE `points_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_statistics`
--

DROP TABLE IF EXISTS `team_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_statistics` (
  `team` text,
  `matches` int DEFAULT NULL,
  `wins` int DEFAULT NULL,
  `losses` int DEFAULT NULL,
  `no_result` int DEFAULT NULL,
  `win_percentage` double DEFAULT NULL,
  `highest_total` int DEFAULT NULL,
  `lowest_total` int DEFAULT NULL,
  `highest_run_chase` int DEFAULT NULL,
  `avg_first_innings` double DEFAULT NULL,
  `avg_second_innings` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_statistics`
--

LOCK TABLES `team_statistics` WRITE;
/*!40000 ALTER TABLE `team_statistics` DISABLE KEYS */;
INSERT INTO `team_statistics` VALUES ('Australia',9,7,2,0,77.78,330,97,333,265.6,208.5),('South Africa',10,6,4,0,60,319,69,248,189.2,195.4),('India',10,8,2,0,80,333,185,336,266.8,216.3),('England',9,5,4,0,55.56,236,118,235,199.4,182.7),('New Zealand',8,3,5,0,37.5,249,168,278,211.8,228.6),('Bangladesh',8,3,4,1,42.86,168,118,133,138.6,145.2),('Sri Lanka',8,2,5,1,28.57,221,132,221,172.4,187.3);
/*!40000 ALTER TABLE `team_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_run_scorers`
--

DROP TABLE IF EXISTS `top_run_scorers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_run_scorers` (
  `rank` int DEFAULT NULL,
  `player_name` text,
  `team` text,
  `matches` int DEFAULT NULL,
  `innings` int DEFAULT NULL,
  `runs` int DEFAULT NULL,
  `highest_score` text,
  `average` double DEFAULT NULL,
  `strike_rate` double DEFAULT NULL,
  `centuries` int DEFAULT NULL,
  `half_centuries` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_run_scorers`
--

LOCK TABLES `top_run_scorers` WRITE;
/*!40000 ALTER TABLE `top_run_scorers` DISABLE KEYS */;
INSERT INTO `top_run_scorers` VALUES (1,'Laura Wolvaardt','South Africa',10,10,571,'169',63.44,85.78,3,2),(2,'Smriti Mandhana','India',10,10,379,'105',42.11,87.12,1,3),(3,'Jemimah Rodrigues','India',10,9,292,'102*',48.67,79.78,1,2),(4,'Phoebe Litchfield','Australia',10,10,287,'103',31.89,92.58,1,1),(5,'Ashleigh Gardner','Australia',10,9,275,'96*',39.29,102.23,0,2),(6,'Deepti Sharma','India',10,9,215,'58',30.71,81.44,0,2),(7,'Beth Mooney','Australia',10,9,213,'85*',35.5,75.53,0,2),(8,'Ellyse Perry','Australia',10,9,206,'78',29.43,71.28,0,1),(9,'Tahlia McGrath','Australia',10,9,198,'87',28.29,88,0,1),(10,'Heather Knight','England',9,9,195,'70',24.38,72.49,0,2),(11,'Harmanpreet Kaur','India',10,10,188,'95',20.89,80.34,0,1),(12,'Annerie Dercksen','South Africa',10,8,182,'84*',30.33,112.35,0,1),(13,'Marizanne Kapp','South Africa',10,9,179,'74',22.38,68.85,0,1),(14,'Nat Sciver-Brunt','England',9,9,176,'67',21.5,74.58,0,1),(15,'Sophie Devine','New Zealand',8,8,174,'65',21.75,79.45,0,2);
/*!40000 ALTER TABLE `top_run_scorers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_wicket_takers`
--

DROP TABLE IF EXISTS `top_wicket_takers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_wicket_takers` (
  `rank` int DEFAULT NULL,
  `player_name` text,
  `team` text,
  `matches` int DEFAULT NULL,
  `innings` int DEFAULT NULL,
  `overs` double DEFAULT NULL,
  `wickets` int DEFAULT NULL,
  `best_figures` text,
  `average` double DEFAULT NULL,
  `economy` double DEFAULT NULL,
  `strike_rate` double DEFAULT NULL,
  `five_wicket_hauls` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_wicket_takers`
--

LOCK TABLES `top_wicket_takers` WRITE;
/*!40000 ALTER TABLE `top_wicket_takers` DISABLE KEYS */;
INSERT INTO `top_wicket_takers` VALUES (1,'Deepti Sharma','India',10,9,71,22,'5/39',20.41,4.15,19.4,1),(2,'Annabel Sutherland','Australia',10,9,69.3,19,'5/17',15.68,3.87,21.9,1),(3,'Alana King','Australia',10,9,77,18,'7/20',17.83,3.64,25.7,1),(4,'Marizanne Kapp','South Africa',10,10,73,17,'5/20',19.76,4.23,25.8,1),(5,'Ashleigh Gardner','Australia',10,9,67,16,'4/32',21.06,4.76,25.1,0),(6,'Sophie Ecclestone','England',9,9,76,15,'4/29',22.73,3.99,30.4,0),(7,'Sune Luus','South Africa',10,10,68,14,'3/28',24.86,4.53,29.1,0),(8,'Ayabonga Khaka','South Africa',10,10,72,13,'3/58',26.31,4.75,33.2,0),(9,'Renuka Singh','India',10,9,64,12,'3/26',28.5,4.78,32,0),(10,'Shafali Verma','India',10,3,20,11,'2/36',14.36,5.25,16.4,0),(11,'Radha Yadav','India',10,8,58,10,'3/39',31.2,4.66,36,0),(12,'Nat Sciver-Brunt','England',9,9,59,10,'3/44',29.9,4.54,35.4,0),(13,'Megan Schutt','Australia',10,9,65,9,'3/42',35,5.08,39,0),(14,'Chamari Athapaththu','Sri Lanka',8,8,52,8,'2/18',38.13,4.42,43.5,0),(15,'Nonkululeko Mlaba','South Africa',10,10,67,8,'2/35',41.5,4.61,50.3,0);
/*!40000 ALTER TABLE `top_wicket_takers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_awards_records`
--

DROP TABLE IF EXISTS `tournament_awards_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_awards_records` (
  `award_category` text,
  `recipient` text,
  `team` text,
  `performance` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_awards_records`
--

LOCK TABLES `tournament_awards_records` WRITE;
/*!40000 ALTER TABLE `tournament_awards_records` DISABLE KEYS */;
INSERT INTO `tournament_awards_records` VALUES ('Winner','India Women','India','Beat South Africa by 52 runs in Final'),('Runner-Up','South Africa Women','South Africa','Lost to India by 52 runs in Final'),('Player of the Tournament','Deepti Sharma','India','215 runs and 22 wickets'),('Player of the Final','Shafali Verma','India','87 runs and 2 wickets'),('Most Runs','Laura Wolvaardt','South Africa','571 runs'),('Most Wickets','Deepti Sharma','India','22 wickets'),('Highest Individual Score','Laura Wolvaardt','South Africa','169 vs England (SF)'),('Best Bowling Figures','Alana King','Australia','7/20 vs South Africa'),('Highest Team Total','India','India','333/5 vs Australia (SF)'),('Lowest Team Total','South Africa','South Africa','69 vs England'),('Highest Successful Chase','India','India','336/4 vs Australia (SF)'),('Most Centuries','Laura Wolvaardt','South Africa','3 centuries'),('Most Sixes','Richa Ghosh','India','10 sixes'),('Best Strike Rate (min 100 runs)','Nadine de Klerk','South Africa','136.69'),('Best Economy Rate (min 50 overs)','Alana King','Australia','3.64');
/*!40000 ALTER TABLE `tournament_awards_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_statistics`
--

DROP TABLE IF EXISTS `venue_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue_statistics` (
  `venue` text,
  `city` text,
  `country` text,
  `matches` int DEFAULT NULL,
  `avg_first_innings` double DEFAULT NULL,
  `avg_second_innings` double DEFAULT NULL,
  `highest_total` int DEFAULT NULL,
  `chases_won` int DEFAULT NULL,
  `chases_lost` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_statistics`
--

LOCK TABLES `venue_statistics` WRITE;
/*!40000 ALTER TABLE `venue_statistics` DISABLE KEYS */;
INSERT INTO `venue_statistics` VALUES ('Guwahati','Guwahati','India',7,210.4,186.7,269,3,3),('Indore','Indore','India',5,249.2,208.6,330,3,1),('Visakhapatnam','Visakhapatnam','India',4,201,176.5,295,1,3),('Navi Mumbai','Navi Mumbai','India',6,283.8,248.2,333,3,2),('Colombo','Colombo','Sri Lanka',9,172.4,163.8,235,5,2);
/*!40000 ALTER TABLE `venue_statistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-10 14:53:45
