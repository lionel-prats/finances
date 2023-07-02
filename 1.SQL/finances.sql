-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para finances
CREATE DATABASE IF NOT EXISTS `finances` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `finances`;

-- Volcando estructura para tabla finances.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(32) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name_id_user` (`name`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.accounts: ~0 rows (aproximadamente)
ALTER TABLE accounts AUTO_INCREMENT = 1;

-- Volcando estructura para tabla finances.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `priority` tinyint(1) DEFAULT 0,
  `id_user` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name_id_user_id_type` (`name`,`id_user`,`id_type`),
  KEY `id_user` (`id_user`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.categories: ~0 rows (aproximadamente)
ALTER TABLE categories AUTO_INCREMENT = 1;

-- Volcando estructura para tabla finances.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `value` decimal(11,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_subcategory` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_subcategory` (`id_subcategory`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.items: ~0 rows (aproximadamente)
ALTER TABLE items AUTO_INCREMENT = 1;

-- Volcando estructura para tabla finances.subcategories
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name_id_category` (`name`,`id_category`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.subcategories: ~0 rows (aproximadamente)
ALTER TABLE subcategories AUTO_INCREMENT = 1;

-- Volcando estructura para tabla finances.types
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.types: ~0 rows (aproximadamente)
ALTER TABLE types AUTO_INCREMENT = 1;
INSERT INTO types 
(name) VALUES
('gasto'),
('ingreso'),
('inversión');

-- Volcando estructura para tabla finances.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.users: ~1 rows (aproximadamente)
ALTER TABLE users AUTO_INCREMENT = 1;
INSERT INTO `users` (`nickname`, `email`, `password`, `token`, `confirmed`) VALUES
	('lionel prats', 'lionel.prats.c@gmail.com', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 1),
	('virginia prats', 'v.prats@hotmail.com.ar', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 1),
	('rodrigo turcowicz', 'rodrigo@correo.com', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 1),
	('tomas wagner', 'tomas@correo.com', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
