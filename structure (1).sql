CREATE DATABASE  IF NOT EXISTS `qas_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `qas_dev`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: qas_dev
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `inf_dept_info_rcv`
--

DROP TABLE IF EXISTS `inf_dept_info_rcv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inf_dept_info_rcv` (
  `INDEPT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CRTYYMMDD` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESTRUCTDD` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OUTDEPT` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPTNM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SOSOK` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TSOSOK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LEVELCD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPTREDUCNM` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HIGHPARTDEPT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOWYN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DIREMPNO` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WRKPLC` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MPRS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPTFULLNM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `T_FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SENDDT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='부서정보 - ILM 시스템에서 직접 연동해줌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inf_person_info_rcv`
--

DROP TABLE IF EXISTS `inf_person_info_rcv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inf_person_info_rcv` (
  `EMPNO` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INDEPT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TELNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MOVETELNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEL_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JBGRP` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JBRANK` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JBCHARGE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HOLDOFFIDIVI` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PLACE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `T_FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SENDDT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='구성원정보 - ILM 시스템에서 직접 연동해줌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `self_person_sync_mgmt`
--

DROP TABLE IF EXISTS `self_person_sync_mgmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `self_person_sync_mgmt` (
  `TargetType` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TargetId` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TargetName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TargetEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UsedYN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`TargetType`,`TargetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_code_tbl`
--

DROP TABLE IF EXISTS `sk_code_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_code_tbl` (
  `SK_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_PARENT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_NAMESL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_ORDER` int DEFAULT NULL,
  `SK_DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_SELECTOR` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_STYLE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ID`,`SK_PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='공통 코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_menu_tbl`
--

DROP TABLE IF EXISTS `sk_menu_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_menu_tbl` (
  `SK_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_PARENT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_ORDER` int DEFAULT NULL,
  `SK_DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_IMAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_IMAGE_OVER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_IMAGE_OUT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TARGET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_SIZE` int DEFAULT NULL,
  `SK_TYPE` int DEFAULT NULL,
  `PRIV_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRIV_BASE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_DEPTH` int DEFAULT NULL,
  PRIMARY KEY (`SK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='메뉴';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_org_tbl`
--

DROP TABLE IF EXISTS `sk_org_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_org_tbl` (
  `SK_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_PARENT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_ORDER` int DEFAULT NULL,
  `SK_DESCRIPTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_STATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_SDATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_EDATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_DIREMPNO` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_LEVELCD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_WRKPLC` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_T_FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='부서';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_role_mapping_tbl`
--

DROP TABLE IF EXISTS `sk_role_mapping_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_role_mapping_tbl` (
  `SK_ROLE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_REF_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_REF_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_TYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ROLE_ID`,`SK_REF_1`,`SK_REF_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='롤 매핑';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_role_mapping_tbl_20240703`
--

DROP TABLE IF EXISTS `sk_role_mapping_tbl_20240703`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_role_mapping_tbl_20240703` (
  `SK_ROLE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_REF_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_REF_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_TYPE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ROLE_ID`,`SK_REF_1`,`SK_REF_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='롤 매핑';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_role_tbl`
--

DROP TABLE IF EXISTS `sk_role_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_role_tbl` (
  `SK_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_ROLE_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_STATUS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='롤';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_upload_tbl`
--

DROP TABLE IF EXISTS `sk_upload_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_upload_tbl` (
  `SK_PROGRAM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_DOC_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_FILE_PATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SK_FILE_SIZE` int DEFAULT NULL,
  `SK_SENDING_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_FILE_ORG_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `sk_upload_tbl_idx` (`SK_FILE_PATH`,`SK_FILE_NAME`),
  KEY `sk_upload_tbl_idx_01` (`SK_PROGRAM`,`SK_DOC_ID`,`SK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='첨부파일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_user_tbl`
--

DROP TABLE IF EXISTS `sk_user_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_user_tbl` (
  `SK_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USR_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CUR_USR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INDEPT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TELNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MOBILENO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECEIVE_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'M',
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_BIZ_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEL_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  `SK_JBGRP` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_JBRANK` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_JBCHARGE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_HOLDOFFIDIVI` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_PLACE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sk_user_tbl_20240630`
--

DROP TABLE IF EXISTS `sk_user_tbl_20240630`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sk_user_tbl_20240630` (
  `SK_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USR_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CUR_USR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INDEPT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TELNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MOBILENO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECEIVE_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'M',
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_BIZ_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEL_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  `SK_JBGRP` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_JBRANK` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_JBCHARGE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_HOLDOFFIDIVI` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_PLACE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_CREATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_UPDATE_TIME` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_as_code`
--

DROP TABLE IF EXISTS `t_as_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_as_code` (
  `AS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SYS_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FAULT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LGRP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SGRP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`AS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='AS 코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_auto_dlvr_cont`
--

DROP TABLE IF EXISTS `t_auto_dlvr_cont`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_auto_dlvr_cont` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CHR` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISP_STDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QLT_CERT_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QLT_CERT_MSG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIFNR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CTR_NO`,`DLVDT_YMD`,`PLANT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='erp 자동승인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cert_exam_req`
--

DROP TABLE IF EXISTS `t_cert_exam_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cert_exam_req` (
  `CERT_EXAM_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EXAM_STDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_ENDDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_PLC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CHR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TELNO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AD_PATH_RECORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AD_PATH_STD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AD_PATH_MAP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CERT_REQ_STATE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHR1` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHR2` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ELIG_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CERT_EXAM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='인증시험';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cert_exam_req_ret`
--

DROP TABLE IF EXISTS `t_cert_exam_req_ret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cert_exam_req_ret` (
  `CERT_EXAM_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL AUTO_INCREMENT,
  `REJ_RES` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SNO`,`CERT_EXAM_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='인증시험반려사유';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cert_exam_schd`
--

DROP TABLE IF EXISTS `t_cert_exam_schd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cert_exam_schd` (
  `CERT_EXAM_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CERT_EXAM_LIST` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CERT_EXAM_NO`,`YMD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='인증시험세부일정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_board`
--

DROP TABLE IF EXISTS `t_cmm_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_board` (
  `BRD_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CTN` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VISIT_CNT` int DEFAULT NULL,
  `RFN_SNO` int DEFAULT NULL,
  `STEP` int DEFAULT NULL,
  `LEVEL` int DEFAULT NULL,
  `PRI_SEQ_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIRST_SEQ_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEL_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RER_NOTI_GBN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SNO`,`BRD_GBN`),
  KEY `t_cmm_board_idx` (`RFN_SNO`),
  KEY `t_cmm_board_idx_01` (`SNO`,`RFN_SNO`)
) ENGINE=InnoDB AUTO_INCREMENT=14009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='게시판';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_cmp`
--

DROP TABLE IF EXISTS `t_cmm_cmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_cmp` (
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HIGR_CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OEM_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WRKR_REG_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HOFF_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FCTY_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HOME_PAGE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TRADE_ATCL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHIEF_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHIEF_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REP_TEL` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EMPLOYEE_CNT` int DEFAULT NULL,
  `AVG_WORK_YEAR` float DEFAULT NULL,
  `REM` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APR_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  `QLTEVAL_VISIT_AUTH_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  `TL9000_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ENJA_SEND_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EVAL_GRD` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_SNM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CERT_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  PRIMARY KEY (`CMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='협력사';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_cmp_item_class`
--

DROP TABLE IF EXISTS `t_cmm_cmp_item_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_cmp_item_class` (
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CMP_CODE`,`ATCL_CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='협력사 장비군';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_faq`
--

DROP TABLE IF EXISTS `t_cmm_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_faq` (
  `SNO` int NOT NULL AUTO_INCREMENT,
  `QST` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANS` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ORDERBY` int DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SNO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='FAQ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_item_class`
--

DROP TABLE IF EXISTS `t_cmm_item_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_item_class` (
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLASS1` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLASS2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLASS3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLASS4` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CAT_NM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EQI_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RECORD_CODE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_VER` int DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_DIVI` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ATCL_CAT_CODE`),
  KEY `t_cmm_item_class_idx_01` (`ATCL_CAT_CODE`,`ATCL_CAT_NM`),
  KEY `t_cmm_item_class_idx` (`CLASS1`,`CLASS2`,`CLASS3`,`CLASS4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='물품분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_item_dtl`
--

DROP TABLE IF EXISTS `t_cmm_item_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_item_dtl` (
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_NM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRST_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIRST_SETUP_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_CODE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_VER` int DEFAULT NULL,
  `EXAM_EXCEPT_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ERP_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAMS_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_EMPNO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_HNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ATCL_CODE`),
  KEY `t_cmm_item_dtl_idx` (`RECORD_CODE`,`RECORD_VER`),
  KEY `t_cmm_item_dtl_idx_01` (`NAMS_YN`),
  KEY `t_cmm_item_dtl_idx_02` (`ATCL_CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='물품상세';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_item_reg_req`
--

DROP TABLE IF EXISTS `t_cmm_item_reg_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_item_reg_req` (
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PERMISSION_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_EXCEPT_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ATCL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='물품상세 승인요청';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmm_notice_tgt`
--

DROP TABLE IF EXISTS `t_cmm_notice_tgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmm_notice_tgt` (
  `BRD_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL,
  `NOTICE_TGT_SNO` int NOT NULL AUTO_INCREMENT,
  `NOTICE_TGT_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOTICE_TGT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOTICE_TGT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VIEW_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`NOTICE_TGT_SNO`,`BRD_GBN`,`SNO`)
) ENGINE=InnoDB AUTO_INCREMENT=8380 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='알림대상';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmp_cert_isu`
--

DROP TABLE IF EXISTS `t_cmp_cert_isu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmp_cert_isu` (
  `SNO` int NOT NULL AUTO_INCREMENT,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ST_CERT_NO` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `END_CERT_NO` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISSUE_CERT_CNT` int DEFAULT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CERT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISSUE_MAN_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CERT_ISSUE_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SNO`)
) ENGINE=InnoDB AUTO_INCREMENT=15035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='검사필증 선발행';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmp_map`
--

DROP TABLE IF EXISTS `t_cmp_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmp_map` (
  `WRKR_REG_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CMP_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DISPLAY_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`WRKR_REG_NO`,`CMP_NM`),
  KEY `t_cmp_map_index` (`CMP_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='NAMS 회사 이름-사업자번호 맵';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cmp_name_map`
--

DROP TABLE IF EXISTS `t_cmp_name_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cmp_name_map` (
  `WRKR_REG_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DISPLAY_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_NAMS` tinyint(1) DEFAULT NULL COMMENT '지표분석 - 주장비',
  `IS_MRCS` tinyint(1) DEFAULT NULL COMMENT '지표분석 - 중계기',
  PRIMARY KEY (`WRKR_REG_NO`),
  KEY `idx_t_cmp_name_map_DISPLAY_NM` (`DISPLAY_NM`),
  KEY `t_cmp_name_map_idx_01` (`IS_NAMS`),
  KEY `t_cmp_name_map_idx_02` (`IS_MRCS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사업자번호 - 회사표시이름 맵';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_cert_isu`
--

DROP TABLE IF EXISTS `t_dlvr_cert_isu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_cert_isu` (
  `CERT_ISSUE_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VER` int DEFAULT NULL,
  `ST_CERT_NO` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `END_CERT_NO` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISSUE_CERT_CNT` int DEFAULT NULL,
  `ISSUE_MAN_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CERT_ISSUE_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CERT_ISSUE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='필증발급';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_cont`
--

DROP TABLE IF EXISTS `t_dlvr_cont`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_cont` (
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '구매 문서 번호',
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '품목 납품일',
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '플랜트',
  `SNO` int NOT NULL COMMENT '구매 문서의 품목 번호',
  `DELIVN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '납품지시 문서 번호',
  `DELIVP` int DEFAULT NULL COMMENT '납품지시 문서의 품목 번호',
  `EBELN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수시계약 문서 번호',
  `EBELP` int DEFAULT NULL COMMENT '수시계약 문서의 품목 번호',
  `CTR_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 문서 유형',
  `ZZTITL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '건명',
  `CTR_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약체결일',
  `CTR_STDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약개시일',
  `CTR_ENDDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약만료일',
  `PLANT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '플랜트명',
  `AFNAM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매요청부서',
  `KTEXT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '일반이름',
  `ORDERMAN` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '발주자',
  `LIFNR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체 계정 번호',
  `SPY_CMP_NM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체명',
  `WERS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '통화',
  `ZZM001` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품납품시',
  `ZZM002` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품개통시',
  `ZZM003` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품최종인수시',
  `ZZM004` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품유보금',
  `ZZX001` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '하자보수 보증금율',
  `ZZX002` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지체상금율',
  `ZZX003` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약보증금율',
  `ZZPRD1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '하자보수 책임기간',
  `MATKL` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 그룹',
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재번호',
  `ATCL_CODE_NM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재코드내역',
  `MENGE` int DEFAULT NULL COMMENT '구매 오더 수량',
  `MEINS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 오더 단위',
  `NETPR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '순 오더 금액(PO 통화)',
  `PRICE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '금액',
  `IDNLF` varchar(47) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '품목구분자',
  `BANFN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 요청 번호',
  `AUFNR` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '오더 번호',
  `KTEXT1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '내역',
  `KNTTP` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계정 지정 범주',
  `KNTTX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계정 지정 범주 내역',
  `ENT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 문서 품목 변경일',
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVR_OD_ENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVR_OD_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CTR_NO`,`DLVDT_YMD`,`PLANT_CODE`,`SNO`),
  KEY `t_dlvr_cont_idx_01` (`LIFNR`),
  KEY `t_dlvr_cont_idx_02` (`ENT_YMD`),
  KEY `t_dlvr_cont_idx_04` (`DLVDT_YMD`),
  KEY `t_dlvr_cont_idx_05` (`REG_YMD`),
  KEY `t_dlvr_cont_idx_06` (`PLANT_NM`),
  KEY `t_dlvr_cont_idx_07` (`ATCL_CODE`,`DLVDT_YMD`),
  KEY `t_dlvr_cont_idx_03` (`CTR_NO`,`ATCL_CODE`),
  KEY `t_dlvr_cont_idx_08` (`CTR_NO`,`DLVDT_YMD`,`PLANT_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 계약 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_cont_tmp`
--

DROP TABLE IF EXISTS `t_dlvr_cont_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_cont_tmp` (
  `DELIVN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '납품지시 문서 번호',
  `DELIVP` int DEFAULT NULL COMMENT '납품지시 문서의 품목 번호',
  `EBELN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수시계약 문서 번호',
  `EBELP` int DEFAULT NULL COMMENT '수시계약 문서의 품목 번호',
  `BSART` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 문서 유형',
  `ZZTITL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '건명',
  `ZZPODT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약체결일',
  `KDATB` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약개시일',
  `KDATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약만료일',
  `AFNAM` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매요청부서',
  `KTEXT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '일반이름',
  `ORDERMAN` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '발주자',
  `LIFNR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체 계정 번호',
  `NAME1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '이름1',
  `WERS` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '통화 키',
  `ZZM001` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품납품시',
  `ZZM002` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품개통시',
  `ZZM003` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품최종인수시',
  `ZZM004` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품유보금',
  `ZZX001` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '하자보수보증금율',
  `ZZX002` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지체상금율',
  `ZZX003` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약보증금율',
  `ZZPRD1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '하자보수책임기간',
  `MATKL` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 그룹',
  `MATNR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재번호',
  `TXZ01` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '내역',
  `MENGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 오더 수량',
  `MEINS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 오더 단위',
  `NETPR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '순 오더 금액(PO 통화)',
  `PRICE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '금액',
  `EINDT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '품목 납품일',
  `WERKS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '플랜트',
  `NAME11` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '성',
  `IDNLF` varchar(47) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '품목구분자',
  `BANFN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매요청번호',
  `AUFNR` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '오더번호',
  `KTEXT1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '내역',
  `KNTTP` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계정 지정 범주',
  `KNTTX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계정 지정 범주 내역',
  `FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'FLAG',
  `AEDAT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 문서 품목 변경일',
  `UNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자이름',
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '이름'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 계약 데이터 입력값 임시 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_cont_tmp2`
--

DROP TABLE IF EXISTS `t_dlvr_cont_tmp2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_cont_tmp2` (
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '구매 문서 번호',
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '품목 납품일',
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '플랜트',
  `SNO` int NOT NULL COMMENT '구매 문서의 품목 번호',
  `DELIVN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '납품지시 문서 번호',
  `DELIVP` int DEFAULT NULL COMMENT '납품지시 문서의 품목 번호',
  `EBELN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수시계약 문서 번호',
  `EBELP` int DEFAULT NULL COMMENT '수시계약 문서의 품목 번호',
  `CTR_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 문서 유형',
  `ZZTITL` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '건명',
  `CTR_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약체결일',
  `CTR_STDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약개시일',
  `CTR_ENDDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약만료일',
  `PLANT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '플랜트명',
  `AFNAM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매요청부서',
  `KTEXT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '일반이름',
  `ORDERMAN` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '발주자',
  `LIFNR` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체 계정 번호',
  `SPY_CMP_NM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체명',
  `WERS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '통화',
  `ZZM001` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품납품시',
  `ZZM002` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품개통시',
  `ZZM003` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품최종인수시',
  `ZZM004` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품유보금',
  `ZZX001` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '하자보수 보증금율',
  `ZZX002` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지체상금율',
  `ZZX003` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계약보증금율',
  `ZZPRD1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '하자보수 책임기간',
  `MATKL` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 그룹',
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재번호',
  `ATCL_CODE_NM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재코드내역',
  `MENGE` int DEFAULT NULL COMMENT '구매 오더 수량',
  `MEINS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 오더 단위',
  `NETPR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '순 오더 금액(PO 통화)',
  `PRICE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '금액',
  `IDNLF` varchar(47) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '품목구분자',
  `BANFN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 요청 번호',
  `AUFNR` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '오더 번호',
  `KTEXT1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '내역',
  `KNTTP` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계정 지정 범주',
  `KNTTX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '계정 지정 범주 내역',
  `ENT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매 문서 품목 변경일',
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVR_OD_ENO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVR_OD_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CTR_NO`,`DLVDT_YMD`,`PLANT_CODE`,`SNO`),
  KEY `t_dlvr_cont_tmp2_idx_01` (`LIFNR`),
  KEY `t_dlvr_cont_tmp2_idx_02` (`ENT_YMD`),
  KEY `t_dlvr_cont_tmp2_idx_04` (`DLVDT_YMD`),
  KEY `t_dlvr_cont_tmp2_idx_05` (`REG_YMD`),
  KEY `t_dlvr_cont_tmp2_idx_06` (`PLANT_NM`),
  KEY `t_dlvr_cont_tmp2_idx_07` (`ATCL_CODE`,`DLVDT_YMD`),
  KEY `t_dlvr_cont_tmp2_idx_03` (`CTR_NO`,`ATCL_CODE`),
  KEY `t_dlvr_cont_tmp2_idx_08` (`CTR_NO`,`DLVDT_YMD`,`PLANT_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 계약 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_erp_req`
--

DROP TABLE IF EXISTS `t_dlvr_erp_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_erp_req` (
  `APR_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CMP_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APR_STATE_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `QLT_CERT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QLT_CERT_MSG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ERP_SEND_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  `MAIN_ISP_ATCL_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APR_MAN_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`APR_REQ_NO`),
  KEY `t_dlvr_erp_req_idx` (`CTR_NO`,`DLVDT_YMD`,`PLANT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 승인신청';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_erp_req_atcl`
--

DROP TABLE IF EXISTS `t_dlvr_erp_req_atcl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_erp_req_atcl` (
  `APR_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CTR_ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL,
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VER` int DEFAULT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APR_REQ_QT` int DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`APR_REQ_NO`,`CTR_ATCL_CODE`,`SNO`),
  KEY `t_dlvr_erp_req_atcl_idx` (`DLVR_EXAM_REQ_NO`,`VER`,`ATCL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 승인신청물품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_erp_req_dtl`
--

DROP TABLE IF EXISTS `t_dlvr_erp_req_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_erp_req_dtl` (
  `APR_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CTR_ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APR_REQ_QT` int DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`APR_REQ_NO`,`CTR_ATCL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 승인신청상세';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_corr`
--

DROP TABLE IF EXISTS `t_dlvr_exam_corr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_corr` (
  `CORR_ACT_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACT_TITLE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ACT_CTN` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SPEC_ITEM` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOTI_TRGT` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANS_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANS_TITLE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANS_CTN` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANS_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ANS_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SEN_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CORR_ACT_GBN`,`REQ_NO`,`VER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시정조치';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_corr_ret`
--

DROP TABLE IF EXISTS `t_dlvr_exam_corr_ret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_corr_ret` (
  `CORR_ACT_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `SNO` int NOT NULL AUTO_INCREMENT,
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REJ_RES` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SNO`,`CORR_ACT_GBN`,`REQ_NO`,`VER`,`DLVR_EXAM_REQ_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시정조치반려';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_1`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_1` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE5` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE6` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE7` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE8` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE9` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE10` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE11` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE12` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE13` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE14` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE15` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE16` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE17` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE18` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE19` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE20` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE21` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE22` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE23` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE24` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE25` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE26` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE27` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE28` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE29` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE30` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE31` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE32` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE33` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE34` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE35` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE36` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE37` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE38` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE39` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE40` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE41` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE42` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE43` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE44` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE45` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE46` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE47` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE48` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE49` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE50` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE51` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE52` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE53` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE54` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE55` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE56` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE57` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE58` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE59` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE60` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE61` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE62` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE63` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE64` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE65` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE66` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE67` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE68` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE69` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE70` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE71` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE72` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE73` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE74` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE75` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE76` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE77` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE78` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE79` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE80` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE81` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE82` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE83` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE84` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE85` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE86` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE87` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE88` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE89` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE90` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE91` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE92` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE93` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE94` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE95` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE96` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE97` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE98` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE99` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE100` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`),
  KEY `t_dlvr_exam_data_1_idx` (`SERIAL_PASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_2`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_2` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE101` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE102` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE103` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE104` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE105` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE106` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE107` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE108` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE109` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE110` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE111` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE112` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE113` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE114` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE115` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE116` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE117` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE118` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE119` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE120` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE121` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE122` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE123` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE124` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE125` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE126` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE127` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE128` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE129` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE130` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE131` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE132` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE133` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE134` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE135` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE136` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE137` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE138` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE139` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE140` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE141` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE142` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE143` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE144` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE145` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE146` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE147` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE148` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE149` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE150` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE151` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE152` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE153` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE154` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE155` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE156` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE157` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE158` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE159` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE160` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE161` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE162` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE163` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE164` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE165` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE166` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE167` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE168` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE169` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE170` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE171` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE172` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE173` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE174` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE175` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE176` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE177` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE178` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE179` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE180` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE181` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE182` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE183` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE184` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE185` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE186` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE187` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE188` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE189` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE190` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE191` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE192` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE193` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE194` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE195` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE196` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE197` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE198` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE199` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE200` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_3`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_3` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE201` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE202` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE203` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE204` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE205` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE206` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE207` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE208` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE209` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE210` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE211` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE212` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE213` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE214` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE215` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE216` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE217` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE218` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE219` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE220` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE221` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE222` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE223` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE224` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE225` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE226` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE227` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE228` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE229` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE230` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE231` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE232` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE233` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE234` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE235` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE236` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE237` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE238` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE239` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE240` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE241` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE242` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE243` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE244` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE245` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE246` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE247` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE248` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE249` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE250` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE251` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE252` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE253` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE254` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE255` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE256` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE257` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE258` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE259` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE260` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE261` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE262` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE263` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE264` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE265` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE266` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE267` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE268` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE269` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE270` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE271` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE272` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE273` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE274` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE275` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE276` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE277` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE278` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE279` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE280` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE281` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE282` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE283` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE284` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE285` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE286` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE287` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE288` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE289` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE290` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE291` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE292` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE293` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE294` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE295` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE296` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE297` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE298` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE299` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE300` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_4`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_4` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE301` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE302` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE303` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE304` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE305` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE306` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE307` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE308` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE309` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE310` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE311` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE312` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE313` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE314` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE315` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE316` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE317` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE318` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE319` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE320` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE321` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE322` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE323` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE324` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE325` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE326` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE327` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE328` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE329` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE330` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE331` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE332` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE333` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE334` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE335` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE336` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE337` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE338` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE339` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE340` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE341` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE342` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE343` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE344` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE345` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE346` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE347` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE348` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE349` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE350` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE351` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE352` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE353` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE354` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE355` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE356` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE357` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE358` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE359` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE360` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE361` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE362` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE363` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE364` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE365` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE366` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE367` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE368` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE369` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE370` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE371` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE372` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE373` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE374` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE375` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE376` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE377` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE378` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE379` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE380` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE381` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE382` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE383` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE384` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE385` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE386` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE387` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE388` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE389` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE390` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE391` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE392` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE393` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE394` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE395` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE396` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE397` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE398` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE399` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE400` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_5`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_5` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE401` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE402` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE403` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE404` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE405` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE406` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE407` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE408` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE409` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE410` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE411` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE412` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE413` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE414` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE415` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE416` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE417` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE418` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE419` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE420` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE421` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE422` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE423` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE424` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE425` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE426` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE427` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE428` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE429` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE430` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE431` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE432` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE433` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE434` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE435` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE436` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE437` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE438` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE439` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE440` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE441` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE442` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE443` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE444` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE445` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE446` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE447` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE448` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE449` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE450` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE451` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE452` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE453` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE454` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE455` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE456` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE457` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE458` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE459` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE460` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE461` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE462` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE463` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE464` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE465` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE466` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE467` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE468` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE469` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE470` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE471` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE472` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE473` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE474` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE475` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE476` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE477` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE478` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE479` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE480` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE481` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE482` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE483` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE484` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE485` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE486` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE487` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE488` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE489` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE490` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE491` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE492` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE493` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE494` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE495` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE496` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE497` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE498` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE499` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE500` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_6`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_6` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE501` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE502` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE503` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE504` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE505` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE506` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE507` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE508` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE509` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE510` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE511` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE512` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE513` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE514` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE515` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE516` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE517` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE518` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE519` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE520` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE521` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE522` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE523` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE524` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE525` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE526` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE527` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE528` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE529` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE530` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE531` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE532` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE533` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE534` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE535` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE536` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE537` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE538` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE539` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE540` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE541` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE542` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE543` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE544` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE545` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE546` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE547` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE548` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE549` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE550` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE551` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE552` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE553` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE554` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE555` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE556` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE557` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE558` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE559` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE560` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE561` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE562` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE563` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE564` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE565` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE566` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE567` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE568` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE569` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE570` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE571` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE572` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE573` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE574` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE575` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE576` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE577` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE578` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE579` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE580` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE581` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE582` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE583` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE584` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE585` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE586` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE587` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE588` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE589` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE590` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE591` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE592` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE593` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE594` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE595` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE596` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE597` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE598` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE599` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE600` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_7`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_7` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE601` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE602` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE603` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE604` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE605` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE606` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE607` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE608` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE609` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE610` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE611` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE612` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE613` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE614` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE615` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE616` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE617` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE618` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE619` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE620` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE621` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE622` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE623` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE624` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE625` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE626` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE627` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE628` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE629` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE630` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE631` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE632` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE633` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE634` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE635` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE636` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE637` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE638` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE639` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE640` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE641` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE642` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE643` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE644` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE645` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE646` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE647` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE648` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE649` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE650` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE651` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE652` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE653` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE654` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE655` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE656` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE657` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE658` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE659` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE660` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE661` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE662` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE663` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE664` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE665` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE666` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE667` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE668` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE669` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE670` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE671` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE672` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE673` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE674` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE675` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE676` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE677` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE678` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE679` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE680` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE681` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE682` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE683` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE684` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE685` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE686` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE687` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE688` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE689` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE690` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE691` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE692` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE693` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE694` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE695` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE696` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE697` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE698` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE699` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE700` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_8`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_8` (
  `DLVR_REC_NO` int NOT NULL,
  `EQI_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIAL_PASS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `EXAM_VALUE701` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE702` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE703` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE704` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE705` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE706` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE707` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE708` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE709` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE710` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE711` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE712` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE713` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE714` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE715` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE716` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE717` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE718` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE719` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE720` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE721` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE722` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE723` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE724` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE725` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE726` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE727` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE728` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE729` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE730` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE731` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE732` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE733` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE734` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE735` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE736` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE737` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE738` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE739` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE740` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE741` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE742` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE743` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE744` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE745` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE746` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE747` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE748` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE749` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE750` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE751` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE752` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE753` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE754` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE755` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE756` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE757` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE758` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE759` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE760` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE761` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE762` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE763` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE764` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE765` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE766` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE767` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE768` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE769` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE770` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE771` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE772` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE773` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE774` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE775` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE776` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE777` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE778` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE779` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE780` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE781` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE782` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE783` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE784` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE785` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE786` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE787` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE788` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE789` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE790` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE791` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE792` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE793` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE794` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE795` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE796` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE797` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE798` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE799` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXAM_VALUE800` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EQI_SERI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_data_result`
--

DROP TABLE IF EXISTS `t_dlvr_exam_data_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_data_result` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DLVR_REC_NO` int NOT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LIST_ID` int NOT NULL,
  `ERR_CNT` int DEFAULT NULL,
  PRIMARY KEY (`DLVR_EXAM_REQ_NO`,`DLVR_REC_NO`,`ATCL_CAT_CODE`,`LIST_ID`),
  KEY `t_dlvr_exam_data_result_idx` (`DLVR_REC_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시험성적결과';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_ppay_item`
--

DROP TABLE IF EXISTS `t_dlvr_exam_ppay_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_ppay_item` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL AUTO_INCREMENT,
  `PPAY_DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PPAY_VER` int NOT NULL,
  `PPAY_ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MENGE` int NOT NULL,
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SNO`,`DLVR_EXAM_REQ_NO`,`VER`,`ATCL_CODE`),
  KEY `t_dlvr_exam_ppay_item_idx` (`PPAY_DLVR_EXAM_REQ_NO`,`PPAY_VER`,`PPAY_ATCL_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=7613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사선납물품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_rec`
--

DROP TABLE IF EXISTS `t_dlvr_exam_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_rec` (
  `DLVR_REC_NO` int NOT NULL AUTO_INCREMENT,
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VER` int DEFAULT NULL,
  `RECORD_CODE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_VER` int DEFAULT NULL,
  `EQI_SIK_CNT` int DEFAULT NULL,
  `PASS_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT (date_format(now(),_utf8mb4'%Y%m%d')),
  PRIMARY KEY (`DLVR_REC_NO`),
  KEY `t_dlvr_exam_rec_idx` (`DLVR_EXAM_REQ_NO`,`VER`,`RECORD_CODE`,`RECORD_VER`)
) ENGINE=InnoDB AUTO_INCREMENT=300512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사성적항목';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_rec_spec`
--

DROP TABLE IF EXISTS `t_dlvr_exam_rec_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_rec_spec` (
  `DLVR_REC_NO` int NOT NULL,
  `EXAM_VALUE_SNO` int NOT NULL,
  `LIST_ID` int DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`EXAM_VALUE_SNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사성적항목';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_req`
--

DROP TABLE IF EXISTS `t_dlvr_exam_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_req` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `IVT_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '투자구분코드',
  `ISP_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '납품검사구분코드',
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DELIVN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '납품지시 문서 번호',
  `EBELN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수시계약 문서 번호',
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BANFN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PPAY_CONT_INFO_SEQ` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SRC_CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AFE_CHASU` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MAIN_ISP_ATCL_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXP_CERT_CNT` int DEFAULT NULL,
  `ISSUE_POSS_CERT_CNT` int DEFAULT NULL,
  `ISSUE_CERT_CNT` int DEFAULT NULL,
  `DLVR_EXAM_STATE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '납품검사상태코드',
  `ISP_MET_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '검사방법구분코드',
  `AUTO_ELIG_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXP_ISP_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISP_STDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ISP_ENDDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APLR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APLR_TELNO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APLR_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SVC_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHR1` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHR2` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ELIG_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QLT_CERT_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QLT_CERT_MSG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NEWEST_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_EXAM_REQ_NO`,`VER`),
  KEY `t_dlvr_exam_req_idx_01` (`CTR_NO`,`DLVDT_YMD`,`PLANT_CODE`),
  KEY `t_dlvr_exam_req_idx_02` (`DLVR_EXAM_REQ_NO`,`ISP_GBN`,`DLVR_EXAM_STATE_CODE`,`VER`),
  KEY `t_dlvr_exam_req_idx_03` (`PPAY_CONT_INFO_SEQ`),
  KEY `t_dlvr_exam_req_idx_04` (`CHR1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사신청';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_req_item`
--

DROP TABLE IF EXISTS `t_dlvr_exam_req_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_req_item` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CTR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVDT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PLANT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PPAY_CONT_INFO_SEQ` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AFE_CHASU` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PPAY_QT` int DEFAULT NULL,
  `REQ_QT` int DEFAULT NULL,
  `APR_QT` int DEFAULT NULL,
  `DLVR_REC_NO` int DEFAULT NULL,
  PRIMARY KEY (`DLVR_EXAM_REQ_NO`,`VER`,`ATCL_CODE`),
  KEY `t_dlvr_exam_req_item_idx_01` (`CTR_NO`,`DLVDT_YMD`,`PLANT_CODE`),
  KEY `t_dlvr_exam_req_item_idx_02` (`PPAY_CONT_INFO_SEQ`),
  KEY `t_dlvr_exam_req_item_idx_03` (`ATCL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사신청물품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_req_ret`
--

DROP TABLE IF EXISTS `t_dlvr_exam_req_ret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_req_ret` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `SNO` int NOT NULL,
  `REJ_RES` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_EXAM_REQ_NO`,`VER`,`SNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사반려사유';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_exam_upload_file`
--

DROP TABLE IF EXISTS `t_dlvr_exam_upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_exam_upload_file` (
  `DLVR_REC_NO` int NOT NULL,
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILE_PATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_REC_NO`,`TYPE`),
  KEY `t_dlvr_exam_upload_file_idx` (`FILE_PATH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='납품검사첨부파일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_fst_eqp`
--

DROP TABLE IF EXISTS `t_dlvr_fst_eqp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_fst_eqp` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AFE_CHASU` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_EXAM_REQ_NO`,`VER`,`ATCL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='초도장비';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_ppay_cont`
--

DROP TABLE IF EXISTS `t_dlvr_ppay_cont`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_ppay_cont` (
  `PPAY_CONT_INFO_SEQ` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL AUTO_INCREMENT,
  `PPAY_CONT_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IVT_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EWH_PLN_DD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PPAY_DD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AREA_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AREA_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MAT_CD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MAT_NM` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PPAY_CNT` int DEFAULT NULL,
  `DL_REG_NUM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DL_CORP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AFE_YEAR` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AFE_CHASU` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RQSTR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RQSTR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TELNO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REM` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONFDT` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '99991231',
  `CONF_MEMO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SNO`,`PPAY_CONT_INFO_SEQ`),
  KEY `t_dlvr_ppay_cont_idx_01` (`CMP_CODE`,`EWH_PLN_DD`,`PPAY_DD`),
  KEY `t_dlvr_ppay_cont_idx_02` (`DL_CORP_NM`)
) ENGINE=InnoDB AUTO_INCREMENT=146191272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='선납계약';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_rec_mng`
--

DROP TABLE IF EXISTS `t_dlvr_rec_mng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_rec_mng` (
  `RECORD_CODE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RECORD_VER` int NOT NULL,
  `RECORD_NM` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`RECORD_CODE`,`RECORD_VER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='성적서양식';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_rec_spec`
--

DROP TABLE IF EXISTS `t_dlvr_rec_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_rec_spec` (
  `RECORD_CODE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RECORD_VER` int NOT NULL,
  `LIST_ID` int NOT NULL,
  `DISPLAY_NO` int NOT NULL,
  `L1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L4_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L4_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L6` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `L8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHO_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EVAL_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIST_NM` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UNT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USL` float DEFAULT NULL,
  `LSL` float DEFAULT NULL,
  `NUM_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OK_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REM` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT (date_format(now(),_utf8mb4'%Y%m%d')),
  PRIMARY KEY (`RECORD_CODE`,`RECORD_VER`,`LIST_ID`),
  KEY `t_dlvr_rec_spec_idx` (`RECORD_CODE`,`LIST_ID`,`USE_YN`,`RECORD_VER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='성적서항목';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_dlvr_temp_item`
--

DROP TABLE IF EXISTS `t_dlvr_temp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dlvr_temp_item` (
  `TMP_ATCL_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CERT_EXAM_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TMP_ATCL_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMPT_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`TMP_ATCL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='임시물품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_eqi_serial`
--

DROP TABLE IF EXISTS `t_eqi_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_eqi_serial` (
  `DLVR_EXAM_REQ_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VER` int NOT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BAR_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SKT_BAR_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DLVR_EXAM_REQ_NO`,`VER`,`ATCL_CODE`,`BAR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='등록번호';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_erp_category`
--

DROP TABLE IF EXISTS `t_erp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_erp_category` (
  `CATEGORY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CLASS1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLASS4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 물품분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_fault_code`
--

DROP TABLE IF EXISTS `t_fault_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_fault_code` (
  `SYS_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FAULT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LGRP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SGRP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FAULT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USE_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SYS_GBN`,`FAULT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='불량코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_job_schedule`
--

DROP TABLE IF EXISTS `t_job_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_job_schedule` (
  `HOSTNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EXPRESSION` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_SCHEDULE` datetime DEFAULT NULL,
  `NEXT_SCHEDULE` datetime DEFAULT NULL,
  `UPDATED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`HOSTNAME`,`JOB_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배치작업 스케쥴';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_job_state`
--

DROP TABLE IF EXISTS `t_job_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_job_state` (
  `JOB_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HOSTNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MESSAGE` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_DATETIME` datetime DEFAULT NULL,
  `LAST_RUN_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`JOB_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배치 작업 상태';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_erp_item_raw`
--

DROP TABLE IF EXISTS `t_lin_erp_item_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_erp_item_raw` (
  `MATKL` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 그룹',
  `MATNR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '자재번호',
  `MAKTX` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 내역',
  `MEINS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '기본 단위',
  `LBTXT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '연구소/엔지니어링 오피스내역 ',
  `ERSDA` date DEFAULT NULL COMMENT '생성일',
  `USNAM` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자 이름',
  `KOSTL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '코스트 센터',
  `WRKST` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '기본 자재',
  `BKLAS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '평가클래스',
  `MAGRV` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드지시자',
  `TAXIM` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 세금 지시자(구매)',
  `QKLAS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '프로젝트재고에 대한 평가클래스',
  `ATWRT_PM` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '설비그룹 특성 값',
  `ATWRT_PM_TEXT` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '설비그룹 특성 값 내역',
  `LVORM` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '클라이언트 레벨의 삭제 대상 자재 표시',
  `UNAME` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자 이름',
  `ZL_ITEM` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '대분류',
  `ZL_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '대분류 Text',
  `ZM_ITEM` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중분류',
  `ZM_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중분류 Text',
  `ZSG_ITEM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SG분류',
  `ZSG_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SG분류 Text',
  `ZS_ITEM` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '소분류',
  `ZS_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '소분류 Text',
  `ZD_ITEM` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세분류',
  `ZD_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세분류 Text',
  `ATWRT_SV` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '서비스방식 특성 값',
  `ATWRT_SV_TEXT` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '서비스방식 특징 값 내역',
  PRIMARY KEY (`MATNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 신규물품 입력값 원본';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_erp_item_tmp`
--

DROP TABLE IF EXISTS `t_lin_erp_item_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_erp_item_tmp` (
  `MATKL` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 그룹',
  `MATNR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '자재번호',
  `MAKTX` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 내역',
  `MEINS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '기본 단위',
  `LBTXT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '연구소/엔지니어링 오피스내역 ',
  `ERSDA` date DEFAULT NULL COMMENT '생성일',
  `USNAM` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자 이름',
  `KOSTL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '코스트 센터',
  `WRKST` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '기본 자재',
  `BKLAS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '평가클래스',
  `MAGRV` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드지시자',
  `TAXIM` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재 세금 지시자(구매)',
  `QKLAS` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '프로젝트재고에 대한 평가클래스',
  `ATWRT_PM` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '설비그룹 특성 값',
  `ATWRT_PM_TEXT` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '설비그룹 특성 값 내역',
  `LVORM` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '클라이언트 레벨의 삭제 대상 자재 표시',
  `UNAME` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자 이름',
  `ZL_ITEM` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '대분류',
  `ZL_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '대분류 Text',
  `ZM_ITEM` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중분류',
  `ZM_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중분류 Text',
  `ZSG_ITEM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SG분류',
  `ZSG_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SG분류 Text',
  `ZS_ITEM` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '소분류',
  `ZS_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '소분류 Text',
  `ZD_ITEM` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세분류',
  `ZD_TEXT` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세분류 Text',
  `ATWRT_SV` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '서비스방식 특성 값',
  `ATWRT_SV_TEXT` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '서비스방식 특징 값 내역',
  PRIMARY KEY (`MATNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 신규물품 입력값 임시 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_erp_new_item`
--

DROP TABLE IF EXISTS `t_lin_erp_new_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_erp_new_item` (
  `SNO` int NOT NULL AUTO_INCREMENT,
  `ERP_CODE_SERI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ERPATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_NM` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CAT_NM` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_CODE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECORD_VER` int DEFAULT NULL,
  `CONFM_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_EMPNO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_HNAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SNO`),
  KEY `t_lin_erp_new_item_idx` (`ERPATCL_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=56505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 신규물품등록정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_fims_as_detail`
--

DROP TABLE IF EXISTS `t_lin_fims_as_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_fims_as_detail` (
  `FIMS_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SNO` int NOT NULL,
  `FAULT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FAULT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_DETAIL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`FIMS_NO`,`SNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='FIMS AS 처리내역상세';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_fims_as_info`
--

DROP TABLE IF EXISTS `t_lin_fims_as_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_fims_as_info` (
  `FIMS_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SKT_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRD_CMP_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SRC_CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONS_CMP_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_WRKR_REQ_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_CMP_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_AREA_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOCAL_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_TEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TROUB_CNTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEAL_GBN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIRST_SHIP_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FCTY_ENT_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FCTY_CG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TMP_EQI_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACTER_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACTER_TELNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_END_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_CORT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MOD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHECK_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  PRIMARY KEY (`FIMS_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='FIMS AS 요청처리정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_fims_as_tmp`
--

DROP TABLE IF EXISTS `t_lin_fims_as_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_fims_as_tmp` (
  `FIMS_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'FIMS요청번호',
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품코드',
  `SKT_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKT시리얼번호',
  `PRD_CMP_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '제조사시리얼번호',
  `CMP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급협력사코드',
  `AS_REQ_WRKR_REQ_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '원천제조사코드',
  `AS_REQ_CMP_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '시공협력사명',
  `AS_REQ_AREA_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AS요청지역코드',
  `LOCAL_NM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '국소명',
  `AS_REQ_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AS요청일자',
  `AS_REQ_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AS요청자명',
  `AS_REQ_TEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AS요청자연락처',
  `TROUB_CNTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '장애내용',
  `STATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '상태'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='FIMS AS 정보 입력값 임시 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_fims_cont_tmp`
--

DROP TABLE IF EXISTS `t_lin_fims_cont_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_fims_cont_tmp` (
  `EWH_PLN_DD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '입고예정일',
  `PPAY_DD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '선납요청일',
  `AREA_NO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '지역본부',
  `AREA_NM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지역본부명',
  `MAT_CD` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '자재코드',
  `MAT_NM` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재명',
  `PPAY_CNT` int DEFAULT '0' COMMENT '수량',
  `DL_REG_NUM` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체사업자번호',
  `DL_CORP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '공급업체사업자명',
  `AFE_YY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AFE 년도',
  `AFE_TMS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AFT 차수',
  `REG_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '선납요청자 ID',
  `REG_NM` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '선납요청자 이름',
  `HP_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '연락처',
  `PPAY_RMKS` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '비고'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='FIMS 계약데이터 입력값 임시 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_mrcs_as_info`
--

DROP TABLE IF EXISTS `t_lin_mrcs_as_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_mrcs_as_info` (
  `MRCS_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AS_AREA_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOCAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TROUB_CTNT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_TEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AS_REQ_DATE` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CMP_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STOCK_DATE` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DLVR_DATE` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DTL_HAND_CTNT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIRST_SHIP_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `M_TROUB_PART_CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `M_DTL_SHAPE_CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `M_DTL_HAND_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `M_DIVI` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHECK_YN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `rep_divi` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rep_do_re_divi` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rep_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `system_divi` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `falt_divi` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `falt_cont` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `falt_cause` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shape_cause` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shape_cont` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `as_divi` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `as_cont` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SRC_CMP_NM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WRKR_REG_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`MRCS_NO`,`falt_divi`,`falt_cause`,`shape_cause`,`as_divi`),
  KEY `IDX_T_LIN_MRCS_AS_INFO_01` (`DLVR_DATE`),
  KEY `IDX_T_LIN_MRCS_AS_INFO_03` (`REG_YMD`),
  KEY `IDX_T_LIN_MRCS_AS_INFO_02` (`DLVR_DATE`,`CMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='MRCS AS 요청처리정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_mrcs_as_info_raw`
--

DROP TABLE IF EXISTS `t_lin_mrcs_as_info_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_mrcs_as_info_raw` (
  `FSRNO` int NOT NULL COMMENT '요청번호(시퀀스)',
  `FGBJY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지역 구분 코드',
  `FNOSERIAL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '유니트 S/N',
  `FNMRPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기명',
  `FTROUBLE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청시 고장내역',
  `FINSPECTOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '현장점검자',
  `FINSPECTORTEL` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '현장점검자 연락처',
  `FDDSKPROC` datetime DEFAULT NULL COMMENT 'SKT 요청일시(작업등록일시)',
  `ENPR_NMBR` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리의뢰처 사업자등록번호',
  `FDDVNDIN` datetime DEFAULT NULL COMMENT 'VENDOR 실제 입고일시',
  `FDDVNDPROC` datetime DEFAULT NULL COMMENT '벤더 조치일',
  `FVNDPROC` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '벤더 조치내역, 수리내역',
  `FCDGRP` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장부위 대분류',
  `FCDCURE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장부위 중분류',
  `FTOK` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'TOK구분\r\n C:소자교체, F:교체, J:장비튜닝, K:기타, N: 수리불가, :T:TOK(TEST OK), U: 유니트 대게체, W:S/W작업',
  `FGBSRTYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '요청구분코드\r\nG: 일상점검, R: 현장점검요청, M:모듈수리',
  `FDDRPTOUT` date DEFAULT NULL COMMENT '벤더 최초 출하 일자',
  `FJRRPT` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기 종류 코드',
  `FGBCD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '도너/리모트 구분코드',
  `FCDRPTMD` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기 타입 코드(rcs, wrcs코드)',
  `FGBERP` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'RCS 미수용 구분',
  `FCDSTBLTYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '고장유형소',
  `FTBLTYPEETC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '기타불량',
  `FCDLTBLREASON` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '고장원인 대',
  `FCDMTBLREASON` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '고장원인 소',
  `FTBLREASONMETC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세부원인 기타',
  `FCDSTBLREASON` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '고장원인 중',
  `FTBLREASONSETC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '조치내역 기타',
  `FQEASCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품코드',
  `FQEASNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품정보에 대한 물품코드명',
  `TRAD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기제조사 업체명',
  PRIMARY KEY (`FSRNO`,`FCDSTBLTYPE`,`FCDLTBLREASON`,`FCDSTBLREASON`,`FCDMTBLREASON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='MRCS AS 요청처리정보 입력값 원본';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_mrcs_as_info_tmp`
--

DROP TABLE IF EXISTS `t_lin_mrcs_as_info_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_mrcs_as_info_tmp` (
  `FSRNO` int NOT NULL COMMENT '요청번호(시퀀스)',
  `FGBJY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지역 구분 코드',
  `FNOSERIAL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '유니트 S/N',
  `FNMRPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기명',
  `FTROUBLE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청시 고장내역',
  `FINSPECTOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '현장점검자',
  `FINSPECTORTEL` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '현장점검자 연락처',
  `FDDSKPROC` datetime DEFAULT NULL COMMENT 'SKT 요청일시(작업등록일시)',
  `ENPR_NMBR` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리의뢰처 사업자등록번호',
  `FDDVNDIN` datetime DEFAULT NULL COMMENT 'VENDOR 실제 입고일시',
  `FDDVNDPROC` datetime DEFAULT NULL COMMENT '벤더 조치일',
  `FVNDPROC` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '벤더 조치내역, 수리내역',
  `FCDGRP` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장부위 대분류',
  `FCDCURE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장부위 중분류',
  `FTOK` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'TOK구분\r\n C:소자교체, F:교체, J:장비튜닝, K:기타, N: 수리불가, :T:TOK(TEST OK), U: 유니트 대게체, W:S/W작업',
  `FGBSRTYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '요청구분코드\r\nG: 일상점검, R: 현장점검요청, M:모듈수리',
  `FDDRPTOUT` date DEFAULT NULL COMMENT '벤더 최초 출하 일자',
  `FJRRPT` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기 종류 코드',
  `FGBCD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '도너/리모트 구분코드',
  `FCDRPTMD` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기 타입 코드(rcs, wrcs코드)',
  `FGBERP` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'RCS 미수용 구분',
  `FCDSTBLTYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장유형소',
  `FTBLTYPEETC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '기타불량',
  `FCDLTBLREASON` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장원인 대',
  `FCDMTBLREASON` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장원인 소',
  `FTBLREASONMETC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세부원인 기타',
  `FCDSTBLREASON` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장원인 중',
  `FTBLREASONSETC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '조치내역 기타',
  `FQEASCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품코드',
  `FQEASNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품정보에 대한 물품코드명',
  `TRAD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '중계기제조사 업체명'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='MRCS AS 요청처리정보 입력값 임시 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_nams_as_info`
--

DROP TABLE IF EXISTS `t_lin_nams_as_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_nams_as_info` (
  `NAMS_NO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAMS_AS_NM` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEAM_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BSIN_GBN_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BSIN_GBN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FACIL_GBN_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FACIL_GBN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EQI_GBN_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EQI_GBN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SKT_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRD_CMP_SERI_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRD_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_ENT_DAY` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIRST_REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TROUBCODE1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TROUB1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TROUBCODE2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TROUB2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TROUBCODE3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SK_TROUB3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CMP_TROUBCODE1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CMP_TROUB1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CMP_TROUBCODE2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CMP_TROUB2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CMP_TROUBCODE3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CMP_TROUB3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CTN1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CTN2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_CTN3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC5` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC6` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC7` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC8` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC9` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REPR_DTL_LOC10` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRD_CMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRD_CMP_WRKR_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MADE_CMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MADE_CMP_WRKR_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MADE_CMP_DEAL_GBN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`NAMS_NO`),
  KEY `t_lin_nams_as_info_idx_01` (`SKT_SERI_NO`,`REPR_ENT_DAY`),
  KEY `t_lin_nams_as_info_idx_02` (`ATCL_CODE`,`REG_YMD`),
  KEY `t_lin_nams_as_info_idx_03` (`PRD_CMP`,`FACIL_GBN`,`EQI_GBN`,`BSIN_GBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='NAMS AS 요청처리정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_nams_as_info_raw`
--

DROP TABLE IF EXISTS `t_lin_nams_as_info_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_nams_as_info_raw` (
  `FUNC_DEPT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKT본부/부서',
  `DEPT_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서코드 ',
  `FUNC_SAUP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세부사업구분',
  `SAUP_DVSN` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사업구분',
  `FUNC_SISL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '시설구분명',
  `SISL_DVSN` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '시설구분코드',
  `SISL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '장비구분명',
  `PREV_NETW` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '장비구분코드',
  `PRDT_TPCD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재코드',
  `PRVS_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재명',
  `BARE_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드',
  `MKCO_BACO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '제조사바코드',
  `JEJO_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '제조일자',
  `CHGE_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드 변경일자',
  `SCRE_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드 생성일자',
  `GOJN_SKC1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형코드1',
  `GOJN_SKT1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형명1',
  `GOJN_SKC2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형코드2',
  `GOJN_SKT2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형명2',
  `GOJN_SKC3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형코드3',
  `GOJN_SKT3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형명3',
  `GOJN_TRC1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형코드1',
  `GOJN_TRD1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형명1',
  `GOJN_TRC2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형코드2',
  `GOJN_TRD2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형명2',
  `GOJN_TRC3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형코드3',
  `GOJN_TRD3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형명3',
  `SURI_TRD1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리유형1',
  `SURI_TRD2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리유형2',
  `SURI_TRD3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리유형3',
  `SURI_PO01` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치1',
  `SURI_PO02` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치2',
  `SURI_PO03` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치3',
  `SURI_PO04` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치4',
  `SURI_PO05` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치5',
  `SURI_PO06` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치6',
  `SURI_PO07` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치7',
  `SURI_PO08` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치8',
  `SURI_PO09` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치9',
  `SURI_PO10` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치10',
  `TRAD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명',
  `TRAD_NAM2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명2',
  `CURR_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '배치일자',
  `ENPR_NMBR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명 사업자번호',
  `ENPR_NMBR2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명2 사업자번호',
  KEY `t_lin_nams_as_info_raw_idx` (`BARE_CODE`,`CHGE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='NAMS AS 요청처리정보 원본';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_lin_nams_as_info_tmp`
--

DROP TABLE IF EXISTS `t_lin_nams_as_info_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lin_nams_as_info_tmp` (
  `FUNC_DEPT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKT본부/부서',
  `DEPT_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서코드 ',
  `FUNC_SAUP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '세부사업구분',
  `SAUP_DVSN` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사업구분',
  `FUNC_SISL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '시설구분명',
  `SISL_DVSN` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '시설구분코드',
  `SISL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '장비구분명',
  `PREV_NETW` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '장비구분코드',
  `PRDT_TPCD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재코드',
  `PRVS_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '자재명',
  `BARE_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드',
  `MKCO_BACO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '제조사바코드',
  `JEJO_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '제조일자',
  `CHGE_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드 변경일자',
  `SCRE_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '바코드 생성일자',
  `GOJN_SKC1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형코드1',
  `GOJN_SKT1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형명1',
  `GOJN_SKC2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형코드2',
  `GOJN_SKT2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형명2',
  `GOJN_SKC3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형코드3',
  `GOJN_SKT3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리요청-고장수리유형명3',
  `GOJN_TRC1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형코드1',
  `GOJN_TRD1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형명1',
  `GOJN_TRC2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형코드2',
  `GOJN_TRD2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형명2',
  `GOJN_TRC3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형코드3',
  `GOJN_TRD3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리업체-고장수리유형명3',
  `SURI_TRD1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리유형1',
  `SURI_TRD2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리유형2',
  `SURI_TRD3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수리유형3',
  `SURI_PO01` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치1',
  `SURI_PO02` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치2',
  `SURI_PO03` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치3',
  `SURI_PO04` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치4',
  `SURI_PO05` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치5',
  `SURI_PO06` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치6',
  `SURI_PO07` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치7',
  `SURI_PO08` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치8',
  `SURI_PO09` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치9',
  `SURI_PO10` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '고장위치10',
  `TRAD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명',
  `TRAD_NAM2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명2',
  `CURR_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '배치일자',
  `ENPR_NMBR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명 사업자번호',
  `ENPR_NMBR2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '업체명2 사업자번호',
  KEY `t_lin_nams_as_info_tmp_idx` (`BARE_CODE`,`CHGE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='NAMS AS 요청처리정보 임시 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_api`
--

DROP TABLE IF EXISTS `t_log_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_api` (
  `SEQ` bigint NOT NULL AUTO_INCREMENT,
  `METHOD` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `URI` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARAMS` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USER_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLIENT_IP` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HOSTNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATUS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MESSAGE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STACKTRACE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ELAPSED_TIME` bigint DEFAULT NULL COMMENT '응답시간(ms)',
  `LOG_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=210985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='api 호출 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_happy_api`
--

DROP TABLE IF EXISTS `t_log_happy_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_happy_api` (
  `SEQ` int NOT NULL AUTO_INCREMENT,
  `END_POINT` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESPONSE_MESSAGE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOG_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='행복나래 API 호출 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_login`
--

DROP TABLE IF EXISTS `t_log_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_login` (
  `SEQ` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CLIENT_IP` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOGIN_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='로그인 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_mail_send`
--

DROP TABLE IF EXISTS `t_log_mail_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_mail_send` (
  `SEQ` bigint NOT NULL AUTO_INCREMENT,
  `HOSTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '발송서버',
  `SENDER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '발신주소',
  `RECEIVER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수신주소',
  `SUBJECT` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '제목',
  `CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '본문',
  `RESULT_MESSAGE` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '응답',
  `SEND_DATETIME` datetime DEFAULT NULL COMMENT '발송일시',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='메일 발송 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_page`
--

DROP TABLE IF EXISTS `t_log_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_page` (
  `SEQ` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PAGE_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HOSTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PATH` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `QUERY_STRING` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACS_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=54728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='페이지 접근 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_system_job`
--

DROP TABLE IF EXISTS `t_log_system_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_system_job` (
  `SEQ` bigint NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HOSTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONFIGURATION` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESULT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MESSAGE` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ARGUMENTS` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_DATETIME` datetime DEFAULT NULL,
  `END_DATETIME` datetime DEFAULT NULL,
  `ELAPSED_TIME` int DEFAULT NULL COMMENT '실행시간(초)',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=35149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='시스템 작업 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_log_z_mi_qeas_interface`
--

DROP TABLE IF EXISTS `t_log_z_mi_qeas_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log_z_mi_qeas_interface` (
  `SEQ` bigint NOT NULL AUTO_INCREMENT,
  `ZINSP_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '물품검사번호',
  `EBELN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '구매문서번호',
  `ZDELIV_DATE` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '납기일자',
  `WERKS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '플랜트',
  `ZINSP_REQDATE` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '검사신청일자',
  `ZINSP_DATE` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '검사일자',
  `ZRESP_EMP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '검사담당자',
  `ZCONT_EMP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '검사책임자',
  `ZSCORE` int DEFAULT NULL COMMENT '품질점수',
  `ZFLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '단일문자플래그',
  `RESULT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '성공여부',
  `MESSAGE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '응답 메시지',
  `SERVICE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '호출 프로그램',
  `HOSTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '호출서버',
  `USER_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '호출한 사용자',
  `LOG_DATETIME` datetime DEFAULT NULL COMMENT '로그일시',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ERP 품질점수 전송 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mrcs_area_code`
--

DROP TABLE IF EXISTS `t_mrcs_area_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mrcs_area_code` (
  `AREA_CODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AREA_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`AREA_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='MRCS 지역구분코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mrcs_ppm_as`
--

DROP TABLE IF EXISTS `t_mrcs_ppm_as`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mrcs_ppm_as` (
  `YYYY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASDIVI` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIVI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `P_1` decimal(10,0) NOT NULL,
  `P_2` decimal(10,0) NOT NULL,
  `P_3` decimal(10,0) NOT NULL,
  `P_4` decimal(10,0) NOT NULL,
  `P_5` decimal(10,0) NOT NULL,
  `P_6` decimal(10,0) NOT NULL,
  `P_7` decimal(10,0) NOT NULL,
  `P_8` decimal(10,0) NOT NULL,
  `P_9` decimal(10,0) NOT NULL,
  `P_10` decimal(10,0) NOT NULL,
  `P_11` decimal(10,0) NOT NULL,
  `P_12` decimal(10,0) NOT NULL,
  PRIMARY KEY (`YYYY`,`ASDIVI`,`CATEGORY`,`SPY_CMP_NM`,`DIVI`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='중계기 AS율 - 연별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mrcs_ppm_as_new`
--

DROP TABLE IF EXISTS `t_mrcs_ppm_as_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mrcs_ppm_as_new` (
  `YYYYMM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASDIVI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`YYYYMM`,`ASDIVI`,`CATEGORY`,`SPY_CMP_NM`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='중계기 AS율 - 월별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mrcs_tot_ppm_as`
--

DROP TABLE IF EXISTS `t_mrcs_tot_ppm_as`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mrcs_tot_ppm_as` (
  `YYYY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASDIVI` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIVI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `P_1` decimal(10,0) NOT NULL,
  `P_2` decimal(10,0) NOT NULL,
  `P_3` decimal(10,0) NOT NULL,
  `P_4` decimal(10,0) NOT NULL,
  `P_5` decimal(10,0) NOT NULL,
  `P_6` decimal(10,0) NOT NULL,
  `P_7` decimal(10,0) NOT NULL,
  `P_8` decimal(10,0) NOT NULL,
  `P_9` decimal(10,0) NOT NULL,
  `P_10` decimal(10,0) NOT NULL,
  `P_11` decimal(10,0) NOT NULL,
  `P_12` decimal(10,0) NOT NULL,
  PRIMARY KEY (`YYYY`,`ASDIVI`,`CATEGORY`,`SPY_CMP_NM`,`DIVI`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='중계기 전체 AS율 - 연별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mrcs_tot_ppm_as_new`
--

DROP TABLE IF EXISTS `t_mrcs_tot_ppm_as_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mrcs_tot_ppm_as_new` (
  `YYYYMM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASDIVI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`YYYYMM`,`ASDIVI`,`CATEGORY`,`SPY_CMP_NM`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='중계기 전체 AS율 - 월별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nams_npr`
--

DROP TABLE IF EXISTS `t_nams_npr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nams_npr` (
  `YYYY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIVI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `P_1` decimal(10,0) DEFAULT NULL,
  `P_2` decimal(10,0) DEFAULT NULL,
  `P_3` decimal(10,0) DEFAULT NULL,
  `P_4` decimal(10,0) DEFAULT NULL,
  `P_5` decimal(10,0) DEFAULT NULL,
  `P_6` decimal(10,0) DEFAULT NULL,
  `P_7` decimal(10,0) DEFAULT NULL,
  `P_8` decimal(10,0) DEFAULT NULL,
  `P_9` decimal(10,0) DEFAULT NULL,
  `P_10` decimal(10,0) DEFAULT NULL,
  `P_11` decimal(10,0) DEFAULT NULL,
  `P_12` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`YYYY`,`CATEGORY`,`SPY_CMP_NM`,`DIVI`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='주장비 AS율 - 연별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nams_npr_06`
--

DROP TABLE IF EXISTS `t_nams_npr_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nams_npr_06` (
  `YYYY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIVI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `P_1` decimal(10,0) NOT NULL,
  `P_2` decimal(10,0) NOT NULL,
  `P_3` decimal(10,0) NOT NULL,
  `P_4` decimal(10,0) NOT NULL,
  `P_5` decimal(10,0) NOT NULL,
  `P_6` decimal(10,0) NOT NULL,
  `P_7` decimal(10,0) NOT NULL,
  `P_8` decimal(10,0) NOT NULL,
  `P_9` decimal(10,0) NOT NULL,
  `P_10` decimal(10,0) NOT NULL,
  `P_11` decimal(10,0) NOT NULL,
  `P_12` decimal(10,0) NOT NULL,
  PRIMARY KEY (`YYYY`,`CATEGORY`,`SPY_CMP_NM`,`DIVI`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='전송장비 AS율 - 연별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nams_npr_06_new`
--

DROP TABLE IF EXISTS `t_nams_npr_06_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nams_npr_06_new` (
  `YYYYMM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`YYYYMM`,`CATEGORY`,`SPY_CMP_NM`,`SEQ`),
  KEY `t_nams_npr_06_new_idx_01` (`YYYYMM`,`CATEGORY`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='전송장비 AS율 - 월별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nams_npr_new`
--

DROP TABLE IF EXISTS `t_nams_npr_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nams_npr_new` (
  `YYYYMM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`YYYYMM`,`CATEGORY`,`SPY_CMP_NM`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='주장비 AS율 - 월별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nams_tot_npr`
--

DROP TABLE IF EXISTS `t_nams_tot_npr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nams_tot_npr` (
  `YYYY` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIVI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `P_1` decimal(12,2) DEFAULT NULL,
  `P_2` decimal(12,2) DEFAULT NULL,
  `P_3` decimal(12,2) DEFAULT NULL,
  `P_4` decimal(12,2) DEFAULT NULL,
  `P_5` decimal(12,2) DEFAULT NULL,
  `P_6` decimal(12,2) DEFAULT NULL,
  `P_7` decimal(12,2) DEFAULT NULL,
  `P_8` decimal(12,2) DEFAULT NULL,
  `P_9` decimal(12,2) DEFAULT NULL,
  `P_10` decimal(12,2) DEFAULT NULL,
  `P_11` decimal(12,2) DEFAULT NULL,
  `P_12` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`YYYY`,`CATEGORY`,`SPY_CMP_NM`,`DIVI`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='주장비 전체 AS율 - 연별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nams_tot_npr_new`
--

DROP TABLE IF EXISTS `t_nams_tot_npr_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nams_tot_npr_new` (
  `YYYYMM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SPY_CMP_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SEQ` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VALUE` decimal(10,0) NOT NULL,
  PRIMARY KEY (`YYYYMM`,`CATEGORY`,`SPY_CMP_NM`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='주장비 전체 AS율 - 월별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_sys_usr_item_class`
--

DROP TABLE IF EXISTS `t_sys_usr_item_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_usr_item_class` (
  `USR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATCL_CAT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGR_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REGR_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REG_YMD` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`USR_ID`,`ATCL_CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='담당자별물품분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_cmm_item_class_name`
--

DROP TABLE IF EXISTS `v_cmm_item_class_name`;
/*!50001 DROP VIEW IF EXISTS `v_cmm_item_class_name`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_cmm_item_class_name` AS SELECT 
 1 AS `ATCL_CAT_CODE`,
 1 AS `C1`,
 1 AS `C1_NM`,
 1 AS `C2`,
 1 AS `C2_NM`,
 1 AS `C3`,
 1 AS `C3_NM`,
 1 AS `C4`,
 1 AS `C4_NM`,
 1 AS `ATCL_CAT_NM`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dlvr_auto_cert_target`
--

DROP TABLE IF EXISTS `v_dlvr_auto_cert_target`;
/*!50001 DROP VIEW IF EXISTS `v_dlvr_auto_cert_target`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dlvr_auto_cert_target` AS SELECT 
 1 AS `ZINSP_NO`,
 1 AS `EBELN`,
 1 AS `ZDELIV_DATE`,
 1 AS `WERKS`,
 1 AS `ZINSP_REQDATE`,
 1 AS `ZINSP_DATE`,
 1 AS `ZRESP_EMP`,
 1 AS `ZCONT_EMP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dlvr_cont_tmp`
--

DROP TABLE IF EXISTS `v_dlvr_cont_tmp`;
/*!50001 DROP VIEW IF EXISTS `v_dlvr_cont_tmp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dlvr_cont_tmp` AS SELECT 
 1 AS `ctr_no`,
 1 AS `sno`,
 1 AS `DELIVN`,
 1 AS `DELIVP`,
 1 AS `EBELN`,
 1 AS `EBELP`,
 1 AS `BSART`,
 1 AS `ZZTITL`,
 1 AS `ZZPODT`,
 1 AS `KDATB`,
 1 AS `KDATE`,
 1 AS `AFNAM`,
 1 AS `KTEXT`,
 1 AS `ORDERMAN`,
 1 AS `LIFNR`,
 1 AS `NAME1`,
 1 AS `WERS`,
 1 AS `ZZM001`,
 1 AS `ZZM002`,
 1 AS `ZZM003`,
 1 AS `ZZM004`,
 1 AS `ZZX001`,
 1 AS `ZZX002`,
 1 AS `ZZX003`,
 1 AS `ZZPRD1`,
 1 AS `MATKL`,
 1 AS `MATNR`,
 1 AS `TXZ01`,
 1 AS `MENGE`,
 1 AS `MEINS`,
 1 AS `NETPR`,
 1 AS `PRICE`,
 1 AS `EINDT`,
 1 AS `WERKS`,
 1 AS `NAME11`,
 1 AS `IDNLF`,
 1 AS `BANFN`,
 1 AS `AUFNR`,
 1 AS `KTEXT1`,
 1 AS `KNTTP`,
 1 AS `KNTTX`,
 1 AS `FLAG`,
 1 AS `AEDAT`,
 1 AS `UNAME`,
 1 AS `NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dlvr_exam_data`
--

DROP TABLE IF EXISTS `v_dlvr_exam_data`;
/*!50001 DROP VIEW IF EXISTS `v_dlvr_exam_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dlvr_exam_data` AS SELECT 
 1 AS `DLVR_REC_NO`,
 1 AS `EQI_SERI_NO`,
 1 AS `SERIAL_PASS`,
 1 AS `EXAM_VALUE1`,
 1 AS `EXAM_VALUE2`,
 1 AS `EXAM_VALUE3`,
 1 AS `EXAM_VALUE4`,
 1 AS `EXAM_VALUE5`,
 1 AS `EXAM_VALUE6`,
 1 AS `EXAM_VALUE7`,
 1 AS `EXAM_VALUE8`,
 1 AS `EXAM_VALUE9`,
 1 AS `EXAM_VALUE10`,
 1 AS `EXAM_VALUE11`,
 1 AS `EXAM_VALUE12`,
 1 AS `EXAM_VALUE13`,
 1 AS `EXAM_VALUE14`,
 1 AS `EXAM_VALUE15`,
 1 AS `EXAM_VALUE16`,
 1 AS `EXAM_VALUE17`,
 1 AS `EXAM_VALUE18`,
 1 AS `EXAM_VALUE19`,
 1 AS `EXAM_VALUE20`,
 1 AS `EXAM_VALUE21`,
 1 AS `EXAM_VALUE22`,
 1 AS `EXAM_VALUE23`,
 1 AS `EXAM_VALUE24`,
 1 AS `EXAM_VALUE25`,
 1 AS `EXAM_VALUE26`,
 1 AS `EXAM_VALUE27`,
 1 AS `EXAM_VALUE28`,
 1 AS `EXAM_VALUE29`,
 1 AS `EXAM_VALUE30`,
 1 AS `EXAM_VALUE31`,
 1 AS `EXAM_VALUE32`,
 1 AS `EXAM_VALUE33`,
 1 AS `EXAM_VALUE34`,
 1 AS `EXAM_VALUE35`,
 1 AS `EXAM_VALUE36`,
 1 AS `EXAM_VALUE37`,
 1 AS `EXAM_VALUE38`,
 1 AS `EXAM_VALUE39`,
 1 AS `EXAM_VALUE40`,
 1 AS `EXAM_VALUE41`,
 1 AS `EXAM_VALUE42`,
 1 AS `EXAM_VALUE43`,
 1 AS `EXAM_VALUE44`,
 1 AS `EXAM_VALUE45`,
 1 AS `EXAM_VALUE46`,
 1 AS `EXAM_VALUE47`,
 1 AS `EXAM_VALUE48`,
 1 AS `EXAM_VALUE49`,
 1 AS `EXAM_VALUE50`,
 1 AS `EXAM_VALUE51`,
 1 AS `EXAM_VALUE52`,
 1 AS `EXAM_VALUE53`,
 1 AS `EXAM_VALUE54`,
 1 AS `EXAM_VALUE55`,
 1 AS `EXAM_VALUE56`,
 1 AS `EXAM_VALUE57`,
 1 AS `EXAM_VALUE58`,
 1 AS `EXAM_VALUE59`,
 1 AS `EXAM_VALUE60`,
 1 AS `EXAM_VALUE61`,
 1 AS `EXAM_VALUE62`,
 1 AS `EXAM_VALUE63`,
 1 AS `EXAM_VALUE64`,
 1 AS `EXAM_VALUE65`,
 1 AS `EXAM_VALUE66`,
 1 AS `EXAM_VALUE67`,
 1 AS `EXAM_VALUE68`,
 1 AS `EXAM_VALUE69`,
 1 AS `EXAM_VALUE70`,
 1 AS `EXAM_VALUE71`,
 1 AS `EXAM_VALUE72`,
 1 AS `EXAM_VALUE73`,
 1 AS `EXAM_VALUE74`,
 1 AS `EXAM_VALUE75`,
 1 AS `EXAM_VALUE76`,
 1 AS `EXAM_VALUE77`,
 1 AS `EXAM_VALUE78`,
 1 AS `EXAM_VALUE79`,
 1 AS `EXAM_VALUE80`,
 1 AS `EXAM_VALUE81`,
 1 AS `EXAM_VALUE82`,
 1 AS `EXAM_VALUE83`,
 1 AS `EXAM_VALUE84`,
 1 AS `EXAM_VALUE85`,
 1 AS `EXAM_VALUE86`,
 1 AS `EXAM_VALUE87`,
 1 AS `EXAM_VALUE88`,
 1 AS `EXAM_VALUE89`,
 1 AS `EXAM_VALUE90`,
 1 AS `EXAM_VALUE91`,
 1 AS `EXAM_VALUE92`,
 1 AS `EXAM_VALUE93`,
 1 AS `EXAM_VALUE94`,
 1 AS `EXAM_VALUE95`,
 1 AS `EXAM_VALUE96`,
 1 AS `EXAM_VALUE97`,
 1 AS `EXAM_VALUE98`,
 1 AS `EXAM_VALUE99`,
 1 AS `EXAM_VALUE100`,
 1 AS `EXAM_VALUE101`,
 1 AS `EXAM_VALUE102`,
 1 AS `EXAM_VALUE103`,
 1 AS `EXAM_VALUE104`,
 1 AS `EXAM_VALUE105`,
 1 AS `EXAM_VALUE106`,
 1 AS `EXAM_VALUE107`,
 1 AS `EXAM_VALUE108`,
 1 AS `EXAM_VALUE109`,
 1 AS `EXAM_VALUE110`,
 1 AS `EXAM_VALUE111`,
 1 AS `EXAM_VALUE112`,
 1 AS `EXAM_VALUE113`,
 1 AS `EXAM_VALUE114`,
 1 AS `EXAM_VALUE115`,
 1 AS `EXAM_VALUE116`,
 1 AS `EXAM_VALUE117`,
 1 AS `EXAM_VALUE118`,
 1 AS `EXAM_VALUE119`,
 1 AS `EXAM_VALUE120`,
 1 AS `EXAM_VALUE121`,
 1 AS `EXAM_VALUE122`,
 1 AS `EXAM_VALUE123`,
 1 AS `EXAM_VALUE124`,
 1 AS `EXAM_VALUE125`,
 1 AS `EXAM_VALUE126`,
 1 AS `EXAM_VALUE127`,
 1 AS `EXAM_VALUE128`,
 1 AS `EXAM_VALUE129`,
 1 AS `EXAM_VALUE130`,
 1 AS `EXAM_VALUE131`,
 1 AS `EXAM_VALUE132`,
 1 AS `EXAM_VALUE133`,
 1 AS `EXAM_VALUE134`,
 1 AS `EXAM_VALUE135`,
 1 AS `EXAM_VALUE136`,
 1 AS `EXAM_VALUE137`,
 1 AS `EXAM_VALUE138`,
 1 AS `EXAM_VALUE139`,
 1 AS `EXAM_VALUE140`,
 1 AS `EXAM_VALUE141`,
 1 AS `EXAM_VALUE142`,
 1 AS `EXAM_VALUE143`,
 1 AS `EXAM_VALUE144`,
 1 AS `EXAM_VALUE145`,
 1 AS `EXAM_VALUE146`,
 1 AS `EXAM_VALUE147`,
 1 AS `EXAM_VALUE148`,
 1 AS `EXAM_VALUE149`,
 1 AS `EXAM_VALUE150`,
 1 AS `EXAM_VALUE151`,
 1 AS `EXAM_VALUE152`,
 1 AS `EXAM_VALUE153`,
 1 AS `EXAM_VALUE154`,
 1 AS `EXAM_VALUE155`,
 1 AS `EXAM_VALUE156`,
 1 AS `EXAM_VALUE157`,
 1 AS `EXAM_VALUE158`,
 1 AS `EXAM_VALUE159`,
 1 AS `EXAM_VALUE160`,
 1 AS `EXAM_VALUE161`,
 1 AS `EXAM_VALUE162`,
 1 AS `EXAM_VALUE163`,
 1 AS `EXAM_VALUE164`,
 1 AS `EXAM_VALUE165`,
 1 AS `EXAM_VALUE166`,
 1 AS `EXAM_VALUE167`,
 1 AS `EXAM_VALUE168`,
 1 AS `EXAM_VALUE169`,
 1 AS `EXAM_VALUE170`,
 1 AS `EXAM_VALUE171`,
 1 AS `EXAM_VALUE172`,
 1 AS `EXAM_VALUE173`,
 1 AS `EXAM_VALUE174`,
 1 AS `EXAM_VALUE175`,
 1 AS `EXAM_VALUE176`,
 1 AS `EXAM_VALUE177`,
 1 AS `EXAM_VALUE178`,
 1 AS `EXAM_VALUE179`,
 1 AS `EXAM_VALUE180`,
 1 AS `EXAM_VALUE181`,
 1 AS `EXAM_VALUE182`,
 1 AS `EXAM_VALUE183`,
 1 AS `EXAM_VALUE184`,
 1 AS `EXAM_VALUE185`,
 1 AS `EXAM_VALUE186`,
 1 AS `EXAM_VALUE187`,
 1 AS `EXAM_VALUE188`,
 1 AS `EXAM_VALUE189`,
 1 AS `EXAM_VALUE190`,
 1 AS `EXAM_VALUE191`,
 1 AS `EXAM_VALUE192`,
 1 AS `EXAM_VALUE193`,
 1 AS `EXAM_VALUE194`,
 1 AS `EXAM_VALUE195`,
 1 AS `EXAM_VALUE196`,
 1 AS `EXAM_VALUE197`,
 1 AS `EXAM_VALUE198`,
 1 AS `EXAM_VALUE199`,
 1 AS `EXAM_VALUE200`,
 1 AS `EXAM_VALUE201`,
 1 AS `EXAM_VALUE202`,
 1 AS `EXAM_VALUE203`,
 1 AS `EXAM_VALUE204`,
 1 AS `EXAM_VALUE205`,
 1 AS `EXAM_VALUE206`,
 1 AS `EXAM_VALUE207`,
 1 AS `EXAM_VALUE208`,
 1 AS `EXAM_VALUE209`,
 1 AS `EXAM_VALUE210`,
 1 AS `EXAM_VALUE211`,
 1 AS `EXAM_VALUE212`,
 1 AS `EXAM_VALUE213`,
 1 AS `EXAM_VALUE214`,
 1 AS `EXAM_VALUE215`,
 1 AS `EXAM_VALUE216`,
 1 AS `EXAM_VALUE217`,
 1 AS `EXAM_VALUE218`,
 1 AS `EXAM_VALUE219`,
 1 AS `EXAM_VALUE220`,
 1 AS `EXAM_VALUE221`,
 1 AS `EXAM_VALUE222`,
 1 AS `EXAM_VALUE223`,
 1 AS `EXAM_VALUE224`,
 1 AS `EXAM_VALUE225`,
 1 AS `EXAM_VALUE226`,
 1 AS `EXAM_VALUE227`,
 1 AS `EXAM_VALUE228`,
 1 AS `EXAM_VALUE229`,
 1 AS `EXAM_VALUE230`,
 1 AS `EXAM_VALUE231`,
 1 AS `EXAM_VALUE232`,
 1 AS `EXAM_VALUE233`,
 1 AS `EXAM_VALUE234`,
 1 AS `EXAM_VALUE235`,
 1 AS `EXAM_VALUE236`,
 1 AS `EXAM_VALUE237`,
 1 AS `EXAM_VALUE238`,
 1 AS `EXAM_VALUE239`,
 1 AS `EXAM_VALUE240`,
 1 AS `EXAM_VALUE241`,
 1 AS `EXAM_VALUE242`,
 1 AS `EXAM_VALUE243`,
 1 AS `EXAM_VALUE244`,
 1 AS `EXAM_VALUE245`,
 1 AS `EXAM_VALUE246`,
 1 AS `EXAM_VALUE247`,
 1 AS `EXAM_VALUE248`,
 1 AS `EXAM_VALUE249`,
 1 AS `EXAM_VALUE250`,
 1 AS `EXAM_VALUE251`,
 1 AS `EXAM_VALUE252`,
 1 AS `EXAM_VALUE253`,
 1 AS `EXAM_VALUE254`,
 1 AS `EXAM_VALUE255`,
 1 AS `EXAM_VALUE256`,
 1 AS `EXAM_VALUE257`,
 1 AS `EXAM_VALUE258`,
 1 AS `EXAM_VALUE259`,
 1 AS `EXAM_VALUE260`,
 1 AS `EXAM_VALUE261`,
 1 AS `EXAM_VALUE262`,
 1 AS `EXAM_VALUE263`,
 1 AS `EXAM_VALUE264`,
 1 AS `EXAM_VALUE265`,
 1 AS `EXAM_VALUE266`,
 1 AS `EXAM_VALUE267`,
 1 AS `EXAM_VALUE268`,
 1 AS `EXAM_VALUE269`,
 1 AS `EXAM_VALUE270`,
 1 AS `EXAM_VALUE271`,
 1 AS `EXAM_VALUE272`,
 1 AS `EXAM_VALUE273`,
 1 AS `EXAM_VALUE274`,
 1 AS `EXAM_VALUE275`,
 1 AS `EXAM_VALUE276`,
 1 AS `EXAM_VALUE277`,
 1 AS `EXAM_VALUE278`,
 1 AS `EXAM_VALUE279`,
 1 AS `EXAM_VALUE280`,
 1 AS `EXAM_VALUE281`,
 1 AS `EXAM_VALUE282`,
 1 AS `EXAM_VALUE283`,
 1 AS `EXAM_VALUE284`,
 1 AS `EXAM_VALUE285`,
 1 AS `EXAM_VALUE286`,
 1 AS `EXAM_VALUE287`,
 1 AS `EXAM_VALUE288`,
 1 AS `EXAM_VALUE289`,
 1 AS `EXAM_VALUE290`,
 1 AS `EXAM_VALUE291`,
 1 AS `EXAM_VALUE292`,
 1 AS `EXAM_VALUE293`,
 1 AS `EXAM_VALUE294`,
 1 AS `EXAM_VALUE295`,
 1 AS `EXAM_VALUE296`,
 1 AS `EXAM_VALUE297`,
 1 AS `EXAM_VALUE298`,
 1 AS `EXAM_VALUE299`,
 1 AS `EXAM_VALUE300`,
 1 AS `EXAM_VALUE301`,
 1 AS `EXAM_VALUE302`,
 1 AS `EXAM_VALUE303`,
 1 AS `EXAM_VALUE304`,
 1 AS `EXAM_VALUE305`,
 1 AS `EXAM_VALUE306`,
 1 AS `EXAM_VALUE307`,
 1 AS `EXAM_VALUE308`,
 1 AS `EXAM_VALUE309`,
 1 AS `EXAM_VALUE310`,
 1 AS `EXAM_VALUE311`,
 1 AS `EXAM_VALUE312`,
 1 AS `EXAM_VALUE313`,
 1 AS `EXAM_VALUE314`,
 1 AS `EXAM_VALUE315`,
 1 AS `EXAM_VALUE316`,
 1 AS `EXAM_VALUE317`,
 1 AS `EXAM_VALUE318`,
 1 AS `EXAM_VALUE319`,
 1 AS `EXAM_VALUE320`,
 1 AS `EXAM_VALUE321`,
 1 AS `EXAM_VALUE322`,
 1 AS `EXAM_VALUE323`,
 1 AS `EXAM_VALUE324`,
 1 AS `EXAM_VALUE325`,
 1 AS `EXAM_VALUE326`,
 1 AS `EXAM_VALUE327`,
 1 AS `EXAM_VALUE328`,
 1 AS `EXAM_VALUE329`,
 1 AS `EXAM_VALUE330`,
 1 AS `EXAM_VALUE331`,
 1 AS `EXAM_VALUE332`,
 1 AS `EXAM_VALUE333`,
 1 AS `EXAM_VALUE334`,
 1 AS `EXAM_VALUE335`,
 1 AS `EXAM_VALUE336`,
 1 AS `EXAM_VALUE337`,
 1 AS `EXAM_VALUE338`,
 1 AS `EXAM_VALUE339`,
 1 AS `EXAM_VALUE340`,
 1 AS `EXAM_VALUE341`,
 1 AS `EXAM_VALUE342`,
 1 AS `EXAM_VALUE343`,
 1 AS `EXAM_VALUE344`,
 1 AS `EXAM_VALUE345`,
 1 AS `EXAM_VALUE346`,
 1 AS `EXAM_VALUE347`,
 1 AS `EXAM_VALUE348`,
 1 AS `EXAM_VALUE349`,
 1 AS `EXAM_VALUE350`,
 1 AS `EXAM_VALUE351`,
 1 AS `EXAM_VALUE352`,
 1 AS `EXAM_VALUE353`,
 1 AS `EXAM_VALUE354`,
 1 AS `EXAM_VALUE355`,
 1 AS `EXAM_VALUE356`,
 1 AS `EXAM_VALUE357`,
 1 AS `EXAM_VALUE358`,
 1 AS `EXAM_VALUE359`,
 1 AS `EXAM_VALUE360`,
 1 AS `EXAM_VALUE361`,
 1 AS `EXAM_VALUE362`,
 1 AS `EXAM_VALUE363`,
 1 AS `EXAM_VALUE364`,
 1 AS `EXAM_VALUE365`,
 1 AS `EXAM_VALUE366`,
 1 AS `EXAM_VALUE367`,
 1 AS `EXAM_VALUE368`,
 1 AS `EXAM_VALUE369`,
 1 AS `EXAM_VALUE370`,
 1 AS `EXAM_VALUE371`,
 1 AS `EXAM_VALUE372`,
 1 AS `EXAM_VALUE373`,
 1 AS `EXAM_VALUE374`,
 1 AS `EXAM_VALUE375`,
 1 AS `EXAM_VALUE376`,
 1 AS `EXAM_VALUE377`,
 1 AS `EXAM_VALUE378`,
 1 AS `EXAM_VALUE379`,
 1 AS `EXAM_VALUE380`,
 1 AS `EXAM_VALUE381`,
 1 AS `EXAM_VALUE382`,
 1 AS `EXAM_VALUE383`,
 1 AS `EXAM_VALUE384`,
 1 AS `EXAM_VALUE385`,
 1 AS `EXAM_VALUE386`,
 1 AS `EXAM_VALUE387`,
 1 AS `EXAM_VALUE388`,
 1 AS `EXAM_VALUE389`,
 1 AS `EXAM_VALUE390`,
 1 AS `EXAM_VALUE391`,
 1 AS `EXAM_VALUE392`,
 1 AS `EXAM_VALUE393`,
 1 AS `EXAM_VALUE394`,
 1 AS `EXAM_VALUE395`,
 1 AS `EXAM_VALUE396`,
 1 AS `EXAM_VALUE397`,
 1 AS `EXAM_VALUE398`,
 1 AS `EXAM_VALUE399`,
 1 AS `EXAM_VALUE400`,
 1 AS `EXAM_VALUE401`,
 1 AS `EXAM_VALUE402`,
 1 AS `EXAM_VALUE403`,
 1 AS `EXAM_VALUE404`,
 1 AS `EXAM_VALUE405`,
 1 AS `EXAM_VALUE406`,
 1 AS `EXAM_VALUE407`,
 1 AS `EXAM_VALUE408`,
 1 AS `EXAM_VALUE409`,
 1 AS `EXAM_VALUE410`,
 1 AS `EXAM_VALUE411`,
 1 AS `EXAM_VALUE412`,
 1 AS `EXAM_VALUE413`,
 1 AS `EXAM_VALUE414`,
 1 AS `EXAM_VALUE415`,
 1 AS `EXAM_VALUE416`,
 1 AS `EXAM_VALUE417`,
 1 AS `EXAM_VALUE418`,
 1 AS `EXAM_VALUE419`,
 1 AS `EXAM_VALUE420`,
 1 AS `EXAM_VALUE421`,
 1 AS `EXAM_VALUE422`,
 1 AS `EXAM_VALUE423`,
 1 AS `EXAM_VALUE424`,
 1 AS `EXAM_VALUE425`,
 1 AS `EXAM_VALUE426`,
 1 AS `EXAM_VALUE427`,
 1 AS `EXAM_VALUE428`,
 1 AS `EXAM_VALUE429`,
 1 AS `EXAM_VALUE430`,
 1 AS `EXAM_VALUE431`,
 1 AS `EXAM_VALUE432`,
 1 AS `EXAM_VALUE433`,
 1 AS `EXAM_VALUE434`,
 1 AS `EXAM_VALUE435`,
 1 AS `EXAM_VALUE436`,
 1 AS `EXAM_VALUE437`,
 1 AS `EXAM_VALUE438`,
 1 AS `EXAM_VALUE439`,
 1 AS `EXAM_VALUE440`,
 1 AS `EXAM_VALUE441`,
 1 AS `EXAM_VALUE442`,
 1 AS `EXAM_VALUE443`,
 1 AS `EXAM_VALUE444`,
 1 AS `EXAM_VALUE445`,
 1 AS `EXAM_VALUE446`,
 1 AS `EXAM_VALUE447`,
 1 AS `EXAM_VALUE448`,
 1 AS `EXAM_VALUE449`,
 1 AS `EXAM_VALUE450`,
 1 AS `EXAM_VALUE451`,
 1 AS `EXAM_VALUE452`,
 1 AS `EXAM_VALUE453`,
 1 AS `EXAM_VALUE454`,
 1 AS `EXAM_VALUE455`,
 1 AS `EXAM_VALUE456`,
 1 AS `EXAM_VALUE457`,
 1 AS `EXAM_VALUE458`,
 1 AS `EXAM_VALUE459`,
 1 AS `EXAM_VALUE460`,
 1 AS `EXAM_VALUE461`,
 1 AS `EXAM_VALUE462`,
 1 AS `EXAM_VALUE463`,
 1 AS `EXAM_VALUE464`,
 1 AS `EXAM_VALUE465`,
 1 AS `EXAM_VALUE466`,
 1 AS `EXAM_VALUE467`,
 1 AS `EXAM_VALUE468`,
 1 AS `EXAM_VALUE469`,
 1 AS `EXAM_VALUE470`,
 1 AS `EXAM_VALUE471`,
 1 AS `EXAM_VALUE472`,
 1 AS `EXAM_VALUE473`,
 1 AS `EXAM_VALUE474`,
 1 AS `EXAM_VALUE475`,
 1 AS `EXAM_VALUE476`,
 1 AS `EXAM_VALUE477`,
 1 AS `EXAM_VALUE478`,
 1 AS `EXAM_VALUE479`,
 1 AS `EXAM_VALUE480`,
 1 AS `EXAM_VALUE481`,
 1 AS `EXAM_VALUE482`,
 1 AS `EXAM_VALUE483`,
 1 AS `EXAM_VALUE484`,
 1 AS `EXAM_VALUE485`,
 1 AS `EXAM_VALUE486`,
 1 AS `EXAM_VALUE487`,
 1 AS `EXAM_VALUE488`,
 1 AS `EXAM_VALUE489`,
 1 AS `EXAM_VALUE490`,
 1 AS `EXAM_VALUE491`,
 1 AS `EXAM_VALUE492`,
 1 AS `EXAM_VALUE493`,
 1 AS `EXAM_VALUE494`,
 1 AS `EXAM_VALUE495`,
 1 AS `EXAM_VALUE496`,
 1 AS `EXAM_VALUE497`,
 1 AS `EXAM_VALUE498`,
 1 AS `EXAM_VALUE499`,
 1 AS `EXAM_VALUE500`,
 1 AS `EXAM_VALUE501`,
 1 AS `EXAM_VALUE502`,
 1 AS `EXAM_VALUE503`,
 1 AS `EXAM_VALUE504`,
 1 AS `EXAM_VALUE505`,
 1 AS `EXAM_VALUE506`,
 1 AS `EXAM_VALUE507`,
 1 AS `EXAM_VALUE508`,
 1 AS `EXAM_VALUE509`,
 1 AS `EXAM_VALUE510`,
 1 AS `EXAM_VALUE511`,
 1 AS `EXAM_VALUE512`,
 1 AS `EXAM_VALUE513`,
 1 AS `EXAM_VALUE514`,
 1 AS `EXAM_VALUE515`,
 1 AS `EXAM_VALUE516`,
 1 AS `EXAM_VALUE517`,
 1 AS `EXAM_VALUE518`,
 1 AS `EXAM_VALUE519`,
 1 AS `EXAM_VALUE520`,
 1 AS `EXAM_VALUE521`,
 1 AS `EXAM_VALUE522`,
 1 AS `EXAM_VALUE523`,
 1 AS `EXAM_VALUE524`,
 1 AS `EXAM_VALUE525`,
 1 AS `EXAM_VALUE526`,
 1 AS `EXAM_VALUE527`,
 1 AS `EXAM_VALUE528`,
 1 AS `EXAM_VALUE529`,
 1 AS `EXAM_VALUE530`,
 1 AS `EXAM_VALUE531`,
 1 AS `EXAM_VALUE532`,
 1 AS `EXAM_VALUE533`,
 1 AS `EXAM_VALUE534`,
 1 AS `EXAM_VALUE535`,
 1 AS `EXAM_VALUE536`,
 1 AS `EXAM_VALUE537`,
 1 AS `EXAM_VALUE538`,
 1 AS `EXAM_VALUE539`,
 1 AS `EXAM_VALUE540`,
 1 AS `EXAM_VALUE541`,
 1 AS `EXAM_VALUE542`,
 1 AS `EXAM_VALUE543`,
 1 AS `EXAM_VALUE544`,
 1 AS `EXAM_VALUE545`,
 1 AS `EXAM_VALUE546`,
 1 AS `EXAM_VALUE547`,
 1 AS `EXAM_VALUE548`,
 1 AS `EXAM_VALUE549`,
 1 AS `EXAM_VALUE550`,
 1 AS `EXAM_VALUE551`,
 1 AS `EXAM_VALUE552`,
 1 AS `EXAM_VALUE553`,
 1 AS `EXAM_VALUE554`,
 1 AS `EXAM_VALUE555`,
 1 AS `EXAM_VALUE556`,
 1 AS `EXAM_VALUE557`,
 1 AS `EXAM_VALUE558`,
 1 AS `EXAM_VALUE559`,
 1 AS `EXAM_VALUE560`,
 1 AS `EXAM_VALUE561`,
 1 AS `EXAM_VALUE562`,
 1 AS `EXAM_VALUE563`,
 1 AS `EXAM_VALUE564`,
 1 AS `EXAM_VALUE565`,
 1 AS `EXAM_VALUE566`,
 1 AS `EXAM_VALUE567`,
 1 AS `EXAM_VALUE568`,
 1 AS `EXAM_VALUE569`,
 1 AS `EXAM_VALUE570`,
 1 AS `EXAM_VALUE571`,
 1 AS `EXAM_VALUE572`,
 1 AS `EXAM_VALUE573`,
 1 AS `EXAM_VALUE574`,
 1 AS `EXAM_VALUE575`,
 1 AS `EXAM_VALUE576`,
 1 AS `EXAM_VALUE577`,
 1 AS `EXAM_VALUE578`,
 1 AS `EXAM_VALUE579`,
 1 AS `EXAM_VALUE580`,
 1 AS `EXAM_VALUE581`,
 1 AS `EXAM_VALUE582`,
 1 AS `EXAM_VALUE583`,
 1 AS `EXAM_VALUE584`,
 1 AS `EXAM_VALUE585`,
 1 AS `EXAM_VALUE586`,
 1 AS `EXAM_VALUE587`,
 1 AS `EXAM_VALUE588`,
 1 AS `EXAM_VALUE589`,
 1 AS `EXAM_VALUE590`,
 1 AS `EXAM_VALUE591`,
 1 AS `EXAM_VALUE592`,
 1 AS `EXAM_VALUE593`,
 1 AS `EXAM_VALUE594`,
 1 AS `EXAM_VALUE595`,
 1 AS `EXAM_VALUE596`,
 1 AS `EXAM_VALUE597`,
 1 AS `EXAM_VALUE598`,
 1 AS `EXAM_VALUE599`,
 1 AS `EXAM_VALUE600`,
 1 AS `EXAM_VALUE601`,
 1 AS `EXAM_VALUE602`,
 1 AS `EXAM_VALUE603`,
 1 AS `EXAM_VALUE604`,
 1 AS `EXAM_VALUE605`,
 1 AS `EXAM_VALUE606`,
 1 AS `EXAM_VALUE607`,
 1 AS `EXAM_VALUE608`,
 1 AS `EXAM_VALUE609`,
 1 AS `EXAM_VALUE610`,
 1 AS `EXAM_VALUE611`,
 1 AS `EXAM_VALUE612`,
 1 AS `EXAM_VALUE613`,
 1 AS `EXAM_VALUE614`,
 1 AS `EXAM_VALUE615`,
 1 AS `EXAM_VALUE616`,
 1 AS `EXAM_VALUE617`,
 1 AS `EXAM_VALUE618`,
 1 AS `EXAM_VALUE619`,
 1 AS `EXAM_VALUE620`,
 1 AS `EXAM_VALUE621`,
 1 AS `EXAM_VALUE622`,
 1 AS `EXAM_VALUE623`,
 1 AS `EXAM_VALUE624`,
 1 AS `EXAM_VALUE625`,
 1 AS `EXAM_VALUE626`,
 1 AS `EXAM_VALUE627`,
 1 AS `EXAM_VALUE628`,
 1 AS `EXAM_VALUE629`,
 1 AS `EXAM_VALUE630`,
 1 AS `EXAM_VALUE631`,
 1 AS `EXAM_VALUE632`,
 1 AS `EXAM_VALUE633`,
 1 AS `EXAM_VALUE634`,
 1 AS `EXAM_VALUE635`,
 1 AS `EXAM_VALUE636`,
 1 AS `EXAM_VALUE637`,
 1 AS `EXAM_VALUE638`,
 1 AS `EXAM_VALUE639`,
 1 AS `EXAM_VALUE640`,
 1 AS `EXAM_VALUE641`,
 1 AS `EXAM_VALUE642`,
 1 AS `EXAM_VALUE643`,
 1 AS `EXAM_VALUE644`,
 1 AS `EXAM_VALUE645`,
 1 AS `EXAM_VALUE646`,
 1 AS `EXAM_VALUE647`,
 1 AS `EXAM_VALUE648`,
 1 AS `EXAM_VALUE649`,
 1 AS `EXAM_VALUE650`,
 1 AS `EXAM_VALUE651`,
 1 AS `EXAM_VALUE652`,
 1 AS `EXAM_VALUE653`,
 1 AS `EXAM_VALUE654`,
 1 AS `EXAM_VALUE655`,
 1 AS `EXAM_VALUE656`,
 1 AS `EXAM_VALUE657`,
 1 AS `EXAM_VALUE658`,
 1 AS `EXAM_VALUE659`,
 1 AS `EXAM_VALUE660`,
 1 AS `EXAM_VALUE661`,
 1 AS `EXAM_VALUE662`,
 1 AS `EXAM_VALUE663`,
 1 AS `EXAM_VALUE664`,
 1 AS `EXAM_VALUE665`,
 1 AS `EXAM_VALUE666`,
 1 AS `EXAM_VALUE667`,
 1 AS `EXAM_VALUE668`,
 1 AS `EXAM_VALUE669`,
 1 AS `EXAM_VALUE670`,
 1 AS `EXAM_VALUE671`,
 1 AS `EXAM_VALUE672`,
 1 AS `EXAM_VALUE673`,
 1 AS `EXAM_VALUE674`,
 1 AS `EXAM_VALUE675`,
 1 AS `EXAM_VALUE676`,
 1 AS `EXAM_VALUE677`,
 1 AS `EXAM_VALUE678`,
 1 AS `EXAM_VALUE679`,
 1 AS `EXAM_VALUE680`,
 1 AS `EXAM_VALUE681`,
 1 AS `EXAM_VALUE682`,
 1 AS `EXAM_VALUE683`,
 1 AS `EXAM_VALUE684`,
 1 AS `EXAM_VALUE685`,
 1 AS `EXAM_VALUE686`,
 1 AS `EXAM_VALUE687`,
 1 AS `EXAM_VALUE688`,
 1 AS `EXAM_VALUE689`,
 1 AS `EXAM_VALUE690`,
 1 AS `EXAM_VALUE691`,
 1 AS `EXAM_VALUE692`,
 1 AS `EXAM_VALUE693`,
 1 AS `EXAM_VALUE694`,
 1 AS `EXAM_VALUE695`,
 1 AS `EXAM_VALUE696`,
 1 AS `EXAM_VALUE697`,
 1 AS `EXAM_VALUE698`,
 1 AS `EXAM_VALUE699`,
 1 AS `EXAM_VALUE700`,
 1 AS `EXAM_VALUE701`,
 1 AS `EXAM_VALUE702`,
 1 AS `EXAM_VALUE703`,
 1 AS `EXAM_VALUE704`,
 1 AS `EXAM_VALUE705`,
 1 AS `EXAM_VALUE706`,
 1 AS `EXAM_VALUE707`,
 1 AS `EXAM_VALUE708`,
 1 AS `EXAM_VALUE709`,
 1 AS `EXAM_VALUE710`,
 1 AS `EXAM_VALUE711`,
 1 AS `EXAM_VALUE712`,
 1 AS `EXAM_VALUE713`,
 1 AS `EXAM_VALUE714`,
 1 AS `EXAM_VALUE715`,
 1 AS `EXAM_VALUE716`,
 1 AS `EXAM_VALUE717`,
 1 AS `EXAM_VALUE718`,
 1 AS `EXAM_VALUE719`,
 1 AS `EXAM_VALUE720`,
 1 AS `EXAM_VALUE721`,
 1 AS `EXAM_VALUE722`,
 1 AS `EXAM_VALUE723`,
 1 AS `EXAM_VALUE724`,
 1 AS `EXAM_VALUE725`,
 1 AS `EXAM_VALUE726`,
 1 AS `EXAM_VALUE727`,
 1 AS `EXAM_VALUE728`,
 1 AS `EXAM_VALUE729`,
 1 AS `EXAM_VALUE730`,
 1 AS `EXAM_VALUE731`,
 1 AS `EXAM_VALUE732`,
 1 AS `EXAM_VALUE733`,
 1 AS `EXAM_VALUE734`,
 1 AS `EXAM_VALUE735`,
 1 AS `EXAM_VALUE736`,
 1 AS `EXAM_VALUE737`,
 1 AS `EXAM_VALUE738`,
 1 AS `EXAM_VALUE739`,
 1 AS `EXAM_VALUE740`,
 1 AS `EXAM_VALUE741`,
 1 AS `EXAM_VALUE742`,
 1 AS `EXAM_VALUE743`,
 1 AS `EXAM_VALUE744`,
 1 AS `EXAM_VALUE745`,
 1 AS `EXAM_VALUE746`,
 1 AS `EXAM_VALUE747`,
 1 AS `EXAM_VALUE748`,
 1 AS `EXAM_VALUE749`,
 1 AS `EXAM_VALUE750`,
 1 AS `EXAM_VALUE751`,
 1 AS `EXAM_VALUE752`,
 1 AS `EXAM_VALUE753`,
 1 AS `EXAM_VALUE754`,
 1 AS `EXAM_VALUE755`,
 1 AS `EXAM_VALUE756`,
 1 AS `EXAM_VALUE757`,
 1 AS `EXAM_VALUE758`,
 1 AS `EXAM_VALUE759`,
 1 AS `EXAM_VALUE760`,
 1 AS `EXAM_VALUE761`,
 1 AS `EXAM_VALUE762`,
 1 AS `EXAM_VALUE763`,
 1 AS `EXAM_VALUE764`,
 1 AS `EXAM_VALUE765`,
 1 AS `EXAM_VALUE766`,
 1 AS `EXAM_VALUE767`,
 1 AS `EXAM_VALUE768`,
 1 AS `EXAM_VALUE769`,
 1 AS `EXAM_VALUE770`,
 1 AS `EXAM_VALUE771`,
 1 AS `EXAM_VALUE772`,
 1 AS `EXAM_VALUE773`,
 1 AS `EXAM_VALUE774`,
 1 AS `EXAM_VALUE775`,
 1 AS `EXAM_VALUE776`,
 1 AS `EXAM_VALUE777`,
 1 AS `EXAM_VALUE778`,
 1 AS `EXAM_VALUE779`,
 1 AS `EXAM_VALUE780`,
 1 AS `EXAM_VALUE781`,
 1 AS `EXAM_VALUE782`,
 1 AS `EXAM_VALUE783`,
 1 AS `EXAM_VALUE784`,
 1 AS `EXAM_VALUE785`,
 1 AS `EXAM_VALUE786`,
 1 AS `EXAM_VALUE787`,
 1 AS `EXAM_VALUE788`,
 1 AS `EXAM_VALUE789`,
 1 AS `EXAM_VALUE790`,
 1 AS `EXAM_VALUE791`,
 1 AS `EXAM_VALUE792`,
 1 AS `EXAM_VALUE793`,
 1 AS `EXAM_VALUE794`,
 1 AS `EXAM_VALUE795`,
 1 AS `EXAM_VALUE796`,
 1 AS `EXAM_VALUE797`,
 1 AS `EXAM_VALUE798`,
 1 AS `EXAM_VALUE799`,
 1 AS `EXAM_VALUE800`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dlvr_exam_fims`
--

DROP TABLE IF EXISTS `v_dlvr_exam_fims`;
/*!50001 DROP VIEW IF EXISTS `v_dlvr_exam_fims`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dlvr_exam_fims` AS SELECT 
 1 AS `werks`,
 1 AS `ppay_dd`,
 1 AS `mat_cd`,
 1 AS `ntprsr_reg_no`,
 1 AS `req_qt`,
 1 AS `reg_id`,
 1 AS `dlvr_exam_req_no`,
 1 AS `code_name`,
 1 AS `end_date`,
 1 AS `ppay_cont_info_seq`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dlvr_rec_spec`
--

DROP TABLE IF EXISTS `v_dlvr_rec_spec`;
/*!50001 DROP VIEW IF EXISTS `v_dlvr_rec_spec`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dlvr_rec_spec` AS SELECT 
 1 AS `DLVR_EXAM_REQ_NO`,
 1 AS `ATCL_CODE`,
 1 AS `RECORD_CODE_1`,
 1 AS `RECORD_VER_1`,
 1 AS `DLVR_REC_NO`,
 1 AS `EXAM_VALUE_SNO`,
 1 AS `RECORD_CODE`,
 1 AS `RECORD_VER`,
 1 AS `LIST_ID`,
 1 AS `DISPLAY_NO`,
 1 AS `L1`,
 1 AS `L2`,
 1 AS `L3`,
 1 AS `L4`,
 1 AS `L4_1`,
 1 AS `L4_2`,
 1 AS `L5`,
 1 AS `L6`,
 1 AS `L7`,
 1 AS `L8`,
 1 AS `CHO_YN`,
 1 AS `EVAL_YN`,
 1 AS `LIST_NM`,
 1 AS `UNT`,
 1 AS `USL`,
 1 AS `LSL`,
 1 AS `NUM_YN`,
 1 AS `OK_YN`,
 1 AS `USE_YN`,
 1 AS `REM`,
 1 AS `REGR_NM`,
 1 AS `REGR_ID`,
 1 AS `REG_YMD`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_erp_category`
--

DROP TABLE IF EXISTS `v_erp_category`;
/*!50001 DROP VIEW IF EXISTS `v_erp_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_erp_category` AS SELECT 
 1 AS `CATEGORY_CODE`,
 1 AS `CLASS1`,
 1 AS `CLASS2`,
 1 AS `CLASS3`,
 1 AS `CLASS4`,
 1 AS `CATEGORY_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_fims_as`
--

DROP TABLE IF EXISTS `v_fims_as`;
/*!50001 DROP VIEW IF EXISTS `v_fims_as`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_fims_as` AS SELECT 
 1 AS `FIMS_NO`,
 1 AS `CMP_CODE`,
 1 AS `STATE`,
 1 AS `DEAL_GBN`,
 1 AS `FIRST_SHIP_YMD`,
 1 AS `FCTY_CG_YMD`,
 1 AS `TMP_EQI_YMD`,
 1 AS `ACTER_NM`,
 1 AS `ACTER_TELNO`,
 1 AS `AS_END_YMD`,
 1 AS `LAST_CORT_NM`,
 1 AS `LAST_CORT_ID`,
 1 AS `LAST_MOD_YMD`,
 1 AS `ERR_CONT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_fims_as_detail`
--

DROP TABLE IF EXISTS `v_fims_as_detail`;
/*!50001 DROP VIEW IF EXISTS `v_fims_as_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_fims_as_detail` AS SELECT 
 1 AS `FIMS_NO`,
 1 AS `SNO`,
 1 AS `FAULT_CODE`,
 1 AS `FAULT_NM`,
 1 AS `AS_CODE`,
 1 AS `AS_NM`,
 1 AS `AS_DETAIL`,
 1 AS `REGR_NM`,
 1 AS `REGR_ID`,
 1 AS `REG_YMD`,
 1 AS `LAST_CORT_NM`,
 1 AS `LAST_CORT_ID`,
 1 AS `LAST_MOD_YMD`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ppay_auto_cert_target`
--

DROP TABLE IF EXISTS `v_ppay_auto_cert_target`;
/*!50001 DROP VIEW IF EXISTS `v_ppay_auto_cert_target`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ppay_auto_cert_target` AS SELECT 
 1 AS `ZINSP_NO`,
 1 AS `EBELN`,
 1 AS `ZDELIV_DATE`,
 1 AS `WERKS`,
 1 AS `ZINSP_REQDATE`,
 1 AS `ZRESP_EMP`,
 1 AS `ZINSP_DATE`,
 1 AS `ZCONT_EMP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stat_dlvr_cnt`
--

DROP TABLE IF EXISTS `v_stat_dlvr_cnt`;
/*!50001 DROP VIEW IF EXISTS `v_stat_dlvr_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stat_dlvr_cnt` AS SELECT 
 1 AS `DLVR_EXAM_REQ_NO`,
 1 AS `ATCL_CODE`,
 1 AS `CTR_NO`,
 1 AS `PLANT_CODE`,
 1 AS `AFE_CHASU`,
 1 AS `CMP_CODE`,
 1 AS `DLVDT_YMD`,
 1 AS `REQ_YMD`,
 1 AS `EXP_ISP_YMD`,
 1 AS `ISP_ENDDT`,
 1 AS `IVT_GBN`,
 1 AS `ISP_GBN`,
 1 AS `UNT`,
 1 AS `PPAY_QT`,
 1 AS `REQ_QT`,
 1 AS `ELIG_YN`,
 1 AS `APR_REQ_QT`,
 1 AS `APR_QT`,
 1 AS `DLVR_REC_NO`,
 1 AS `MAIN_ISP_ATCL_NM`,
 1 AS `SRC_CMP_CODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'qas_dev'
--
/*!50003 DROP FUNCTION IF EXISTS `FC_CREATE_NO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_CREATE_NO`(StrAbbr varchar(2), DtDate datetime) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN	
	DECLARE StrDate VARCHAR(8);
	SET StrDate = DATE_FORMAT(DtDate,'%Y%m%d');

    RETURN
        CASE StrAbbr
            WHEN 'DM'  -- 납품검사
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(DLVR_EXAM_REQ_NO,3)),3) FROM T_DLVR_EXAM_REQ  WHERE DLVR_EXAM_REQ_NO LIKE CONCAT('DM', StrDate, '%')))			
            WHEN 'QL'  -- 인증시험
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(CERT_EXAM_NO,3)),3) FROM T_CERT_EXAM_REQ WHERE CERT_EXAM_NO LIKE CONCAT('QL', StrDate, '%')))	
            WHEN 'EA'  -- ERP승인	
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(APR_REQ_NO,3)),3) FROM T_DLVR_ERP_REQ WHERE  APR_REQ_NO LIKE CONCAT('EA', StrDate, '%')))
            WHEN 'RE'  -- 성적양식코드
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(RECORD_CODE,3)),3) FROM T_DLVR_REC_MNG WHERE RECORD_CODE LIKE CONCAT('RE', StrDate, '%')))
            WHEN 'GR'  -- 필증발급
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(CERT_ISSUE_NO,3)),3) FROM T_DLVR_CERT_ISU WHERE CERT_ISSUE_NO LIKE CONCAT('GR', StrDate, '%')))	
            WHEN 'FM'  -- AS요청(FIMS)
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(FIMS_NO,3)),3) FROM T_LIN_FIMS_AS_INFO WHERE FIMS_NO LIKE CONCAT('FM', StrDate, '%')))
            WHEN 'PP'  -- 선납신청
            	THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(PPAY_CONT_INFO_SEQ,3)),3) FROM T_DLVR_PPAY_CONT WHERE PPAY_CONT_INFO_SEQ LIKE CONCAT('PP', StrDate, '%')))	
            WHEN 'CP'  -- 업체코드
                THEN CONCAT(StrAbbr, (SELECT FC_NUMBERING(MAX(RIGHT(CMP_CODE,6)),6) FROM T_CMM_CMP ))
            WHEN 'TE'  -- 임시물품코드	
                THEN CONCAT(StrAbbr, (SELECT FC_NUMBERING(MAX(RIGHT(TMP_ATCL_CODE,8)),8) FROM T_DLVR_TEMP_ITEM ))
	    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_ERP_TO_QAS_CATEGORY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_ERP_TO_QAS_CATEGORY`(ERP_CATEGORY varchar(8)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN

    RETURN CASE

               WHEN ERP_CATEGORY LIKE '200102%' THEN '0100000000' -- 교환기

               WHEN ERP_CATEGORY = '20010101' THEN '0100000000' -- 교환기

               WHEN ERP_CATEGORY LIKE '200103%' THEN '0200000000' -- 기지국

               WHEN ERP_CATEGORY = '20010102' THEN '0200000000' -- 기지국

               WHEN ERP_CATEGORY LIKE '200703%' THEN '0500000000' -- 부대장비

               WHEN ERP_CATEGORY LIKE '200708%' THEN '0500000000' -- 부대장비

               WHEN ERP_CATEGORY LIKE '2003%' THEN '0600000000' -- 전송장비

               WHEN ERP_CATEGORY LIKE '2002%' THEN '0700000000' -- 중계기

               WHEN ERP_CATEGORY LIKE '1009%' THEN '0800000000' -- IT

               WHEN ERP_CATEGORY LIKE '1010%' THEN '0800000000' -- IT

               ELSE '0000000000' -- 미분류

        END;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_FORMAT_WRKRREGNO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_FORMAT_WRKRREGNO`(WrkrRegNo char(10)) RETURNS char(12) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN

    SET @trimmed = TRIM(WrkrRegNo);



    RETURN CONCAT(substring(@trimmed,1,3),'-',substring(@trimmed,4,2),'-',substring(@trimmed,6,5));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_GET_ATCLCATCD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_GET_ATCLCATCD`(atclCode varchar(18)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN (
        SELECT CONCAT(SUBSTRING(ATCL_CAT_CODE, 1, 2), '00000000')
		FROM T_CMM_ITEM_DTL 
		WHERE ATCL_CODE = atclCode
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_GET_DLVR_EXAM_STATE_GROUP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_GET_DLVR_EXAM_STATE_GROUP`(DLVR_EXAM_STATE_CODE varchar(6)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN

    RETURN

        CASE SUBSTR(DLVR_EXAM_STATE_CODE,1,5)

            WHEN 'C2101'

                THEN CASE DLVR_EXAM_STATE_CODE

                        WHEN 'C21011' THEN '반려' -- 신청서작성중(반려)

                        WHEN 'C21012' THEN '불합격' -- 신청서작성중(시정조치)

                    END

            WHEN 'C2102' THEN '신청'

            WHEN 'C2103' THEN '접수' -- 신청서접수

            WHEN 'C2104' THEN '접수' -- 시험데이터등록

            WHEN 'C2105' THEN '합격'

            WHEN 'C2106' THEN '불합격'

    END;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_GET_IF_TARGET_MONTH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_GET_IF_TARGET_MONTH`(targetMonth char(2), yyyymm varchar(8), val decimal) RETURNS decimal(10,0)
BEGIN
    RETURN IF(SUBSTRING(yyyymm, 5, 2) = targetMonth, val, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_GET_NPR_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_GET_NPR_NAME`(SEQ varchar(1)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN CASE SEQ
        when 9 then '12개월납품수량'
        WHEN 8 then '월납품수량'
        when 7 then '월AS수량'
        WHEN 6 then 'A/S율(12개월,PPM)'
    end;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_GET_TOT_NPR_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_GET_TOT_NPR_NAME`(SEQ varchar(1)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN CASE SEQ
        when 9 then '총납품수량'
        WHEN 8 then '월납품수량'
        when 7 then '월AS수량'
        WHEN 6 then 'A/S율(전체,PPM)'
    end;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_IS_VALID_WRKRREGNO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_IS_VALID_WRKRREGNO`(WRKR_REG_NO varchar(50)) RETURNS tinyint(1)
    COMMENT '사업자번호 유효성 확인'
BEGIN
    DECLARE _NO VARCHAR(10);

    IF WRKR_REG_NO IS NULL THEN RETURN FALSE; END IF;

    SET _NO = REGEXP_REPLACE(`WRKR_REG_NO`, '[^0-9]', '');

    IF LENGTH(_NO) != 10 THEN RETURN FALSE;
    ELSE
        RETURN RIGHT(10 - 
             (SUBSTR(_NO, 1, 1) * 1
            + SUBSTR(_NO, 2, 1) * 3
            + SUBSTR(_NO, 3, 1) * 7
            + SUBSTR(_NO, 4, 1) * 1
            + SUBSTR(_NO, 5, 1) * 3
            + SUBSTR(_NO, 6, 1) * 7
            + SUBSTR(_NO, 7, 1) * 1
            + SUBSTR(_NO, 8, 1) * 3
            + SUBSTR(_NO, 9, 1) * 5
            + FLOOR((SUBSTR(_NO, 9, 1) * 5) / 10)) % 10, 1) = RIGHT(_NO, 1);

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_NUMBERING` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_NUMBERING`(prevValue varchar(30), len int) RETURNS varchar(30) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN LPAD(IFNULL(CAST(SUBSTRING(prevValue, -len) AS DECIMAL), 0) + 1, len, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_TO_FULL_ATCL_CODE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_bin */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_TO_FULL_ATCL_CODE`(

	`ATCL_CODE` VARCHAR(18)

) RETURNS varchar(18) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN

	RETURN LPAD(REPLACE(`ATCL_CODE`,'Z','1'), 18, '0');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FC_YMD_MONTH_BEFORE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FC_YMD_MONTH_BEFORE`(YMD varchar(8), `Interval` int) RETURNS varchar(8) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN		
	RETURN DATE_FORMAT(STR_TO_DATE(`YMD`, '%Y%m%d') - INTERVAL `Interval` MONTH, '%Y%m%d');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_DELETE_OUTDATED_LOGS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_DELETE_OUTDATED_LOGS`()
    COMMENT '보관 기간이 지난 로그 삭제'
BEGIN
    SET @message := '';
    SET @sum := 0;
    SET @startDatetime = NOW();

    DELETE FROM t_log_api WHERE LOG_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @api;
    IF @api > 0 THEN
        SET @message := CONCAT(@api, ' rows from t_log_api');
        SET @sum := @sum + @api;
    END IF;

    DELETE FROM t_log_mail_send WHERE SEND_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @mailSend;
    IF @mailSend > 0 THEN
        SET @message := CONCAT(@message, IF(@sum > 0, ', ',''), @mailSend, ' rows from t_log_mail_send');
        SET @sum := @sum + @mailSend;
    END IF;

    DELETE FROM t_log_page WHERE ACS_DATE < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @page;
    IF @page > 0 THEN
        SET @message := CONCAT(@message, IF(@sum > 0, ', ',''), @page, ' rows from t_log_page');
        SET @sum := @sum + @page;
    END IF;

    DELETE FROM t_log_system_job WHERE END_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @systemJob;
    IF @systemJob > 0 THEN
        SET @message := CONCAT(@message, IF(@sum > 0, ', ',''), @systemJob, ' rows from t_log_system_job');
        SET @sum := @sum + @systemJob;
    END IF;

    -- DELETE FROM t_log_z_mi_qeas_interface WHERE LOG_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    
    IF @sum > 0 THEN
        SET @message := CONCAT('Deleted ', @message);
    ELSE 
        SET @message := '삭제할 로그가 없습니다.';
    END IF;

    CALL SP_INSERT_SYSTEM_JOB_LOG(
            'SWEEP_LOGS'
        , '{"_comment": "보관 기간이 지난 로그 삭제","query": "CALL SC_DELETE_OUTDATED_LOGS();"}'
        , 'SUCCESS'
        , @message
        , 'procedure SWEEP_LOGS'
        , @startDatetime
         );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_ERP_CONT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_ERP_CONT`()
    COMMENT '계약Data 업로드'
BEGIN
    START TRANSACTION;

    UPDATE T_DLVR_CONT_TMP
    SET eindt = REPLACE(eindt,'-','');

    DELETE T_DLVR_CONT
    FROM T_DLVR_CONT 
         LEFT JOIN
             (SELECT DISTINCT CDT.ctr_no, CDT.eindt, CDT.werks
              FROM v_dlvr_cont_tmp CDT
                   LEFT JOIN t_dlvr_exam_req DER
                         on CDT.ctr_no = DER.ctr_no
                             AND CDT.eindt = DER.DLVDT_YMD
                             AND CDT.WERKS = DER.PLANT_CODE
              WHERE DER.CTR_NO IS NULL -- 납품검사신청이 시작하지 않았거나
                 OR DER.DLVR_EXAM_STATE_CODE < 'C21030' -- 상태가 '신청서접수' 이전
             ) B
                ON T_DLVR_CONT.ctr_no = B.ctr_no AND T_DLVR_CONT.DLVDT_YMD = b.EINDT AND T_DLVR_CONT.PLANT_CODE = b.WERKS
    WHERE B.ctr_no IS NOT NULL;

    /* 계약테이블 입력 */
    INSERT INTO T_DLVR_CONT
    (ctr_no, dlvdt_ymd, plant_code, sno, delivn, delivp, ebeln, ebelp, ctr_type, zztitl, ctr_ymd, ctr_stdt, ctr_enddt, afnam, ktext, orderman,
     lifnr, spy_cmp_nm, wers, zzm001, zzm002, zzm003, zzm004, zzx001, zzx002, zzx003, zzprd1, MATKL, atcl_code,
     atcl_code_nm, menge, meins, netpr, price, idnlf, banfn, aufnr, ktext1, knttp, knttx, plant_nm, reg_ymd, ent_ymd,
     DLVR_OD_ENO, DLVR_OD_NM)
    SELECT
     ctr_no, eindt, werks, sno, delivn, delivp, ebeln, ebelp, bsart, zztitl, REPLACE(ZZPODT,'-',''), REPLACE(kdatb,'-',''), REPLACE(kdate,'-',''), afnam, ktext, orderman,
     lifnr, name1, wers, zzm001, zzm002, zzm003, zzm004, zzx001, zzx002, zzx003,zzprd1,MATKL,matnr,
     txz01, CAST(CAST(menge AS FLOAT(24)) AS DECIMAL),meins,netpr,price,idnlf,banfn,aufnr,ktext1,knttp,knttx,name11,REPLACE(AEDAT,'-',''),DATE_FORMAT(NOW(), '%Y%m%d'),
     UNAME,NAME
    FROM v_dlvr_cont_tmp DCT
    WHERE NOT EXISTS (SELECT *
                      FROM T_DLVR_CONT dc
                      WHERE dct.ctr_no = dc.ctr_no AND dct.eindt = dc.dlvdt_ymd AND dct.werks = dc.plant_code);

    INSERT INTO t_lin_erp_new_item (erp_code_seri, erpatcl_code, atcl_nm, atcl_cat_code, reg_ymd)
    SELECT DISTINCT matkl
                  , atcl_code
                  , atcl_code_nm
                  , FC_ERP_TO_QAS_CATEGORY(matkl)
                  , DATE_FORMAT(NOW(), '%Y%m%d')
    FROM t_dlvr_cont
    WHERE NOT EXISTS (select * from t_cmm_item_dtl where t_dlvr_cont.atcl_code = t_cmm_item_dtl.atcl_code)
      AND NOT EXISTS (select * from t_lin_erp_new_item where t_dlvr_cont.atcl_code = t_lin_erp_new_item.erpatcl_code)
      AND dlvdt_ymd >= '20050101';
    -- NOTE: 선납 신청시 등록된 물품만 사용하므로 아래 로직은 삭제
    -- 선납 계약 생성후 선납 신청 진행중 신청서를 삭제했을 때, 임시 물품이 t_cmm_item_dtl에서 삭제되는데, 해당 물품이 t_lin_erp_new_item에 임의로 등록되는 로직이다.
    -- 이렇게 임의로 추가된 물품을 처리하는 로직이 없으므로 아래 로직 삭제
    /*UNION ALL
    SELECT DISTINCT ''
         , mat_cd
         , mat_nm
         , ''
         , DATE_FORMAT(NOW(), '%Y%m%d')
    FROM T_DLVR_PPAY_CONT
    WHERE NOT EXISTS (select * from t_cmm_item_dtl where T_DLVR_PPAY_CONT.mat_cd = t_cmm_item_dtl.atcl_code)
      AND NOT EXISTS (select * from t_lin_erp_new_item where T_DLVR_PPAY_CONT.mat_cd = t_lin_erp_new_item.erpatcl_code);*/


    -- Step 2: erp_exam_auto_insert
    INSERT INTO T_AUTO_DLVR_CONT (DLVR_EXAM_REQ_NO, CTR_NO, DLVDT_YMD, PLANT_CODE, CHR, REQ_YMD, ISP_STDT, LIFNR, CMP_CODE)
    WITH NO_AUT_DLVR AS -- T_AUTO_DLVR_CONT에 등록되지 않은 CONT
             (SELECT DC.ATCL_CODE
                   , DC.CTR_NO
                   , DC.DLVDT_YMD
                   , DC.PLANT_CODE
                   , DC.LIFNR
                   , SUM(CONVERT(MENGE, DECIMAL)) AS MENGE
              FROM T_DLVR_CONT DC
                       LEFT JOIN T_AUTO_DLVR_CONT ADC
                                 ON DC.CTR_NO = ADC.CTR_NO AND DC.DLVDT_YMD = ADC.DLVDT_YMD AND
                                    DC.PLANT_CODE = ADC.PLANT_CODE
              WHERE ADC.CTR_NO IS NULL
                AND DC.DLVDT_YMD >= DATE_FORMAT(NOW() - INTERVAL 60 DAY, '%Y%m%d')
              GROUP BY ATCL_CODE, CTR_NO, DLVDT_YMD, PLANT_CODE, LIFNR),
         EXAM_EXCEPT AS -- 납품 검사 예외 품목으로 등록된 CONT
             (SELECT DC.ATCL_CODE
                   , DC.CTR_NO
                   , DC.DLVDT_YMD
                   , DC.PLANT_CODE
                   , DC.LIFNR
                   , SUM(CONVERT(MENGE, DECIMAL)) AS ITEM_CNT
              FROM T_DLVR_CONT DC
                       LEFT JOIN T_CMM_ITEM_DTL CID
                                 ON DC.ATCL_CODE = CID.ATCL_CODE
              WHERE CID.EXAM_EXCEPT_YN = 'Y'
                AND DLVDT_YMD >= DATE_FORMAT(NOW() - INTERVAL 60 DAY, '%Y%m%d')
              GROUP BY DC.ATCL_CODE, DC.CTR_NO, DC.DLVDT_YMD, DC.PLANT_CODE, DC.LIFNR)
    SELECT CONCAT('AU', DATE_FORMAT(NOW(), '%Y%m%d'), '000')                                               as DLVR_EXAM_REQ_NO
         , T9.CTR_NO
         , T9.DLVDT_YMD
         , T9.PLANT_CODE
         , IFNULL((SELECT last_cort_id
                   FROM t_cmm_item_dtl
                   WHERE last_cort_id not like 'q%'
                     AND last_cort_id not like '0%'
                     AND atcl_code in (SELECT min(atcl_code)
                                       FROM T_DLVR_CONT
                                       WHERE T_DLVR_CONT.CTR_NO = T9.CTR_NO
                                         AND T_DLVR_CONT.DLVDT_YMD = T9.DLVDT_YMD
                                         AND T_DLVR_CONT.PLANT_CODE = T9.PLANT_CODE)), '1106537')          as CHR
         , DATE_FORMAT(NOW(), '%Y%m%d')                                                                    as REQ_YMD
         , DATE_FORMAT(NOW(), '%Y%m%d')                                                                    as ISP_STDT
         , LIFNR
         , (select cmp_code from t_cmm_cmp where wrkr_reg_no = LIFNR and IFNULL(oem_yn, '') = 'N' LIMIT 1) as CMP_CODE
    FROM (SELECT A.CTR_NO
               , A.DLVDT_YMD
               , A.PLANT_CODE
               , A.LIFNR
               , MIN(IFNULL(B.ITEM_CNT, 0) - A.MENGE) AS RESULT
          FROM NO_AUT_DLVR A
                   LEFT JOIN EXAM_EXCEPT B
                             ON A.ATCL_CODE = B.ATCL_CODE
                                 AND A.CTR_NO = B.CTR_NO
                                 AND A.DLVDT_YMD = B.DLVDT_YMD
                                 AND A.PLANT_CODE = B.PLANT_CODE

          GROUP BY A.CTR_NO, A.DLVDT_YMD, A.PLANT_CODE, A.LIFNR
          HAVING RESULT >= 0) T9;

    DELETE
    FROM t_dlvr_cont DC
    WHERE atcl_code IN (SELECT atcl_code FROM t_cmm_item_dtl WHERE exam_except_yn = 'Y')
      AND CONCAT(ctr_no, plant_code, dlvdt_ymd) NOT IN
        (
        SELECT DISTINCT CONCAT(ctr_no, plant_code, dlvdt_ymd)
        FROM t_dlvr_exam_req
        )
      AND CONCAT(ctr_no, plant_code, dlvdt_ymd) NOT IN
        (
        SELECT DISTINCT CONCAT(ctr_no, plant_code, dlvdt_ymd)
        FROM T_AUTO_DLVR_CONT
        )
      AND DC.dlvdt_ymd >= '20110101';

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_ERP_NEW_ITEM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_ERP_NEW_ITEM`()
    COMMENT '신규 물품코드 등록'
BEGIN
    START TRANSACTION;

    -- 원본 데이터 저장
    DELETE
    FROM t_lin_erp_item_raw raw
    WHERE EXISTS (SELECT *
                  FROM t_lin_erp_item_tmp temp
                  where temp.MATNR = raw.MATNR);

    INSERT INTO t_lin_erp_item_raw
    SELECT *
    FROM t_lin_erp_item_tmp temp;

    -- 새로운 물품 카테고리가 있으면 t_erp_category에 추가
    INSERT INTO t_erp_category
    WITH CTE AS (
        SELECT DISTINCT RPAD(ZL_ITEM, 8, '0') AS CATEGORY_CODE, ZL_TEXT AS CLASS1, NULL AS CLASS2, NULL AS CLASS3, NULL CLASS4 from t_lin_erp_item_tmp
        UNION
        SELECT DISTINCT RPAD(ZM_ITEM, 8, '0'), ZL_TEXT, ZM_TEXT, NULL, NULL from t_lin_erp_item_tmp
        UNION
        SELECT DISTINCT RPAD(ZSG_ITEM, 8, '0'), ZL_TEXT, ZM_TEXT, ZSG_TEXT, NULL from t_lin_erp_item_tmp
        UNION
        SELECT DISTINCT ZS_ITEM, ZL_TEXT, ZM_TEXT, ZSG_TEXT, ZS_TEXT from t_lin_erp_item_tmp
    )
    SELECT CTE.* FROM CTE
        LEFT JOIN t_erp_category ec
            ON ec.CATEGORY_CODE = CTE.CATEGORY_CODE
    WHERE ec.CATEGORY_CODE IS NULL;


    -- t_lin_erp_new_item에 추가
    INSERT INTO t_lin_erp_new_item
    ( erp_code_seri
    , erpatcl_code
    , atcl_nm
    , atcl_cat_code
    , atcl_cat_nm
    , reg_ymd
    , reg_empno
    , reg_hname)
    SELECT A.MATKL -- 자재 그룹
         , A.MATNR -- 자재번호
         , A.MAKTX -- 자재내역
         , C.ATCL_CAT_CODE
         , C.ATCL_CAT_NM
         , DATE_FORMAT(A.ERSDA, '%Y%m%d')
         , UNAME -- 사용자
         , (SELECT hname FROM INF_PERSON_INFO_RCV WHERE empno = UNAME)
    FROM t_lin_erp_item_tmp A
        LEFT JOIN t_cmm_item_class C
            ON C.ATCL_CAT_CODE = FC_ERP_TO_QAS_CATEGORY(ZS_ITEM)
    WHERE MATNR NOT IN (SELECT atcl_code FROM t_cmm_item_dtl UNION ALL SELECT erpatcl_code FROM t_lin_erp_new_item);

    -- 계약데이터를 통해 먼저 입력된 경우라면 카테고리 분류가 제대로 안 되었을 수 있다. t_lin_erp_item_tmp에서 정보를 확인할 수 있으면 업데이트
    UPDATE t_lin_erp_new_item eni JOIN t_lin_erp_item_tmp eit ON eni.ERPATCL_CODE = eit.MATNR
    SET eni.ATCL_CAT_CODE = FC_ERP_TO_QAS_CATEGORY(eit.ZS_ITEM)
    WHERE eni.ATCL_CAT_CODE = '0000000000'
      AND FC_ERP_TO_QAS_CATEGORY(eit.ZS_ITEM) != '0000000000';

    -- 물품검사 제외품목
    INSERT INTO t_cmm_item_dtl
    ( atcl_code
    , atcl_cat_code
    , atcl_nm
    , exam_except_yn
    , use_yn
    , regr_nm
    , regr_id
    , last_cort_nm
    , last_cort_id
    , last_mod_ymd
    , erp_cat_code)
    SELECT erpatcl_code,
           '0800000000',
           atcl_nm,
           'Y',
           'Y',
           '최성필',
           '1106374',
           '최성필',
           '1106374',
           DATE_FORMAT(NOW(), '%Y%m%d'),
           erp_code_seri
    FROM t_lin_erp_new_item a
    WHERE (LOWER(atcl_nm) REGEXP '^s/w|설치비|notebook|모니터|monitor|install|upgrde|desktop|설명서|manual|설치|구축|공사' OR
           erpatcl_code like '000000002%')
      AND ifnull(confm_yn, '') = ''
      AND erpatcl_code not in (select atcl_code from t_cmm_item_dtl);

    UPDATE t_lin_erp_new_item
    SET confm_yn ='Y'
    WHERE (LOWER(atcl_nm) REGEXP '^s/w|설치비|notebook|모니터|monitor|install|upgrde|desktop|설명서|manual|설치|구축|공사' OR
           erpatcl_code like '000000002%')
      AND ifnull(confm_yn, '') = '';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_FIMS_AS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_FIMS_AS`()
    COMMENT 'FIMS AS 데이터 입력'
BEGIN

    DROP TEMPORARY TABLE IF EXISTS TEMP_LIN_FIMS_AS;
    CREATE TEMPORARY TABLE TEMP_LIN_FIMS_AS AS
    SELECT FIMS_NO
         , ATCL_CODE
         , SKT_SERI_NO
         , PRD_CMP_SERI_NO
         , IFNULL(b.cmp_code, a.CMP_CODE)                        AS CMP_CODE
         , AS_REQ_WRKR_REQ_NO
         , AS_REQ_CMP_NM
         , AS_REQ_AREA_CODE
         , LOCAL_NM
         , AS_REQ_YMD
         , AS_REQ_NAME
         , AS_REQ_TEL
         , TROUB_CNTS
         , IF(b.CMP_CODE IS NULL, 'C23050', `STATE`)             AS STATE
         , IF(b.CMP_CODE IS NULL, '공급자 사업자번호가 존재하지 않습니다.', NULL) AS ERR_CONT
    FROM T_LIN_FIMS_AS_TMP a
             LEFT JOIN(SELECT wrkr_reg_no, MAX(CMP_CODE) AS CMP_CODE
                       FROM t_cmm_cmp
                       WHERE oem_yn = 'N'
                         AND apr_yn = 'Y'
                         AND use_yn = 'Y'
                       GROUP BY wrkr_reg_no) b
                      on a.CMP_CODE = b.wrkr_reg_no;


    DELETE
    FROM TEMP_LIN_FIMS_AS
    WHERE fims_no IN (SELECT fims_no FROM T_LIN_FIMS_AS_INFO WHERE STATE IN ('C23030', 'C23040'));

    DELETE
    FROM T_LIN_FIMS_AS_INFO
    WHERE fims_no IN (SELECT fims_no FROM TEMP_LIN_FIMS_AS);

    INSERT INTO T_LIN_FIMS_AS_INFO
    ( FIMS_NO
    , ATCL_CAT_CODE
    , ATCL_CODE
    , SKT_SERI_NO
    , PRD_CMP_SERI_NO
    , CMP_CODE
    , AS_REQ_WRKR_REQ_NO
    , AS_REQ_CMP_NM
    , AS_REQ_AREA_CODE
    , LOCAL_NM
    , AS_REQ_YMD
    , AS_REQ_NAME
    , AS_REQ_TEL
    , TROUB_CNTS
    , STATE
    , REG_YMD)
    SELECT FIMS_NO
         , (select atcl_cat_code from t_cmm_item_dtl where t_cmm_item_dtl.atcl_code = TEMP_LIN_FIMS_AS.ATCL_CODE)
         , ATCL_CODE
         , SKT_SERI_NO
         , PRD_CMP_SERI_NO
         , CMP_CODE
         , AS_REQ_WRKR_REQ_NO
         , AS_REQ_CMP_NM
         , AS_REQ_AREA_CODE
         , LOCAL_NM
         , AS_REQ_YMD
         , AS_REQ_NAME
         , AS_REQ_TEL
         , TROUB_CNTS
         , replace(STATE, '#', '')      as state
         , DATE_FORMAT(NOW(), '%Y%m%d') as REG_YMD
    FROM TEMP_LIN_FIMS_AS;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_FIMS_CONT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_FIMS_CONT`()
    COMMENT 'FIMS 계약데이터 입력'
BEGIN

    DROP TEMPORARY TABLE IF EXISTS TEMP_LIN_FIMS_CONT;
    CREATE TEMPORARY TABLE TEMP_LIN_FIMS_CONT AS
    SELECT a.EWH_PLN_DD
         , a.PPAY_DD
         , a.AREA_NO
         , max(a.AREA_NM)                                                                         AS AREA_NM
         , CONCAT('0000000', a.MAT_CD)                                                            AS MAT_CD
         , a.MAT_NM
         , sum(a.PPAY_CNT)                                                                        AS PPAY_CNT
         , C.WRKR_REG_NO                                                                          AS DL_REG_NUM
         , max(a.DL_CORP_NM)                                                                      AS DL_CORP_NM
         , C.CMP_CODE
         , CONCAT(a.EWH_PLN_DD, a.PPAY_DD, a.AREA_NO, C.CMP_CODE, IFNULL(REG_ID, '111111111111')) AS FIMS_CONT_IND
         , max(AFE_YY)                                                                            AS AFE_YY
         , max(AFE_TMS)                                                                           AS AFE_TMS
         , IFNULL(REG_ID, '111111111111')                                                         AS reg_id
         , max(REG_NM)                                                                            AS REG_NM
         , max(HP_NO)                                                                             AS HP_NO
         , max(PPAY_RMKS)                                                                         AS PPAY_RMKS
    FROM T_LIN_FIMS_CONT_TMP a
             LEFT JOIN t_cmm_cmp c
                       ON FC_FORMAT_WRKRREGNO(C.WRKR_REG_NO) = a.DL_REG_NUM
    WHERE c.CMP_CODE is NOT null -- 등록되지 않은 회사 제외
    GROUP BY a.EWH_PLN_DD, a.PPAY_DD, a.AREA_NO
           , C.WRKR_REG_NO
           , C.CMP_CODE
           , CONCAT(a.EWH_PLN_DD, a.PPAY_DD, a.AREA_NO, C.CMP_CODE, IFNULL(REG_ID, '111111111111'))
           , IFNULL(REG_ID, '111111111111');

    /* 납품검사 제외 품목 삭제 */
    DELETE
    FROM TEMP_LIN_FIMS_CONT
    WHERE mat_cd in (select atcl_code from t_cmm_item_dtl where IFNULL(exam_except_yn, 'N') = 'Y');

    /* 기존 데이타중 검사신청 내용 없이 임시 테이블에 있는 것과 같은 내용 삭제  */
    DELETE
    FROM T_DLVR_PPAY_CONT
    WHERE CONCAT(ppay_cont_info_seq, MAT_CD)
              IN (SELECT CONCAT(FIMS_CONT_IND, MAT_CD)
                  FROM TEMP_LIN_FIMS_CONT A
                  WHERE NOT EXISTS (SELECT *
                                    FROM T_DLVR_EXAM_REQ_item B
                                    WHERE A.FIMS_CONT_IND = B.ppay_cont_info_seq
                                      AND A.MAT_CD = B.atcl_code
                                      AND ppay_cont_info_seq <> ''));


    /* 최종 Data 반영 */
    INSERT INTO T_DLVR_PPAY_CONT (ppay_cont_info_seq, EWH_PLN_DD, PPAY_DD, AREA_NO, AREA_NM,
                                  MAT_CD, MAT_NM, PPAY_CNT, DL_REG_NUM, DL_CORP_NM,
                                  CMP_CODE, AFE_YEAR, AFE_CHASU, RQSTR_ID, RQSTR_NM, TELNO, REM,
                                  PPAY_CONT_GBN, IVT_GBN, REG_YMD, CONFDT)
    SELECT fims_cont_ind,
           EWH_PLN_DD,
           PPAY_DD,
           AREA_NO,
           AREA_NM,
           MAT_CD,
           MAT_NM,
           PPAY_CNT,
           DL_REG_NUM,
           DL_CORP_NM,
           CMP_CODE,
           AFE_YY,
           AFE_TMS,
           right(REG_ID, 7),
           REG_NM,
           HP_NO,
           PPAY_RMKS,
           'C70001',
           'C47001',
           DATE_FORMAT(NOW(), '%Y%m%d'),
           DATE_FORMAT(NOW(), '%Y%m%d')
    FROM TEMP_LIN_FIMS_CONT A
    WHERE NOT EXISTS
              (SELECT *
               FROM T_DLVR_EXAM_REQ_item B
               where A.FIMS_CONT_IND = B.ppay_cont_info_seq
                 AND A.MAT_CD = B.atcl_code
                 AND ppay_cont_info_seq <> '');


    UPDATE t_cmm_item_dtl
    SET record_ver  = null
      , record_code = null
    WHERE record_ver = '0';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_IMS_TO_QAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_bin */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_IMS_TO_QAS`()
    COMMENT 'IMS조직정보 가져오기'
begin	
   
	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @ERR_NO = MYSQL_ERRNO ,
            @MSG = MESSAGE_TEXT;

        ROLLBACK;

        CALL SP_INSERT_SYSTEM_JOB_LOG(
                'IMS_TO_QAS'
            , @LogParam
            , 'FAIL'
            , CONCAT('[', @ERR_NO, '] ', @MSG)
            , @LogArgs
            , @START_DATETIME
             );
    END;
   
    SET @LogParam = '{"_comment": "인사정보 동기화","query": "CALL SC_IMS_TO_QAS();"}';
    SET @LogArgs = 'procedure IMS_TO_QAS';
    SET @START_DATETIME = NOW();
    SET @PREVIOUS_USERS = 0;
    SET @CURRENT_USERS = 0;
	
	START TRANSACTION;
	
	-- ===================================
	--  SK조직정보 - 부서 || SK_ORG_TBL 업데이트
	-- ===================================
    TRUNCATE sk_org_tbl;
    INSERT INTO sk_org_tbl( SK_ID
                          , SK_NAME
                          , SK_PARENT_ID
                          , SK_ORDER
                          , SK_DESCRIPTION
                          , SK_STATUS
                          , SK_SDATE
                          , SK_EDATE
                          , SK_TYPE
                          , SK_DIREMPNO
                          , SK_LEVELCD
                          , SK_WRKPLC
                          , SK_T_FLAG
                          , SK_CREATE_USER
                          , SK_UPDATE_USER
                          , SK_CREATE_TIME
                          , SK_UPDATE_TIME)
    SELECT INDEPT
         , SOSOK
         , HIGHPARTDEPT
         , OUTDEPT
         , TSOSOK
         , IF(T_FLAG = 'D', 'N', 'Y')
         , CRTYYMMDD
         , DESTRUCTDD
         , NULL
         , DIREMPNO
         , LEVELCD
         , WRKPLC
         , T_FLAG
         , '배치작업'
         , '배치작업'
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
    FROM INF_DEPT_INFO_RCV;
	
   
    -- ===================================
	--  SK조직정보 - 사용자 || SK_USER_TBL 업데이트
	-- ===================================  
	
	-- ILM에 존재하는 모든 계정은 QAS 에도 동일하게 생성함
	-- 단, QAS 사용(로그인)을 위한 최소한의 권한은 특정부서(ICT Infra) 이하 구성원으로 제한함
	-- ** 아래 쿼리는 ICT Infra 구성원을 tempQasManagers 임시 테이블로 추출하기 위한 용도입니다.
	create temporary table if not exists tempQasManagers ( UserId VARCHAR(8) NOT NULL );	
	insert into tempQasManagers (UserId)
	WITH RECURSIVE cte AS
	(
		select d.* 
		from inf_dept_info_rcv d
		where d.indept = '00001350' -- ICT Infra
		union all
		select d.*
		from inf_dept_info_rcv d
			inner join cte c on c.indept = d.highpartdept	
	)
	select u.EMPNO
	from cte as c
	inner join inf_person_info_rcv u on u.INDEPT = c.INDEPT
	;

	/* ======================================
	 	[사용자 구분코드]
	 	C55001	SKT	=> 내부사용자
		C55002	협력사	=> 외부사용자
		C55003	협력협체 | QAS 사용자 대상은 아님, 협력사의 원청협력업체 관리 용도 (구시스템)
	 	[사용자 상태코드]
	 	C62001	삭제	=> 퇴직, 삭제 처리 시 | 사용자 목록에서 제외됨
		C62002	미승인	=> 미승인 처리 시 | 사용자 목록에는 유지
		C62003	승인	=> 최초가입, 승인 처리 시 | 사용자 목록에 유지
	 * ===================================== */


	-- ILM 에만 존재하고 QAS에 없는 사용자는 신규 사용자로 판단함
	-- 사용자 추가 및 기본권한(Network 매니저)을 부여
	insert into sk_user_tbl
	( SK_ID, SK_NAME, INDEPT, USR_GBN, CUR_USR_ID, TELNO, MOBILENO, EMAIL, CMP_CODE, STATUS, DEL_YN, SK_JBGRP, SK_JBRANK, SK_JBCHARGE, SK_HOLDOFFIDIVI, SK_PLACE, SK_CREATE_TIME)
	select 
		ipir.EMPNO, ipir.HNAME, ipir.INDEPT, 'C55001', ipir.EMPNO, ipir.TELNO, ipir.MOVETELNO, ipir.EMAIL, 'CP000000', 'C62003', ipir.DEL_YN, ipir.JBGRP, ipir.JBRANK, ipir.JBCHARGE, ipir.HOLDOFFIDIVI, ipir.PLACE, DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
	from inf_person_info_rcv ipir	
	where ipir.EMPNO not in (select a.SK_ID from sk_user_tbl a)
	;
	
	-- ILM 데이터 기준으로 SKT(내부) 사용자 기본 정보 업데이트
	update sk_user_tbl u
	join inf_person_info_rcv i on i.EMPNO = u.SK_ID
    set
		u.SK_NAME         = i.HNAME,
		u.INDEPT          = i.INDEPT,
		u.TELNO           = i.TELNO,
		u.MOBILENO        = i.MOVETELNO,
		u.EMAIL           = i.EMAIL,
		u.DEL_YN          = i.DEL_YN,
		u.SK_JBGRP        = i.JBGRP,
		u.SK_JBRANK       = i.JBRANK,
		u.SK_JBCHARGE     = i.JBCHARGE,
		u.SK_HOLDOFFIDIVI = i.HOLDOFFIDIVI,
		u.SK_PLACE        = i.PLACE,
		u.SK_UPDATE_TIME  = DATE_FORMAT(i.SENDDT, '%Y%m%d%H%i%S')
	where u.USR_GBN = 'C55001'
	;
	
	-- ILM 존재하지 않는 사용자 + SKT(내부) 사용자인 경우 => 퇴직 처리
	update sk_user_tbl 
	set DEL_YN = 'Y', STATUS = 'C62001'
	where 
		-- SKT 사용자 대상
		USR_GBN = 'C55001'
		and 
		-- ILM 인사데이터 및 QAS 자체관리데이터에 없는 사용자를 대상으로 함
		SK_ID not in
					(
						select person.EMPNO EMPNO from inf_person_info_rcv person
						union
						select spsm.TargetId EMPNO from self_person_sync_mgmt spsm where spsm.TargetType in ('A','U')						
					) 						
		and
		SK_ID not like 'qeas%'							
	;
	
	-- 퇴직 처리 (DEL_YN=Y) 사용자의 상태도 같이 변경해야함	
	update sk_user_tbl 
	set STATUS = 'C62001'
	where USR_GBN = 'C55001' and DEL_YN = 'Y' and STATUS <> 'C62001'
	;

	-- 재입사 등의 사유로 삭제처리(DEL_YN=Y) 상태가 N으로 변경된 경우 
	-- STATUS값도 (삭제:C62001)에서 (미승인:C62002)으로 변경해준다.
	update sk_user_tbl 
	set STATUS = 'C62002'
	where USR_GBN = 'C55001' and DEL_YN = 'N' and STATUS = 'C62001'
	;
	
	-- QAS최소권한(tempQasManagers) 대상자 중 기본 role이 부여되지 않은 사용자에 대해 기본 권한 부여
    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', m.UserId, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
	from tempQasManagers m
	where m.UserId not in 
						(
							select srmt.SK_REF_1 
							from sk_role_mapping_tbl srmt
							where srmt.SK_TYPE ='U'						
						)
	;
	
	-- QAS 삭제(퇴직자) 상태 사용자의 Role 회수
	delete from sk_role_mapping_tbl srmt where srmt.SK_TYPE ='U' and srmt.SK_REF_1 not in (select sut.SK_ID from sk_user_tbl sut where sut.DEL_YN <> 'Y')
	;	

	-- 삭제(퇴직) 처리된 사용자는 각 장비군 담당자에서 제거함 (삭제 Y가 아니고 상태코드가 승인(C62003)상태인 사용자를 제외한 담당자를 삭제 처리)
	delete from t_sys_usr_item_class a where a.USR_ID not in (select b.SK_ID from sk_user_tbl b where b.DEL_YN <> 'Y' and b.STATUS in ('C62003') )
	;


	/* AS-IS 인사동기화 백업
    DECLARE _EMPNO CHAR(7);
    DECLARE _HNAME VARCHAR(40);
    DECLARE _INDEPT VARCHAR(8);
    DECLARE _TELNO VARCHAR(30);
    DECLARE _MOVETELNO VARCHAR(30);
    DECLARE _EMAIL VARCHAR(50);
    DECLARE _DEL_YN CHAR(1);
    DECLARE _JBGRP VARCHAR(3);
    DECLARE _JBRANK VARCHAR(2);
    DECLARE _JBCHARGE VARCHAR(3);
    DECLARE _HOLDOFFIDIVI VARCHAR(1);
    DECLARE _PLACE VARCHAR(4);
    DECLARE _T_FLAG CHAR(1);

    DECLARE done BOOLEAN DEFAULT FALSE;

    DECLARE CURSOR_PERSON_INFO CURSOR FOR
        SELECT EMPNO
             , IFNULL(HNAME, '')
             , IFNULL(INDEPT, '')
             , CONCAT('', IFNULL(TELNO, ''))
             , CONCAT('', IFNULL(MOVETELNO, ''))
             , IFNULL(EMAIL, '')
             , IF(T_FLAG = 'D', 'Y', 'N')
             , JBGRP
             , JBRANK
             , JBCHARGE
             , HOLDOFFIDIVI
             , PLACE
             , T_FLAG
        FROM INF_PERSON_INFO_RCV
        WHERE empno NOT LIKE '107%'
            and indept in (SELECT indept
                           FROM INF_DEPT_INFO_RCV
                           where outdept >= '106000' and outdept <= '106999'
                              or INDEPT in ('00003438', '00004191', '00004011', '00001671'))
           or empno in ('1102085', '1105249', '1105009', '1101630', '1103199');

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            GET DIAGNOSTICS CONDITION 1
                @ERR_NO = MYSQL_ERRNO ,
                @MSG = MESSAGE_TEXT;

            ROLLBACK;

            CALL SP_INSERT_SYSTEM_JOB_LOG(
                    'IMS_TO_QAS'
                , @LogParam
                , 'FAIL'
                , CONCAT('[', @ERR_NO, '] ', @MSG)
                , @LogArgs
                , @START_DATETIME
                 );
        END;
    
    SET @LogParam = '{"_comment": "인사정보 동기화","query": "CALL SC_IMS_TO_QAS();"}';
    SET @LogArgs = 'procedure IMS_TO_QAS';
    SET @START_DATETIME = NOW();
    SET @IN = 0;
    SET @UP = 0;

    -- SK_ORG_TBL 업데이트
    TRUNCATE sk_org_tbl;
    INSERT INTO sk_org_tbl( SK_ID
                          , SK_NAME
                          , SK_PARENT_ID
                          , SK_ORDER
                          , SK_DESCRIPTION
                          , SK_STATUS
                          , SK_SDATE
                          , SK_EDATE
                          , SK_TYPE
                          , SK_DIREMPNO
                          , SK_LEVELCD
                          , SK_WRKPLC
                          , SK_T_FLAG
                          , SK_CREATE_USER
                          , SK_UPDATE_USER
                          , SK_CREATE_TIME
                          , SK_UPDATE_TIME)
    SELECT INDEPT
         , SOSOK
         , HIGHPARTDEPT
         , OUTDEPT
         , TSOSOK
         , IF(T_FLAG = 'D', 'N', 'Y')
         , CRTYYMMDD
         , DESTRUCTDD
         , NULL
         , DIREMPNO
         , LEVELCD
         , WRKPLC
         , T_FLAG
         , '배치작업'
         , '배치작업'
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
    FROM INF_DEPT_INFO_RCV;

    -- 인사정보
    OPEN CURSOR_PERSON_INFO;
    SELECT FOUND_ROWS() INTO @rowCount;

    START TRANSACTION;
    
    read_loop: LOOP
        FETCH CURSOR_PERSON_INFO
            INTO _EMPNO, _HNAME, _INDEPT, _TELNO, _MOVETELNO, _EMAIL, _DEL_YN, _JBGRP, _JBRANK, _JBCHARGE, _HOLDOFFIDIVI, _PLACE, _T_FLAG;
        
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*)
        FROM SK_USER_TBL
        WHERE SK_ID = _EMPNO
        INTO @SK_COUNT;

        IF @SK_COUNT > 0 THEN
            UPDATE SK_USER_TBL
            SET SK_NAME         = _HNAME
              , INDEPT          = _INDEPT
              , TELNO           = _TELNO
              , MOBILENO        = _MOVETELNO
              , EMAIL           = _EMAIL
              , DEL_YN          = _DEL_YN
              , SK_JBGRP        = _JBGRP
              , SK_JBRANK       = _JBRANK
              , SK_JBCHARGE     = _JBCHARGE
              , SK_HOLDOFFIDIVI = _HOLDOFFIDIVI
              , SK_PLACE        = _PLACE
              , SK_UPDATE_TIME  = DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
            WHERE SK_ID = _EMPNO;

            SET @UP = @UP + 1;
        ELSE
            INSERT INTO SK_USER_TBL
            ( SK_ID
            , SK_NAME
            , INDEPT
            , USR_GBN
            , CUR_USR_ID
            , TELNO
            , MOBILENO
            , EMAIL
            , CMP_CODE
            , STATUS
            , DEL_YN
            , SK_JBGRP
            , SK_JBRANK
            , SK_JBCHARGE
            , SK_HOLDOFFIDIVI
            , SK_PLACE
            , SK_CREATE_TIME)
            VALUES ( _EMPNO
                   , _HNAME
                   , _INDEPT
                   , 'C55001'
                   , _EMPNO
                   , _TELNO
                   , _MOVETELNO
                   , _EMAIL
                   , 'CP000000'
                   , 'C62003'
                   , _DEL_YN
                   , _JBGRP
                   , _JBRANK
                   , _JBCHARGE
                   , _HOLDOFFIDIVI
                   , _PLACE
                   , DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'));

            -- 매핑테이블
            INSERT INTO SK_ROLE_MAPPING_TBL
            ( SK_ROLE_ID
            , SK_REF_1
            , SK_REF_2
            , SK_TYPE)
            VALUES ( 'R000000001'
                   , _EMPNO
                   , 'N/A'
                   , 'U');

            SET @IN = @IN + 1;
        END IF;
    END LOOP;

    CLOSE CURSOR_PERSON_INFO;
    */

	# 자체 인사정보 처리
    CALL SP_SYNC_SKTUSERS();

	# 로그 기록
    CALL SP_INSERT_SYSTEM_JOB_LOG(
            'IMS_TO_QAS'
        , @LogParam
        , 'SUCCESS'
		#, concat('기존 사용자 : ',@PREVIOUS_USERS, '명,  rows inserted and ', @CURRENT_USERS, ' rows updated for SK_USER_TBL')
        , 'ILM 데이터를 QAS 사용자 계정으로 동기화 완료 했습니다.'
        , @LogArgs
        , @START_DATETIME
         );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_MRCS_AS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_MRCS_AS`()
    COMMENT 'MRCS AS 데이터 입력'
BEGIN

    -- 원본 데이터 저장
    DELETE
    FROM t_lin_mrcs_as_info_raw raw
    WHERE EXISTS (SELECT FSRNO
                  FROM t_lin_mrcs_as_info_tmp tmp
                  WHERE raw.FSRNO = tmp.FSRNO
                    AND raw.FCDSTBLTYPE = tmp.FCDSTBLTYPE
                    AND raw.FCDLTBLREASON = tmp.FCDLTBLREASON
                    AND raw.FCDMTBLREASON = tmp.FCDMTBLREASON
                    AND raw.FCDSTBLREASON = tmp.FCDSTBLREASON);

    INSERT INTO t_lin_mrcs_as_info_raw
    SELECT *
    FROM t_lin_mrcs_as_info_tmp temp;

    -- 중복 제거
    DELETE
    FROM T_LIN_MRCS_AS_INFO A
    WHERE EXISTS (SELECT FSRNO
                  FROM t_lin_mrcs_as_info_tmp tmp
                  WHERE right(A.mrcs_no, 6) = CAST(tmp.FSRNO AS char(6))
                    AND A.falt_divi = IFNULL(NULLIF(tmp.FCDSTBLTYPE, ''), 'xxx')
                    AND A.falt_cause = tmp.FCDLTBLREASON
                    AND A.shape_cause = tmp.FCDMTBLREASON
                    AND A.as_divi = tmp.FCDSTBLREASON);

    INSERT INTO `T_LIN_MRCS_AS_INFO` ( MRCS_NO
                                     , AS_AREA_CODE
                                     , CMP_SERI_NO
                                     , LOCAL_NAME
                                     , TROUB_CTNT
                                     , AS_REQ_NAME
                                     , AS_REQ_TEL
                                     , AS_REQ_DATE
                                     , STOCK_DATE
                                     , DLVR_DATE
                                     , DTL_HAND_CTNT
                                     , M_TROUB_PART_CODE
                                     , M_DTL_SHAPE_CODE
                                     , M_DTL_HAND_TYPE
                                     , M_DIVI
                                     , ITEM_CODE
                                     , FIRST_SHIP_YMD
                                     , REG_YMD
                                     , REP_DIVI
                                     , REP_DO_RE_DIVI
                                     , REP_TYPE
                                     , SYSTEM_DIVI
                                     , FALT_DIVI
                                     , FALT_CONT
                                     , FALT_CAUSE
                                     , SHAPE_CAUSE
                                     , SHAPE_CONT
                                     , AS_DIVI
                                     , AS_CONT
                                     , SRC_CMP_NM
                                     , WRKR_REG_NO)
    SELECT CONCAT('NPE', substring(A.FDDSKPROC, 1, 4), LPAD(FSRNO, 6, '0')) AS MRCS_NO
         , A.FGBJY                                  -- 지역구분코드
         , A.FNOSERIAL                              -- 유니트 S/N
         , A.FNMRPT                                 -- 중계기명
         , A.FTROUBLE                               -- 수리요청시 고장내역
         , A.FINSPECTOR                             -- 현장점검자
         , A.FINSPECTORTEL                          -- 현장점검자 연락처
         , DATE_FORMAT(A.FDDSKPROC, '%Y%m%d')       -- SKT 요청일시(작업등록일시)
         , DATE_FORMAT(A.FDDVNDIN, '%Y%m%d')        -- VENDOR 실제 입고일시
         , DATE_FORMAT(IFNULL(A.FDDVNDPROC, A.FDDSKPROC), '%Y%m%d')
         , TRIM(A.FVNDPROC)                         -- 벤더 조치내역, 수리내역
         , A.FCDGRP                                 -- 고장부위 대분류
         , A.FCDCURE                                -- 고장부위 중분류
         , CASE a.FTOK
               WHEN 'T' THEN 'A'
               WHEN 'S' THEN 'B'
               WHEN 'C' THEN 'C'
               ELSE 'C'
        END                                         -- TOK구분 C:소자교체, F:교체, J:장비튜닝, K:기타, N: 수리불가, :T:TOK(TEST OK), U: 유니트 대게체, W:S/W작업
         , A.FGBSRTYPE                              -- 요청구분코드 G: 일상점검, R: 현장점검요청, M:모듈수리
         , FC_TO_FULL_ATCL_CODE(A.FQEASCODE)        -- 물품코드
         , DATE_FORMAT(A.FDDRPTOUT, '%Y%m%d')       -- 벤더 최초 출하일자
         , DATE_FORMAT(A.FDDVNDPROC, '%Y%m%d')      -- 벤더 조치일
         , A.FJRRPT                                 -- 중계기 종류 코드
         , A.FGBCD                                  -- 도너/리모트 구분코드
         , A.FCDRPTMD                               -- 중계기 타입 코드(rcs, wrcs코드)
         , A.FGBERP                                 -- RCS 미수용 구분
         , IFNULL(NULLIF(FCDSTBLTYPE, ''), 'xxx')   -- 고장유형소
         , A.FTBLTYPEETC                            -- 기타불량
         , A.FCDLTBLREASON                          -- 고장원인 대
         , A.FCDMTBLREASON                          -- 고장원인 소
         , A.FTBLREASONMETC                         -- 세부원인 기타
         , A.FCDSTBLREASON                          -- 고장원인 중
         , A.FTBLREASONSETC                         -- 조치내역 기타
         , A.TRAD_NAME                              -- 중계기제조사 업체명
         , REGEXP_REPLACE(A.ENPR_NMBR, '[-| ]', '') -- 수리의뢰처 사업자등록번호
    FROM t_lin_mrcs_as_info_tmp a;

    UPDATE t_cmm_item_dtl
    SET nams_yn='N'
    WHERE substring(atcl_cat_code, 1, 2) IN ('01', '02', '07', '06')
      AND IFNULL(nams_yn, '') != 'N'
      AND use_yn = 'Y'
      AND IFNULL(exam_except_yn, '') = 'Y'
      AND reg_ymd >= DATE_FORMAT(NOW() - INTERVAL 2 DAY, '%Y%m%d')
      AND reg_ymd <> '99991231';

    SELECT YEAR(FDDVNDPROC)
    INTO @year
    FROM t_lin_mrcs_as_info_tmp
    LIMIT 1;

    -- 중계기 A/S율
    CALL SP_INSERT_MRCS_PPM_AS(@year);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SC_NAMS_AS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SC_NAMS_AS`()
    COMMENT 'NAMS AS 데이터 입력'
BEGIN

    -- 원본 데이터 저장
    DELETE
    FROM t_lin_nams_as_info_raw raw
    WHERE EXISTS (SELECT 1
                  FROM t_lin_nams_as_info_tmp tmp
                  WHERE raw.BARE_CODE = tmp.BARE_CODE
                    AND raw.CHGE_DATE = tmp.CHGE_DATE);

    INSERT INTO t_lin_nams_as_info_raw
    SELECT *
    FROM t_lin_nams_as_info_tmp temp;

    -- 중복 제거
    DELETE
    FROM T_LIN_NAMS_AS_INFO A
    WHERE EXISTS (SELECT 1
                  FROM t_lin_nams_as_info_tmp tmp
                  WHERE A.SKT_SERI_NO = tmp.BARE_CODE
                    AND A.REPR_ENT_DAY = tmp.CHGE_DATE);

    SELECT CURR_DATE
    INTO @StrDate
    FROM t_lin_nams_as_info_tmp
    LIMIT 1;

    SELECT IFNULL(MAX(RIGHT(NAMS_NO, 3)), 0)
    FROM T_LIN_NAMS_AS_INFO
    WHERE NAMS_NO LIKE CONCAT('NM', @StrDate, '%')
    INTO @StartNumber;

    INSERT INTO T_LIN_NAMS_AS_INFO (
                                     `NAMS_NO`, `NAMS_AS_NM`, `TEAM_CODE`, `BSIN_GBN`, `BSIN_GBN_CODE`, `FACIL_GBN`, `FACIL_GBN_CODE`, `EQI_GBN`, `EQI_GBN_CODE`, `ATCL_CODE`
                                   , `ATCL_NM`, `SKT_SERI_NO`, `PRD_CMP_SERI_NO`, `PRD_YMD`, `REPR_ENT_DAY`, `FIRST_REG_YMD`, `SK_TROUBCODE1`, `SK_TROUB1`, `SK_TROUBCODE2`, `SK_TROUB2`
                                   , `SK_TROUBCODE3`, `SK_TROUB3`, `REPR_CMP_TROUBCODE1`, `REPR_CMP_TROUB1`, `REPR_CMP_TROUBCODE2`, `REPR_CMP_TROUB2`, `REPR_CMP_TROUBCODE3`, `REPR_CMP_TROUB3`
                                   , `REPR_CTN1`, `REPR_CTN2`, `REPR_CTN3`, `REPR_DTL_LOC1`, `REPR_DTL_LOC2`, `REPR_DTL_LOC3`, `REPR_DTL_LOC4`, `REPR_DTL_LOC5`, `REPR_DTL_LOC6`, `REPR_DTL_LOC7`
                                   , `REPR_DTL_LOC8`, `REPR_DTL_LOC9`, `REPR_DTL_LOC10`, `PRD_CMP`, `PRD_CMP_WRKR_NO`, `MADE_CMP`, `MADE_CMP_WRKR_NO`, `REG_YMD`, `ATCL_CAT_CODE`)
    SELECT CONCAT('NM', @StrDate, LPAD(ROW_NUMBER() OVER (ORDER BY (SELECT 1)) + @StartNumber, 3, '0')) AS NAMS_NO
         , t.FUNC_DEPT , t.DEPT_CODE , t.FUNC_SAUP , t.SAUP_DVSN , t.FUNC_SISL , t.SISL_DVSN , t.SISL_NAME , t.PREV_NETW , FC_TO_FULL_ATCL_CODE(t.PRDT_TPCD)
         , t.PRVS_NAME , t.BARE_CODE , t.MKCO_BACO
         , ifnull(t.JEJO_DATE, (case length(t.BARE_CODE)
                                    when 13 then concat('20', substr(t.BARE_CODE, 7, 2), '1231')
                                    when 15 then concat('20', substr(t.BARE_CODE, 8, 2), '1231')
                                    else '' end))                                                       AS PRD_YMD
         , t.CHGE_DATE , t.SCRE_DATE , t.GOJN_SKC1 , t.GOJN_SKT1 , t.GOJN_SKC2 , t.GOJN_SKT2
         , t.GOJN_SKC3 , t.GOJN_SKT3 , t.GOJN_TRC1 , t.GOJN_TRD1 , t.GOJN_TRC2 , t.GOJN_TRD2 , t.GOJN_TRC3 , t.GOJN_TRD3
         , t.SURI_TRD1 , t.SURI_TRD2 , t.SURI_TRD3 , t.SURI_PO01 , t.SURI_PO02 , t.SURI_PO03 , t.SURI_PO04 , t.SURI_PO05 , t.SURI_PO06 , t.SURI_PO07
         , t.SURI_PO08 , t.SURI_PO09 , t.SURI_PO10 , t.TRAD_NAME
         , IFNULL(NULLIF(ENPR_NMBR, ''), (select WRKR_REG_NO from t_cmp_map where CMP_NM = t.TRAD_NAME LIMIT 1)) -- NOTE: 오픈 이후 NAMS에서 파일에 사업자 번호를 추가해주면 t_cmp_map 참조 제거 및 t_cmp_map 테이블 제거
         , t.TRAD_NAM2
         , IFNULL(NULLIF(ENPR_NMBR2, ''), (select WRKR_REG_NO from t_cmp_map where CMP_NM = t.TRAD_NAM2 LIMIT 1)) -- NOTE: 오픈 이후 NAMS에서 파일에 사업자 번호를 추가해주면 t_cmp_map 참조 제거 및 t_cmp_map 테이블 제거
         , t.CURR_DATE , NULL
    FROM t_lin_nams_as_info_tmp t;

    SET @year = YEAR(@StrDate);

    -- 전송장비
    CALL SP_INSERT_NAMS_NPR_06(@year);

    -- 주장비
    CALL SP_INSERT_NAMS_NPR(@year);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_DLVR_EXAM_REQ` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_DLVR_EXAM_REQ`(IN P_DLVR_EXAM_REQ_NO varchar(13), IN P_VER int)
    COMMENT '납품검사 신청서 삭제'
BEGIN
    -- 해당 신청의 모든 버전에 대해 삭제하도록 ver 체크 안 함

    -- 납품검사 신청 및 관련 데이터 모두 삭제
    -- 신청서삭제
    DELETE FROM t_dlvr_exam_req WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 신청서 임시물품 삭제
    DELETE FROM t_cmm_item_dtl
           WHERE ATCL_CODE IN (SELECT ATCL_CODE
                        FROM T_DLVR_EXAM_REQ_ITEM
                        WHERE PPAY_CONT_INFO_SEQ IS NOT NULL
                          AND ATCL_CODE LIKE '%T%'
                          AND DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO
                          -- AND VER = P_VER
                        );
    -- 신청서 물품삭제
    DELETE FROM t_dlvr_exam_req_item WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 초도장비 삭제
    DELETE FROM t_dlvr_fst_eqp WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 신규물품등록정보 삭제
    DELETE FROM t_lin_erp_new_item
            WHERE SNO IN (SELECT SNO
                      FROM T_DLVR_EXAM_PPAY_ITEM
                      WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO); -- AND VER = P_VER);
    -- 납품검사 선납물품 삭제
    DELETE FROM t_dlvr_exam_ppay_item WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 필증발급
    DELETE FROM t_dlvr_cert_isu WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- erp 승인신청 물품
    DELETE FROM t_dlvr_erp_req_atcl WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 시정초치
    DELETE FROM t_dlvr_exam_corr WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 시정초치 반려
    DELETE FROM t_dlvr_exam_corr_ret WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 납품검사선납물품
    DELETE FROM t_dlvr_exam_req_ret WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 첨부파일
    DELETE FROM sk_upload_tbl where SK_DOC_ID LIKE CONCAT(P_DLVR_EXAM_REQ_NO, '%') AND SK_PROGRAM = 'upload_req.exm';

    -- 해당 납품검사 신청에 연결된 시험데이터 삭제
    DROP TEMPORARY TABLE IF EXISTS T_TARGET;

    CREATE TEMPORARY TABLE T_TARGET AS
    SELECT dlvr_rec_no
    FROM t_dlvr_exam_rec
    WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO;
     -- AND VER = P_VER;

    DELETE FROM t_dlvr_exam_rec WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_rec_spec WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_1 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_2 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_3 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_4 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_5 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_6 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_7 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_8 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_result WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);    
    DELETE FROM t_eqi_serial WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    DELETE FROM t_dlvr_exam_upload_file WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    
    DROP TEMPORARY TABLE T_TARGET;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GENERATE_ANALYSIS_DATA_BATCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GENERATE_ANALYSIS_DATA_BATCH`()
    COMMENT '지표분석 데이터 전체 기간생성'
BEGIN

    SET @jobName = 'AS_ANALYSIS_ALL';
    SET @startDatetime = NOW();
    SET @message = '';

    SET @year = 2003;
    SET @end = YEAR(NOW());

    analLoop:
    WHILE @year < @end
        DO
            CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'RUN', CONCAT('[', @year, '] 중계기'));
            CALL SP_INSERT_MRCS_PPM_AS(@year);
            IF EXISTS(SELECT 1 FROM t_job_state WHERE JOB_NAME = @jobName AND STATE = 'ABORT') THEN
                SET @message = CONCAT('Aborted after [', @year, '] 중계기');
                LEAVE analLoop;
            END IF;

            CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'RUN', CONCAT('[', @year, '] 주장비'));
            CALL SP_INSERT_NAMS_NPR(@year);
            IF EXISTS(SELECT 1 FROM t_job_state WHERE JOB_NAME = @jobName AND STATE = 'ABORT') THEN
                SET @message = CONCAT('Aborted after [', @year, '] 주장비');
                LEAVE analLoop;
            END IF;

            CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'RUN', CONCAT('[', @year, '] 전송장비'));
            CALL SP_INSERT_NAMS_NPR_06(@year);
            IF EXISTS(SELECT 1 FROM t_job_state WHERE JOB_NAME = @jobName AND STATE = 'ABORT') THEN
                SET @message = CONCAT('Aborted after [', @year, '] 전송장비');
                LEAVE analLoop;
            END IF;

            SET @year = @year + 1;
        END WHILE analLoop;

    CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'PAUSE', null);
    CALL SP_INSERT_SYSTEM_JOB_LOG(
            @jobName
        , null
        , 'SUCCESS'
        , @message
        , null
        , @startDatetime
         );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GET_SAMPLING_CRITERIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_SAMPLING_CRITERIA`(IN P_CMP_CODE varchar(10), IN P_DLVR_REC_NO int,
                                                              IN P_ATCL_CODE varchar(18))
    COMMENT '시험데이터 샘플링 기준 조회'
BEGIN
    SET @yyyymm = EXTRACT(YEAR_MONTH FROM DATE_ADD(NOW(), INTERVAL -1 MONTH));
    SET @spyCmpNm = '';
    SET @category = '';
    
    SELECT b.DISPLAY_NM
    INTO @spyCmpNm
    FROM t_cmm_cmp a
             JOIN t_cmp_name_map b on a.WRKR_REG_NO = b.WRKR_REG_NO
    WHERE CMP_CODE = P_CMP_CODE;

    SELECT ATCL_CAT_CODE
    INTO @category
    FROM t_cmm_item_dtl 
    WHERE ATCL_CODE = P_ATCL_CODE;

    SET @cat1 = SUBSTRING(@category, 1, 2);
    SET @rate := 0.03;
    IF @cat1 in ('01', '02') THEN
        SELECT `VALUE` / 1000000
        INTO @rate
        FROM t_nams_npr_new
        WHERE CATEGORY = @category
          AND SPY_CMP_NM = @spyCmpNm
          AND YYYYMM = @yyyymm
          AND SEQ = 6;
    ELSEIF @cat1 = '06' THEN
        SELECT `VALUE` / 1000000
        INTO @rate
        FROM t_nams_npr_06_new
        WHERE CATEGORY = @category
          AND SPY_CMP_NM = @spyCmpNm
          AND YYYYMM = @yyyymm
          AND SEQ = 6;
    ELSEIF @cat1 = '07' THEN
        SELECT `VALUE` / 1000000
        INTO @rate
        FROM t_mrcs_ppm_as_new
        WHERE CATEGORY = @category
          AND SPY_CMP_NM = @spyCmpNm
          AND YYYYMM = @yyyymm
          AND SEQ = 6;
    END IF;

    -- 3% 이하: 3%
    -- 3% ~ 4%: 4%
    -- 5% 이상: 5%
    SET @rate := (SELECT CASE
                             WHEN @rate <= 0.03 THEN 0.03
                             WHEN @rate >= 0.05 THEN 0.05
                             ELSE 0.04
                             END);

    -- 최소 5건
    SELECT CAST(@rate * 100 AS DECIMAL) as PERCENT,
           COUNT(*) AS TOTAL_COUNT,
           GREATEST(CAST(COUNT(*) * @rate AS DECIMAL), 5) AS SAMPLE_COUNT
    FROM t_dlvr_exam_data_1
    WHERE DLVR_REC_NO = P_DLVR_REC_NO;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_COMPANY_NAMES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COMPANY_NAMES`()
    COMMENT '회사이름 테이블에 신규 회사정보 입력'
BEGIN
    
    INSERT INTO t_cmp_name_map
    SELECT cc.WRKR_REG_NO
         , MAX(cc.CMP_NM) AS CMP_NM
         , FALSE
         , FALSE
    FROM t_cmm_cmp cc
             LEFT JOIN t_cmp_name_map cnm
                       on cc.WRKR_REG_NO = cnm.WRKR_REG_NO
    WHERE cc.USE_YN = 'Y'
      AND cnm.WRKR_REG_NO is null
      -- 사업자 번호 형식이 맞는지 확인
      AND length(REGEXP_REPLACE(cc.WRKR_REG_NO, '[^0-9]', '')) = 10
    -- AND FC_IS_VALID_WRKR_REG_NO(cc.WRKR_REG_NO) = TRUE
    GROUP BY cc.WRKR_REG_NO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_MRCS_PPM_AS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_MRCS_PPM_AS`(IN Year char(4))
    COMMENT 't_mrcs_ppm_as 입력'
BEGIN

    SET @Year = `Year`;
    SET @TargetStartDate = FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11);
    SET @TargetEndDate = CONCAT(@Year, '1231');

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT B.ATCL_CAT_CODE AS category
         , a.LIFNR         AS wrkr_reg_no
    FROM t_dlvr_cont a
             JOIN t_cmm_item_dtl b -- QAS 등록된 물품만 취급
                  ON a.atcl_code = b.atcl_code
    WHERE b.ATCL_CAT_CODE LIKE '07%' -- 중계기
      AND IFNULL(b.nams_yn, '') != 'N'
      AND b.use_yn = 'Y'
      AND a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
    GROUP BY b.ATCL_CAT_CODE, a.LIFNR;

    START TRANSACTION;

    DELETE FROM t_mrcs_ppm_as WHERE asdivi ='ASREG' AND yyyy = @Year;

    -- 12개월 납품 수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE              AS category
             , a.LIFNR                      AS wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0101'), 11) AND CONCAT(@Year,'0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0201'), 11) AND CONCAT(@Year,'0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0301'), 11) AND CONCAT(@Year,'0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0401'), 11) AND CONCAT(@Year,'0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0501'), 11) AND CONCAT(@Year,'0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0601'), 11) AND CONCAT(@Year,'0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0701'), 11) AND CONCAT(@Year,'0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0801'), 11) AND CONCAT(@Year,'0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0901'), 11) AND CONCAT(@Year,'0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'1001'), 11) AND CONCAT(@Year,'1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'1101'), 11) AND CONCAT(@Year,'1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'1201'), 11) AND CONCAT(@Year,'1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year as yyyy
         , 'ASREG' as asdivi
         , ref.category
         , CNM.DISPLAY_NM
         , '12개월납품수량' as divi
         , '9' as seq
         , SUM(IFNULL(CTE.P_1, 0)) AS P_1
         , SUM(IFNULL(CTE.P_2, 0)) AS P_2
         , SUM(IFNULL(CTE.P_3, 0)) AS P_3
         , SUM(IFNULL(CTE.P_4, 0)) AS P_4
         , SUM(IFNULL(CTE.P_5, 0)) AS P_5
         , SUM(IFNULL(CTE.P_6, 0)) AS P_6
         , SUM(IFNULL(CTE.P_7, 0)) AS P_7
         , SUM(IFNULL(CTE.P_8, 0)) AS P_8
         , SUM(IFNULL(CTE.P_9, 0)) AS P_9
         , SUM(IFNULL(CTE.P_10, 0)) AS P_10
         , SUM(IFNULL(CTE.P_11, 0)) AS P_11
         , SUM(IFNULL(CTE.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 월납품수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE AS category
             , a.LIFNR                      AS wrkr_reg_no
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), MENGE, 0)), 0) P_1
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), MENGE, 0)), 0) P_2
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), MENGE, 0)), 0) P_3
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), MENGE, 0)), 0) P_4
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), MENGE, 0)), 0) P_5
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), MENGE, 0)), 0) P_6
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), MENGE, 0)), 0) P_7
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), MENGE, 0)), 0) P_8
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), MENGE, 0)), 0) P_9
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), MENGE, 0)), 0) P_10
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), MENGE, 0)), 0) P_11
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), MENGE, 0)), 0) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year AS yyyy
         , 'ASREG' AS asdivi
         , ref.category
         , CNM.DISPLAY_NM
         ,'월납품수량' AS divi
         , '8' AS seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- AS수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE              AS category
             , a.WRKR_REG_NO                AS wrkr_reg_no
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), 1, 0)), 0) C_1
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), 1, 0)), 0) C_2
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), 1, 0)), 0) C_3
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), 1, 0)), 0) C_4
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), 1, 0)), 0) C_5
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), 1, 0)), 0) C_6
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), 1, 0)), 0) C_7
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), 1, 0)), 0) C_8
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), 1, 0)), 0) C_9
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), 1, 0)), 0) C_10
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), 1, 0)), 0) C_11
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), 1, 0)), 0) C_12
        FROM T_LIN_MRCS_AS_INFO a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.ITEM_CODE = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          AND a.reg_ymd BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
          AND a.m_divi = 'M'
          AND IFNULL(b.nams_yn, '') != 'N'
          AND b.use_yn='Y'
          AND ABS(DATEDIFF(FIRST_SHIP_YMD, SUBSTRING(a.AS_REQ_DATE,1,8))) < 365
        group by b.ATCL_CAT_CODE, a.wrkr_reg_no
    )
    SELECT @Year AS yyyy
         , 'ASREG' as asdivi
         , ref.category
         , CNM.DISPLAY_NM
         , 'AS수량' as divi
         , '7' as seq
         , SUM(IFNULL(CTE.C_1, 0))  AS P_1
         , SUM(IFNULL(CTE.C_2, 0))  AS P_2
         , SUM(IFNULL(CTE.C_3, 0))  AS P_3
         , SUM(IFNULL(CTE.C_4, 0))  AS P_4
         , SUM(IFNULL(CTE.C_5, 0))  AS P_5
         , SUM(IFNULL(CTE.C_6, 0))  AS P_6
         , SUM(IFNULL(CTE.C_7, 0))  AS P_7
         , SUM(IFNULL(CTE.C_8, 0))  AS P_8
         , SUM(IFNULL(CTE.C_9, 0))  AS P_9
         , SUM(IFNULL(CTE.C_10, 0)) AS P_10
         , SUM(IFNULL(CTE.C_11, 0)) AS P_11
         , SUM(IFNULL(CTE.C_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S율(PPM)
    INSERT INTO t_mrcs_ppm_as
    SELECT @Year AS yyyy
         , 'ASREG' AS asdivi
         , T.category
         , T.spy_cmp_nm
         , 'A/S율(PPM)' AS divi
         , '6' AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    DELETE FROM t_mrcs_ppm_as  where asdivi ='ASREQ'  and yyyy = @Year;

    -- 12개월납품수량, 월납품수량. --> ASREG와 동일
    INSERT INTO t_mrcs_ppm_as
    SELECT yyyy
         , 'ASREQ' as asdivi
         , category
         , spy_cmp_nm
         , divi
         , seq
         , P_1
         , P_2
         , P_3
         , P_4
         , P_5
         , P_6
         , P_7
         , P_8
         , P_9
         , P_10
         , P_11
         , P_12
    FROM t_mrcs_ppm_as
    WHERE yyyy = @Year and seq in('9', '8');

    -- AS수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE   AS category
             , a.WRKR_REG_NO                AS wrkr_reg_no
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), 1, 0)), 0) C_1
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), 1, 0)), 0) C_2
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), 1, 0)), 0) C_3
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), 1, 0)), 0) C_4
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), 1, 0)), 0) C_5
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), 1, 0)), 0) C_6
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), 1, 0)), 0) C_7
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), 1, 0)), 0) C_8
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), 1, 0)), 0) C_9
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), 1, 0)), 0) C_10
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), 1, 0)), 0) C_11
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), 1, 0)), 0) C_12
        FROM T_LIN_MRCS_AS_INFO a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.ITEM_CODE = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          AND a.AS_REQ_DATE BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
          AND a.m_divi = 'M'
          AND IFNULL(b.nams_yn, '') != 'N'
          AND b.use_yn='Y'
          AND ABS(DATEDIFF(FIRST_SHIP_YMD, SUBSTRING(a.AS_REQ_DATE,1,8))) < 365
        group by b.ATCL_CAT_CODE, a.wrkr_reg_no
    )
    SELECT @Year AS yyyy
         , 'ASREQ' as asdivi
         , ref.category
         , CNM.DISPLAY_NM
         , 'AS수량' as divi
         , '7' as seq
         , SUM(IFNULL(CTE.C_1, 0))  AS P_1
         , SUM(IFNULL(CTE.C_2, 0))  AS P_2
         , SUM(IFNULL(CTE.C_3, 0))  AS P_3
         , SUM(IFNULL(CTE.C_4, 0))  AS P_4
         , SUM(IFNULL(CTE.C_5, 0))  AS P_5
         , SUM(IFNULL(CTE.C_6, 0))  AS P_6
         , SUM(IFNULL(CTE.C_7, 0))  AS P_7
         , SUM(IFNULL(CTE.C_8, 0))  AS P_8
         , SUM(IFNULL(CTE.C_9, 0))  AS P_9
         , SUM(IFNULL(CTE.C_10, 0)) AS P_10
         , SUM(IFNULL(CTE.C_11, 0)) AS P_11
         , SUM(IFNULL(CTE.C_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S율(PPM)
    INSERT INTO t_mrcs_ppm_as
    SELECT @Year AS yyyy
         , 'ASREQ' AS asdivi
         , T.category
         , T.SPY_CMP_NM
         , 'A/S율(PPM)' AS divi
         , '6' AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM t_mrcs_ppm_as
        WHERE YYYY = @Year
    )
    DELETE FROM t_mrcs_ppm_as T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT ASDIVI, CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
           AND filter.ASDIVI = T.ASDIVI
        );

    COMMIT;

    CALL SP_INSERT_MRCS_PPM_AS_NEW(@year);

    -- 중계기 전체 A/S율
    CALL SP_INSERT_MRCS_TOT_PPM_AS(@year);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_MRCS_PPM_AS_NEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_MRCS_PPM_AS_NEW`(IN year char(4))
    COMMENT 't_mrcs_ppm_as_new 입력'
BEGIN

    START TRANSACTION;

    DELETE FROM T_MRCS_PPM_AS_NEW WHERE yyyymm like CONCAT(`year`, '%');

    SET @month = 1;
    WHILE @month < 13 DO
            INSERT INTO T_MRCS_PPM_AS_NEW
            (
              YYYYMM			-- 년월
            , ASDIVI            -- AS 구분
            , CATEGORY          -- 물품분류 코드
            , SPY_CMP_NM        -- 공급업체 이름
            , SEQ               -- 통계유형코드
            , VALUE             -- 통계값
            )
            SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))
                 , ASDIVI
                 , CATEGORY
                 , SPY_CMP_NM
                 , SEQ
                 , CASE @month
                       WHEN 1 THEN P_1
                       WHEN 2 THEN P_2
                       WHEN 3 THEN P_3
                       WHEN 4 THEN P_4
                       WHEN 5 THEN P_5
                       WHEN 6 THEN P_6
                       WHEN 7 THEN P_7
                       WHEN 8 THEN P_8
                       WHEN 9 THEN P_9
                       WHEN 10 THEN P_10
                       WHEN 11 THEN P_11
                       ELSE P_12
                END
            FROM T_MRCS_PPM_AS WHERE yyyy = `year`;

            SET @month = @month + 1;
        END WHILE;

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_MRCS_TOT_PPM_AS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_MRCS_TOT_PPM_AS`(IN Year char(4))
    COMMENT 't_mrcs_tot_ppm_as 입력'
