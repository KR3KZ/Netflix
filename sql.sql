-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.31 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.6099
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour netflix
DROP DATABASE IF EXISTS `netflix`;
CREATE DATABASE IF NOT EXISTS `netflix` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `netflix`;

-- Listage de la structure de la table netflix. category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Listage des données de la table netflix.category : ~10 rows (environ)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Animé'),
	(2, 'Adulte'),
	(3, 'Action'),
	(4, 'Comédies'),
	(5, 'Drames'),
	(6, 'Films d\'animation japonaise'),
	(7, 'Science-fiction'),
	(8, 'Horreur'),
	(9, 'Fantasie'),
	(10, 'Séries');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Listage de la structure de la table netflix. director
DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext,
  `first_name` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table netflix.director : ~0 rows (environ)
DELETE FROM `director`;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;

-- Listage de la structure de la table netflix. movie
DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext,
  `duration` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `image_b64` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table netflix.movie : ~2 rows (environ)
DELETE FROM `movie`;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`id`, `name`, `duration`, `release_date`, `image_b64`) VALUES
	(1, 'Avengers : Endgame', 182, '2019-04-24', 'test'),
	(2, 'Venom', 140, '2020-10-08', 'test');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Listage de la structure de la table netflix. movie_category_member
DROP TABLE IF EXISTS `movie_category_member`;
CREATE TABLE IF NOT EXISTS `movie_category_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_movie_category_member_movie_id` (`movie_id`),
  CONSTRAINT `FK_movie_category_member_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table netflix.movie_category_member : ~0 rows (environ)
DELETE FROM `movie_category_member`;
/*!40000 ALTER TABLE `movie_category_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_category_member` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
