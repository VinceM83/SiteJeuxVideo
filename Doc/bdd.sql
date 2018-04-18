-- MySQL Script generated by MySQL Workbench
-- Wed Apr 18 14:52:37 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Editeur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Editeur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Editeur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jeux`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Jeux` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Jeux` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NOT NULL,
  `Editeur_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC),
  INDEX `fk_Jeux_Editeur1_idx` (`Editeur_id` ASC),
  CONSTRAINT `fk_Jeux_Editeur1`
    FOREIGN KEY (`Editeur_id`)
    REFERENCES `mydb`.`Editeur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Support`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Support` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Support` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DLC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DLC` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DLC` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NOT NULL,
  `Editeur_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC),
  INDEX `fk_DLC_Editeur1_idx` (`Editeur_id` ASC),
  CONSTRAINT `fk_DLC_Editeur1`
    FOREIGN KEY (`Editeur_id`)
    REFERENCES `mydb`.`Editeur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jeux_has_Support`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Jeux_has_Support` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Jeux_has_Support` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Jeux_id` INT NOT NULL,
  `Support_id` INT NOT NULL,
  `DLC_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Jeux_has_Support_Support1_idx` (`Support_id` ASC),
  INDEX `fk_Jeux_has_Support_Jeux1_idx` (`Jeux_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Jeux_has_Support_DLC1_idx` (`DLC_id` ASC),
  CONSTRAINT `fk_Jeux_has_Support_Jeux1`
    FOREIGN KEY (`Jeux_id`)
    REFERENCES `mydb`.`Jeux` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jeux_has_Support_Support1`
    FOREIGN KEY (`Support_id`)
    REFERENCES `mydb`.`Support` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jeux_has_Support_DLC1`
    FOREIGN KEY (`DLC_id`)
    REFERENCES `mydb`.`DLC` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
