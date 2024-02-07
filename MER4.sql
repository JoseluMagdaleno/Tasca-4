-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Adreca` VARCHAR(100) NULL,
  `Telefon` INT(9) NULL,
  `VIP` INT NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Tipus_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipus_Polissa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Venedor` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `NUM_Polissa` INT(12) NOT NULL,
  `Preu_anual` INT NULL,
  `Tipus_pagament` VARCHAR(32) NULL,
  `Data_contractacio` DATE NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  `Tipus_Polissa_ID` INT NOT NULL,
  `Venedor_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`NUM_Polissa`),
  INDEX `fk_Polissa_Client_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Tipus_Polissa1_idx` (`Tipus_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER4`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Tipus_Polissa1`
    FOREIGN KEY (`Tipus_Polissa_ID`)
    REFERENCES `MER4`.`Tipus_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `MER4`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
