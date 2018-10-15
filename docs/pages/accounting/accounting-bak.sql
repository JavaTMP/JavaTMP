-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: accounting
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `bank_t`
--

DROP TABLE IF EXISTS `bank_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_t` (
  `Bank_Code_VC` varchar(10) NOT NULL,
  `Bank_Add_VC` varchar(10) DEFAULT NULL,
  `Bank_Contact_VC` varchar(10) DEFAULT NULL,
  `AR_Code_IN` int(11) DEFAULT NULL,
  `AP_Code_IN` int(11) DEFAULT NULL,
  PRIMARY KEY (`Bank_Code_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_t`
--

LOCK TABLES `bank_t` WRITE;
/*!40000 ALTER TABLE `bank_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_t`
--

DROP TABLE IF EXISTS `cash_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_t` (
  `Doc_No_VC` varchar(20) NOT NULL,
  `Cash_Type_VC` varchar(20) DEFAULT NULL,
  `Cash_Category_VC` varchar(20) DEFAULT NULL,
  `Chq_No_VC` varchar(20) DEFAULT NULL,
  `Bank_Code_VC` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Doc_No_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_t`
--

LOCK TABLES `cash_t` WRITE;
/*!40000 ALTER TABLE `cash_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coa_t`
--

DROP TABLE IF EXISTS `coa_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coa_t` (
  `GL_ID` int(11) NOT NULL,
  `GL_Name_VC` varchar(20) NOT NULL,
  `BS_Category_VC` varchar(20) NOT NULL,
  `Segment_VC` varchar(10) DEFAULT NULL,
  `Status_BT` bit(1) NOT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coa_t`
--

LOCK TABLES `coa_t` WRITE;
/*!40000 ALTER TABLE `coa_t` DISABLE KEYS */;
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (1000,'PPE','FA_Cost',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (1001,'Acc_Deprn','FA',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (2000,'Stock','CA',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (2001,'Prov_Stk_Obsolete','CA',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (2002,'Bank','CA',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (2003,'Debtor','CA',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (3000,'Creditors','CL',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (4000,'Share_Cap','SF',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (4001,'RE b/f','SF',NULL,0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (5001,'Revenue_Hardware','Rev','BU1',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (5002,'Revenue_Software','Rev','BU2',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (6001,'Cost_Hardware','Cos','BU1',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (6002,'Cost_Software','Cos','BU2',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (7001,'Admin & Utility','Otc','BU3',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (7002,'Prov-Stk','Otc','BU1',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (8001,'Interest From Bank','Oic','BU2',0x01);
INSERT INTO `coa_t` (`GL_ID`, `GL_Name_VC`, `BS_Category_VC`, `Segment_VC`, `Status_BT`) VALUES (9001,'Tax','Tax','BU1',0x01);
/*!40000 ALTER TABLE `coa_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditor_t`
--

DROP TABLE IF EXISTS `creditor_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditor_t` (
  `Cred_ID_VC` varchar(20) NOT NULL,
  `Cred_Name_VC` varchar(20) DEFAULT NULL,
  `Cred_Add_VC` varchar(50) DEFAULT NULL,
  `Cred_Contact_VC` varchar(20) DEFAULT NULL,
  `Credit_Term_TI` tinyint(4) DEFAULT NULL,
  `Cred_Code_IN` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cred_ID_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditor_t`
--

LOCK TABLES `creditor_t` WRITE;
/*!40000 ALTER TABLE `creditor_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditor_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_t`
--

DROP TABLE IF EXISTS `customer_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_t` (
  `Cust_ID_VC` varchar(20) NOT NULL,
  `Cust_Name_VC` varchar(30) DEFAULT NULL,
  `Cust_Add_VC` varchar(50) DEFAULT NULL,
  `Cust_Contact_VC` varchar(20) DEFAULT NULL,
  `Credit_Term_TI` tinyint(4) DEFAULT NULL,
  `Cust_Code_VC` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cust_ID_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_t`
--

LOCK TABLES `customer_t` WRITE;
/*!40000 ALTER TABLE `customer_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixedasset_t`
--

DROP TABLE IF EXISTS `fixedasset_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixedasset_t` (
  `FA_ID_IN` int(11) DEFAULT NULL,
  `FA_Type_VC` varchar(20) DEFAULT NULL,
  `FA_Category_VC` varchar(20) DEFAULT NULL,
  `FA_Descrip_VC` varchar(50) DEFAULT NULL,
  `Doc_No_VC` varchar(20) NOT NULL,
  PRIMARY KEY (`Doc_No_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixedasset_t`
--

LOCK TABLES `fixedasset_t` WRITE;
/*!40000 ALTER TABLE `fixedasset_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `fixedasset_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_t`
--

DROP TABLE IF EXISTS `journal_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_t` (
  `Doc_No_VC` varchar(10) DEFAULT NULL,
  `GL_ID` int(11) DEFAULT NULL,
  `Inv_ID_VC` varchar(10) DEFAULT NULL,
  `Amount_NU` float DEFAULT NULL,
  `Descrip_VC` varchar(100) DEFAULT NULL,
  `Date_DT` date DEFAULT NULL,
  `Period_TI` tinyint(4) DEFAULT NULL,
  `Year_SI` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_t`
--

LOCK TABLES `journal_t` WRITE;
/*!40000 ALTER TABLE `journal_t` DISABLE KEYS */;
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1000',2003,NULL,2000,'HP Presario-TX 101 p4','2007-05-12',5,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1000',5001,NULL,-2000,'HP Presario-TX 101 p4','2007-05-12',5,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1001',2003,NULL,2000,'HP Presario-TX 101 p4','2007-08-22',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1001',5001,NULL,-2000,'HP Presario-TX 101 p4','2007-08-22',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1002',2003,NULL,2500,'Red Hat-version 2.0','2007-06-03',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1002',5002,NULL,-2500,'Red Hat-version 2.0','2007-06-03',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1003',2000,NULL,300,'HP Presario-TX 101 P4','2006-07-20',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1003',3000,NULL,-300,'HP Presario-TX 101 P4','2006-07-20',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1004',2000,NULL,180,'HP Presario - TX 101 P4','2006-07-20',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1004',3000,NULL,-180,'HP Presario - TX 101 P4','2006-07-20',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1005',2000,NULL,220,'Red Hat-version 2.0','2006-07-20',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1005',3000,NULL,-220,'Red Hat-version 2.0','2006-07-20',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1002',2000,NULL,-100,'Red Hat-version 2.0','2007-06-03',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1002',6002,NULL,100,'Red Hat-version 2.0','2007-06-03',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1000',2000,NULL,-150,'HP Presario - TX 101 P4','2007-05-12',5,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1000',6001,NULL,150,'HP Presario - TX 101 P4','2007-05-12',5,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1001',2000,NULL,-150,'HP Presario - TX 101 P4','2007-08-22',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1001',6001,NULL,150,'HP Presario - TX 101 P4','2007-08-22',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1009',2001,NULL,-150,'','2007-12-28',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1009',7002,NULL,150,'','2007-12-28',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1010',1000,NULL,600,'Purchase OfficeEquip','2006-12-28',12,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1010',1000,NULL,650,'Purchase Furniture','2006-12-28',12,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1010',1000,NULL,460,'Purchase CompEquip','2006-12-28',12,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1010',3000,NULL,-1710,'Purchase FA','2006-12-28',12,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',1000,NULL,-60,'CE Disp Cost','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',1000,NULL,-100,'OE Disp Cost','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',1000,NULL,-100,'FF Disp Cost','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',4001,NULL,260,'Disposal','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',1001,NULL,50,'CE Disp Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',1001,NULL,100,'OE Disp Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',1001,NULL,95,'FF Disp Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1011',4001,NULL,-245,'Disposal','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1012',1001,NULL,-300,'CE Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1012',1001,NULL,-400,'OE Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1012',1001,NULL,-250,'FF Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1012',4001,NULL,950,'Deprn','2006-07-25',7,2006);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1013',1000,NULL,800,'Purchase CompEquip','2007-02-20',2,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1013',1000,NULL,450,'Purchase OfficeEquip','2007-02-20',2,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1013',1000,NULL,360,'Purchase Furniture','2007-02-20',2,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1013',3000,NULL,-1610,'Purchase FA','2007-02-20',2,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1014',1001,NULL,-200,'CE Deprn','2007-12-28',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1014',1001,NULL,-120,'OE Deprn','2007-12-28',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1014',1001,NULL,-55,'FF Deprn','2007-12-28',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1014',7001,NULL,375,'Deprn','2007-12-28',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1015',1000,NULL,-50,'CE DispCost','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1015',1000,NULL,-100,'OE DispCost','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1015',1000,NULL,-10,'FF DispCost','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1015',7001,NULL,160,'Disposal','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1016',1001,NULL,20,'CE DispDeprn','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1016',1001,NULL,55,'OE DispDeprn','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1016',1001,NULL,5,'FF DispDeprn','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1016',7001,NULL,-80,'Disposal','2007-06-26',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1017',7001,NULL,745,'Payment of interest','2007-12-26',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1017',2002,NULL,-745,'Payment of interest','2007-12-26',12,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1018',9001,NULL,600,'Payment of Taxes','2007-07-25',7,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1018',2002,NULL,-600,'Payment of Taxes','2007-07-25',7,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1019',2002,NULL,250,'Interest from bank','2007-07-25',7,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1019',8001,NULL,-250,'Interest from bank','2007-07-25',7,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1020',2002,NULL,2000,'Proceeds from shares issue','2007-08-25',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1020',4000,NULL,-2000,'Proceeds from shares issue','2007-08-25',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1021',3000,NULL,1710,'Purchase FA','2007-06-25',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1021',2002,NULL,-1710,'Purchase FA','2007-06-25',6,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1022',2002,NULL,2000,'Receipt from William','2007-08-26',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1022',2003,NULL,-2000,'Receipt from William','2007-08-26',8,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1023',2002,NULL,2000,'Receipt from Randy','2007-07-23',7,2007);
INSERT INTO `journal_t` (`Doc_No_VC`, `GL_ID`, `Inv_ID_VC`, `Amount_NU`, `Descrip_VC`, `Date_DT`, `Period_TI`, `Year_SI`) VALUES ('JV1023',2003,NULL,-2000,'Receipt from Randy','2007-07-23',7,2007);
/*!40000 ALTER TABLE `journal_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_accountset_t`
--

DROP TABLE IF EXISTS `product_accountset_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_accountset_t` (
  `Pdt_AcctSet_VC` varchar(20) NOT NULL,
  `Cost_Method_VC` varchar(5) DEFAULT NULL,
  `Stock_IN` int(11) DEFAULT NULL,
  `Payable_IN` int(11) DEFAULT NULL,
  `Shipment_IN` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pdt_AcctSet_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_accountset_t`
--

LOCK TABLES `product_accountset_t` WRITE;
/*!40000 ALTER TABLE `product_accountset_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_accountset_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_t`
--

DROP TABLE IF EXISTS `product_category_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_t` (
  `Pdt_Category_VC` varchar(20) DEFAULT NULL,
  `Category_Name_VC` varchar(30) DEFAULT NULL,
  `GL_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_t`
--

LOCK TABLES `product_category_t` WRITE;
/*!40000 ALTER TABLE `product_category_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_t`
--

DROP TABLE IF EXISTS `product_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_t` (
  `Pdt_ID_VC` varchar(10) NOT NULL,
  `Pdt_Name_VC` varchar(10) DEFAULT NULL,
  `Pdt_Descrip_VC` varchar(100) DEFAULT NULL,
  `Pdt_Category_VC` varchar(20) DEFAULT NULL,
  `Cred_ID_VC` varchar(20) DEFAULT NULL,
  `Pdt_AcctSet_VC` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Pdt_ID_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_t`
--

LOCK TABLES `product_t` WRITE;
/*!40000 ALTER TABLE `product_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_t`
--

DROP TABLE IF EXISTS `purchase_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_t` (
  `Cred_ID_VC` varchar(20) DEFAULT NULL,
  `Pdt_ID_VC` varchar(20) DEFAULT NULL,
  `Doc_No_VC` varchar(20) DEFAULT NULL,
  `Date_DT` date DEFAULT NULL,
  `Status_BT` bit(1) DEFAULT NULL,
  `Inv_ID_VC` varchar(30) NOT NULL,
  PRIMARY KEY (`Inv_ID_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_t`
--

LOCK TABLES `purchase_t` WRITE;
/*!40000 ALTER TABLE `purchase_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_t`
--

DROP TABLE IF EXISTS `sale_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_t` (
  `Doc_No_VC` varchar(10) DEFAULT NULL,
  `Pdt_ID_VC` varchar(10) DEFAULT NULL,
  `Inv_ID_VC` varchar(10) NOT NULL,
  `Cust_ID_VC` varchar(20) DEFAULT NULL,
  `Date_DT` date DEFAULT NULL,
  `Status_BT` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Inv_ID_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_t`
--

LOCK TABLES `sale_t` WRITE;
/*!40000 ALTER TABLE `sale_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_balance_t`
--

DROP TABLE IF EXISTS `stock_balance_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_balance_t` (
  `Doc_ID_VC` varchar(10) NOT NULL,
  `Pdt_ID_VC` varchar(20) DEFAULT NULL,
  `Qty_NU` float DEFAULT NULL,
  `Unit_Price_TI` tinyint(4) DEFAULT NULL,
  `Date_DT` date DEFAULT NULL,
  PRIMARY KEY (`Doc_ID_VC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_balance_t`
--

LOCK TABLES `stock_balance_t` WRITE;
/*!40000 ALTER TABLE `stock_balance_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_balance_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movement_t`
--

DROP TABLE IF EXISTS `stock_movement_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movement_t` (
  `Doc_No_VC` varchar(20) DEFAULT NULL,
  `Date_DT` date DEFAULT NULL,
  `Pdt_ID_VC` varchar(20) DEFAULT NULL,
  `Qty_NU` int(11) DEFAULT NULL,
  `Unit_Price_TI` tinyint(4) DEFAULT NULL,
  `Descrip_VC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movement_t`
--

LOCK TABLES `stock_movement_t` WRITE;
/*!40000 ALTER TABLE `stock_movement_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movement_t` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-15 20:06:18
