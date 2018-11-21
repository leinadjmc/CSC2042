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

-- ---------------------------------------------
-- Table `Employee`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Employee` ;
CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `monthly_salary` BIGINT NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_Employee_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES Person(`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAUT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Tenant`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Tenant` ;
CREATE TABLE IF NOT EXISTS `Tenant` (
  `person_id` INT NOT NULL,
  `bank_account_num` INT NOT NULL,
  CONSTRAINT `fk_Tenant_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES Person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAUT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Skills`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Skills` ;
CREATE TABLE IF NOT EXISTS `Skills` (
  `skill_id` INT NOT NULL,
  `skill` VARCHAR(255) NOT NULL DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  INDEX `skill` (`skill` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `TechnicianSkills`
-- ---------------------------------------------
DROP TABLE IF EXISTS `TechnicianSkills`;
CREATE TABLE IF NOT EXISTS `TechnicianSkills`(
  `employee_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  CONSTRAINT `fk_TechnicianSkills_employee_id`
  FOREIGN KEY (`employee_id`)
  REFERENCES Employee(`employee_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
  CONSTRAINT `fk_TechnicianSkills_skill_id`
  FOREIGN KEY (`skill_id`)
  REFERENCES Skills(`skill_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Manager`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Manager` ;
CREATE TABLE IF NOT EXISTS `Manager`(
  `manager_id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`manager_id`),
  CONSTRAINT `fk_Manager_employee_id`
  FOREIGN KEY (`employee_id`)
  REFERENCES Employee(`employee_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Building`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Building` ;
CREATE TABLE IF NOT EXISTS `Building`(
  `building_id` INT NOT NULL DEFAULT NULL,
  `building_number` INT,
  `street` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `county` VARCHAR(255) NOT NULL,
  `postcode` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`building_id`),
  INDEX `street` (`street` ASC),
  INDEX `city` (`city` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


)
