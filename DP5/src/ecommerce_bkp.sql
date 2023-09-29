-- MySQL dump 10.16  Distrib 10.2.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.2.8-MariaDB

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
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecommerce`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) NOT NULL,
  `Minit` varchar(3) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_cpf_client` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Renata','J','Pinto','00460110723','Rua da Quitanda 19, Cidade Nova - Vinhedo'),(2,'Matheus','M','Pimentel','01850585706','Rua Bala de Prata 38, Transilvania - Cidade dos Morcegos'),(3,'Nair','F','Belo','01950485701','Av Cascadura 18, Rio Marinho - Vila Velha'),(4,'Friedrich','Von','Hayek','02103250594','Freiburg, Germany'),(5,'Maria','D','Caprio','02799586601','Rua das Orquideas 22, Jardim Camburi - Vitoria'),(6,'Margot','N','Pereira','01930335707','Rua das Margaridas 56, Laranjeiras - Serra'),(7,'John','M','Keynes','04450585706','Cambridge, United Kingdom'),(8,'Teofilo','C','Cerqueira','02140490981','Rua Coronel Josino 22, Vila Pavão - Miracema'),(9,'Tiara','D','Cabelo','03378932101','Rua das Flores 44, Cehab - Santa Teresa'),(57,'Joseph','C','Climber','01750558703','R Lauro Muller');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bef_client_delete
before delete
on clients for EACH ROW
BEGIN
		insert into former_client(Fname, Minit, Lname, CPF, Address) 
        values (OLD.Fname, OLD.Minit, OLD.Lname, OLD.CPF, OLD.Address);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `former_client`
--

DROP TABLE IF EXISTS `former_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `former_client` (
  `id_former_client` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Delete_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_former_client`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `former_client`
--

