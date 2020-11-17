-- MySQL Script generated by MySQL Workbench
-- Wed Jan 15 09:00:46 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PLy5TXIYnn
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PLy5TXIYnn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PLy5TXIYnn` DEFAULT CHARACTER SET utf8 ;
USE `PLy5TXIYnn` ;

-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`City` (
  `idCity` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCity`),
  UNIQUE INDEX `idCity_UNIQUE` (`idCity` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Address` (
  `Address_id` INT NOT NULL AUTO_INCREMENT,
  `City_idCity` INT NOT NULL,
  `Plot_No` INT NOT NULL,
  `Street_No` INT NOT NULL,
  PRIMARY KEY (`Address_id`),
  INDEX `fk_Address_City1_idx` (`City_idCity` ASC) VISIBLE,
  CONSTRAINT `fk_Address_City1`
    FOREIGN KEY (`City_idCity`)
    REFERENCES `PLy5TXIYnn`.`City` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Restaurant` (
  `Restaurant_id` INT NOT NULL AUTO_INCREMENT,
  `Address_Address_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Reservation` TINYINT NOT NULL,
  `Online_Order` TINYINT NOT NULL,
  PRIMARY KEY (`Restaurant_id`),
  UNIQUE INDEX `Restaurant_id_UNIQUE` (`Restaurant_id` ASC) VISIBLE,
  INDEX `fk_Restaurant_Address1_idx` (`Address_Address_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_Address1`
    FOREIGN KEY (`Address_Address_id`)
    REFERENCES `PLy5TXIYnn`.`Address` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`RestaurantManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`RestaurantManager` (
  `Manager_id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `Contact_No` INT NOT NULL,
  `Restaurant_Restaurant_id` INT NOT NULL,
  PRIMARY KEY (`Manager_id`),
  UNIQUE INDEX `Manager_id_UNIQUE` (`Manager_id` ASC) VISIBLE,
  INDEX `fk_RestaurantManager_Restaurant_idx` (`Restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_RestaurantManager_Restaurant`
    FOREIGN KEY (`Restaurant_Restaurant_id`)
    REFERENCES `PLy5TXIYnn`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`FoodItemCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`FoodItemCategory` (
  `Category_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Category_id`),
  UNIQUE INDEX `Category_id_UNIQUE` (`Category_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`FoodItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`FoodItem` (
  `FoodItem_id` INT NOT NULL AUTO_INCREMENT,
  `FoodItemCategory_Category_id` INT NOT NULL,
  `Food_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FoodItem_id`),
  UNIQUE INDEX `FoodItem_id_UNIQUE` (`FoodItem_id` ASC) VISIBLE,
  INDEX `fk_FoodItem_FoodItemCategory1_idx` (`FoodItemCategory_Category_id` ASC) VISIBLE,
  CONSTRAINT `fk_FoodItem_FoodItemCategory1`
    FOREIGN KEY (`FoodItemCategory_Category_id`)
    REFERENCES `PLy5TXIYnn`.`FoodItemCategory` (`Category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Menu` (
  `Restaurant_Restaurant_id` INT NOT NULL,
  `FoodItem_FoodItem_id` INT NOT NULL,
  `Price` DOUBLE NOT NULL,
  PRIMARY KEY (`Restaurant_Restaurant_id`, `FoodItem_FoodItem_id`),
  INDEX `fk_Restaurant_has_FoodItem_FoodItem1_idx` (`FoodItem_FoodItem_id` ASC) VISIBLE,
  INDEX `fk_Restaurant_has_FoodItem_Restaurant1_idx` (`Restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_has_FoodItem_Restaurant1`
    FOREIGN KEY (`Restaurant_Restaurant_id`)
    REFERENCES `PLy5TXIYnn`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurant_has_FoodItem_FoodItem1`
    FOREIGN KEY (`FoodItem_FoodItem_id`)
    REFERENCES `PLy5TXIYnn`.`FoodItem` (`FoodItem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Contact_No` VARCHAR(45) NOT NULL,
  `DOB` VARCHAR(45) NOT NULL,
  `Address_Address_id` INT NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE INDEX `Customer_id_UNIQUE` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Customer_Address1_idx` (`Address_Address_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`Address_Address_id`)
    REFERENCES `PLy5TXIYnn`.`Address` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Employees` (
  `idEmployees` INT NOT NULL AUTO_INCREMENT,
  `Restaurant_Restaurant_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Status` TINYINT NOT NULL,
  `designation` VARCHAR(45) NOT NULL,
  `Salary` DOUBLE NOT NULL,
  `Contact_No` VARCHAR(45) NOT NULL,
  `Join_Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmployees`),
  INDEX `fk_Employees_Restaurant1_idx` (`Restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Restaurant1`
    FOREIGN KEY (`Restaurant_Restaurant_id`)
    REFERENCES `PLy5TXIYnn`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Orders` (
  `Customer_Customer_id` INT NOT NULL,
  `FoodItem_FoodItem_id` INT NOT NULL,
  `Order_id` INT NOT NULL AUTO_INCREMENT,
  `Order_Date` VARCHAR(45) NOT NULL,
  `DeliveryCharges` DOUBLE NOT NULL,
  `Employees_idEmployees` INT NOT NULL,
  PRIMARY KEY (`Customer_Customer_id`, `FoodItem_FoodItem_id`),
  INDEX `fk_Customer_has_FoodItem_FoodItem1_idx` (`FoodItem_FoodItem_id` ASC) VISIBLE,
  INDEX `fk_Customer_has_FoodItem_Customer1_idx` (`Customer_Customer_id` ASC) VISIBLE,
  UNIQUE INDEX `Order_id_UNIQUE` (`Order_id` ASC) VISIBLE,
  INDEX `fk_Orders_Employees1_idx` (`Employees_idEmployees` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_has_FoodItem_Customer1`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `PLy5TXIYnn`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_FoodItem_FoodItem1`
    FOREIGN KEY (`FoodItem_FoodItem_id`)
    REFERENCES `PLy5TXIYnn`.`FoodItem` (`FoodItem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Employees1`
    FOREIGN KEY (`Employees_idEmployees`)
    REFERENCES `PLy5TXIYnn`.`Employees` (`idEmployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`CustomerBankAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`CustomerBankAccount` (
  `Accout_number` INT NOT NULL,
  `Customer_Customer_id` INT NOT NULL,
  PRIMARY KEY (`Accout_number`),
  UNIQUE INDEX `Accout_number_UNIQUE` (`Accout_number` ASC) VISIBLE,
  INDEX `fk_CustomerBankAccount_Customer1_idx` (`Customer_Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_CustomerBankAccount_Customer1`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `PLy5TXIYnn`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`RestaurantBankAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`RestaurantBankAccount` (
  `Account_number` INT NOT NULL,
  `Restaurant_Restaurant_id` INT NOT NULL,
  PRIMARY KEY (`Account_number`),
  UNIQUE INDEX `Account_number_UNIQUE` (`Account_number` ASC) VISIBLE,
  INDEX `fk_RestaurantBankAccount_Restaurant1_idx` (`Restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_RestaurantBankAccount_Restaurant1`
    FOREIGN KEY (`Restaurant_Restaurant_id`)
    REFERENCES `PLy5TXIYnn`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Ingredients` (
  `Ingredient_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Ingredient_id`),
  UNIQUE INDEX `Ingredient_id_UNIQUE` (`Ingredient_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`FoodItem_has_Ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`FoodItem_has_Ingredients` (
  `FoodItem_FoodItem_id` INT NOT NULL,
  `Ingredients_Ingredient_id` INT NOT NULL,
  PRIMARY KEY (`FoodItem_FoodItem_id`, `Ingredients_Ingredient_id`),
  INDEX `fk_FoodItem_has_Ingredients_Ingredients1_idx` (`Ingredients_Ingredient_id` ASC) VISIBLE,
  INDEX `fk_FoodItem_has_Ingredients_FoodItem1_idx` (`FoodItem_FoodItem_id` ASC) VISIBLE,
  CONSTRAINT `fk_FoodItem_has_Ingredients_FoodItem1`
    FOREIGN KEY (`FoodItem_FoodItem_id`)
    REFERENCES `PLy5TXIYnn`.`FoodItem` (`FoodItem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FoodItem_has_Ingredients_Ingredients1`
    FOREIGN KEY (`Ingredients_Ingredient_id`)
    REFERENCES `PLy5TXIYnn`.`Ingredients` (`Ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`DiningTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`DiningTable` (
  `idDiningTable` INT NOT NULL,
  `no_of_chairs` INT NOT NULL,
  `Restaurant_Restaurant_id` INT NOT NULL,
  PRIMARY KEY (`idDiningTable`),
  UNIQUE INDEX `idDiningTable_UNIQUE` (`idDiningTable` ASC) VISIBLE,
  INDEX `fk_DiningTable_Restaurant1_idx` (`Restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_DiningTable_Restaurant1`
    FOREIGN KEY (`Restaurant_Restaurant_id`)
    REFERENCES `PLy5TXIYnn`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Customer_reserves_DiningTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Customer_reserves_DiningTable` (
  `Customer_Customer_id` INT NOT NULL,
  `DiningTable_idDiningTable` INT NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_Customer_id`, `DiningTable_idDiningTable`),
  INDEX `fk_Customer_has_DiningTable_DiningTable1_idx` (`DiningTable_idDiningTable` ASC) VISIBLE,
  INDEX `fk_Customer_has_DiningTable_Customer1_idx` (`Customer_Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_has_DiningTable_Customer1`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `PLy5TXIYnn`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_DiningTable_DiningTable1`
    FOREIGN KEY (`DiningTable_idDiningTable`)
    REFERENCES `PLy5TXIYnn`.`DiningTable` (`idDiningTable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLy5TXIYnn`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLy5TXIYnn`.`Reviews` (
  `Restaurant_Restaurant_id` INT NOT NULL,
  `Customer_Customer_id` INT NOT NULL,
  `Review` VARCHAR(400) NOT NULL,
  `Rating` INT NOT NULL,
  PRIMARY KEY (`Restaurant_Restaurant_id`, `Customer_Customer_id`),
  INDEX `fk_Restaurant_has_Customer_Customer1_idx` (`Customer_Customer_id` ASC) VISIBLE,
  INDEX `fk_Restaurant_has_Customer_Restaurant1_idx` (`Restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_has_Customer_Restaurant1`
    FOREIGN KEY (`Restaurant_Restaurant_id`)
    REFERENCES `PLy5TXIYnn`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurant_has_Customer_Customer1`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `PLy5TXIYnn`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
