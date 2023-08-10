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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.accounts: ~5 rows (aproximadamente)
INSERT INTO `accounts` (`id`, `name`, `url`, `id_user`, `created_at`, `updated_at`) VALUES
	(1, 'junio 2023', '6ae674a4d05e963bc13f05b81ddfca82', 1, '2023-07-02 01:17:41', '2023-07-03 19:16:48'),
	(2, 'año 2023', '57c3e0c33e39842feb543be911d88ddd', 3, '2023-07-02 01:18:19', '2023-07-03 19:16:50'),
	(3, 'julio 2023', '9081b81dd23adda82fba89fa8fd16a27', 1, '2023-07-02 01:18:57', '2023-07-03 19:16:53'),
	(4, 'ingresos pasivos', '9948e6718ba049f92a787467909dc765', 2, '2023-07-02 01:20:30', '2023-07-03 19:16:56'),
	(5, 'agosto 2023', '4cb604960c5e936cede42fbaddcb0ca1', 1, '2023-08-09 22:20:19', '2023-08-09 22:20:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.categories: ~27 rows (aproximadamente)
INSERT INTO `categories` (`id`, `name`, `color`, `priority`, `id_user`, `id_type`, `created_at`, `updated_at`) VALUES
	(1, 'taxi', NULL, 0, 1, 1, '2023-07-02 14:56:09', '2023-07-02 14:56:09'),
	(2, 'carnicería', NULL, 0, 1, 1, '2023-07-02 14:58:47', '2023-07-02 14:58:54'),
	(3, 'moto', NULL, 0, 1, 1, '2023-07-02 15:00:28', '2023-07-02 15:00:28'),
	(4, 'verdulería', NULL, 0, 1, 1, '2023-07-02 15:02:03', '2023-07-02 15:02:10'),
	(5, 'metrogas', NULL, 0, 1, 1, '2023-07-02 15:48:49', '2023-07-02 15:48:56'),
	(6, 'carrefour', NULL, 0, 1, 1, '2023-07-02 17:51:02', '2023-07-02 17:51:02'),
	(7, 'almuerzo', NULL, 0, 1, 1, '2023-07-03 18:55:03', '2023-07-03 18:55:03'),
	(8, 'dietética', NULL, 0, 1, 1, '2023-07-03 18:56:25', '2023-07-03 18:57:19'),
	(9, 'panadería', NULL, 0, 1, 1, '2023-07-09 19:09:02', '2023-07-09 19:09:09'),
	(10, 'lore', NULL, 0, 1, 1, '2023-07-09 19:11:00', '2023-07-09 19:11:00'),
	(11, 'internet casa', NULL, 0, 1, 1, '2023-07-09 19:12:08', '2023-07-09 19:13:52'),
	(12, 'trabajo', NULL, 0, 1, 2, '2023-07-09 19:14:44', '2023-07-09 19:14:51'),
	(13, 'auto', NULL, 0, 1, 1, '2023-07-09 19:17:20', '2023-07-09 19:17:43'),
	(14, 'ropa', NULL, 0, 1, 1, '2023-07-09 19:23:22', '2023-07-09 19:23:28'),
	(15, 'youtube', NULL, 0, 1, 1, '2023-07-09 19:25:51', '2023-07-09 19:25:59'),
	(16, 'visa ciudad impuestos', NULL, 0, 1, 1, '2023-07-09 19:31:53', '2023-07-09 19:32:01'),
	(17, 'peluquería', NULL, 0, 1, 1, '2023-07-09 19:38:55', '2023-07-09 19:39:02'),
	(18, 'expensas', NULL, 0, 1, 1, '2023-07-09 19:54:02', '2023-07-09 19:54:06'),
	(19, 'abl', NULL, 0, 1, 1, '2023-07-09 19:57:16', '2023-07-09 19:57:22'),
	(20, 'aysa', NULL, 0, 1, 1, '2023-07-09 19:58:11', '2023-07-09 19:58:11'),
	(21, 'edesur', NULL, 0, 1, 1, '2023-07-09 19:59:05', '2023-07-09 19:59:05'),
	(22, 'británico', NULL, 0, 1, 1, '2023-07-09 19:59:54', '2023-07-09 20:00:00'),
	(23, 'netflix', NULL, 0, 1, 1, '2023-07-09 20:01:17', '2023-07-09 20:01:17'),
	(24, 'diarco', NULL, 0, 1, 1, '2023-07-11 00:42:33', '2023-07-11 00:42:41'),
	(25, 'varios', NULL, 0, 1, 1, '2023-07-16 22:55:24', '2023-07-16 22:55:24'),
	(26, 'celular', NULL, 0, 1, 1, '2023-07-16 23:23:53', '2023-07-16 23:24:10'),
	(27, 'master francés impuestos', NULL, 0, 1, 1, '2023-07-16 23:28:39', '2023-07-16 23:28:45'),
	(28, 'tinder', NULL, 0, 1, 1, '2023-07-16 23:30:35', '2023-07-16 23:30:40'),
	(29, 'delivery', NULL, 0, 1, 1, '2023-07-23 02:45:07', '2023-07-23 02:45:07');

-- Volcando estructura para tabla finances.investments
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(50) DEFAULT NULL,
  `anr` decimal(11,2) DEFAULT NULL,
  `capital` decimal(11,2) DEFAULT NULL,
  `interest` decimal(11,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.investments: ~2 rows (aproximadamente)
INSERT INTO `investments` (`id`, `bank`, `anr`, `capital`, `interest`, `date`, `expiration`, `created_at`, `updated_at`) VALUES
	(1, 'francés', 97.00, 60000.00, 4783.56, '2023-07-15', '2023-08-16', '2023-07-15 20:21:48', '2023-07-15 20:22:12'),
	(2, 'francés', 97.00, 30000.00, 2391.78, '2023-07-15', '2023-08-16', '2023-07-15 20:22:22', '2023-07-15 20:22:48');

-- Volcando estructura para tabla finances.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `value` decimal(11,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_subcategory` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_subcategory` (`id_subcategory`),
  KEY `fk_accounts_id_account` (`id_account`),
  CONSTRAINT `fk_accounts_id_account` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.items: ~90 rows (aproximadamente)
INSERT INTO `items` (`id`, `name`, `value`, `date`, `id_subcategory`, `created_at`, `updated_at`, `id_account`) VALUES
	(1, 'didi', 316.76, '2023-07-03', 1, '2023-07-02 14:58:00', '2023-07-03 19:27:38', 3),
	(2, 'carnicería', 12708.25, '2023-07-01', 2, '2023-07-02 14:59:32', '2023-07-03 19:27:40', 3),
	(3, 'cambio de aceite + lubricacion cadena', 10000.00, '2023-07-01', 3, '2023-07-02 15:01:19', '2023-07-03 19:27:43', 3),
	(4, 'verdulería', 2040.00, '2023-07-01', 4, '2023-07-02 15:02:58', '2023-07-03 19:27:45', 3),
	(5, 'metrogas', 885.08, '2023-07-02', 5, '2023-07-02 15:49:29', '2023-07-03 19:27:48', 3),
	(6, 'carrefour', 4180.50, '2023-07-02', 6, '2023-07-02 17:52:12', '2023-07-03 19:27:59', 3),
	(7, 'lunes', 300.00, '2023-07-03', 7, '2023-07-03 18:56:10', '2023-07-03 19:28:02', 3),
	(8, 'dietética', 4900.00, '2023-07-03', 8, '2023-07-03 18:58:15', '2023-07-03 19:28:03', 3),
	(9, 'facturas', 520.00, '2023-07-05', 9, '2023-07-09 19:10:08', '2023-08-09 22:14:46', 3),
	(10, 'lore', 2000.00, '2023-07-05', 10, '2023-07-09 19:11:36', '2023-08-09 22:14:46', 3),
	(11, 'internet casa', 9714.99, '2023-07-05', 11, '2023-07-09 19:12:44', '2023-08-09 22:14:47', 3),
	(12, 'aguinaldo', 50695.00, '2023-07-05', 12, '2023-07-09 19:15:23', '2023-08-09 22:14:48', 3),
	(13, 'gas', 410.00, '2023-07-06', 13, '2023-07-09 19:18:09', '2023-08-09 22:14:48', 3),
	(14, 'jueves', 300.00, '2023-07-06', 14, '2023-07-09 19:20:29', '2023-08-09 22:14:49', 3),
	(15, 'nafta', 2800.00, '2023-07-06', 15, '2023-07-09 19:21:19', '2023-08-09 22:14:50', 3),
	(16, 'ropa', 9530.00, '2023-07-06', 16, '2023-07-09 19:24:08', '2023-08-09 22:14:50', 3),
	(17, 'ropa', 6362.56, '2023-07-06', 16, '2023-07-09 19:24:54', '2023-08-09 22:14:51', 3),
	(18, 'youtube', 389.00, '2023-07-06', 17, '2023-07-09 19:26:36', '2023-08-09 22:14:51', 3),
	(19, 'visa ciudad impuestos', 734.37, '2023-07-06', 18, '2023-07-09 19:32:33', '2023-08-09 22:14:52', 3),
	(20, 'masitas', 700.00, '2023-07-07', 19, '2023-07-09 19:34:30', '2023-08-09 22:14:52', 3),
	(21, 'viernes', 1270.00, '2023-07-07', 20, '2023-07-09 19:35:42', '2023-08-09 22:14:53', 3),
	(22, 'sueldo', 250000.00, '2023-07-07', 12, '2023-07-09 19:38:33', '2023-08-09 22:14:54', 3),
	(23, 'peluquería', 1800.00, '2023-07-08', 25, '2023-07-09 19:40:13', '2023-08-09 22:14:54', 3),
	(24, 'verdulería', 1180.00, '2023-07-08', 4, '2023-07-09 19:41:05', '2023-08-09 22:14:55', 3),
	(25, 'gas', 800.00, '2023-07-07', 26, '2023-07-09 19:43:23', '2023-08-09 22:14:56', 3),
	(27, 'monotributo', 2689.05, '2023-07-09', 29, '2023-07-09 19:48:55', '2023-08-09 22:14:57', 3),
	(28, 'gas', 510.00, '2023-07-08', 26, '2023-07-09 19:50:00', '2023-08-09 22:16:13', 3),
	(29, 'teléfono', 3185.00, '2023-07-09', 30, '2023-07-09 19:52:27', '2023-08-09 22:16:13', 3),
	(30, 'didi', 341.77, '2023-07-10', 1, '2023-07-09 19:52:56', '2023-08-09 22:16:13', 3),
	(31, 'expensas', 35652.56, '2023-07-09', 31, '2023-07-09 19:54:46', '2023-08-09 22:16:13', 3),
	(32, 'garage', 5600.00, '2023-07-09', 32, '2023-07-09 19:55:28', '2023-08-09 22:16:13', 3),
	(33, 'ropa', 8815.90, '2023-07-09', 16, '2023-07-09 19:55:52', '2023-08-09 22:16:13', 3),
	(34, 'abl', 1481.86, '2023-07-09', 33, '2023-07-09 19:57:52', '2023-08-09 22:16:13', 3),
	(35, 'aysa', 1701.92, '2023-07-09', 34, '2023-07-09 19:58:41', '2023-08-09 22:16:13', 3),
	(36, 'edesur', 1029.38, '2023-07-09', 35, '2023-07-09 19:59:41', '2023-08-09 22:16:13', 3),
	(37, 'británico', 6731.86, '2023-07-09', 36, '2023-07-09 20:00:54', '2023-08-09 22:16:13', 3),
	(38, 'netflix', 1650.00, '2023-07-09', 37, '2023-07-09 20:01:58', '2023-08-09 22:16:13', 3),
	(39, 'carrefour', 2680.00, '2023-07-09', 6, '2023-07-09 20:02:22', '2023-08-09 22:16:13', 3),
	(40, 'lunes', 500.00, '2023-07-10', 7, '2023-07-11 00:41:47', '2023-08-09 22:16:13', 3),
	(41, 'diarco', 5460.00, '2023-07-10', 38, '2023-07-11 00:43:17', '2023-08-09 22:16:13', 3),
	(42, 'masitas', 700.00, '2023-07-11', 19, '2023-07-11 22:58:33', '2023-08-09 22:16:13', 3),
	(43, 'facturas', 520.00, '2023-07-11', 9, '2023-07-11 22:58:49', '2023-08-09 22:16:13', 3),
	(44, 'gas', 400.00, '2023-07-12', 13, '2023-07-16 22:50:47', '2023-08-09 22:16:13', 3),
	(45, 'miércoles', 200.00, '2023-07-12', 39, '2023-07-16 22:53:38', '2023-08-09 22:16:13', 3),
	(46, 'lore', 2000.00, '2023-07-12', 10, '2023-07-16 22:54:06', '2023-08-09 22:16:13', 3),
	(47, 'bizcochos', 250.00, '2023-07-13', 40, '2023-07-16 22:56:07', '2023-08-09 22:16:13', 3),
	(48, 'bizcochos', 270.00, '2023-07-13', 40, '2023-07-16 22:56:20', '2023-08-09 22:16:13', 3),
	(49, 'gas', 400.00, '2023-07-13', 13, '2023-07-16 22:56:59', '2023-08-09 22:16:13', 3),
	(50, 'jueves', 450.00, '2023-07-13', 14, '2023-07-16 22:58:11', '2023-08-09 22:16:13', 3),
	(51, 'viernes', 1570.00, '2023-07-14', 20, '2023-07-16 22:58:44', '2023-08-09 22:16:13', 3),
	(52, 'metogas', 39.17, '2023-07-15', 5, '2023-07-16 22:59:18', '2023-08-09 22:16:13', 3),
	(53, 'verdulería', 1000.00, '2023-07-15', 4, '2023-07-16 22:59:35', '2023-08-09 22:16:13', 3),
	(54, 'jornal', 13524.72, '2023-07-07', 41, '2023-07-16 23:03:15', '2023-08-09 22:16:13', 3),
	(55, 'jornal', 11252.87, '2023-07-08', 41, '2023-07-16 23:03:38', '2023-08-09 22:16:13', 3),
	(56, 'jornal', 14900.14, '2023-07-14', 41, '2023-07-16 23:03:56', '2023-08-09 22:16:13', 3),
	(57, 'didi', 541.82, '2023-07-17', 1, '2023-07-16 23:08:44', '2023-08-09 22:16:13', 3),
	(58, 'gas', 800.00, '2023-07-14', 26, '2023-07-16 23:09:09', '2023-08-09 22:16:13', 3),
	(59, 'seguro', 9953.00, '2023-07-15', 42, '2023-07-16 23:09:35', '2023-08-09 22:16:13', 3),
	(60, 'seguro', 457.24, '2023-07-10', 43, '2023-07-16 23:23:01', '2023-08-09 22:16:13', 3),
	(61, 'celular', 48449.66, '2023-07-10', 44, '2023-07-16 23:24:56', '2023-08-09 22:16:13', 3),
	(62, 'datos', 300.00, '2023-07-10', 45, '2023-07-16 23:26:29', '2023-08-09 22:16:13', 3),
	(63, 'master francés impuestos', 585.00, '2023-07-10', 46, '2023-07-16 23:29:37', '2023-08-09 22:16:13', 3),
	(64, 'tinder', 4989.82, '2023-07-10', 47, '2023-07-16 23:31:09', '2023-08-09 22:16:13', 3),
	(65, 'lunes', 330.00, '2023-07-17', 7, '2023-07-23 02:41:05', '2023-08-09 22:16:13', 3),
	(66, 'martes', 200.00, '2023-07-18', 48, '2023-07-23 02:42:52', '2023-08-09 22:16:13', 3),
	(67, 'miércoles', 200.00, '2023-07-19', 39, '2023-07-23 02:43:19', '2023-08-09 22:16:13', 3),
	(68, 'lore', 2000.00, '2023-07-20', 10, '2023-07-23 02:44:02', '2023-08-09 22:16:13', 3),
	(69, 'delivery', 1600.00, '2023-07-20', 49, '2023-07-23 02:46:05', '2023-08-09 22:16:13', 3),
	(70, 'masitas', 700.00, '2023-07-21', 19, '2023-07-23 02:46:49', '2023-08-09 22:16:13', 3),
	(71, 'viernes', 1600.00, '2023-07-21', 20, '2023-07-23 02:47:15', '2023-08-09 22:16:13', 3),
	(72, 'gas', 800.00, '2023-07-21', 26, '2023-07-23 02:50:15', '2023-08-09 22:16:13', 3),
	(73, 'didi', 691.89, '2023-07-24', 1, '2023-07-23 02:50:46', '2023-08-09 22:16:13', 3),
	(74, 'jornal', 13498.70, '2023-07-21', 41, '2023-07-23 02:52:23', '2023-08-09 22:16:13', 3),
	(75, 'carrefour', 6810.00, '2023-07-23', 6, '2023-07-23 18:00:17', '2023-08-09 22:16:13', 3),
	(76, 'lunes', 500.00, '2023-07-24', 7, '2023-07-30 13:47:11', '2023-08-09 22:16:13', 3),
	(77, 'masitas', 700.00, '2023-07-25', 19, '2023-07-30 13:49:07', '2023-08-09 22:16:13', 3),
	(78, 'cremona', 300.00, '2023-07-25', 50, '2023-07-30 13:49:52', '2023-08-09 22:16:13', 3),
	(79, 'bizcochos', 300.00, '2023-07-26', 40, '2023-07-30 13:51:19', '2023-08-09 22:16:13', 3),
	(80, 'gas', 400.00, '2023-07-26', 13, '2023-07-30 13:52:49', '2023-08-09 22:16:13', 3),
	(81, 'diarco', 680.00, '2023-07-26', 38, '2023-07-30 13:54:14', '2023-08-09 22:16:13', 3),
	(82, 'lore', 2000.00, '2023-07-27', 10, '2023-07-30 13:55:20', '2023-08-09 22:16:13', 3),
	(83, 'cremona', 450.00, '2023-07-27', 50, '2023-07-30 13:56:18', '2023-08-09 22:16:13', 3),
	(84, 'nafta', 2900.00, '2023-07-28', 15, '2023-07-30 13:57:42', '2023-08-09 22:16:13', 3),
	(85, 'facturas', 680.00, '2023-07-28', 9, '2023-07-30 13:58:11', '2023-08-09 22:16:13', 3),
	(86, 'jueves', 1200.00, '2023-07-28', 14, '2023-07-30 14:00:11', '2023-08-09 22:16:13', 3),
	(87, 'viernes', 2550.00, '2023-07-28', 20, '2023-07-30 14:02:03', '2023-08-09 22:16:13', 3),
	(88, 'gas', 800.00, '2023-07-29', 26, '2023-07-30 14:03:23', '2023-08-09 22:16:13', 3),
	(89, 'didi', 160.46, '2023-07-31', 1, '2023-07-30 14:04:05', '2023-08-09 22:16:13', 3),
	(90, 'jornal', 14967.45, '2023-07-29', 41, '2023-07-30 14:05:10', '2023-08-09 22:16:13', 3),
	(91, 'verdulería', 1680.00, '2023-07-31', 4, '2023-07-31 23:53:24', '2023-08-09 22:16:13', 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.subcategories: ~39 rows (aproximadamente)
INSERT INTO `subcategories` (`id`, `name`, `id_category`, `created_at`, `updated_at`) VALUES
	(1, 'didi', 1, '2023-07-02 14:57:33', '2023-07-02 14:57:38'),
	(2, 'carniceria', 2, '2023-07-02 14:59:22', '2023-07-02 14:59:22'),
	(3, 'mantenimiento', 3, '2023-07-02 15:00:50', '2023-07-02 15:00:56'),
	(4, 'verdulería', 4, '2023-07-02 15:02:44', '2023-07-02 15:02:47'),
	(5, 'metrogas', 5, '2023-07-02 15:49:04', '2023-07-02 15:49:08'),
	(6, 'carrefour', 6, '2023-07-02 17:51:24', '2023-07-02 17:51:24'),
	(7, 'lunes', 7, '2023-07-03 18:55:22', '2023-07-03 18:55:22'),
	(8, 'dietética', 8, '2023-07-03 18:58:02', '2023-07-03 18:58:02'),
	(9, 'facturas', 9, '2023-07-09 19:09:40', '2023-07-09 19:09:40'),
	(10, 'lore', 10, '2023-07-09 19:11:12', '2023-07-09 19:11:12'),
	(11, 'internet casa', 11, '2023-07-09 19:12:27', '2023-07-09 19:13:43'),
	(12, 'cecaitra', 12, '2023-07-09 19:15:10', '2023-07-09 19:15:13'),
	(13, 'gas', 13, '2023-07-09 19:17:58', '2023-07-09 19:18:00'),
	(14, 'jueves', 7, '2023-07-09 19:19:52', '2023-07-09 19:19:52'),
	(15, 'nafta', 3, '2023-07-09 19:21:00', '2023-07-09 19:21:00'),
	(16, 'ropa', 14, '2023-07-09 19:23:53', '2023-07-09 19:23:53'),
	(17, 'youtube', 15, '2023-07-09 19:26:09', '2023-07-09 19:26:13'),
	(18, 'visa ciudad impuestos', 16, '2023-07-09 19:32:13', '2023-07-09 19:32:18'),
	(19, 'masitas', 9, '2023-07-09 19:34:19', '2023-07-09 19:34:19'),
	(20, 'viernes', 7, '2023-07-09 19:34:56', '2023-07-09 19:35:00'),
	(25, 'peluquería', 17, '2023-07-09 19:39:19', '2023-07-09 19:39:19'),
	(26, 'gas', 1, '2023-07-09 19:43:00', '2023-07-09 19:43:00'),
	(29, 'monotributo', 1, '2023-07-09 19:48:34', '2023-07-09 19:48:34'),
	(30, 'teléfono', 1, '2023-07-09 19:51:47', '2023-07-09 19:51:51'),
	(31, 'expensas', 18, '2023-07-09 19:54:18', '2023-07-09 19:54:23'),
	(32, 'garage', 3, '2023-07-09 19:55:09', '2023-07-09 19:55:09'),
	(33, 'abl', 19, '2023-07-09 19:57:35', '2023-07-09 19:57:35'),
	(34, 'aysa', 20, '2023-07-09 19:58:25', '2023-07-09 19:58:25'),
	(35, 'edesur', 21, '2023-07-09 19:59:19', '2023-07-09 19:59:19'),
	(36, 'británico', 22, '2023-07-09 20:00:24', '2023-07-09 20:00:24'),
	(37, 'netflix', 23, '2023-07-09 20:01:31', '2023-07-09 20:01:37'),
	(38, 'diarco', 24, '2023-07-11 00:41:04', '2023-07-11 00:42:54'),
	(39, 'miércoles', 7, '2023-07-16 22:52:43', '2023-07-16 22:52:43'),
	(40, 'bizcochos', 25, '2023-07-16 22:55:42', '2023-07-16 22:55:48'),
	(41, 'taxi', 12, '2023-07-16 23:01:34', '2023-07-16 23:01:34'),
	(42, 'seguro', 1, '2023-07-16 23:07:27', '2023-07-16 23:07:27'),
	(43, 'seguro', 3, '2023-07-16 23:22:34', '2023-07-16 23:22:34'),
	(44, 'renovación', 26, '2023-07-16 23:24:28', '2023-07-16 23:25:47'),
	(45, 'datos', 26, '2023-07-16 23:25:59', '2023-07-16 23:26:07'),
	(46, 'master frances impuestos', 27, '2023-07-16 23:28:59', '2023-07-16 23:29:07'),
	(47, 'tinder', 28, '2023-07-16 23:30:54', '2023-07-16 23:30:54'),
	(48, 'martes', 7, '2023-07-23 02:42:04', '2023-07-23 02:42:04'),
	(49, 'delivery', 29, '2023-07-23 02:45:39', '2023-07-23 02:45:39'),
	(50, 'cremona', 9, '2023-07-30 13:48:23', '2023-07-30 13:48:23');

-- Volcando estructura para tabla finances.types
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.types: ~3 rows (aproximadamente)
INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'gasto', '2023-07-02 04:15:48', '2023-07-02 04:15:48'),
	(2, 'ingreso', '2023-07-02 04:15:48', '2023-07-02 04:15:48'),
	(3, 'inversión', '2023-07-02 04:15:48', '2023-07-02 04:15:48');

-- Volcando estructura para tabla finances.usd
CREATE TABLE IF NOT EXISTS `usd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `official_purchase` decimal(11,2) DEFAULT NULL,
  `official_sale` decimal(11,2) DEFAULT NULL,
  `unofficial_purchase` decimal(11,2) DEFAULT NULL,
  `unofficial_sale` decimal(11,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.usd: ~9 rows (aproximadamente)
INSERT INTO `usd` (`id`, `date`, `official_purchase`, `official_sale`, `unofficial_purchase`, `unofficial_sale`, `created_at`, `updated_at`) VALUES
	(1, '2023-07-07', NULL, NULL, 487.00, 492.00, '2023-07-15 15:03:31', '2023-07-15 15:03:43'),
	(2, '2023-07-14', 264.00, 277.00, 517.00, 522.00, '2023-07-15 15:03:47', '2023-07-15 15:04:12'),
	(3, '2023-07-21', 268.50, 281.50, 523.00, 528.00, '2023-07-23 02:08:08', '2023-07-23 02:09:15'),
	(4, '2023-07-24', 270.50, 283.50, 547.00, 552.00, '2023-07-24 20:19:17', '2023-07-24 20:19:17'),
	(5, '2023-07-25', 270.50, 283.50, 531.00, 536.00, '2023-07-26 00:23:16', '2023-07-26 00:23:47'),
	(6, '2023-07-26', 271.00, 284.00, 541.00, 546.00, '2023-07-26 20:49:46', '2023-07-26 20:51:06'),
	(7, '2023-07-27', 271.00, 284.00, 548.00, 553.00, '2023-07-27 20:52:42', '2023-07-27 20:53:29'),
	(8, '2023-07-28', 272.00, 285.00, 546.00, 551.00, '2023-07-30 12:37:44', '2023-07-30 12:38:13'),
	(9, '2023-07-31', 273.50, 286.50, 545.00, 550.00, '2023-07-31 23:56:42', '2023-07-31 23:57:19'),
	(10, '2023-08-04', 278.00, 291.00, 569.00, 574.00, '2023-08-05 16:26:24', '2023-08-05 16:27:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`id`, `nickname`, `email`, `password`, `token`, `confirmed`, `created_at`, `updated_at`) VALUES
	(1, 'lionel prats', 'lionel.prats.c@gmail.com', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 1, '2023-07-02 04:15:48', '2023-07-02 04:15:48'),
	(2, 'virginia prats', 'v.prats@hotmail.com.ar', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 1, '2023-07-02 04:15:48', '2023-07-02 04:15:48'),
	(3, 'rodrigo turcowicz', 'rodrigo@correo.com', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 1, '2023-07-02 04:15:48', '2023-07-02 04:15:48'),
	(4, 'tomas wagner', 'tomas@correo.com', '$2y$10$nsIVXxl6rYSms1BH1LrJnuYCh2w52RMNHfjgOeoE0xcFVSajYUvgC', '', 0, '2023-07-02 04:15:48', '2023-07-02 04:15:48');

-- Volcando estructura para tabla finances.wallets
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallet` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_account` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_date_id_user_idaccount` (`date`,`id_user`,`id_account`),
  KEY `id_user` (`id_user`),
  KEY `id_account` (`id_account`),
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wallets_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla finances.wallets: ~8 rows (aproximadamente)
INSERT INTO `wallets` (`id`, `wallet`, `date`, `id_user`, `id_account`, `created_at`, `updated_at`) VALUES
	(1, 'a:7:{s:9:"billetera";s:4:"6750";s:10:"caja_chica";s:3:"890";s:11:"caja_grande";s:5:"15500";s:12:"banco_ciudad";s:7:"1815.01";s:13:"banco_frances";s:5:"100.3";s:4:"didi";s:7:"3758.69";s:12:"mercado_pago";s:8:"65962.31";}', '2023-06-30', 1, 3, '2023-07-02 15:18:14', '2023-07-02 15:18:14'),
	(2, 'a:7:{s:9:"billetera";s:4:"4750";s:10:"caja_chica";s:3:"890";s:11:"caja_grande";s:5:"15500";s:12:"banco_ciudad";s:7:"1815.01";s:13:"banco_frances";s:5:"100.3";s:4:"didi";s:7:"3441.93";s:12:"mercado_pago";s:8:"41214.06";}', '2023-07-01', 1, 3, '2023-07-02 15:18:33', '2023-07-02 15:18:33'),
	(3, 'a:7:{s:9:"billetera";s:5:"10000";s:10:"caja_chica";s:3:"840";s:11:"caja_grande";s:5:"10300";s:12:"banco_ciudad";s:5:"30000";s:13:"banco_frances";s:5:"100.3";s:4:"didi";s:7:"3441.93";s:12:"mercado_pago";s:7:"7963.49";}', '2023-07-02', 1, 3, '2023-07-02 17:49:55', '2023-07-02 17:49:55'),
	(4, 'a:7:{s:9:"billetera";s:5:"10000";s:10:"caja_chica";s:3:"610";s:11:"caja_grande";s:4:"9900";s:12:"banco_ciudad";s:4:"1000";s:13:"banco_frances";s:6:"115000";s:4:"didi";s:7:"7195.82";s:12:"mercado_pago";s:9:"129257.75";}', '2023-07-09', 1, 3, '2023-07-09 19:05:57', '2023-07-09 19:05:57'),
	(5, 'a:8:{s:9:"billetera";s:5:"10000";s:10:"caja_chica";s:3:"530";s:11:"caja_grande";s:4:"7500";s:12:"banco_ciudad";s:3:"100";s:13:"banco_frances";s:3:"100";s:4:"didi";s:7:"3858.32";s:9:"inversion";s:5:"60000";s:12:"mercado_pago";s:9:"129014.54";}', '2023-07-14', 1, 3, '2023-07-15 17:03:05', '2023-07-15 17:03:05'),
	(6, 'a:8:{s:9:"billetera";s:5:"10000";s:10:"caja_chica";s:3:"340";s:11:"caja_grande";s:5:"13300";s:12:"banco_ciudad";s:6:"100.32";s:13:"banco_frances";s:3:"100";s:4:"didi";s:7:"2096.81";s:9:"inversion";s:6:"100000";s:12:"mercado_pago";s:8:"94384.11";}', '2023-07-22', 1, 3, '2023-07-23 02:36:40', '2023-07-23 02:36:40'),
	(7, 'a:9:{s:9:"billetera";s:4:"5000";s:10:"caja_chica";s:3:"620";s:11:"caja_grande";s:4:"5000";s:12:"banco_ciudad";s:5:"99.13";s:13:"banco_frances";s:3:"100";s:4:"didi";s:7:"2506.99";s:9:"inversion";s:6:"120000";s:12:"mercado_pago";s:8:"70146.81";s:7:"reserva";s:5:"15000";}', '2023-07-29', 1, 3, '2023-07-30 13:43:24', '2023-07-30 13:43:24'),
	(8, 'a:9:{s:9:"billetera";s:4:"5000";s:10:"caja_chica";s:3:"640";s:11:"caja_grande";s:5:"12800";s:12:"banco_ciudad";s:4:"1.12";s:13:"banco_frances";s:3:"100";s:4:"didi";s:1:"0";s:9:"inversion";s:6:"120000";s:12:"mercado_pago";s:8:"73386.59";s:7:"reserva";s:4:"5500";}', '2023-07-31', 1, 3, '2023-07-31 23:50:13', '2023-07-31 23:50:13');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