BEGIN

    SET @Year = `Year`;

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT DISTINCT YYYY
                  , CATEGORY
                  , SPY_CMP_NM
    FROM t_mrcs_ppm_as
    WHERE YYYY = @Year;

    START TRANSACTION;

    DELETE FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year;

    -- 월납품수량, A/S 수량
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT *
    FROM t_mrcs_ppm_as
    WHERE YYYY = @Year
      AND SEQ IN (7, 8);

    -- 총 납품수량 - 등록일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    WITH CTE AS (
        SELECT CATEGORY
             , SPY_CMP_NM
             , SUM(IF(YYYYMM <= CONCAT(@Year, '01'), VALUE, 0)) P_1
             , SUM(IF(YYYYMM <= CONCAT(@Year, '02'), VALUE, 0)) P_2
             , SUM(IF(YYYYMM <= CONCAT(@Year, '03'), VALUE, 0)) P_3
             , SUM(IF(YYYYMM <= CONCAT(@Year, '04'), VALUE, 0)) P_4
             , SUM(IF(YYYYMM <= CONCAT(@Year, '05'), VALUE, 0)) P_5
             , SUM(IF(YYYYMM <= CONCAT(@Year, '06'), VALUE, 0)) P_6
             , SUM(IF(YYYYMM <= CONCAT(@Year, '07'), VALUE, 0)) P_7
             , SUM(IF(YYYYMM <= CONCAT(@Year, '08'), VALUE, 0)) P_8
             , SUM(IF(YYYYMM <= CONCAT(@Year, '09'), VALUE, 0)) P_9
             , SUM(IF(YYYYMM <= CONCAT(@Year, '10'), VALUE, 0)) P_10
             , SUM(IF(YYYYMM <= CONCAT(@Year, '11'), VALUE, 0)) P_11
             , SUM(IF(YYYYMM <= CONCAT(@Year, '12'), VALUE, 0)) P_12
        FROM t_mrcs_ppm_as_new
        WHERE YYYYMM <= CONCAT(@Year, '12') AND ASDIVI = 'ASREG' AND SEQ = 8
        GROUP BY CATEGORY, SPY_CMP_NM
    )
    SELECT ref.yyyy
         , 'ASREG'           AS asdivi
         , ref.category
         , ref.spy_cmp_nm
         , '총납품수량'        AS divi
         , '9'               AS seq
         , IFNULL(cte.P_1,0) AS P_1
         , IFNULL(cte.P_2,0) AS P_2
         , IFNULL(cte.P_3,0) AS P_3
         , IFNULL(cte.P_4,0) AS P_4
         , IFNULL(cte.P_5,0) AS P_5
         , IFNULL(cte.P_6,0) AS P_6
         , IFNULL(cte.P_7,0) AS P_7
         , IFNULL(cte.P_8,0) AS P_8
         , IFNULL(cte.P_9,0) AS P_9
         , IFNULL(cte.P_10,0) AS P_10
         , IFNULL(cte.P_11,0) AS P_11
         , IFNULL(cte.P_12,0) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE ON CTE.category = ref.category AND CTE.spy_cmp_nm = ref.spy_cmp_nm;

    -- 총 납품수량 - 요청일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT yyyy
         , 'ASREQ' as asdivi
         , category
         , spy_cmp_nm
         , divi
         , seq
         , P_1
         , P_2
         , P_3
         , P_4
         , P_5
         , P_6
         , P_7
         , P_8
         , P_9
         , P_10
         , P_11
         , P_12
    FROM t_mrcs_tot_ppm_as
    WHERE yyyy = @Year
      AND ASDIVI = 'ASREG'
      AND seq = 9;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM t_mrcs_tot_ppm_as
        WHERE YYYY = @Year
    )
    DELETE FROM t_mrcs_tot_ppm_as T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT ASDIVI, CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
           AND filter.ASDIVI = T.ASDIVI
        );

    -- A/S율 - 등록일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT @Year       AS yyyy
         , 'ASREG'     AS asdivi
         , T.category
         , T.spy_cmp_nm
         , 'A/S율(PPM)'  AS divi
         , '6'           AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    -- A/S율 - AS요청일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT @Year AS yyyy
         , 'ASREQ' AS asdivi
         , T.category
         , T.SPY_CMP_NM
         , 'A/S율(PPM)' AS divi
         , '6' AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    COMMIT;

    CALL SP_INSERT_MRCS_TOT_PPM_AS_NEW(@year);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_MRCS_TOT_PPM_AS_NEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_MRCS_TOT_PPM_AS_NEW`(IN Year char(4))
    COMMENT 't_mrcs_tot_ppm_as_new 입력'
BEGIN

    START TRANSACTION;

    DELETE FROM T_MRCS_TOT_PPM_AS_NEW WHERE yyyymm like CONCAT(`Year`, '%');

    SET @month = 1;
    WHILE @month < 13 DO
            INSERT INTO T_MRCS_TOT_PPM_AS_NEW
            (
              YYYYMM			-- 년월
            , ASDIVI            -- AS 구분
            , CATEGORY          -- 물품분류코드
            , SPY_CMP_NM        -- 공급업체 이름
            , SEQ               -- 통계유형코드
            , VALUE             -- 통계값
            )
            SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))
                 , ASDIVI
                 , CATEGORY
                 , SPY_CMP_NM
                 , SEQ
                 , CASE @month
                       WHEN 1 THEN P_1
                       WHEN 2 THEN P_2
                       WHEN 3 THEN P_3
                       WHEN 4 THEN P_4
                       WHEN 5 THEN P_5
                       WHEN 6 THEN P_6
                       WHEN 7 THEN P_7
                       WHEN 8 THEN P_8
                       WHEN 9 THEN P_9
                       WHEN 10 THEN P_10
                       WHEN 11 THEN P_11
                       ELSE P_12
                END
            FROM T_MRCS_TOT_PPM_AS WHERE yyyy = `Year`;

            SET @month = @month + 1;
        END WHILE;

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_NAMS_NPR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NAMS_NPR`(IN Year char(4))
    COMMENT 't_nams_npr 입력'
