-- ---------------------------------------------
-- Table `Person`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Person` ;
CREATE TABLE IF NOT EXISTS `Person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  INDEX `first_name` (`first_name` ASC),
  INDEX `last_name` (`last_name` ASC))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Emergency Contact`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Emergency_Contact` ;
CREATE TABLE IF NOT EXISTS `Emergency_Contact` (
  `ice_number` VARCHAR(32) NOT NULL,
  `person_id` INT NOT NULL,
  `ec_first_name`VARCHAR(50) NULL DEFAULT NULL,
  `ec_last_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ice_number`),
  INDEX `ec_first_name` (`ec_first_name` ASC),
  INDEX `ec_last_name` (`ec_last_name` ASC),
  CONSTRAINT `fk_Emergency_Contact_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES Person(`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAUT CHARACTER SET = utf8;
