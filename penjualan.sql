Enter password: 
/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-13.0.2-MariaDB, for Android (aarch64)
--
-- Host: localhost    Database: penjualan
-- ------------------------------------------------------
-- Server version	13.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `detil_pesan`
--

DROP TABLE IF EXISTS `detil_pesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detil_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_produk` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` double NOT NULL,
  PRIMARY KEY (`id_pesan`,`id_produk`),
  KEY `fk_detil_produk` (`id_produk`),
  CONSTRAINT `fk_detil_pesan` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id_pesan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detil_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_pesan`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `detil_pesan` WRITE;
/*!40000 ALTER TABLE `detil_pesan` DISABLE KEYS */;
INSERT INTO `detil_pesan` VALUES
(1,'PRD-001',2,72000),
(2,'PRD-001',2,72000);
/*!40000 ALTER TABLE `detil_pesan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `faktur`
--

DROP TABLE IF EXISTS `faktur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `faktur` (
  `id_faktur` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `tgl_faktur` date NOT NULL,
  PRIMARY KEY (`id_faktur`),
  KEY `fk_faktur_pesan` (`id_pesan`),
  CONSTRAINT `fk_faktur_pesan` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id_pesan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `faktur` WRITE;
/*!40000 ALTER TABLE `faktur` DISABLE KEYS */;
INSERT INTO `faktur` VALUES
(1,1,'2026-10-27'),
(2,2,'2026-10-27');
/*!40000 ALTER TABLE `faktur` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `kuitansi`
--

DROP TABLE IF EXISTS `kuitansi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kuitansi` (
  `id_kuitansi` int(11) NOT NULL,
  `id_faktur` int(11) NOT NULL,
  `tgl_kuitansi` date NOT NULL,
  PRIMARY KEY (`id_kuitansi`),
  KEY `fk_kuitansi_faktur` (`id_faktur`),
  CONSTRAINT `fk_kuitansi_faktur` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuitansi`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `kuitansi` WRITE;
/*!40000 ALTER TABLE `kuitansi` DISABLE KEYS */;
INSERT INTO `kuitansi` VALUES
(1,1,'2026-10-27'),
(2,2,'2026-10-27');
/*!40000 ALTER TABLE `kuitansi` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(20) NOT NULL,
  `nm_pelanggan` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES
('PEL-001','Pelanggan Umum (Cash)','Jl. Toko Utama No. 01','081200000001','umum@tokokasir.id'),
('PEL-002','Budi Santoso','Jl. Merak No. 14, Bandung','081234567890','budi.santoso@gmail.com'),
('PEL-003','Siti Rahmawati','Jl. Melati Blok C2, Jakarta','085678912345','siti.rahma@yahoo.com'),
('PEL-004','Warung Berkah Bu Ani','Jl. Kenanga No. 88, Surabaya','087811223344','berkah.ani@gmail.com');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pesan`
--

DROP TABLE IF EXISTS `pesan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_pelanggan` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_pesan` date NOT NULL,
  PRIMARY KEY (`id_pesan`),
  KEY `fk_pesan_pelanggan` (`id_pelanggan`),
  KEY `fk_pesan_user` (`id_user`),
  CONSTRAINT `fk_pesan_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pesan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesan`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pesan` WRITE;
/*!40000 ALTER TABLE `pesan` DISABLE KEYS */;
INSERT INTO `pesan` VALUES
(1,'PEL-001',1,'2026-10-27'),
(2,'PEL-001',1,'2026-10-27');
/*!40000 ALTER TABLE `pesan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `produk` (
  `id_produk` varchar(20) NOT NULL,
  `nm_produk` varchar(150) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga` double NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES
('PRD-001','Beras Ramos Super 5 Kg','Sak',72000,31),
('PRD-002','Minyak Goreng Sania 2 Liter','Pouch',35000,50),
('PRD-003','Gula Pasir Gulaku 1 Kg','Kg',17500,80),
('PRD-004','Indomie Goreng Spesial','Bungkus',3100,240),
('PRD-005','Kopi Kapal Api Special Mix 10x24g','Renceng',15000,60),
('PRD-006','Teh Celup Sosro Isi 25','Kotak',7500,95),
('PRD-007','Susu Kental Manis Frisian Flag','Kaleng',12500,45),
('PRD-008','Sabun Mandi Lifebuoy Total 10 85g','Pcs',4500,110),
('PRD-009','Shampoo Pantene 160ml','Botol',24000,30),
('PRD-010','Air Mineral Aqua 600ml','Botol',3500,150);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Kasir','Owner') NOT NULL DEFAULT 'Kasir',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'Administrator Utama','admin','0192023a7bbd73250516f069df18b500','Admin'),
(2,'Kasir Toko 1','kasir','de28f8f7998f23ab4194b51a6029416f','Kasir'),
(3,'Pemilik Toko','owner','5be057accb25758101fa5eadbbd79503','Owner');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-10 11:43:24