BEGIN
    
    SET @Year = `Year`;
    SET @TargetStartDate = FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11);
    SET @TargetEndDate = CONCAT(@Year, '1231');

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT @Year           AS yyyy
         , b.ATCL_CAT_CODE AS CATEGORY
         , a.LIFNR         AS wrkr_reg_no
    FROM t_dlvr_cont a
             LEFT JOIN t_cmm_item_dtl b
                       on a.ATCL_CODE = b.ATCL_CODE
    WHERE b.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
      AND IFNULL(b.nams_yn, '') != 'N'
      AND b.USE_YN = 'Y'
      AND a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
    GROUP BY b.ATCL_CAT_CODE, a.LIFNR;

    START TRANSACTION;

    DELETE FROM T_NAMS_NPR where yyyy = @Year;

    -- 12개월납품수량
    INSERT INTO T_NAMS_NPR
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE   AS category
             , a.LIFNR           AS wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11) AND CONCAT(@Year, '0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0201'), 11) AND CONCAT(@Year, '0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0301'), 11) AND CONCAT(@Year, '0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0401'), 11) AND CONCAT(@Year, '0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0501'), 11) AND CONCAT(@Year, '0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0601'), 11) AND CONCAT(@Year, '0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0701'), 11) AND CONCAT(@Year, '0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0801'), 11) AND CONCAT(@Year, '0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0901'), 11) AND CONCAT(@Year, '0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1001'), 11) AND CONCAT(@Year, '1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1101'), 11) AND CONCAT(@Year, '1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1201'), 11) AND CONCAT(@Year, '1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT ref.yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , '12개월납품수량' AS divi
         , '9' AS seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF ref
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 월납품수량
    INSERT INTO T_NAMS_NPR
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE   AS category
             , a.LIFNR                      AS wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           on a.ATCL_CODE = b.ATCL_CODE
        where  b.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '1231')
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT ref.yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , '월납품수량' as divi
         , '8' as seq
         , SUM(IFNULL(cte.P_1, 0))  AS P_1
         , SUM(IFNULL(cte.P_2, 0))  AS P_2
         , SUM(IFNULL(cte.P_3, 0))  AS P_3
         , SUM(IFNULL(cte.P_4, 0))  AS P_4
         , SUM(IFNULL(cte.P_5, 0))  AS P_5
         , SUM(IFNULL(cte.P_6, 0))  AS P_6
         , SUM(IFNULL(cte.P_7, 0))  AS P_7
         , SUM(IFNULL(cte.P_8, 0))  AS P_8
         , SUM(IFNULL(cte.P_9, 0))  AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF ref
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S수량
    INSERT INTO T_NAMS_NPR
    WITH CTE AS (
        select cid.ATCL_CAT_CODE      AS category
             , a.PRD_CMP_WRKR_NO      AS wrkr_reg_no
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'0131'), 1, 0)) C_1
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0201') AND CONCAT(@Year,'0231'), 1, 0)) C_2
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0301') AND CONCAT(@Year,'0331'), 1, 0)) C_3
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0401') AND CONCAT(@Year,'0431'), 1, 0)) C_4
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0501') AND CONCAT(@Year,'0531'), 1, 0)) C_5
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0601') AND CONCAT(@Year,'0631'), 1, 0)) C_6
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0701') AND CONCAT(@Year,'0731'), 1, 0)) C_7
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0801') AND CONCAT(@Year,'0831'), 1, 0)) C_8
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0901') AND CONCAT(@Year,'0931'), 1, 0)) C_9
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'1001') AND CONCAT(@Year,'1031'), 1, 0)) C_10
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'1101') AND CONCAT(@Year,'1131'), 1, 0)) C_11
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'1201') AND CONCAT(@Year,'1231'), 1, 0)) C_12
        FROM T_LIN_NAMS_AS_INFO a
                 JOIN t_cmm_item_dtl cid on a.ATCL_CODE = cid.ATCL_CODE
        WHERE cid.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
          AND IFNULL(a.prd_ymd,a.REG_YMD) >= FC_YMD_MONTH_BEFORE(a.REG_YMD, 15)
          AND a.REG_YMD BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
        GROUP BY cid.ATCL_CAT_CODE, a.PRD_CMP_WRKR_NO
    )
    SELECT ref.yyyy
         , ref.category
         , CNM.DISPLAY_NM
         ,'AS수량' as divi
         ,'7' as seq
         ,SUM(IFNULL(cte.C_1,0))  AS C_1
         ,SUM(IFNULL(cte.C_2,0))  AS C_2
         ,SUM(IFNULL(cte.C_3,0))  AS C_3
         ,SUM(IFNULL(cte.C_4,0))  AS C_4
         ,SUM(IFNULL(cte.C_5,0))  AS C_5
         ,SUM(IFNULL(cte.C_6,0))  AS C_6
         ,SUM(IFNULL(cte.C_7,0))  AS C_7
         ,SUM(IFNULL(cte.C_8,0))  AS C_8
         ,SUM(IFNULL(cte.C_9,0))  AS C_9
         ,SUM(IFNULL(cte.C_10,0)) AS C_10
         ,SUM(IFNULL(cte.C_11,0)) AS C_11
         ,SUM(IFNULL(cte.C_12,0)) AS C_12
    FROM T_REF ref
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S율
    INSERT INTO T_NAMS_NPR
    SELECT T.yyyy
         , t.category
         , t.SPY_CMP_NM
         , 'A/S율(PPM)' as divi
         , '6' as seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM T_NAMS_NPR WHERE yyyy = @Year AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM T_NAMS_NPR WHERE yyyy = @Year AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM T_NAMS_NPR
        WHERE YYYY = @Year
    )
    DELETE FROM T_NAMS_NPR T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
        );

    COMMIT;

    CALL SP_INSERT_NAMS_NPR_NEW(@year);

    -- 주장비 전체
    CALL SP_INSERT_NAMS_TOT_NPR(@year);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_NAMS_NPR_06` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NAMS_NPR_06`(IN Year char(4))
    COMMENT 't_nams_npr_06 입력'
