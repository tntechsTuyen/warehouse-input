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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.order_in: ~15 rows (approximately)
DELETE FROM `order_in`;
/*!40000 ALTER TABLE `order_in` DISABLE KEYS */;
INSERT INTO `order_in` (`id`, `code`, `id_supplier`, `id_user`, `id_status`, `total_price`, `created_date`) VALUES
	(1, 'N1669705257465', 1, 1, 1, 10000, '2022-11-29 11:50:05'),
	(2, '1669714808727', 1, 1, 1, 100000, '2022-11-29 16:40:20'),
	(3, '1669714946980', 1, 1, 1, 150000, '2022-11-29 16:42:27'),
	(4, '1669715121680', 1, 1, 1, 100000, '2022-11-29 16:45:21'),
	(5, '1669715197206', 1, 1, 1, 100000, '2022-11-29 16:46:37'),
	(6, '1669715333049', 1, 1, 1, 100000, '2022-11-29 16:48:53'),
	(7, '1669715639468', 1, 1, 1, 100000, '2022-11-29 16:53:59'),
	(8, '1669775360591', 1, 1, 1, 100000, '2022-11-30 09:29:20'),
	(9, '1669775433842', 1, 1, 1, 100000, '2022-11-30 09:30:33'),
	(10, '1669776136740', 1, 1, 1, 100000, '2022-11-30 09:42:16'),
	(11, '1669776253577', 1, 1, 1, 100000, '2022-11-30 09:44:13'),
	(12, '1669776322707', 1, 1, 1, 150000, '2022-11-30 09:45:22'),
	(13, '1669802501738', 1, 1, 1, 100000, '2022-11-30 17:01:41'),
	(14, '1669870152513', 1, 1, 1, 100000, '2022-12-01 11:49:12'),
	(15, '1669875238417', 1, 1, 1, 150000, '2022-12-01 13:13:58'),
	(16, '1669876034387', 1, 1, 1, 340000, '2022-12-01 13:27:14'),
	(17, '1669880012336', 1, 1, 1, 50000, '2022-12-01 14:33:32'),
	(18, '1669881560300', 1, 1, 1, 450000, '2022-12-01 14:59:20'),
	(19, '1669881666452', 1, 1, 1, 750000, '2022-12-01 15:01:06'),
	(20, '1669881811445', 2, 1, 1, 23000, '2022-12-01 15:03:31'),
	(21, '1669882059232', 2, 1, 2, 22000, '2022-12-01 15:07:39'),
	(22, '1669882758046', 1, 1, 1, 50000, '2022-12-01 15:19:18'),
	(23, '1669882839161', 1, 1, 1, 150000, '2022-12-01 15:20:39');
/*!40000 ALTER TABLE `order_in` ENABLE KEYS */;

-- Dumping structure for table warehouse.order_in_detail
CREATE TABLE IF NOT EXISTS `order_in_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order_in` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.order_in_detail: ~17 rows (approximately)
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
	(10, 7, 1, 1),
	(11, 8, 1, 1),
	(12, 12, 2, 1),
	(13, 10, 1, 1),
	(14, 11, 1, 1),
	(15, 15, 2, 1),
	(17, 14, 1, 1),
	(19, 19, 2, 3),
	(20, 20, 10, 1),
	(21, 21, 10, 1),
	(22, 18, 1, 3),
	(23, 23, 2, 1),
	(24, 19, 3, 5),
	(25, 20, 9, 3),
	(26, 21, 9, 2),
	(27, 22, 2, 1),
	(28, 23, 1, 1);
/*!40000 ALTER TABLE `order_in_detail` ENABLE KEYS */;

-- Dumping structure for table warehouse.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.product: ~8 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `id_supplier`, `code`, `name`, `price`, `qty`) VALUES
	(1, 1, 'sn000001', 'Product 1', 100000, 2),
	(2, 1, 'sn000002', 'Product 2', 50000, 3),
	(3, 1, 'sn000003', 'product 3', 120000, 0),
	(4, 1, 'c1', 'n1', 10, 1),
	(5, 1, '1669791676857c', 'aaaa', 10, 1),
	(6, 1, '1669791792329c', 'aaaa', 10, 1),
	(7, 1, '1669791982587c', 'aaaa', 10, 1),
	(8, 1, '1669792417408c', 'aaaa', 10, 1),
	(9, 2, 'sp01', 'sp01', 1000, 0),
	(10, 2, 'sp02', 'sp02', 20000, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table warehouse.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table warehouse.supplier: ~9 rows (approximately)
DELETE FROM `supplier`;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id`, `code`, `name`, `address`, `phone`) VALUES
	(1, 'ncc00001', 'NCC 1', 'H?? N???i', '0331778886'),
	(2, 'ncc00002', 'NCC 2', 'H???i Ph??ng', '0973374474'),
	(3, 'ncc00003', 'NCC 3', 'H???i D????ng', '0986213312'),
	(4, 'ncc00004', 'NCC 4', 'B???c Giang', '0412345786'),
	(5, 'ncc00005', 'NCC 5', 'H??a B??nh', '097462345'),
	(6, 'ncc00006', 'NCC 6', 'Test', '091231234'),
	(7, 'ncc00007', 'NCC 7', 'Test', '123123123'),
	(12, '1669791792555', '1669791792555', 'HN', '0123148721312'),
	(15, '1669791982781', '1669791982781', 'HN', '0123148721312'),
	(17, '1669792417594', '1669792417594', 'HN', '0123148721312');
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
	(1, 'admin', '$2a$12$sxYYBAhLeOGgkC3AwqSrO.W9zRInmIyDjjGrdm/Zr.t4oWT7YYuyC', 'Administrator', 'Vi???t Nam', '2000-07-23 00:00:00', 'admin@blog.com', 1, '0368311662', 'SELLER', '2022-10-10 13:45:46');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
