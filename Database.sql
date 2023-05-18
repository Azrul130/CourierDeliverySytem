create DATABASE CourierDeliverySystem;
use CourirDeliverySystem;

CREATE TABLE `courierdeliverysystem`.`employee` (
  `EmployeeId` VARCHAR(6) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Occupation` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  UNIQUE INDEX `EmployeeId_UNIQUE` (`EmployeeId` ASC) );

CREATE TABLE `courierdeliverysystem`.`occupation` (
  `Occupation` VARCHAR(30) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Occupation`));
  
  CREATE TABLE `courierdeliverysystem`.`order` (
  `ParcelId` VARCHAR(6) NOT NULL,
  `ParcelType` ENUM("Domestic", "International") NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ParcelId`));
  
  CREATE TABLE `courierdeliverysystem`.`parcel` (
  `ParcelType` ENUM("Domestic", "International") NOT NULL,
  `Weight(Kg)` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL);
  
  ALTER TABLE `courierdeliverysystem`.`order` 
ADD COLUMN `weight` DECIMAL(10,2) NOT NULL AFTER `Description`;

CREATE TABLE `courierdeliverysystem`.`delivery` (
  `RiderId` VARCHAR(6) NOT NULL,
  `parcelId` VARCHAR(6) NOT NULL,
  `TrackingNo` VARCHAR(45) NULL,
  PRIMARY KEY (`RiderId`));

ALTER TABLE `courierdeliverysystem`.`delivery` 
ADD COLUMN `Destination` VARCHAR(45) NOT NULL AFTER `TrackingNo`,
CHANGE COLUMN `TrackingNo` `TrackingNo` VARCHAR(45) NOT NULL ;

CREATE TABLE `courierdeliverysystem`.`rider` (
  `RiderId` VARCHAR(6) NOT NULL,
  `EmployeeId` VARCHAR(6) NOT NULL,
  `VehicleId` VARCHAR(10) NULL,
  `LicenceExp` DATE NOT NULL,
  PRIMARY KEY (`RiderId`));

CREATE TABLE `courierdeliverysystem`.`vehicle` (
  `VehicleID` VARCHAR(10) NOT NULL,
  `vehicleType` ENUM("Motorcycle", "Lorry", "Van") NULL,
  `description` VARCHAR(45) NULL,
  `RoadTaxExp` DATE NULL,
  PRIMARY KEY (`VehicleID`));

CREATE TABLE `courierdeliverysystem`.`receipt` (
  `ReceiptID` VARCHAR(10) NOT NULL,
  `CustId` VARCHAR(6) NULL,
  `ParcelId` VARCHAR(6) NULL,
  `TotalPrice` DECIMAL(10,2) NULL,
  PRIMARY KEY (`ReceiptID`));

CREATE TABLE `courierdeliverysystem`.`customer` (
  `CustId` VARCHAR(6) NOT NULL,
  `CustName` VARCHAR(45) NULL,
  `CustPhoneNo` INT(11) NULL,
  PRIMARY KEY (`CustId`));

ALTER TABLE `courierdeliverysystem`.`parcel` 
ADD PRIMARY KEY (`ParcelType`);
;

ALTER TABLE `courierdeliverysystem`.`order` 
ADD INDEX `ftype_idx` (`ParcelType` ASC) ;
;
ALTER TABLE `courierdeliverysystem`.`order` 
ADD CONSTRAINT `ftype`
  FOREIGN KEY (`ParcelType`)
  REFERENCES `courierdeliverysystem`.`parcel` (`ParcelType`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `courierdeliverysystem`.`delivery` 
ADD INDEX `f_idx` (`RiderId` ASC) ,
ADD INDEX `2_idx` (`parcelId` ASC) ;
;
ALTER TABLE `courierdeliverysystem`.`delivery` 
ADD CONSTRAINT `f`
  FOREIGN KEY (`RiderId`)
  REFERENCES `courierdeliverysystem`.`rider` (`RiderId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `2`
  FOREIGN KEY (`parcelId`)
  REFERENCES `courierdeliverysystem`.`order` (`ParcelId`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `courierdeliverysystem`.`rider` 
ADD INDEX `tre_idx` (`EmployeeId` ASC) ,
ADD INDEX `trv_idx` (`VehicleId` ASC) ;
;
ALTER TABLE `courierdeliverysystem`.`rider` 
ADD CONSTRAINT `tre`
  FOREIGN KEY (`EmployeeId`)
  REFERENCES `courierdeliverysystem`.`employee` (`EmployeeId`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `trv`
  FOREIGN KEY (`VehicleId`)
  REFERENCES `courierdeliverysystem`.`vehicle` (`VehicleID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `courierdeliverysystem`.`receipt` 
ADD INDEX `trcc_idx` (`CustId` ASC) ,
ADD INDEX `trcp_idx` (`ParcelId` ASC) ;
;
ALTER TABLE `courierdeliverysystem`.`receipt` 
ADD CONSTRAINT `trcc`
  FOREIGN KEY (`CustId`)
  REFERENCES `courierdeliverysystem`.`customer` (`CustId`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `trcp`
  FOREIGN KEY (`ParcelId`)
  REFERENCES `courierdeliverysystem`.`order` (`ParcelId`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `courierdeliverysystem`.`employee` 
ADD INDEX `eto_idx` (`Occupation` ASC) ;
;
ALTER TABLE `courierdeliverysystem`.`employee` 
ADD CONSTRAINT `eto`
  FOREIGN KEY (`Occupation`)
  REFERENCES `courierdeliverysystem`.`occupation` (`Occupation`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `courierdeliverysystem`.`receipt` 
ADD UNIQUE INDEX `ParcelId_UNIQUE` (`ParcelId` ASC) ;
;

ALTER TABLE `courierdeliverysystem`.`rider` 
ADD UNIQUE INDEX `EmployeeId_UNIQUE` (`EmployeeId` ASC) ;
;

ALTER TABLE `courierdeliverysystem`.`delivery` 
ADD UNIQUE INDEX `parcelId_UNIQUE` (`parcelId` ASC) ;
;

CREATE TABLE `courierdeliverysystem`.`status` (
  `ParcelId` VARCHAR(6) NOT NULL,
  `status` ENUM("Delivered", "Hub Processing", "On hold", "On Delivery") NULL,
  `Location` VARCHAR(45) NULL,
  INDEX `pid_idx` (`ParcelId` ASC) ,
  CONSTRAINT `pid`
    FOREIGN KEY (`ParcelId`)
    REFERENCES `courierdeliverysystem`.`order` (`ParcelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `courierdeliverysystem`.`order` 
DROP FOREIGN KEY `ftype`;
ALTER TABLE `courierdeliverysystem`.`order` 
CHANGE COLUMN `ParcelType` `idType` ENUM('Domestic', 'International') NOT NULL ,
DROP INDEX `Type_idx` ;
;
ALTER TABLE `courierdeliverysystem`.`parcel` 
ADD COLUMN `TypeId` INT NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`TypeId`);
;
ALTER TABLE `courierdeliverysystem`.`order` 
CHANGE COLUMN `idType` `idType` INT NOT NULL ;
ALTER TABLE `courierdeliverysystem`.`order` 
ADD CONSTRAINT `typ`
  FOREIGN KEY (`idType`)
  REFERENCES `courierdeliverysystem`.`parcel` (`TypeId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `courierdeliverysystem`.`customer` 
ADD COLUMN `Password` VARCHAR(45) NULL AFTER `CustName`,
ADD COLUMN `email` VARCHAR(45) NULL AFTER `CustPhoneNo`;

