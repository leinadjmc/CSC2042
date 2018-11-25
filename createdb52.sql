-- ---------------------------------------------
-- Table `Person`
-- ---------------------------------------------
DROP TABLE IF EXISTS `person` ;
CREATE TABLE IF NOT EXISTS `person` (
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
DROP TABLE IF EXISTS `emergency_contact` ;
CREATE TABLE IF NOT EXISTS `emergency_contact` (
  `ice_number` VARCHAR(32) NOT NULL,
  `person_id` INT NOT NULL,
  `ec_first_name`VARCHAR(50) NULL DEFAULT NULL,
  `ec_last_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ice_number`),
  INDEX `ec_first_name` (`ec_first_name` ASC),
  INDEX `ec_last_name` (`ec_last_name` ASC),
  CONSTRAINT `fk_Emergency_Contact_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES person(`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Employee`
-- ---------------------------------------------
DROP TABLE IF EXISTS `employee` ;
CREATE TABLE IF NOT EXISTS `employee` (
  `person_id` INT NOT NULL,
  `monthly_salary` BIGINT NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_Employee_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES person(`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT=40216270
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Technician`
-- ---------------------------------------------
DROP TABLE IF EXISTS `technician` ;
CREATE TABLE IF NOT EXISTS `technician` (
  `person_id` INT NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_Technician_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `TechnicianSkills`
-- ---------------------------------------------
DROP TABLE IF EXISTS `technicianskills`;
CREATE TABLE IF NOT EXISTS `technicianskills`(
  `person_id` INT NOT NULL,
  `skill` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`person_id`,`skill`),
  CONSTRAINT `fk_TechnicianSkills_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Manager`
-- ---------------------------------------------
DROP TABLE IF EXISTS `manager` ;
CREATE TABLE IF NOT EXISTS `manager`(
  `person_id` INT NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_Manager_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Building`
-- ---------------------------------------------
DROP TABLE IF EXISTS `building` ;
CREATE TABLE IF NOT EXISTS `building`(
  `building_number` INT NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `county` VARCHAR(255) NOT NULL,
  `postcode` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`building_number`,`postcode`),
  INDEX `street` (`street` ASC),
  INDEX `city` (`city` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Apartment`
-- ---------------------------------------------
DROP TABLE IF EXISTS `apartment` ;
CREATE TABLE IF NOT EXISTS `apartment` (
  `building_number` INT NOT NULL,
  `postcode` VARCHAR(50) NOT NULL,
  `person_id` INT NOT NULL,
  `apartment_number` INT NOT NULL,
  `number_bedrooms` INT NOT NULL,
  `total_bathrooms` INT NOT NULL,
  `total_area` BIGINT NOT NULL,
  PRIMARY KEY (`apartment_number`,`building_number`,`postcode`),
  CONSTRAINT `fk_Apartment_building_number`
  FOREIGN KEY (`building_number`, `postcode`)
  REFERENCES building(`building_number`,`postcode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Manager Office`
-- ---------------------------------------------
DROP TABLE IF EXISTS `manageroffice` ;
CREATE TABLE IF NOT EXISTS `manageroffice` (
  `person_id` INT NOT NULL,
  `apartment_number` INT NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_Manager_office_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_Manager_office_apartment_number`
  FOREIGN KEY (`apartment_number`)
  REFERENCES apartment(`apartment_number`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `LeaseAgreement`
-- ---------------------------------------------
DROP TABLE IF EXISTS `leaseagreement`;
CREATE TABLE IF NOT EXISTS `leaseagreement` (
  `lease_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `apartment_number` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `monthly_rent` BIGINT NOT NULL,
  `expired` BOOLEAN NOT NULL,
  `building_number` INT NOT NULL,
  `postcode` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`lease_id`),
  CONSTRAINT `fk_LeaseAgreement_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_LeaseAgreement_apartment_number`
  FOREIGN KEY (`apartment_number`)
  REFERENCES apartment(`apartment_number`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_LeaseAgreement_postcode`
  FOREIGN KEY (`building_number`, `postcode`)
  REFERENCES building(`building_number`,`postcode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  INDEX `start_date` (`start_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ---------------------------------------------
-- Table `Tenant`
-- ---------------------------------------------
DROP TABLE IF EXISTS `tenant` ;
CREATE TABLE IF NOT EXISTS `tenant` (
  `person_id` INT NOT NULL,
  `bank_account_num` INT NOT NULL,
  `lease_id` INT NOT NULL,
  PRIMARY KEY(`person_id`),
  CONSTRAINT `fk_Tenant_lease_id`
  FOREIGN KEY (`lease_id`)
  REFERENCES leaseagreement(`lease_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tenant_person_id`
  FOREIGN KEY (`person_id`)
  REFERENCES person(`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
