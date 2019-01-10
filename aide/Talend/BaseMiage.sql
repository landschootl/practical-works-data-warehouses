-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `ROWID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `brands` (`ROWID`, `NAME`) VALUES
(1,	'LEVIS'),
(2,	'SONY'),
(3,	'SAMSUNG');

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ROWID` int(11) NOT NULL AUTO_INCREMENT,
  `EAN` varchar(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT 'Nom du produit',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT 'Marque',
  `UNIT_PRICE` decimal(8,2) DEFAULT NULL COMMENT 'Marque',
  PRIMARY KEY (`ROWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products` (`ROWID`, `EAN`, `NAME`, `BRAND_ID`, `UNIT_PRICE`) VALUES
(1,	'1234567891231',	'jean homme',	1,	75.00),
(2,	'1234567891232',	'jean femme',	1,	90.00),
(3,	'1234567891233',	'veste en jean',	1,	125.00),
(4,	'1234567891234',	'playstation',	2,	400.00),
(5,	'1234567891235',	'manette',	2,	60.00),
(6,	'1234567891236',	'télévision',	2,	900.00),
(7,	'1234567891237',	'téléphone',	3,	500.00),
(8,	'1234567891238',	'télévision',	3,	1100.00),
(9,	'1234567891239',	'oreillette',	3,	30.00),
(10,	'1234567891221',	'bague',	NULL,	350.00),
(11,	'1234567891222',	'collier',	NULL,	250.00);

DROP TABLE IF EXISTS `products_no_brand`;
CREATE TABLE `products_no_brand` (
  `ROWID` int(11) NOT NULL,
  `EAN` varchar(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT 'Nom du produit',
  `BRAND` varchar(255) DEFAULT NULL COMMENT 'Marque',
  `AMOUNT` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ROWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products_no_brand` (`ROWID`, `EAN`, `NAME`, `BRAND`, `AMOUNT`) VALUES
(1,	'1234567891231',	'jean homme',	NULL,	NULL),
(2,	'1234567891232',	'jean femme',	NULL,	NULL),
(3,	'1234567891233',	'veste en jean',	NULL,	NULL),
(4,	'1234567891234',	'playstation',	NULL,	NULL),
(5,	'1234567891235',	'manette',	NULL,	NULL),
(6,	'1234567891236',	'télévision',	NULL,	NULL),
(7,	'1234567891237',	'téléphone',	NULL,	NULL),
(8,	'1234567891238',	'télévision',	NULL,	NULL),
(9,	'1234567891239',	'oreillette',	NULL,	NULL);

DROP TABLE IF EXISTS `products_with_brand`;
CREATE TABLE `products_with_brand` (
  `ROWID` int(11) NOT NULL,
  `EAN` varchar(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT 'Nom du produit',
  `BRAND` varchar(255) DEFAULT NULL COMMENT 'Marque',
  `AMOUNT` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ROWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products_with_brand` (`ROWID`, `EAN`, `NAME`, `BRAND`, `AMOUNT`) VALUES
(10,	'1234567891221',	'bague',	NULL,	NULL),
(11,	'1234567891222',	'collier',	NULL,	NULL);

-- 2014-11-24 13:41:38