BEGIN

    SET @Year = `Year`;
    SET @TargetStartDate = FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11);
    SET @TargetEndDate = CONCAT(@Year, '1231');

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT b.ATCL_CAT_CODE as category
         , a.LIFNR as wrkr_reg_no
    from t_dlvr_cont a
             LEFT JOIN t_cmm_item_dtl b
                       ON a.atcl_code = b.atcl_code
    where b.ATCL_CAT_CODE LIKE '06%' -- 전송장비
      and IFNULL(b.nams_yn,'') != 'N'
      and b.use_yn='Y'
      and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
    GROUP BY b.ATCL_CAT_CODE, a.LIFNR;

    START TRANSACTION;

    DELETE FROM T_NAMS_NPR_06  where yyyy = @Year;

    -- 12개월 납품 수량
    INSERT INTO T_NAMS_NPR_06
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE as category
             , a.LIFNR as wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11) AND CONCAT(@Year, '0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0201'), 11) AND CONCAT(@Year, '0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0301'), 11) AND CONCAT(@Year, '0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0401'), 11) AND CONCAT(@Year, '0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0501'), 11) AND CONCAT(@Year, '0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0601'), 11) AND CONCAT(@Year, '0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0701'), 11) AND CONCAT(@Year, '0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0801'), 11) AND CONCAT(@Year, '0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0901'), 11) AND CONCAT(@Year, '0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1001'), 11) AND CONCAT(@Year, '1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1101'), 11) AND CONCAT(@Year, '1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1201'), 11) AND CONCAT(@Year, '1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '06%' -- 전송장비
          and IFNULL(b.nams_yn,'') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year as yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , '12개월납품수량' as divi
         , '9' as seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 월 납품 수량
    INSERT INTO T_NAMS_NPR_06
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE as category
             , a.LIFNR as wrkr_reg_no
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), MENGE, 0)), 0) P_1
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), MENGE, 0)), 0) P_2
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), MENGE, 0)), 0) P_3
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), MENGE, 0)), 0) P_4
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), MENGE, 0)), 0) P_5
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), MENGE, 0)), 0) P_6
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), MENGE, 0)), 0) P_7
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), MENGE, 0)), 0) P_8
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), MENGE, 0)), 0) P_9
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), MENGE, 0)), 0) P_10
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), MENGE, 0)), 0) P_11
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), MENGE, 0)), 0) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '06%' -- 전송장비
          and IFNULL(b.nams_yn,'') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year AS yyyy
         , ref.category
         , CNM.DISPLAY_NM
         ,'월납품수량' AS divi
         , '8' AS seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT OUTER JOIN CTE
                             ON CTE.category = ref.category
                                 AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- AS수량 - 월간
    INSERT INTO T_NAMS_NPR_06
    WITH CTE AS (
        SELECT cid.ATCL_CAT_CODE as category
             , a.PRD_CMP_WRKR_NO as wrkr_reg_no
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), 1, 0)) C_1
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), 1, 0)) C_2
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), 1, 0)) C_3
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), 1, 0)) C_4
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), 1, 0)) C_5
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), 1, 0)) C_6
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), 1, 0)) C_7
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), 1, 0)) C_8
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), 1, 0)) C_9
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), 1, 0)) C_10
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), 1, 0)) C_11
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), 1, 0)) C_12
        FROM T_LIN_NAMS_AS_INFO a
                 JOIN t_cmm_item_dtl cid on a.ATCL_CODE = cid.ATCL_CODE
        where a.REG_YMD BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
          AND cid.ATCL_CAT_CODE LIKE '06%' -- 전송장비
          and IFNULL(a.repr_ctn1,'') <> 'NTF'
          AND IFNULL(a.prd_ymd, a.REG_YMD) >= FC_YMD_MONTH_BEFORE(a.REG_YMD, 15)
        group by cid.ATCL_CAT_CODE, a.PRD_CMP_WRKR_NO
    )
    SELECT @Year AS yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , 'AS수량' as divi
         , '7' as seq
         , SUM(IFNULL(b.C_1,0)) AS C_1
         , SUM(IFNULL(b.C_2,0)) AS C_2
         , SUM(IFNULL(b.C_3,0)) AS C_3
         , SUM(IFNULL(b.C_4,0)) AS C_4
         , SUM(IFNULL(b.C_5,0)) AS C_5
         , SUM(IFNULL(b.C_6,0)) AS C_6
         , SUM(IFNULL(b.C_7,0)) AS C_7
         , SUM(IFNULL(b.C_8,0)) AS C_8
         , SUM(IFNULL(b.C_9,0)) AS C_9
         , SUM(IFNULL(b.C_10,0)) AS C_10
         , SUM(IFNULL(b.C_11,0)) AS C_11
         , SUM(IFNULL(b.C_12,0)) AS C_12
    FROM T_REF REF
             LEFT JOIN CTE b
                       ON REF.category = b.category AND ref.wrkr_reg_no = b.wrkr_reg_no
             LEFT JOIN t_cmp_name_map CNM
                       ON CNM.WRKR_REG_NO = REF.wrkr_reg_no
    WHERE CNM.WRKR_REG_NO IS NOT NULL
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM T_NAMS_NPR_06
        WHERE YYYY = @Year
    )
    DELETE FROM T_NAMS_NPR_06 T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
        );

    -- A/S율(PPM)
    INSERT INTO T_NAMS_NPR_06
    SELECT @Year AS yyyy
         , T.category
         , T.SPY_CMP_NM
         , 'A/S율(PPM)' as divi
         , '6' as seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM T_NAMS_NPR_06 WHERE yyyy = @Year AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM T_NAMS_NPR_06 WHERE yyyy = @Year AND seq = 7) AS A
                       ON T.category = A.category AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    COMMIT;

    CALL SP_INSERT_NAMS_NPR_06_NEW(@year);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_NAMS_NPR_06_NEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NAMS_NPR_06_NEW`(IN Year char(4))
    COMMENT 't_nams_npr_06_new 입력'
BEGIN
    
	START TRANSACTION;   
	
	DELETE FROM T_NAMS_NPR_06_NEW WHERE yyyymm like CONCAT(`Year`, '%');
    	
	SET @month = 1;  
	WHILE @month < 13 DO	
        INSERT INTO T_NAMS_NPR_06_NEW
        (
              YYYYMM			-- 년월
            , CATEGORY          -- 물품분류 코드
            , SPY_CMP_NM        -- 공급업체 이름
            , SEQ               -- 통계유형코드
            , VALUE		        -- 통계값
        )
        SELECT CONCAT(yyyy, LPAD(@month, 2, '0')) 
            , CATEGORY
            , SPY_CMP_NM
            , SEQ
            , CASE @month
                WHEN 1 THEN P_1
                WHEN 2 THEN P_2
                WHEN 3 THEN P_3
                WHEN 4 THEN P_4
                WHEN 5 THEN P_5
                WHEN 6 THEN P_6
                WHEN 7 THEN P_7
                WHEN 8 THEN P_8
                WHEN 9 THEN P_9
                WHEN 10 THEN P_10
                WHEN 11 THEN P_11
                ELSE P_12
              END
        FROM T_NAMS_NPR_06 WHERE yyyy = `Year`;
		
        SET @month = @month + 1;
    END WHILE;

    COMMIT;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_NAMS_NPR_NEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NAMS_NPR_NEW`(IN Year char(4))
    COMMENT 't_nams_npr_new 입력'
