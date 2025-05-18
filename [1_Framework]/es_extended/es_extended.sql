CREATE DATABASE IF NOT EXISTS `es_extended`;

ALTER DATABASE `es_extended`
	DEFAULT CHARACTER SET UTF8MB4;
	
ALTER DATABASE `es_extended`
	DEFAULT COLLATE UTF8MB4_UNICODE_CI;

USE `es_extended`;

CREATE TABLE `users` (
	`identifier` VARCHAR(60) NOT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT NULL DEFAULT 0,
	`job2` VARCHAR(20) NULL DEFAULT 'unemployed2',
	`job2_grade` INT NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`metadata` LONGTEXT NULL DEFAULT NULL,
	`position` longtext NULL DEFAULT NULL,

	PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;

CREATE TABLE `user_perm` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(255) NOT NULL UNIQUE,
  `steam_id` varchar(50) DEFAULT 'N/A',
  `ip` varchar(15) DEFAULT '0.0.0.0',
  `nom` VARCHAR(255) NOT NULL DEFAULT 'Inconnu',
  `group` VARCHAR(50) NOT NULL DEFAULT 'user',
  `date_ajout` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`rare` TINYINT NOT NULL DEFAULT 0,
	`can_remove` TINYINT NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

CREATE TABLE `job_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

INSERT INTO `jobs` VALUES ('unemployed','Unemployed');
