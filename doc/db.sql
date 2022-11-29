-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for warehouse
CREATE DATABASE IF NOT EXISTS `warehouse` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `warehouse`;

-- Dumping structure for table warehouse.order_in
CREATE TABLE IF NOT EXISTS `order_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(50) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL COMMENT '1: draf | 2: success',
  `total_price` double DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.order_in: ~0 rows (approximately)
DELETE FROM `order_in`;
/*!40000 ALTER TABLE `order_in` DISABLE KEYS */;
INSERT INTO `order_in` (`id`, `code`, `id_supplier`, `id_user`, `id_status`, `total_price`, `created_date`) VALUES
	(1, 'N1669705257465', 1, 1, 1, 10000, '2022-11-29 11:50:05'),
	(2, '1669714808727', 1, 1, 1, 100000, '2022-11-29 16:40:20'),
	(3, '1669714946980', 1, 1, 1, 100000, '2022-11-29 16:42:27'),
	(4, '1669715121680', 1, 1, 1, 100000, '2022-11-29 16:45:21'),
	(5, '1669715197206', 1, 1, 1, 100000, '2022-11-29 16:46:37'),
	(6, '1669715333049', 1, 1, 1, 100000, '2022-11-29 16:48:53'),
	(7, '1669715639468', 1, 1, 1, 100000, '2022-11-29 16:53:59');
/*!40000 ALTER TABLE `order_in` ENABLE KEYS */;

-- Dumping structure for table warehouse.order_in_detail
CREATE TABLE IF NOT EXISTS `order_in_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order_in` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.order_in_detail: ~0 rows (approximately)
DELETE FROM `order_in_detail`;
/*!40000 ALTER TABLE `order_in_detail` DISABLE KEYS */;
INSERT INTO `order_in_detail` (`id`, `id_order_in`, `id_product`, `qty`) VALUES
	(1, 2, 1, 1),
	(2, 3, 1, 1),
	(3, 3, 2, 1),
	(4, 4, 1, 1),
	(5, 4, 2, 1),
	(6, 5, 1, 1),
	(7, 7, 2, 1),
	(8, 6, 1, 1),
	(9, 6, 2, 1),
	(10, 7, 1, 1);
/*!40000 ALTER TABLE `order_in_detail` ENABLE KEYS */;

-- Dumping structure for table warehouse.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.product: ~1 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `id_supplier`, `code`, `name`, `price`, `qty`) VALUES
	(1, 1, 'sn000001', 'Product 1', 100000, 2),
	(2, 1, 'sn000002', 'Product 2', 50000, 3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table warehouse.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.supplier: ~5 rows (approximately)
DELETE FROM `supplier`;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id`, `code`, `name`, `address`, `phone`) VALUES
	(1, 'ncc00001', 'NCC 1', 'Hà Nội', '0331778886'),
	(2, 'ncc00002', 'NCC 2', 'Hải Phòng', '0973374474'),
	(3, 'ncc00003', 'NCC 3', 'Hải Dương', '0986213312'),
	(4, 'ncc00004', 'NCC 4', 'Bắc Giang', '0412345786'),
	(5, 'ncc00005', 'NCC 5', 'Hòa Bình', '097462345');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

-- Dumping structure for table warehouse.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.user: 1 rows
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `full_name`, `address`, `birth`, `email`, `gender`, `phone`, `role`, `created_date`) VALUES
	(1, 'admin', '$2a$12$sxYYBAhLeOGgkC3AwqSrO.W9zRInmIyDjjGrdm/Zr.t4oWT7YYuyC', 'Administrator', 'Việt Nam', '2000-07-23 00:00:00', 'admin@blog.com', 1, '0368311662', 'SELLER', '2022-10-10 13:45:46');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