BEGIN

	START TRANSACTION;   
	
	DELETE FROM T_NAMS_NPR_NEW WHERE yyyymm like CONCAT(`Year`, '%');
	
	SET @month = 1;  
	WHILE @month < 13 DO	
        INSERT INTO T_NAMS_NPR_NEW
        (
              YYYYMM		-- 년월
            , CATEGORY		-- 분류
            , SPY_CMP_NM	-- 공급업체명
            , SEQ           -- 통계유형코드
            , VALUE		    -- 통계값
        )
        SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))   
            , CATEGORY
            , SPY_CMP_NM
            , seq
            , CASE @month
                WHEN 1 THEN P_1
                WHEN 2 THEN P_2
                WHEN 3 THEN P_3
                WHEN 4 THEN P_4
                WHEN 5 THEN P_5
                WHEN 6 THEN P_6
                WHEN 7 THEN P_7
                WHEN 8 THEN P_8
                WHEN 9 THEN P_9
                WHEN 10 THEN P_10
                WHEN 11 THEN P_11
                ELSE P_12 
              END
        FROM T_NAMS_NPR WHERE yyyy = `Year`;

        SET @month = @month + 1;
    END WHILE;

    COMMIT;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_NAMS_TOT_NPR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NAMS_TOT_NPR`(IN Year char(4))
    COMMENT 't_nams_tot_npr 입력'
BEGIN
    
    SET @Year = `Year`;

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT YYYY
         , A.CATEGORY
         , A.SPY_CMP_NM
    FROM t_nams_npr A
    WHERE SEQ = 9 AND YYYY = @Year;

    START TRANSACTION;

    DELETE FROM t_nams_tot_npr  WHERE yyyy = @Year;

    -- 총납품수량
    INSERT INTO t_nams_tot_npr
    WITH CTE AS (
        SELECT A.CATEGORY
             , A.SPY_CMP_NM
             , SUM(IF(YYYYMM <= CONCAT(@Year, '01'), VALUE, 0)) P_1
             , SUM(IF(YYYYMM <= CONCAT(@Year, '02'), VALUE, 0)) P_2
             , SUM(IF(YYYYMM <= CONCAT(@Year, '03'), VALUE, 0)) P_3
             , SUM(IF(YYYYMM <= CONCAT(@Year, '04'), VALUE, 0)) P_4
             , SUM(IF(YYYYMM <= CONCAT(@Year, '05'), VALUE, 0)) P_5
             , SUM(IF(YYYYMM <= CONCAT(@Year, '06'), VALUE, 0)) P_6
             , SUM(IF(YYYYMM <= CONCAT(@Year, '07'), VALUE, 0)) P_7
             , SUM(IF(YYYYMM <= CONCAT(@Year, '08'), VALUE, 0)) P_8
             , SUM(IF(YYYYMM <= CONCAT(@Year, '09'), VALUE, 0)) P_9
             , SUM(IF(YYYYMM <= CONCAT(@Year, '10'), VALUE, 0)) P_10
             , SUM(IF(YYYYMM <= CONCAT(@Year, '11'), VALUE, 0)) P_11
             , SUM(IF(YYYYMM <= CONCAT(@Year, '12'), VALUE, 0)) P_12
        FROM t_nams_npr_new A
        WHERE YYYYMM <= CONCAT(@Year, '12') AND SEQ = 8
        GROUP BY CATEGORY, SPY_CMP_NM
    )
    SELECT ref.yyyy
         , ref.category
         , ref.spy_cmp_nm
         , '총납품수량' AS divi
         , '9' AS seq
         , IFNULL(cte.P_1,0) AS P_1
         , IFNULL(cte.P_2,0) AS P_2
         , IFNULL(cte.P_3,0) AS P_3
         , IFNULL(cte.P_4,0) AS P_4
         , IFNULL(cte.P_5,0) AS P_5
         , IFNULL(cte.P_6,0) AS P_6
         , IFNULL(cte.P_7,0) AS P_7
         , IFNULL(cte.P_8,0) AS P_8
         , IFNULL(cte.P_9,0) AS P_9
         , IFNULL(cte.P_10,0) AS P_10
         , IFNULL(cte.P_11,0) AS P_11
         , IFNULL(cte.P_12,0) AS P_12
    FROM T_REF ref
             LEFT JOIN CTE ON CTE.category = ref.category AND CTE.SPY_CMP_NM = ref.SPY_CMP_NM;

    -- 월납품수량, A/S 수량
    INSERT INTO t_nams_tot_npr
    SELECT *
    FROM t_nams_npr
    WHERE YYYY = @Year
      AND SEQ IN (7, 8); -- 월납품수량, A/S 수량

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM T_NAMS_TOT_NPR
        WHERE YYYY = @Year
    )
    DELETE FROM T_NAMS_TOT_NPR T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
        );

    -- A/S율
    INSERT INTO t_nams_tot_npr
    SELECT T.yyyy
         , T.category
         , T.spy_cmp_nm
         ,'A/S율(PPM)' as divi
         ,'6' as seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM T_NAMS_TOT_NPR WHERE yyyy = @Year AND seq = 9) AS T -- 총 납품수량
             LEFT JOIN (SELECT * FROM T_NAMS_TOT_NPR WHERE yyyy = @Year AND seq = 7) AS A  -- AS 수량
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    COMMIT;

    CALL SP_INSERT_NAMS_TOT_NPR_NEW(@year);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_NAMS_TOT_NPR_NEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_NAMS_TOT_NPR_NEW`(IN Year char(4))
    COMMENT 't_nams_tot_npr_new 입력'
