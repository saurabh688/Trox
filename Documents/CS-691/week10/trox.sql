-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trox
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `PaymentStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `OrderReferenceID` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `Product_id` varchar(45) NOT NULL,
  `OrderID` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderReferenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetails` (
  `cardDetails` varchar(45) NOT NULL,
  `orderId` varchar(45) NOT NULL,
  `Invoices` varchar(45) DEFAULT NULL,
  `ProductID` varchar(45) NOT NULL,
  PRIMARY KEY (`cardDetails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetails`
--

LOCK TABLES `productdetails` WRITE;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `productdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(45) NOT NULL,
  `Brand` varchar(60) NOT NULL,
  `color` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Size` varchar(45) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `ImageURL1` varchar(45) NOT NULL,
  `ImageURL2` varchar(45) DEFAULT NULL,
  `ImageURL3` varchar(45) DEFAULT NULL,
  `SKU ID` double NOT NULL,
  `GTIN` double NOT NULL,
  `MPN` varchar(45) NOT NULL,
  `Batch_number` varchar(45) NOT NULL,
  `ParentProductID` double NOT NULL,
  `Product_Category` varchar(45) NOT NULL,
  `AgeGroup` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `SalePrice` decimal(10,0) NOT NULL,
  `ListPrice` decimal(10,0) NOT NULL,
  `CurrencyType` varchar(45) NOT NULL,
  `InventoryValue` varchar(45) NOT NULL,
  `Rating` decimal(10,0) NOT NULL,
  `ProductLevel` varchar(45) NOT NULL,
  `ProductStatus` tinyint NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1022918865572','Barefoot Power','Antique ruby','PowaPack 5W Gen. 2.5','35','PowaPa','https://www.google.com/url?sa=i','','',1010050007,1022918865572,'1022918865572','10615',1022918865572,'Electronics','adult','CD519762',27472,26972,'Pound','369',2,'L2',0),('1061418865572','Bettalights (pty) Ltd','Antique white','PowaPack Junior 2.5 W Matrix','37','PowaPa','https://www.google.com/url?sa=i','','',1010051435,1061418865572,'1061418865572','11307',1061418865572,'smartPhone','child','NH059332',28693,28193,'Rupees','7978',3,'L5',1),('1099918865572','Bettalights (pty) Ltd','Ao (English)','BettaOne','39','BettaO','https://www.google.com/url?sa=i','','',1010052863,1099918865572,'1099918865572','11999',1099918865572,'Clothes','adult','CS222579',29914,29414,'Dollars','78',4,'L3',1),('1138418865572','Brighterlite','Apple green','BettaTwo','41','BettaT','https://www.google.com/url?sa=i','','',1010054290,1138418865572,'1138418865572','12691',1138418865572,'SmartPhone','child','BG334236',31135,30635,'Yen','500',3,'L2',1),('1176918865572','Bright Products','Apricot','L4','43','L4','https://www.google.com/url?sa=i','','',1010055718,1176918865572,'1176918865572','13383',1176918865572,'Electronics','adult','SC3333688',32356,31856,'Pound','522',3,'L1',0),('1215418865572','Bright Products','Aqua','SunBell','45','SunBel','https://www.google.com/url?sa=i','','',1010057146,1215418865572,'1215418865572','14075',1215418865572,'SmartPhone','child','SE1484112',33577,33077,'Rupees','471',3,'L4',1),('1234565238905','All Weather Solar Technology Co.','Alloy orange','GoSol Firefly 12','25','GoSol','https://www.google.com/url?sa=i','','',1010020025,1234565238905,'1234565238905','524',1234565238905,'smartPhone','child','GJ254810',20500,20000,'Rupees','500',3,'L2',1),('12345678905','AEG International','Alice blue','VOLTZE ESCORT G3 Solar Power Lantern','24','VOLTZE','https://www.google.com/url?sa=i','','',1010020028,12345678905,'12345678905','246',12345678905,'Electronics','adult','AL319842',2500,2000,'Dollars','78',4,'L1',1),('1253918865572','Bright Products','Aquamarine','SunBell 2.0','85','SunBel','https://www.google.com/url?sa=i','','',1010058573,1253918865572,'1253918865572','14767',1253918865572,'Hat','adult','AL319844',34798,34298,'Dollars','369',3,'L1',0),('1292418865572','CAA Communications and Accessories Int GmbH','Arctic lime','Sun Turtle','87.5','Sun Tu','https://www.google.com/url?sa=i','','',1010060001,1292418865572,'1292418865572','15460',1292418865572,'Home accesories','child','GJ254812',36019,35519,'Yen','7978',5,'L2',1),('1330918865572','d.light','Army green','Solar Lantern','92.5','Solar','https://www.google.com/url?sa=i','','',1010061429,1330918865572,'1330918865572','16152',1330918865572,'Electronics','adult','SK781257',37240,36740,'Pound','78',4,'L5',0),('1369418865572','d.light','Artichoke','D20 / D20-G','97.5','D20 /','https://www.google.com/url?sa=i','','',1010062857,1369418865572,'1369418865572','16844',1369418865572,'smartPhone','child','CS451550',38461,37961,'Rupees','500',2,'L3',0),('1407918865572','d.light','Arylide yellow','D34','102.5','D34','https://www.google.com/url?sa=i','','',1010064284,1407918865572,'1407918865572','17536',1407918865572,'Clothes','adult','XZ121547',39682,39182,'Dollars','522',4,'L1',1),('1446418865572','d.light','Ash gray','S20','107.5','S20','https://www.google.com/url?sa=i','','',1010065712,1446418865572,'1446418865572','18228',1446418865572,'SmartPhone','child','CD519763',40903,40403,'Yen','471',4,'L2',1),('1484918865572','d.light','Asparagus','S300B','112.5','S300B','https://www.google.com/url?sa=i','','',1010067140,1484918865572,'1484918865572','18920',1484918865572,'Electronics','adult','NH059333',42124,41624,'Pound','369',4,'L5',1),('1523418865572','d.light','Astronaut','Kiran','M\'','Kiran','https://www.google.com/url?sa=i','','',1010068567,1523418865572,'1523418865572','19612',1523418865572,'SmartPhone','child','CS222580',43345,42845,'Rupees','7978',4,'L3',0),('1561918865572','d.light','Atomic tangerine','Nova','XL\'','Nova','https://www.google.com/url?sa=i','','',1010069995,1561918865572,'1561918865572','20304',1561918865572,'Hat','adult','BG334237',44566,44066,'Dollars','78',4,'L2',1),('1600418865572','d.light','Auburn','S1','S\'','S1','https://www.google.com/url?sa=i','','',1010071423,1600418865572,'1600418865572','20996',1600418865572,'Home accesories','child','SC3333689',45787,45287,'Yen','500',4,'L1',0),('1638918865572','d.light','Aureolin','S2','L\'','S2','https://www.google.com/url?sa=i','','',1010072850,1638918865572,'1638918865572','21689',1638918865572,'Electronics','adult','SE1484113',47008,46508,'Pound','522',4,'L4',1),('1677418865572','d.light','Avocado','S3B','M\'','S3B','https://www.google.com/url?sa=i','','',1010074278,1677418865572,'1677418865572','22381',1677418865572,'smartPhone','child','AL319845',48229,47729,'Rupees','471',4,'L1',0),('1715918865572','d.light','Azure','S10','XL\'','S10','https://www.google.com/url?sa=i','','',1010075706,1715918865572,'1715918865572','23073',1715918865572,'Clothes','adult','GJ254813',49450,48950,'Dollars','369',4,'L2',0),('1754418865572','d.light','Azure (X11/web color)','S100','S\'','S100','https://www.google.com/url?sa=i','','',1010077133,1754418865572,'1754418865572','23765',1754418865572,'SmartPhone','child','SK781258',50671,50171,'Yen','7978',4,'L5',1),('1792918865572','d.light','Baby blue','S250','L\'','S250','https://www.google.com/url?sa=i','','',1010078561,1792918865572,'1792918865572','24457',1792918865572,'Electronics','adult','CS451551',51892,51392,'Pound','78',4,'L3',1),('1831418865572','d.light','Baby blue eyes','S50X Family','M\'','S50X F','https://www.google.com/url?sa=i','','',1010079989,1831418865572,'1831418865572','25149',1831418865572,'SmartPhone','child','XZ121548',53113,52613,'Rupees','500',4,'L1',1),('1869918865572','d.light','Baby pink','S500','XL\'','S500','https://www.google.com/url?sa=i','','',1010081416,1869918865572,'1869918865572','25841',1869918865572,'Hat','adult','CD519764',54334,53834,'Dollars','522',4,'L2',0),('1908418865572','d.light','Baby powder','S501','S\'','S501','https://www.google.com/url?sa=i','','',1010082844,1908418865572,'1908418865572','26533',1908418865572,'Home accesories','child','NH059334',55555,55055,'Yen','471',4,'L5',1),('1946918865572','d.light','Baker-Miller pink','A1','L\'','A1','https://www.google.com/url?sa=i','','',1010084272,1946918865572,'1946918865572','27225',1946918865572,'Electronics','adult','CS222581',56776,56276,'Pound','369',4,'L3',0),('1985418865572','Deutrex 818','Banana Mania','X740','M\'','X740','https://www.google.com/url?sa=i','','',1010085699,1985418865572,'1985418865572','27918',1985418865572,'smartPhone','child','BG334238',57997,57497,'Rupees','7978',4,'L2',1),('522418865572','Azuri Technologies, Ltd','Amaranth','Solar Lamp','29','Solar','https://www.google.com/url?sa=i','','',1010020026,522418865572,'522418865572','791',522418865572,'SmartPhone','child','CS451548',750,250,'Yen','471',3,'L3',1),('560918865572','Azuri Technologies, Ltd','Amaranth (M&P)','10W Quad Solar Home System','31','10W Qu','https://www.google.com/url?sa=i','','',1010020020,560918865572,'560918865572','633',560918865572,'Electronics','adult','XZ121545',2833,2333,'Pound','369',3,'L1',0),('599418865572','Azuri Technologies, Ltd','Amaranth pink','15W Quad 600','33','15W Qu','https://www.google.com/url?sa=i','','',1010060001,599418865572,'599418865572','4962',599418865572,'SmartPhone','child','CD519761',50500,50000,'Rupees','7978',2,'L2',1),('637918865572','Barefoot Power','Amaranth purple','Indigo Duo Solar Home System','35','Indigo','https://www.google.com/url?sa=i','','',1010020030,637918865572,'637918865572','3694',637918865572,'Hat','adult','NH059331',1046,546,'Dollars','78',5,'L5',0),('676418865572','Barefoot Power','Amaranth red','Connect 600','','Connec','https://www.google.com/url?sa=i','','',1010037158,676418865572,'676418865572','4386',676418865572,'Home accesories','child','CS222578',8391,7891,'Yen','500',4,'L3',0),('714918865572','Barefoot Power','Amazon','Connect 3050','60','Connec','https://www.google.com/url?sa=i','','',1010038586,714918865572,'714918865572','5078',714918865572,'Electronics','adult','BG334235',22722,22222,'Pound','522',5,'L2',1),('753418865572','Barefoot Power','Amber','Connect Systems','62.5','Connec','https://www.google.com/url?sa=i','','',1010040014,753418865572,'753418865572','5770',753418865572,'smartPhone','child','SC3333687',18925,18425,'Rupees','471',4,'L1',1),('791918865572','Barefoot Power','Amber (SAE/ECE)','Firefly 12 Mobile','67.5','Firefl','https://www.google.com/url?sa=i','','',1010041441,791918865572,'791918865572','6462',791918865572,'Clothes','adult','SE1484111',20146,19646,'Dollars','369',4,'L4',1),('830418865572','Barefoot Power','Amethyst','Firefly / Firefly Mobile','72.5','Firefl','https://www.google.com/url?sa=i','','',1010042869,830418865572,'830418865572','7154',830418865572,'SmartPhone','child','AL319843',21367,20867,'Yen','7978',4,'L1',0),('868918865572','Barefoot Power','Android green','Firefly Mini','77.5','Firefl','https://www.google.com/url?sa=i','','',1010044297,868918865572,'868918865572','7846',868918865572,'Electronics','adult','GJ254811',22588,22088,'Pound','78',2,'L2',1),('89345678905','Anji DaSol Solar Energy Science & Technology Co., Ltd.','Almond','Solar Lantern','27','Solar','https://www.google.com/url?sa=i','','',1010060003,89345678905,'89345678905','474',89345678905,'Clothes','adult','SK781255',700,200,'Dollars','522',5,'L5',0),('907418865572','Barefoot Power','Antique brass','Go 150','82.5','Go 150','https://www.google.com/url?sa=i','','',1010045724,907418865572,'907418865572','8538',907418865572,'SmartPhone','child','SK781256',23809,23309,'Rupees','500',2,'L5',0),('945918865572','Barefoot Power','Antique bronze','PowaPack 5W','87.5','PowaPa','https://www.google.com/url?sa=i','','',1010047152,945918865572,'945918865572','9230',945918865572,'Hat','adult','CS451549',25030,24530,'Dollars','522',4,'L3',1),('984418865572','Barefoot Power','Antique fuchsia','PowaPack Junior Matrix Gen. 2.5','34','PowaPa','https://www.google.com/url?sa=i','','',1010048580,984418865572,'984418865572','9923',984418865572,'Home accesories','child','XZ121546',26251,25751,'Yen','471',2,'L1',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(45) NOT NULL,
  `phone_no` int DEFAULT NULL,
  `email_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_postal_address` varchar(45) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `ssn` int DEFAULT NULL,
  `bank_details` varchar(45) NOT NULL,
  `card_no_credit` varchar(45) DEFAULT NULL,
  `card_no_debit` varchar(45) DEFAULT NULL,
  `card_no_apple_pay` varchar(45) DEFAULT NULL,
  `card_no_wallet` varchar(45) DEFAULT NULL,
  `seller_tax_no` int DEFAULT NULL,
  `seller_company_name` varchar(45) DEFAULT NULL,
  `user_accout_type` int DEFAULT NULL,
  `review` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `last_visited` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18 23:38:22
