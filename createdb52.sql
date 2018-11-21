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
DEFAULT CHARACTER SET = utf8;

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
DEFAULT CHARACTER SET = utf8;

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
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Skills`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Skills` ;
CREATE TABLE IF NOT EXISTS `Skills` (
  `skill_id` INT NOT NULL,
  `skill` VARCHAR(255) NOT NULL,
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
  ON UPDATE NO ACTION,
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
  `building_id` INT NOT NULL AUTO_INCREMENT,
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

-- ---------------------------------------------
-- Table `Apartment`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Apartment` ;
CREATE TABLE IF NOT EXISTS `Apartment` (
  `apartment_id` INT NOT NULL AUTO_INCREMENT,
  `building_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  `apartment_number` INT NOT NULL,
  `number_bedrooms` INT NOT NULL,
  `total_bathrooms` INT NOT NULL,
  `total_area` BIGINT NOT NULL,
  PRIMARY KEY (`apartment_id`),
  CONSTRAINT `fk_Apartment_building_id`
  FOREIGN KEY (`building_id`)
  REFERENCES Building(`building_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_manager_id`
  FOREIGN KEY (`manager_id`)
  REFERENCES Manager(`manager_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Office`
-- ---------------------------------------------
DROP TABLE IF EXISTS `Office` ;
CREATE TABLE IF NOT EXISTS `Office` (
  `apartment_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
 CONSTRAINT `fk_Office_apartment_id`
 FOREIGN KEY (`apartment_id`)
 REFERENCES Apartment(`apartment_id`)
 ON UPDATE NO ACTION
 ON DELETE NO ACTION,
 CONSTRAINT `fk_Office_manager_id`
 FOREIGN KEY (`manager_id`)
 REFERENCES Manager(`manager_id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `LeaseAgreement`
-- ---------------------------------------------
DROP TABLE IF EXISTS `LeaseAgreement`;
CREATE TABLE IF NOT EXISTS `LeaseAgreement` (
  `lease_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `apartment_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `monthly_rent` BIGINT NOT NULL,
  `expired` BOOLEAN NOT NULL,
  `manager_id` INT NOT NULL,
  PRIMARY KEY (`lease_id`),
  CONSTRAINT `fk_LeaseAgreement_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES Person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_LeaseAgreement_apartment_id`
  FOREIGN KEY (`apartment_id`)
  REFERENCES Apartment(`apartment_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_LeaseAgreement_manager_id`
  FOREIGN KEY (`manager_id`)
  REFERENCES Manager(`manager_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  INDEX `start_date` (`start_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