BEGIN
		
	START TRANSACTION;   
	
	DELETE FROM T_NAMS_TOT_NPR_NEW WHERE yyyymm like CONCAT(`Year`, '%');
	
	SET @month = 1;  
	WHILE @month < 13 DO		
        INSERT INTO T_NAMS_TOT_NPR_NEW
        (
              YYYYMM			-- 년월
            , CATEGORY		    -- 물품분류코드
            , SPY_CMP_NM		-- 공급업체명            
            , SEQ               -- 통계유형코드
            , VALUE		        -- 통계값
        )
        SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))           
            , CATEGORY
            , SPY_CMP_NM
            , seq
            , CASE @month 
                WHEN 1 THEN P_1
                WHEN 2 THEN P_2
                WHEN 3 THEN P_3
                WHEN 4 THEN P_4
                WHEN 5 THEN P_5
                WHEN 6 THEN P_6
                WHEN 7 THEN P_7
                WHEN 8 THEN P_8
                WHEN 9 THEN P_9
                WHEN 10 THEN P_10
                WHEN 11 THEN P_11
                ELSE P_12 
             END              
        FROM T_NAMS_TOT_NPR WHERE yyyy = `Year`;

        SET @month = @month + 1;
    END WHILE;

    COMMIT;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_SYSTEM_JOB_LOG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SYSTEM_JOB_LOG`(IN JOB_NAME varchar(30), IN CONFIGURATION varchar(512),
                                                              IN RESULT varchar(30), IN MESSAGE varchar(2048),
                                                              IN ARGUMENTS varchar(256), IN START_DATETIME datetime)
    COMMENT '작업 이력 추가'
BEGIN
    INSERT INTO t_log_system_job
    VALUES (
             NULL
           , JOB_NAME
           , @@hostname
           , CONFIGURATION
           , RESULT
           , MESSAGE
           , ARGUMENTS
           , START_DATETIME
           , NOW()
           , TIMESTAMPDIFF(SECOND,START_DATETIME,NOW())
           );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SET_JOB_STATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SET_JOB_STATE`(IN p_job_name varchar(30), IN p_host_name varchar(30),
                                                      IN p_state varchar(10), IN p_message varchar(512))
    COMMENT '작업 실행 상태'
