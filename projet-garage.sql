-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 mai 2023 à 15:57
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet-garage`
--

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `dossier_id` int(11) NOT NULL AUTO_INCREMENT,
  `nomFicher` varchar(45) NOT NULL,
  `vehicule_id` int(11) NOT NULL,
  PRIMARY KEY (`dossier_id`),
  KEY `FK_DossierVehicule` (`vehicule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `marque` varchar(45) NOT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pree`
--

DROP TABLE IF EXISTS `pree`;
CREATE TABLE IF NOT EXISTS `pree` (
  `pree_id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`pree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `vehicule_id` int(11) NOT NULL AUTO_INCREMENT,
  `years` int(11) NOT NULL,
  `color` varchar(15) NOT NULL,
  `model_id` int(11) NOT NULL,
  `pree_id` int(11) NOT NULL,
  PRIMARY KEY (`vehicule_id`),
  KEY `FK_VehiculeModel` (`model_id`),
  KEY `FK_VehiculePree` (`pree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `dossier`
--
ALTER TABLE `dossier`
  ADD CONSTRAINT `FK_DossierVehicule` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule` (`vehicule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `FK_VehiculeModel` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  ADD CONSTRAINT `FK_VehiculePree` FOREIGN KEY (`pree_id`) REFERENCES `pree` (`pree_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
