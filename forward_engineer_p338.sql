-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Profession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profession` (
  `prof_id` INT NOT NULL,
  `profession` VARCHAR(45) NULL,
  PRIMARY KEY (`prof_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zip_Code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zip_Code` (
  `zip_code` INT NOT NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  PRIMARY KEY (`zip_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Status` (
  `status_id` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`my_contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`my_contacts` (
  `contact_id` INT NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `birthday` VARCHAR(45) NULL,
  `fx_prof_id` INT NOT NULL,
  `fx_zip_code` INT NOT NULL,
  `fx_status_id` INT NOT NULL,
  PRIMARY KEY (`contact_id`),
  INDEX `fk_prof_id_idx` (`fx_prof_id` ASC) VISIBLE,
  INDEX `fk_zip_code_idx` (`fx_zip_code` ASC) VISIBLE,
  INDEX `fk_status_id_idx` (`fx_status_id` ASC) VISIBLE,
  CONSTRAINT `fk_prof_id`
    FOREIGN KEY (`fx_prof_id`)
    REFERENCES `mydb`.`Profession` (`prof_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_zip_code`
    FOREIGN KEY (`fx_zip_code`)
    REFERENCES `mydb`.`Zip_Code` (`zip_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_status_id`
    FOREIGN KEY (`fx_status_id`)
    REFERENCES `mydb`.`Status` (`status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seeking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seeking` (
  `seeking_id` INT NOT NULL,
  `seeking` VARCHAR(45) NULL,
  PRIMARY KEY (`seeking_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contact_seeking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact_seeking` (
  `contact_id` INT NOT NULL,
  `seeking_id` INT NOT NULL,
  INDEX `fk_contact_seeking_my_contacts1_idx` (`contact_id` ASC) VISIBLE,
  INDEX `fk_contact_seeking_seeking1_idx` (`seeking_id` ASC) VISIBLE,
  CONSTRAINT `fk_to_my_contacts3`
    FOREIGN KEY (`contact_id`)
    REFERENCES `mydb`.`my_contacts` (`contact_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_to_seeking`
    FOREIGN KEY (`seeking_id`)
    REFERENCES `mydb`.`seeking` (`seeking_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`interests` (
  `interest_id` INT NOT NULL,
  `interest` VARCHAR(45) NULL,
  PRIMARY KEY (`interest_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contacts_interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contacts_interests` (
  `id_interests` INT NOT NULL,
  `contacts_id` INT NOT NULL,
  INDEX `fk_contacts_interests_my_contacts1_idx` (`id_interests` ASC) VISIBLE,
  INDEX `fk_contacts_interests_interests1_idx` (`contacts_id` ASC) VISIBLE,
  CONSTRAINT `fk_to_my_contacts1`
    FOREIGN KEY (`id_interests`)
    REFERENCES `mydb`.`my_contacts` (`contact_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_to_interests`
    FOREIGN KEY (`contacts_id`)
    REFERENCES `mydb`.`interests` (`interest_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