BEGIN
    IF p_state = 'PAUSE' THEN
        UPDATE t_job_state
            SET STATE = p_state,
                HOSTNAME = null,
                MESSAGE = p_message,
                START_DATETIME = null,
                LAST_RUN_DATETIME = NOW()
        WHERE JOB_NAME = `p_job_name`;
    ELSE
        INSERT INTO t_job_state (JOB_NAME, HOSTNAME, STATE, MESSAGE, START_DATETIME)
            VALUE (p_job_name, p_host_name, p_state, p_message, NOW())
        ON DUPLICATE KEY UPDATE HOSTNAME = p_host_name,
                                STATE   = p_state,
                                MESSAGE = p_message,
                                START_DATETIME = NOW();

    END IF;

    -- 1시간이 넘게 걸리는 작업은 없는 가정하에, 혹시 1시간 이상 된 작업이 남아있다면 쓰레기 데이터로 보고 완료로 변경한다.
    UPDATE t_job_state
    SET STATE = 'PAUSE',
        HOSTNAME = null,
        MESSAGE = null,
        START_DATETIME = null,
        LAST_RUN_DATETIME = NOW()
    WHERE STATE = 'RUN' 
      AND TIMESTAMPDIFF(hour,  START_DATETIME,NOW()) > 1;        

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SET_ROLE_MENU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_bin */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SET_ROLE_MENU`(IN MenuId VARCHAR(50), IN RoleId VARCHAR(50))
    COMMENT '메뉴 role 권한 부여'
BEGIN

	START TRANSACTION;



	DELETE from sk_role_mapping_tbl 

    WHERE SK_ROLE_ID = RoleId

    and SK_TYPE = 'M';

   

   INSERT INTO sk_role_mapping_tbl	(SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)

	SELECT RoleId, sk_id, 'N/A', 'M', null, null

	FROM (

		WITH RECURSIVE child_nodes AS (

		    SELECT SK_ID

		    FROM sk_menu_tbl smt

		    WHERE SK_ID = MenuId

		    UNION ALL

		    SELECT t.SK_ID

		    FROM sk_menu_tbl t

		        INNER JOIN child_nodes cn 

		        ON cn.SK_ID = t.SK_PARENT_ID

		)

		SELECT SK_ID FROM child_nodes

	

	)

		



    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SYNC_SKTUSERS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SYNC_SKTUSERS`()
begin

    # 관리자 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select TargetId,'C55001',TargetId,'',TargetName,'02-6400-0000','010-0000-0000',TargetEmail,'M','CP000000','','C62003','N','','','','','','','','',TargetId,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('A');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'SKT0000001', TargetId, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('A');

    # SKT 커스텀 사용자 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select TargetId,'C55001',TargetId,'',TargetName,'02-6400-0000','010-0000-0000',TargetEmail,'M','CP000000','','C62003','N','','','','','','','','',TargetId,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('U');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', TargetId, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('U');

    # SKT 특정 사용자 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select b.EMPNO ,'C55001',b.EMPNO ,b.INDEPT,b.HNAME,b.TELNO,b.MOVETELNO,b.EMAIL,'M','CP000000','','C62003','N',b.JBGRP,b.JBRANK,b.JBCHARGE,b.HOLDOFFIDIVI,b.PLACE,'','','',b.EMPNO,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.EMPNO = a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('P');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', b.EMPNO, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.EMPNO = a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('P');

    # SKT 특정 부서 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select b.EMPNO ,'C55001',b.EMPNO ,b.INDEPT,b.HNAME,b.TELNO,b.MOVETELNO,b.EMAIL,'M','CP000000','','C62003','N',b.JBGRP,b.JBRANK,b.JBCHARGE,b.HOLDOFFIDIVI,b.PLACE,'','','',b.EMPNO,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.INDEPT=a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('D');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', b.EMPNO, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.INDEPT=a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('D');

		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_ERP_QLT_CERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ERP_QLT_CERT`(IN P_CTR_NO varchar(40), IN P_DLVDT_YMD varchar(40),
                                                            IN P_PLANT_CODE varchar(40), IN TYPE char,
                                                            IN MESSAGE varchar(50))
    COMMENT '품질인증번호 업데이트'
BEGIN

    IF TYPE = 'E' THEN
        UPDATE t_dlvr_exam_req
        SET QLT_CERT_MSG = MESSAGE,
            LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d')
        WHERE NEWEST_YN = 'Y'
          AND CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_auto_dlvr_cont
        SET QLT_CERT_MSG = MESSAGE
        WHERE CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_dlvr_erp_req
        SET QLT_CERT_MSG  = MESSAGE
          , APR_STATE_GBN = 'C25010'
          , ERP_SEND_YN   = 'N'
          , LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d')
        WHERE CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;
    ELSEIF TYPE = 'S' THEN
        UPDATE t_dlvr_exam_req
        SET QLT_CERT_CODE = MESSAGE,
            LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d'),
            QLT_CERT_MSG = NULL
        WHERE NEWEST_YN = 'Y'
          AND IFNULL(QLT_CERT_CODE, '') = ''
          AND CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_auto_dlvr_cont
        SET QLT_CERT_CODE = MESSAGE,
            QLT_CERT_MSG = NULL
        WHERE IFNULL(QLT_CERT_CODE, '') = ''
          AND CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_dlvr_erp_req
        SET QLT_CERT_CODE = MESSAGE
          , QLT_CERT_MSG = NULL
          , APR_STATE_GBN = 'C25020'
          , ERP_SEND_YN   = 'Y'
          , LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d')
        WHERE CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_cmm_item_class_name`
--