LOCK TABLES `former_client` WRITE;
/*!40000 ALTER TABLE `former_client` DISABLE KEYS */;
INSERT INTO `former_client` VALUES (1,'John','D','Rockfeller','01750558703','Fair Lane Drive','2023-09-23 14:44:28'),(3,'John','D','Rockfeller','01750558703','Fair Lane Drive','2023-09-28 20:09:03'),(4,'John','D','Ford','01750558703','Capitain America St','2023-09-28 20:20:27'),(5,'Joseph','MTF','Climber','01750558703','R Lauro Muller','2023-09-28 20:54:34'),(6,'Joseph','MTF','Climber','01750558703','R Lauro Muller','2023-09-28 21:00:17'),(7,'John','D','Ford','01750558703','Capitain America St','2023-09-28 21:03:53'),(8,'Joseph','','Climber','01750558703','R Lauro Muller, Botafogo - Rio de Janeiro','2023-09-28 21:12:15'),(9,'Joseph','MTF','Climber','01750558703','R Lauro Muller','2023-09-28 21:38:01'),(10,'Joseph','MTF','Climber','01750558703','R Lauro Muller','2023-09-28 21:47:52'),(11,'Joseph','','Climber','01750558703','R Lauro Muller, Botafogo - Rio de Janeiro','2023-09-28 22:04:36'),(12,'John','','Ford','01750558703','Capitain America St','2023-09-28 22:05:15'),(13,'Joseph','C','Climber','01750558703','R Lauro Muller','2023-09-28 22:39:15'),(14,'Joseph','C','Climber','01750558703','R Lauro Muller','2023-09-29 00:18:54');
/*!40000 ALTER TABLE `former_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idOrderClient` int(11) DEFAULT NULL,
  `orderStatus` enum('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
  `orderDescription` varchar(255) DEFAULT NULL,
  `sendValue` float DEFAULT 10,
  `paymentCash` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`idOrder`),
  KEY `fk_orders_client` (`idOrderClient`),
  CONSTRAINT `fk_orders_client` FOREIGN KEY (`idOrderClient`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Em Processamento','Compra via Aplicativo',NULL,1),(2,2,'Em Processamento','Compra via Aplicativo',50,0),(3,3,'Confirmado',NULL,NULL,1),(4,4,'Confirmado',NULL,NULL,1),(5,5,'Em Processamento','Compra via Web Site',150,0),(6,2,'Em Processamento','Compra via Aplicativo',NULL,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `idClient` int(11) NOT NULL,
  `idPayment` int(11) NOT NULL,
  `typePayment` enum('Boleto','Cartao','Dois Cartões') DEFAULT NULL,
  `limiteAvailable` float DEFAULT NULL,
  PRIMARY KEY (`idClient`,`idPayment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `Pname` varchar(50) NOT NULL,
  `Classification_kids` tinyint(1) DEFAULT 0,
  `category` enum('Eletronico','Vestuario','Brinquedos','Alimentos','Moveis') NOT NULL,
  `avaliacao` float DEFAULT 0,
  `size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fone de Ouvido',0,'Eletronico',4,NULL),(2,'Barbie Elsa',1,'Brinquedos',3,NULL),(3,'Body Carters',1,'Vestuario',5,NULL),(4,'Microfone Vedo - Youtuber',0,'Eletronico',4,NULL),(5,'Sofa retrátil',0,'Moveis',3,'220x90x80'),(6,'Monitor LED 24\"',0,'Eletronico',4,NULL),(7,'Agua Mineral',0,'Alimentos',5,'500ml'),(8,'Carabina Ar Comprimido 5,5mm',1,'Brinquedos',3,'6x8x120'),(9,'Camisa Polo MAsculina',1,'Vestuario',5,NULL),(10,'Teclado Gamer Mecanico LED',0,'Eletronico',4,NULL),(11,'Cadeira de escritorio giratoria\"',0,'Moveis',3,'65x55x135');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productorder` (
  `idPOproduct` int(11) NOT NULL,
  `idPOorder` int(11) NOT NULL,
  `poQuantity` int(11) DEFAULT 1,
  `poStatus` enum('Disponivel','Sem Estoque') DEFAULT 'Disponivel',
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `fk_productorder_product` (`idPOorder`),
  CONSTRAINT `fk_productorder_product` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_productorder_seller` FOREIGN KEY (`idPOproduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (1,1,2,NULL),(2,1,1,NULL),(3,1,1,NULL);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productseller` (
  `idPseller` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `prodQuantity` int(11) DEFAULT 1,
  PRIMARY KEY (`idPseller`,`idProduct`),
  KEY `fk_product_produtct` (`idProduct`),
  CONSTRAINT `fk_product_produtct` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`idPseller`) REFERENCES `seller` (`idSeller`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (4,6,80),(5,7,10);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstorage`
--

DROP TABLE IF EXISTS `productstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productstorage` (
  `idProdStorage` int(11) NOT NULL AUTO_INCREMENT,
  `storageLocation` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  PRIMARY KEY (`idProdStorage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstorage`
--

LOCK TABLES `productstorage` WRITE;
/*!40000 ALTER TABLE `productstorage` DISABLE KEYS */;
INSERT INTO `productstorage` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',100),(5,'São Paulo',10),(6,'Brasilia',10);
/*!40000 ALTER TABLE `productstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productsupplier` (
  `idPsSupplier` int(11) NOT NULL,
  `idPsProduct` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`idPsSupplier`,`idPsProduct`),
  KEY `fk_product_supplier_product` (`idPsProduct`),
  CONSTRAINT `fk_product_supplier_product` FOREIGN KEY (`idPsProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_supplier_supplier` FOREIGN KEY (`idPsSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (4,1,500),(4,2,400),(5,4,633),(5,5,10),(6,3,5);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `idSeller` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` char(14) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `SocialName` varchar(255) NOT NULL,
  `AbstName` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `unique_seller_cnpj` (`CNPJ`),
  UNIQUE KEY `unique_seller_cpf` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (4,'12345678901234',NULL,'Tech Eletronics',NULL,'Rio de Janeiro','21995718558'),(5,NULL,'12345678901','Boutique Dunga',NULL,'Rio de Janeiro','21995893451'),(6,'23456789012345',NULL,'Tech Eletronics',NULL,'São Paulo','1197618552');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagelocation`
--

DROP TABLE IF EXISTS `storagelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagelocation` (
  `idLproduct` int(11) NOT NULL,
  `idLstorage` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduct`,`idLstorage`),
  KEY `fk_storage_location_storage` (`idLstorage`),
  CONSTRAINT `fk_storage_location_product` FOREIGN KEY (`idLproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_storage_location_storage` FOREIGN KEY (`idLstorage`) REFERENCES `productstorage` (`idProdStorage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagelocation`
--

LOCK TABLES `storagelocation` WRITE;
/*!40000 ALTER TABLE `storagelocation` DISABLE KEYS */;
INSERT INTO `storagelocation` VALUES (1,2,'RJ'),(2,6,'GO');
/*!40000 ALTER TABLE `storagelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` char(14) NOT NULL,
  `socialName` varchar(255) NOT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `unique_supplier` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (4,'12345678901234','Almeida e Filhos','21995739558'),(5,'43210987654321','Eletronicos Silva','41998956758'),(6,'87654321098765','Eletronicos Valma','11996749558');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-28 22:05:20
