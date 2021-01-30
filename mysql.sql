-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.22-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица graph.gr_city
CREATE TABLE IF NOT EXISTS `gr_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы graph.gr_city: ~0 rows (приблизительно)
DELETE FROM `gr_city`;
/*!40000 ALTER TABLE `gr_city` DISABLE KEYS */;
INSERT INTO `gr_city` (`id`, `name`, `phone`) VALUES
	(1, 'Omsk', 777888666),
	(2, 'Omsk', 777888999),
	(3, 'Omsk', 4444),
	(4, 'Omsk', 4444);
/*!40000 ALTER TABLE `gr_city` ENABLE KEYS */;

-- Дамп структуры для таблица graph.gr_station
CREATE TABLE IF NOT EXISTS `gr_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `CITY_KEY` (`city_id`),
  CONSTRAINT `ST_TO_CITY` FOREIGN KEY (`city_id`) REFERENCES `gr_city` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы graph.gr_station: ~0 rows (приблизительно)
DELETE FROM `gr_station`;
/*!40000 ALTER TABLE `gr_station` DISABLE KEYS */;
INSERT INTO `gr_station` (`id`, `name`, `city_id`) VALUES
	(1, 'Station 1', 1),
	(2, 'Station 2', 1);
/*!40000 ALTER TABLE `gr_station` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