/*!50001 DROP VIEW IF EXISTS `v_cmm_item_class_name`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cmm_item_class_name` AS select 1 AS `ATCL_CAT_CODE`,1 AS `C1`,1 AS `C1_NM`,1 AS `C2`,1 AS `C2_NM`,1 AS `C3`,1 AS `C3_NM`,1 AS `C4`,1 AS `C4_NM`,1 AS `ATCL_CAT_NM` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dlvr_auto_cert_target`
--

/*!50001 DROP VIEW IF EXISTS `v_dlvr_auto_cert_target`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dlvr_auto_cert_target` AS select 1 AS `ZINSP_NO`,1 AS `EBELN`,1 AS `ZDELIV_DATE`,1 AS `WERKS`,1 AS `ZINSP_REQDATE`,1 AS `ZINSP_DATE`,1 AS `ZRESP_EMP`,1 AS `ZCONT_EMP` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dlvr_cont_tmp`
--

/*!50001 DROP VIEW IF EXISTS `v_dlvr_cont_tmp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dlvr_cont_tmp` AS select 1 AS `ctr_no`,1 AS `sno`,1 AS `DELIVN`,1 AS `DELIVP`,1 AS `EBELN`,1 AS `EBELP`,1 AS `BSART`,1 AS `ZZTITL`,1 AS `ZZPODT`,1 AS `KDATB`,1 AS `KDATE`,1 AS `AFNAM`,1 AS `KTEXT`,1 AS `ORDERMAN`,1 AS `LIFNR`,1 AS `NAME1`,1 AS `WERS`,1 AS `ZZM001`,1 AS `ZZM002`,1 AS `ZZM003`,1 AS `ZZM004`,1 AS `ZZX001`,1 AS `ZZX002`,1 AS `ZZX003`,1 AS `ZZPRD1`,1 AS `MATKL`,1 AS `MATNR`,1 AS `TXZ01`,1 AS `MENGE`,1 AS `MEINS`,1 AS `NETPR`,1 AS `PRICE`,1 AS `EINDT`,1 AS `WERKS`,1 AS `NAME11`,1 AS `IDNLF`,1 AS `BANFN`,1 AS `AUFNR`,1 AS `KTEXT1`,1 AS `KNTTP`,1 AS `KNTTX`,1 AS `FLAG`,1 AS `AEDAT`,1 AS `UNAME`,1 AS `NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dlvr_exam_data`
--

/*!50001 DROP VIEW IF EXISTS `v_dlvr_exam_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dlvr_exam_data` AS select 1 AS `DLVR_REC_NO`,1 AS `EQI_SERI_NO`,1 AS `SERIAL_PASS`,1 AS `EXAM_VALUE1`,1 AS `EXAM_VALUE2`,1 AS `EXAM_VALUE3`,1 AS `EXAM_VALUE4`,1 AS `EXAM_VALUE5`,1 AS `EXAM_VALUE6`,1 AS `EXAM_VALUE7`,1 AS `EXAM_VALUE8`,1 AS `EXAM_VALUE9`,1 AS `EXAM_VALUE10`,1 AS `EXAM_VALUE11`,1 AS `EXAM_VALUE12`,1 AS `EXAM_VALUE13`,1 AS `EXAM_VALUE14`,1 AS `EXAM_VALUE15`,1 AS `EXAM_VALUE16`,1 AS `EXAM_VALUE17`,1 AS `EXAM_VALUE18`,1 AS `EXAM_VALUE19`,1 AS `EXAM_VALUE20`,1 AS `EXAM_VALUE21`,1 AS `EXAM_VALUE22`,1 AS `EXAM_VALUE23`,1 AS `EXAM_VALUE24`,1 AS `EXAM_VALUE25`,1 AS `EXAM_VALUE26`,1 AS `EXAM_VALUE27`,1 AS `EXAM_VALUE28`,1 AS `EXAM_VALUE29`,1 AS `EXAM_VALUE30`,1 AS `EXAM_VALUE31`,1 AS `EXAM_VALUE32`,1 AS `EXAM_VALUE33`,1 AS `EXAM_VALUE34`,1 AS `EXAM_VALUE35`,1 AS `EXAM_VALUE36`,1 AS `EXAM_VALUE37`,1 AS `EXAM_VALUE38`,1 AS `EXAM_VALUE39`,1 AS `EXAM_VALUE40`,1 AS `EXAM_VALUE41`,1 AS `EXAM_VALUE42`,1 AS `EXAM_VALUE43`,1 AS `EXAM_VALUE44`,1 AS `EXAM_VALUE45`,1 AS `EXAM_VALUE46`,1 AS `EXAM_VALUE47`,1 AS `EXAM_VALUE48`,1 AS `EXAM_VALUE49`,1 AS `EXAM_VALUE50`,1 AS `EXAM_VALUE51`,1 AS `EXAM_VALUE52`,1 AS `EXAM_VALUE53`,1 AS `EXAM_VALUE54`,1 AS `EXAM_VALUE55`,1 AS `EXAM_VALUE56`,1 AS `EXAM_VALUE57`,1 AS `EXAM_VALUE58`,1 AS `EXAM_VALUE59`,1 AS `EXAM_VALUE60`,1 AS `EXAM_VALUE61`,1 AS `EXAM_VALUE62`,1 AS `EXAM_VALUE63`,1 AS `EXAM_VALUE64`,1 AS `EXAM_VALUE65`,1 AS `EXAM_VALUE66`,1 AS `EXAM_VALUE67`,1 AS `EXAM_VALUE68`,1 AS `EXAM_VALUE69`,1 AS `EXAM_VALUE70`,1 AS `EXAM_VALUE71`,1 AS `EXAM_VALUE72`,1 AS `EXAM_VALUE73`,1 AS `EXAM_VALUE74`,1 AS `EXAM_VALUE75`,1 AS `EXAM_VALUE76`,1 AS `EXAM_VALUE77`,1 AS `EXAM_VALUE78`,1 AS `EXAM_VALUE79`,1 AS `EXAM_VALUE80`,1 AS `EXAM_VALUE81`,1 AS `EXAM_VALUE82`,1 AS `EXAM_VALUE83`,1 AS `EXAM_VALUE84`,1 AS `EXAM_VALUE85`,1 AS `EXAM_VALUE86`,1 AS `EXAM_VALUE87`,1 AS `EXAM_VALUE88`,1 AS `EXAM_VALUE89`,1 AS `EXAM_VALUE90`,1 AS `EXAM_VALUE91`,1 AS `EXAM_VALUE92`,1 AS `EXAM_VALUE93`,1 AS `EXAM_VALUE94`,1 AS `EXAM_VALUE95`,1 AS `EXAM_VALUE96`,1 AS `EXAM_VALUE97`,1 AS `EXAM_VALUE98`,1 AS `EXAM_VALUE99`,1 AS `EXAM_VALUE100`,1 AS `EXAM_VALUE101`,1 AS `EXAM_VALUE102`,1 AS `EXAM_VALUE103`,1 AS `EXAM_VALUE104`,1 AS `EXAM_VALUE105`,1 AS `EXAM_VALUE106`,1 AS `EXAM_VALUE107`,1 AS `EXAM_VALUE108`,1 AS `EXAM_VALUE109`,1 AS `EXAM_VALUE110`,1 AS `EXAM_VALUE111`,1 AS `EXAM_VALUE112`,1 AS `EXAM_VALUE113`,1 AS `EXAM_VALUE114`,1 AS `EXAM_VALUE115`,1 AS `EXAM_VALUE116`,1 AS `EXAM_VALUE117`,1 AS `EXAM_VALUE118`,1 AS `EXAM_VALUE119`,1 AS `EXAM_VALUE120`,1 AS `EXAM_VALUE121`,1 AS `EXAM_VALUE122`,1 AS `EXAM_VALUE123`,1 AS `EXAM_VALUE124`,1 AS `EXAM_VALUE125`,1 AS `EXAM_VALUE126`,1 AS `EXAM_VALUE127`,1 AS `EXAM_VALUE128`,1 AS `EXAM_VALUE129`,1 AS `EXAM_VALUE130`,1 AS `EXAM_VALUE131`,1 AS `EXAM_VALUE132`,1 AS `EXAM_VALUE133`,1 AS `EXAM_VALUE134`,1 AS `EXAM_VALUE135`,1 AS `EXAM_VALUE136`,1 AS `EXAM_VALUE137`,1 AS `EXAM_VALUE138`,1 AS `EXAM_VALUE139`,1 AS `EXAM_VALUE140`,1 AS `EXAM_VALUE141`,1 AS `EXAM_VALUE142`,1 AS `EXAM_VALUE143`,1 AS `EXAM_VALUE144`,1 AS `EXAM_VALUE145`,1 AS `EXAM_VALUE146`,1 AS `EXAM_VALUE147`,1 AS `EXAM_VALUE148`,1 AS `EXAM_VALUE149`,1 AS `EXAM_VALUE150`,1 AS `EXAM_VALUE151`,1 AS `EXAM_VALUE152`,1 AS `EXAM_VALUE153`,1 AS `EXAM_VALUE154`,1 AS `EXAM_VALUE155`,1 AS `EXAM_VALUE156`,1 AS `EXAM_VALUE157`,1 AS `EXAM_VALUE158`,1 AS `EXAM_VALUE159`,1 AS `EXAM_VALUE160`,1 AS `EXAM_VALUE161`,1 AS `EXAM_VALUE162`,1 AS `EXAM_VALUE163`,1 AS `EXAM_VALUE164`,1 AS `EXAM_VALUE165`,1 AS `EXAM_VALUE166`,1 AS `EXAM_VALUE167`,1 AS `EXAM_VALUE168`,1 AS `EXAM_VALUE169`,1 AS `EXAM_VALUE170`,1 AS `EXAM_VALUE171`,1 AS `EXAM_VALUE172`,1 AS `EXAM_VALUE173`,1 AS `EXAM_VALUE174`,1 AS `EXAM_VALUE175`,1 AS `EXAM_VALUE176`,1 AS `EXAM_VALUE177`,1 AS `EXAM_VALUE178`,1 AS `EXAM_VALUE179`,1 AS `EXAM_VALUE180`,1 AS `EXAM_VALUE181`,1 AS `EXAM_VALUE182`,1 AS `EXAM_VALUE183`,1 AS `EXAM_VALUE184`,1 AS `EXAM_VALUE185`,1 AS `EXAM_VALUE186`,1 AS `EXAM_VALUE187`,1 AS `EXAM_VALUE188`,1 AS `EXAM_VALUE189`,1 AS `EXAM_VALUE190`,1 AS `EXAM_VALUE191`,1 AS `EXAM_VALUE192`,1 AS `EXAM_VALUE193`,1 AS `EXAM_VALUE194`,1 AS `EXAM_VALUE195`,1 AS `EXAM_VALUE196`,1 AS `EXAM_VALUE197`,1 AS `EXAM_VALUE198`,1 AS `EXAM_VALUE199`,1 AS `EXAM_VALUE200`,1 AS `EXAM_VALUE201`,1 AS `EXAM_VALUE202`,1 AS `EXAM_VALUE203`,1 AS `EXAM_VALUE204`,1 AS `EXAM_VALUE205`,1 AS `EXAM_VALUE206`,1 AS `EXAM_VALUE207`,1 AS `EXAM_VALUE208`,1 AS `EXAM_VALUE209`,1 AS `EXAM_VALUE210`,1 AS `EXAM_VALUE211`,1 AS `EXAM_VALUE212`,1 AS `EXAM_VALUE213`,1 AS `EXAM_VALUE214`,1 AS `EXAM_VALUE215`,1 AS `EXAM_VALUE216`,1 AS `EXAM_VALUE217`,1 AS `EXAM_VALUE218`,1 AS `EXAM_VALUE219`,1 AS `EXAM_VALUE220`,1 AS `EXAM_VALUE221`,1 AS `EXAM_VALUE222`,1 AS `EXAM_VALUE223`,1 AS `EXAM_VALUE224`,1 AS `EXAM_VALUE225`,1 AS `EXAM_VALUE226`,1 AS `EXAM_VALUE227`,1 AS `EXAM_VALUE228`,1 AS `EXAM_VALUE229`,1 AS `EXAM_VALUE230`,1 AS `EXAM_VALUE231`,1 AS `EXAM_VALUE232`,1 AS `EXAM_VALUE233`,1 AS `EXAM_VALUE234`,1 AS `EXAM_VALUE235`,1 AS `EXAM_VALUE236`,1 AS `EXAM_VALUE237`,1 AS `EXAM_VALUE238`,1 AS `EXAM_VALUE239`,1 AS `EXAM_VALUE240`,1 AS `EXAM_VALUE241`,1 AS `EXAM_VALUE242`,1 AS `EXAM_VALUE243`,1 AS `EXAM_VALUE244`,1 AS `EXAM_VALUE245`,1 AS `EXAM_VALUE246`,1 AS `EXAM_VALUE247`,1 AS `EXAM_VALUE248`,1 AS `EXAM_VALUE249`,1 AS `EXAM_VALUE250`,1 AS `EXAM_VALUE251`,1 AS `EXAM_VALUE252`,1 AS `EXAM_VALUE253`,1 AS `EXAM_VALUE254`,1 AS `EXAM_VALUE255`,1 AS `EXAM_VALUE256`,1 AS `EXAM_VALUE257`,1 AS `EXAM_VALUE258`,1 AS `EXAM_VALUE259`,1 AS `EXAM_VALUE260`,1 AS `EXAM_VALUE261`,1 AS `EXAM_VALUE262`,1 AS `EXAM_VALUE263`,1 AS `EXAM_VALUE264`,1 AS `EXAM_VALUE265`,1 AS `EXAM_VALUE266`,1 AS `EXAM_VALUE267`,1 AS `EXAM_VALUE268`,1 AS `EXAM_VALUE269`,1 AS `EXAM_VALUE270`,1 AS `EXAM_VALUE271`,1 AS `EXAM_VALUE272`,1 AS `EXAM_VALUE273`,1 AS `EXAM_VALUE274`,1 AS `EXAM_VALUE275`,1 AS `EXAM_VALUE276`,1 AS `EXAM_VALUE277`,1 AS `EXAM_VALUE278`,1 AS `EXAM_VALUE279`,1 AS `EXAM_VALUE280`,1 AS `EXAM_VALUE281`,1 AS `EXAM_VALUE282`,1 AS `EXAM_VALUE283`,1 AS `EXAM_VALUE284`,1 AS `EXAM_VALUE285`,1 AS `EXAM_VALUE286`,1 AS `EXAM_VALUE287`,1 AS `EXAM_VALUE288`,1 AS `EXAM_VALUE289`,1 AS `EXAM_VALUE290`,1 AS `EXAM_VALUE291`,1 AS `EXAM_VALUE292`,1 AS `EXAM_VALUE293`,1 AS `EXAM_VALUE294`,1 AS `EXAM_VALUE295`,1 AS `EXAM_VALUE296`,1 AS `EXAM_VALUE297`,1 AS `EXAM_VALUE298`,1 AS `EXAM_VALUE299`,1 AS `EXAM_VALUE300`,1 AS `EXAM_VALUE301`,1 AS `EXAM_VALUE302`,1 AS `EXAM_VALUE303`,1 AS `EXAM_VALUE304`,1 AS `EXAM_VALUE305`,1 AS `EXAM_VALUE306`,1 AS `EXAM_VALUE307`,1 AS `EXAM_VALUE308`,1 AS `EXAM_VALUE309`,1 AS `EXAM_VALUE310`,1 AS `EXAM_VALUE311`,1 AS `EXAM_VALUE312`,1 AS `EXAM_VALUE313`,1 AS `EXAM_VALUE314`,1 AS `EXAM_VALUE315`,1 AS `EXAM_VALUE316`,1 AS `EXAM_VALUE317`,1 AS `EXAM_VALUE318`,1 AS `EXAM_VALUE319`,1 AS `EXAM_VALUE320`,1 AS `EXAM_VALUE321`,1 AS `EXAM_VALUE322`,1 AS `EXAM_VALUE323`,1 AS `EXAM_VALUE324`,1 AS `EXAM_VALUE325`,1 AS `EXAM_VALUE326`,1 AS `EXAM_VALUE327`,1 AS `EXAM_VALUE328`,1 AS `EXAM_VALUE329`,1 AS `EXAM_VALUE330`,1 AS `EXAM_VALUE331`,1 AS `EXAM_VALUE332`,1 AS `EXAM_VALUE333`,1 AS `EXAM_VALUE334`,1 AS `EXAM_VALUE335`,1 AS `EXAM_VALUE336`,1 AS `EXAM_VALUE337`,1 AS `EXAM_VALUE338`,1 AS `EXAM_VALUE339`,1 AS `EXAM_VALUE340`,1 AS `EXAM_VALUE341`,1 AS `EXAM_VALUE342`,1 AS `EXAM_VALUE343`,1 AS `EXAM_VALUE344`,1 AS `EXAM_VALUE345`,1 AS `EXAM_VALUE346`,1 AS `EXAM_VALUE347`,1 AS `EXAM_VALUE348`,1 AS `EXAM_VALUE349`,1 AS `EXAM_VALUE350`,1 AS `EXAM_VALUE351`,1 AS `EXAM_VALUE352`,1 AS `EXAM_VALUE353`,1 AS `EXAM_VALUE354`,1 AS `EXAM_VALUE355`,1 AS `EXAM_VALUE356`,1 AS `EXAM_VALUE357`,1 AS `EXAM_VALUE358`,1 AS `EXAM_VALUE359`,1 AS `EXAM_VALUE360`,1 AS `EXAM_VALUE361`,1 AS `EXAM_VALUE362`,1 AS `EXAM_VALUE363`,1 AS `EXAM_VALUE364`,1 AS `EXAM_VALUE365`,1 AS `EXAM_VALUE366`,1 AS `EXAM_VALUE367`,1 AS `EXAM_VALUE368`,1 AS `EXAM_VALUE369`,1 AS `EXAM_VALUE370`,1 AS `EXAM_VALUE371`,1 AS `EXAM_VALUE372`,1 AS `EXAM_VALUE373`,1 AS `EXAM_VALUE374`,1 AS `EXAM_VALUE375`,1 AS `EXAM_VALUE376`,1 AS `EXAM_VALUE377`,1 AS `EXAM_VALUE378`,1 AS `EXAM_VALUE379`,1 AS `EXAM_VALUE380`,1 AS `EXAM_VALUE381`,1 AS `EXAM_VALUE382`,1 AS `EXAM_VALUE383`,1 AS `EXAM_VALUE384`,1 AS `EXAM_VALUE385`,1 AS `EXAM_VALUE386`,1 AS `EXAM_VALUE387`,1 AS `EXAM_VALUE388`,1 AS `EXAM_VALUE389`,1 AS `EXAM_VALUE390`,1 AS `EXAM_VALUE391`,1 AS `EXAM_VALUE392`,1 AS `EXAM_VALUE393`,1 AS `EXAM_VALUE394`,1 AS `EXAM_VALUE395`,1 AS `EXAM_VALUE396`,1 AS `EXAM_VALUE397`,1 AS `EXAM_VALUE398`,1 AS `EXAM_VALUE399`,1 AS `EXAM_VALUE400`,1 AS `EXAM_VALUE401`,1 AS `EXAM_VALUE402`,1 AS `EXAM_VALUE403`,1 AS `EXAM_VALUE404`,1 AS `EXAM_VALUE405`,1 AS `EXAM_VALUE406`,1 AS `EXAM_VALUE407`,1 AS `EXAM_VALUE408`,1 AS `EXAM_VALUE409`,1 AS `EXAM_VALUE410`,1 AS `EXAM_VALUE411`,1 AS `EXAM_VALUE412`,1 AS `EXAM_VALUE413`,1 AS `EXAM_VALUE414`,1 AS `EXAM_VALUE415`,1 AS `EXAM_VALUE416`,1 AS `EXAM_VALUE417`,1 AS `EXAM_VALUE418`,1 AS `EXAM_VALUE419`,1 AS `EXAM_VALUE420`,1 AS `EXAM_VALUE421`,1 AS `EXAM_VALUE422`,1 AS `EXAM_VALUE423`,1 AS `EXAM_VALUE424`,1 AS `EXAM_VALUE425`,1 AS `EXAM_VALUE426`,1 AS `EXAM_VALUE427`,1 AS `EXAM_VALUE428`,1 AS `EXAM_VALUE429`,1 AS `EXAM_VALUE430`,1 AS `EXAM_VALUE431`,1 AS `EXAM_VALUE432`,1 AS `EXAM_VALUE433`,1 AS `EXAM_VALUE434`,1 AS `EXAM_VALUE435`,1 AS `EXAM_VALUE436`,1 AS `EXAM_VALUE437`,1 AS `EXAM_VALUE438`,1 AS `EXAM_VALUE439`,1 AS `EXAM_VALUE440`,1 AS `EXAM_VALUE441`,1 AS `EXAM_VALUE442`,1 AS `EXAM_VALUE443`,1 AS `EXAM_VALUE444`,1 AS `EXAM_VALUE445`,1 AS `EXAM_VALUE446`,1 AS `EXAM_VALUE447`,1 AS `EXAM_VALUE448`,1 AS `EXAM_VALUE449`,1 AS `EXAM_VALUE450`,1 AS `EXAM_VALUE451`,1 AS `EXAM_VALUE452`,1 AS `EXAM_VALUE453`,1 AS `EXAM_VALUE454`,1 AS `EXAM_VALUE455`,1 AS `EXAM_VALUE456`,1 AS `EXAM_VALUE457`,1 AS `EXAM_VALUE458`,1 AS `EXAM_VALUE459`,1 AS `EXAM_VALUE460`,1 AS `EXAM_VALUE461`,1 AS `EXAM_VALUE462`,1 AS `EXAM_VALUE463`,1 AS `EXAM_VALUE464`,1 AS `EXAM_VALUE465`,1 AS `EXAM_VALUE466`,1 AS `EXAM_VALUE467`,1 AS `EXAM_VALUE468`,1 AS `EXAM_VALUE469`,1 AS `EXAM_VALUE470`,1 AS `EXAM_VALUE471`,1 AS `EXAM_VALUE472`,1 AS `EXAM_VALUE473`,1 AS `EXAM_VALUE474`,1 AS `EXAM_VALUE475`,1 AS `EXAM_VALUE476`,1 AS `EXAM_VALUE477`,1 AS `EXAM_VALUE478`,1 AS `EXAM_VALUE479`,1 AS `EXAM_VALUE480`,1 AS `EXAM_VALUE481`,1 AS `EXAM_VALUE482`,1 AS `EXAM_VALUE483`,1 AS `EXAM_VALUE484`,1 AS `EXAM_VALUE485`,1 AS `EXAM_VALUE486`,1 AS `EXAM_VALUE487`,1 AS `EXAM_VALUE488`,1 AS `EXAM_VALUE489`,1 AS `EXAM_VALUE490`,1 AS `EXAM_VALUE491`,1 AS `EXAM_VALUE492`,1 AS `EXAM_VALUE493`,1 AS `EXAM_VALUE494`,1 AS `EXAM_VALUE495`,1 AS `EXAM_VALUE496`,1 AS `EXAM_VALUE497`,1 AS `EXAM_VALUE498`,1 AS `EXAM_VALUE499`,1 AS `EXAM_VALUE500`,1 AS `EXAM_VALUE501`,1 AS `EXAM_VALUE502`,1 AS `EXAM_VALUE503`,1 AS `EXAM_VALUE504`,1 AS `EXAM_VALUE505`,1 AS `EXAM_VALUE506`,1 AS `EXAM_VALUE507`,1 AS `EXAM_VALUE508`,1 AS `EXAM_VALUE509`,1 AS `EXAM_VALUE510`,1 AS `EXAM_VALUE511`,1 AS `EXAM_VALUE512`,1 AS `EXAM_VALUE513`,1 AS `EXAM_VALUE514`,1 AS `EXAM_VALUE515`,1 AS `EXAM_VALUE516`,1 AS `EXAM_VALUE517`,1 AS `EXAM_VALUE518`,1 AS `EXAM_VALUE519`,1 AS `EXAM_VALUE520`,1 AS `EXAM_VALUE521`,1 AS `EXAM_VALUE522`,1 AS `EXAM_VALUE523`,1 AS `EXAM_VALUE524`,1 AS `EXAM_VALUE525`,1 AS `EXAM_VALUE526`,1 AS `EXAM_VALUE527`,1 AS `EXAM_VALUE528`,1 AS `EXAM_VALUE529`,1 AS `EXAM_VALUE530`,1 AS `EXAM_VALUE531`,1 AS `EXAM_VALUE532`,1 AS `EXAM_VALUE533`,1 AS `EXAM_VALUE534`,1 AS `EXAM_VALUE535`,1 AS `EXAM_VALUE536`,1 AS `EXAM_VALUE537`,1 AS `EXAM_VALUE538`,1 AS `EXAM_VALUE539`,1 AS `EXAM_VALUE540`,1 AS `EXAM_VALUE541`,1 AS `EXAM_VALUE542`,1 AS `EXAM_VALUE543`,1 AS `EXAM_VALUE544`,1 AS `EXAM_VALUE545`,1 AS `EXAM_VALUE546`,1 AS `EXAM_VALUE547`,1 AS `EXAM_VALUE548`,1 AS `EXAM_VALUE549`,1 AS `EXAM_VALUE550`,1 AS `EXAM_VALUE551`,1 AS `EXAM_VALUE552`,1 AS `EXAM_VALUE553`,1 AS `EXAM_VALUE554`,1 AS `EXAM_VALUE555`,1 AS `EXAM_VALUE556`,1 AS `EXAM_VALUE557`,1 AS `EXAM_VALUE558`,1 AS `EXAM_VALUE559`,1 AS `EXAM_VALUE560`,1 AS `EXAM_VALUE561`,1 AS `EXAM_VALUE562`,1 AS `EXAM_VALUE563`,1 AS `EXAM_VALUE564`,1 AS `EXAM_VALUE565`,1 AS `EXAM_VALUE566`,1 AS `EXAM_VALUE567`,1 AS `EXAM_VALUE568`,1 AS `EXAM_VALUE569`,1 AS `EXAM_VALUE570`,1 AS `EXAM_VALUE571`,1 AS `EXAM_VALUE572`,1 AS `EXAM_VALUE573`,1 AS `EXAM_VALUE574`,1 AS `EXAM_VALUE575`,1 AS `EXAM_VALUE576`,1 AS `EXAM_VALUE577`,1 AS `EXAM_VALUE578`,1 AS `EXAM_VALUE579`,1 AS `EXAM_VALUE580`,1 AS `EXAM_VALUE581`,1 AS `EXAM_VALUE582`,1 AS `EXAM_VALUE583`,1 AS `EXAM_VALUE584`,1 AS `EXAM_VALUE585`,1 AS `EXAM_VALUE586`,1 AS `EXAM_VALUE587`,1 AS `EXAM_VALUE588`,1 AS `EXAM_VALUE589`,1 AS `EXAM_VALUE590`,1 AS `EXAM_VALUE591`,1 AS `EXAM_VALUE592`,1 AS `EXAM_VALUE593`,1 AS `EXAM_VALUE594`,1 AS `EXAM_VALUE595`,1 AS `EXAM_VALUE596`,1 AS `EXAM_VALUE597`,1 AS `EXAM_VALUE598`,1 AS `EXAM_VALUE599`,1 AS `EXAM_VALUE600`,1 AS `EXAM_VALUE601`,1 AS `EXAM_VALUE602`,1 AS `EXAM_VALUE603`,1 AS `EXAM_VALUE604`,1 AS `EXAM_VALUE605`,1 AS `EXAM_VALUE606`,1 AS `EXAM_VALUE607`,1 AS `EXAM_VALUE608`,1 AS `EXAM_VALUE609`,1 AS `EXAM_VALUE610`,1 AS `EXAM_VALUE611`,1 AS `EXAM_VALUE612`,1 AS `EXAM_VALUE613`,1 AS `EXAM_VALUE614`,1 AS `EXAM_VALUE615`,1 AS `EXAM_VALUE616`,1 AS `EXAM_VALUE617`,1 AS `EXAM_VALUE618`,1 AS `EXAM_VALUE619`,1 AS `EXAM_VALUE620`,1 AS `EXAM_VALUE621`,1 AS `EXAM_VALUE622`,1 AS `EXAM_VALUE623`,1 AS `EXAM_VALUE624`,1 AS `EXAM_VALUE625`,1 AS `EXAM_VALUE626`,1 AS `EXAM_VALUE627`,1 AS `EXAM_VALUE628`,1 AS `EXAM_VALUE629`,1 AS `EXAM_VALUE630`,1 AS `EXAM_VALUE631`,1 AS `EXAM_VALUE632`,1 AS `EXAM_VALUE633`,1 AS `EXAM_VALUE634`,1 AS `EXAM_VALUE635`,1 AS `EXAM_VALUE636`,1 AS `EXAM_VALUE637`,1 AS `EXAM_VALUE638`,1 AS `EXAM_VALUE639`,1 AS `EXAM_VALUE640`,1 AS `EXAM_VALUE641`,1 AS `EXAM_VALUE642`,1 AS `EXAM_VALUE643`,1 AS `EXAM_VALUE644`,1 AS `EXAM_VALUE645`,1 AS `EXAM_VALUE646`,1 AS `EXAM_VALUE647`,1 AS `EXAM_VALUE648`,1 AS `EXAM_VALUE649`,1 AS `EXAM_VALUE650`,1 AS `EXAM_VALUE651`,1 AS `EXAM_VALUE652`,1 AS `EXAM_VALUE653`,1 AS `EXAM_VALUE654`,1 AS `EXAM_VALUE655`,1 AS `EXAM_VALUE656`,1 AS `EXAM_VALUE657`,1 AS `EXAM_VALUE658`,1 AS `EXAM_VALUE659`,1 AS `EXAM_VALUE660`,1 AS `EXAM_VALUE661`,1 AS `EXAM_VALUE662`,1 AS `EXAM_VALUE663`,1 AS `EXAM_VALUE664`,1 AS `EXAM_VALUE665`,1 AS `EXAM_VALUE666`,1 AS `EXAM_VALUE667`,1 AS `EXAM_VALUE668`,1 AS `EXAM_VALUE669`,1 AS `EXAM_VALUE670`,1 AS `EXAM_VALUE671`,1 AS `EXAM_VALUE672`,1 AS `EXAM_VALUE673`,1 AS `EXAM_VALUE674`,1 AS `EXAM_VALUE675`,1 AS `EXAM_VALUE676`,1 AS `EXAM_VALUE677`,1 AS `EXAM_VALUE678`,1 AS `EXAM_VALUE679`,1 AS `EXAM_VALUE680`,1 AS `EXAM_VALUE681`,1 AS `EXAM_VALUE682`,1 AS `EXAM_VALUE683`,1 AS `EXAM_VALUE684`,1 AS `EXAM_VALUE685`,1 AS `EXAM_VALUE686`,1 AS `EXAM_VALUE687`,1 AS `EXAM_VALUE688`,1 AS `EXAM_VALUE689`,1 AS `EXAM_VALUE690`,1 AS `EXAM_VALUE691`,1 AS `EXAM_VALUE692`,1 AS `EXAM_VALUE693`,1 AS `EXAM_VALUE694`,1 AS `EXAM_VALUE695`,1 AS `EXAM_VALUE696`,1 AS `EXAM_VALUE697`,1 AS `EXAM_VALUE698`,1 AS `EXAM_VALUE699`,1 AS `EXAM_VALUE700`,1 AS `EXAM_VALUE701`,1 AS `EXAM_VALUE702`,1 AS `EXAM_VALUE703`,1 AS `EXAM_VALUE704`,1 AS `EXAM_VALUE705`,1 AS `EXAM_VALUE706`,1 AS `EXAM_VALUE707`,1 AS `EXAM_VALUE708`,1 AS `EXAM_VALUE709`,1 AS `EXAM_VALUE710`,1 AS `EXAM_VALUE711`,1 AS `EXAM_VALUE712`,1 AS `EXAM_VALUE713`,1 AS `EXAM_VALUE714`,1 AS `EXAM_VALUE715`,1 AS `EXAM_VALUE716`,1 AS `EXAM_VALUE717`,1 AS `EXAM_VALUE718`,1 AS `EXAM_VALUE719`,1 AS `EXAM_VALUE720`,1 AS `EXAM_VALUE721`,1 AS `EXAM_VALUE722`,1 AS `EXAM_VALUE723`,1 AS `EXAM_VALUE724`,1 AS `EXAM_VALUE725`,1 AS `EXAM_VALUE726`,1 AS `EXAM_VALUE727`,1 AS `EXAM_VALUE728`,1 AS `EXAM_VALUE729`,1 AS `EXAM_VALUE730`,1 AS `EXAM_VALUE731`,1 AS `EXAM_VALUE732`,1 AS `EXAM_VALUE733`,1 AS `EXAM_VALUE734`,1 AS `EXAM_VALUE735`,1 AS `EXAM_VALUE736`,1 AS `EXAM_VALUE737`,1 AS `EXAM_VALUE738`,1 AS `EXAM_VALUE739`,1 AS `EXAM_VALUE740`,1 AS `EXAM_VALUE741`,1 AS `EXAM_VALUE742`,1 AS `EXAM_VALUE743`,1 AS `EXAM_VALUE744`,1 AS `EXAM_VALUE745`,1 AS `EXAM_VALUE746`,1 AS `EXAM_VALUE747`,1 AS `EXAM_VALUE748`,1 AS `EXAM_VALUE749`,1 AS `EXAM_VALUE750`,1 AS `EXAM_VALUE751`,1 AS `EXAM_VALUE752`,1 AS `EXAM_VALUE753`,1 AS `EXAM_VALUE754`,1 AS `EXAM_VALUE755`,1 AS `EXAM_VALUE756`,1 AS `EXAM_VALUE757`,1 AS `EXAM_VALUE758`,1 AS `EXAM_VALUE759`,1 AS `EXAM_VALUE760`,1 AS `EXAM_VALUE761`,1 AS `EXAM_VALUE762`,1 AS `EXAM_VALUE763`,1 AS `EXAM_VALUE764`,1 AS `EXAM_VALUE765`,1 AS `EXAM_VALUE766`,1 AS `EXAM_VALUE767`,1 AS `EXAM_VALUE768`,1 AS `EXAM_VALUE769`,1 AS `EXAM_VALUE770`,1 AS `EXAM_VALUE771`,1 AS `EXAM_VALUE772`,1 AS `EXAM_VALUE773`,1 AS `EXAM_VALUE774`,1 AS `EXAM_VALUE775`,1 AS `EXAM_VALUE776`,1 AS `EXAM_VALUE777`,1 AS `EXAM_VALUE778`,1 AS `EXAM_VALUE779`,1 AS `EXAM_VALUE780`,1 AS `EXAM_VALUE781`,1 AS `EXAM_VALUE782`,1 AS `EXAM_VALUE783`,1 AS `EXAM_VALUE784`,1 AS `EXAM_VALUE785`,1 AS `EXAM_VALUE786`,1 AS `EXAM_VALUE787`,1 AS `EXAM_VALUE788`,1 AS `EXAM_VALUE789`,1 AS `EXAM_VALUE790`,1 AS `EXAM_VALUE791`,1 AS `EXAM_VALUE792`,1 AS `EXAM_VALUE793`,1 AS `EXAM_VALUE794`,1 AS `EXAM_VALUE795`,1 AS `EXAM_VALUE796`,1 AS `EXAM_VALUE797`,1 AS `EXAM_VALUE798`,1 AS `EXAM_VALUE799`,1 AS `EXAM_VALUE800` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dlvr_exam_fims`
--

/*!50001 DROP VIEW IF EXISTS `v_dlvr_exam_fims`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dlvr_exam_fims` AS select 1 AS `werks`,1 AS `ppay_dd`,1 AS `mat_cd`,1 AS `ntprsr_reg_no`,1 AS `req_qt`,1 AS `reg_id`,1 AS `dlvr_exam_req_no`,1 AS `code_name`,1 AS `end_date`,1 AS `ppay_cont_info_seq` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dlvr_rec_spec`
--

/*!50001 DROP VIEW IF EXISTS `v_dlvr_rec_spec`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dlvr_rec_spec` AS select 1 AS `DLVR_EXAM_REQ_NO`,1 AS `ATCL_CODE`,1 AS `RECORD_CODE_1`,1 AS `RECORD_VER_1`,1 AS `DLVR_REC_NO`,1 AS `EXAM_VALUE_SNO`,1 AS `RECORD_CODE`,1 AS `RECORD_VER`,1 AS `LIST_ID`,1 AS `DISPLAY_NO`,1 AS `L1`,1 AS `L2`,1 AS `L3`,1 AS `L4`,1 AS `L4_1`,1 AS `L4_2`,1 AS `L5`,1 AS `L6`,1 AS `L7`,1 AS `L8`,1 AS `CHO_YN`,1 AS `EVAL_YN`,1 AS `LIST_NM`,1 AS `UNT`,1 AS `USL`,1 AS `LSL`,1 AS `NUM_YN`,1 AS `OK_YN`,1 AS `USE_YN`,1 AS `REM`,1 AS `REGR_NM`,1 AS `REGR_ID`,1 AS `REG_YMD` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_erp_category`
--

/*!50001 DROP VIEW IF EXISTS `v_erp_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_erp_category` AS select 1 AS `CATEGORY_CODE`,1 AS `CLASS1`,1 AS `CLASS2`,1 AS `CLASS3`,1 AS `CLASS4`,1 AS `CATEGORY_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fims_as`
--

/*!50001 DROP VIEW IF EXISTS `v_fims_as`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fims_as` AS select 1 AS `FIMS_NO`,1 AS `CMP_CODE`,1 AS `STATE`,1 AS `DEAL_GBN`,1 AS `FIRST_SHIP_YMD`,1 AS `FCTY_CG_YMD`,1 AS `TMP_EQI_YMD`,1 AS `ACTER_NM`,1 AS `ACTER_TELNO`,1 AS `AS_END_YMD`,1 AS `LAST_CORT_NM`,1 AS `LAST_CORT_ID`,1 AS `LAST_MOD_YMD`,1 AS `ERR_CONT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fims_as_detail`
--

/*!50001 DROP VIEW IF EXISTS `v_fims_as_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fims_as_detail` AS select 1 AS `FIMS_NO`,1 AS `SNO`,1 AS `FAULT_CODE`,1 AS `FAULT_NM`,1 AS `AS_CODE`,1 AS `AS_NM`,1 AS `AS_DETAIL`,1 AS `REGR_NM`,1 AS `REGR_ID`,1 AS `REG_YMD`,1 AS `LAST_CORT_NM`,1 AS `LAST_CORT_ID`,1 AS `LAST_MOD_YMD` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ppay_auto_cert_target`
--

/*!50001 DROP VIEW IF EXISTS `v_ppay_auto_cert_target`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ppay_auto_cert_target` AS select 1 AS `ZINSP_NO`,1 AS `EBELN`,1 AS `ZDELIV_DATE`,1 AS `WERKS`,1 AS `ZINSP_REQDATE`,1 AS `ZRESP_EMP`,1 AS `ZINSP_DATE`,1 AS `ZCONT_EMP` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stat_dlvr_cnt`
--

/*!50001 DROP VIEW IF EXISTS `v_stat_dlvr_cnt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stat_dlvr_cnt` AS select 1 AS `DLVR_EXAM_REQ_NO`,1 AS `ATCL_CODE`,1 AS `CTR_NO`,1 AS `PLANT_CODE`,1 AS `AFE_CHASU`,1 AS `CMP_CODE`,1 AS `DLVDT_YMD`,1 AS `REQ_YMD`,1 AS `EXP_ISP_YMD`,1 AS `ISP_ENDDT`,1 AS `IVT_GBN`,1 AS `ISP_GBN`,1 AS `UNT`,1 AS `PPAY_QT`,1 AS `REQ_QT`,1 AS `ELIG_YN`,1 AS `APR_REQ_QT`,1 AS `APR_QT`,1 AS `DLVR_REC_NO`,1 AS `MAIN_ISP_ATCL_NM`,1 AS `SRC_CMP_CODE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 14:50:32
