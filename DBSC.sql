CREATE TABLE IF NOT EXISTS `Players` (
  `Id_P` INT NOT NULL,
  `Nickname` VARCHAR(45) NULL,
  `Class` VARCHAR(45) NULL,
  `Species` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_P`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Account` (
  `Id_Ac` INT NOT NULL,
  `Login` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Players_Id_P` INT NOT NULL,
  PRIMARY KEY (`Id_Ac`, `Players_Id_P`),
  INDEX `fk_Account_Players1_idx` (`Players_Id_P` ASC) VISIBLE,
  CONSTRAINT `fk_Account_Players1`
    FOREIGN KEY (`Players_Id_P`)
    REFERENCES `Players` (`Id_P`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Clans` (
  `Id_Cl` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Players_id` INT NULL,
  `Admin_id` INT NULL,
  `Cat_id` INT NULL,
  `Clanscol` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Cl`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Cat_Cl` (
  `id_Cat` INT NOT NULL,
  `Cat_Gr` VARCHAR(45) NULL,
  `Clans_Id_Cl` INT NOT NULL,
  `Clans_Players_Id_P` INT NOT NULL,
  PRIMARY KEY (`id_Cat`, `Clans_Id_Cl`, `Clans_Players_Id_P`),
  INDEX `fk_Cat_Cl_Clans1_idx` (`Clans_Id_Cl` ASC, `Clans_Players_Id_P` ASC) VISIBLE,
  CONSTRAINT `fk_Cat_Cl_Clans1`
    FOREIGN KEY (`Clans_Id_Cl`)
    REFERENCES `Clans` (`Id_Cl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Inventory` (
  `id_In` INT NOT NULL,
  `Player_id` INT NULL,
  `Item_Id` INT NULL,
  `Size` VARCHAR(45) NULL,
  `Players_Id_P` INT NOT NULL,
  `Players_Account_Id_Ac` INT NOT NULL,
  PRIMARY KEY (`id_In`, `Players_Id_P`, `Players_Account_Id_Ac`),
  INDEX `fk_Inventory_Players1_idx` (`Players_Id_P` ASC, `Players_Account_Id_Ac` ASC) VISIBLE,
  CONSTRAINT `fk_Inventory_Players1`
    FOREIGN KEY (`Players_Id_P`)
    REFERENCES `Players` (`Id_P`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Friends` (
  `Id_F` INT NOT NULL,
  `From_User_id` INT NULL,
  `To_User_Id` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Players_Id_P` INT NOT NULL,
  PRIMARY KEY (`Id_F`, `Players_Id_P`),
  INDEX `fk_Friends_Players1_idx` (`Players_Id_P` ASC) VISIBLE,
  CONSTRAINT `fk_Friends_Players1`
    FOREIGN KEY (`Players_Id_P`)
    REFERENCES `Players` (`Id_P`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `Players_has_Clans` (
  `Players_Id_P` INT NOT NULL,
  `Players_Account_Id_Ac` INT NOT NULL,
  `Clans_Id_Cl` INT NOT NULL,
  PRIMARY KEY (`Players_Id_P`, `Players_Account_Id_Ac`, `Clans_Id_Cl`),
  INDEX `fk_Players_has_Clans_Clans1_idx` (`Clans_Id_Cl` ASC) VISIBLE,
  INDEX `fk_Players_has_Clans_Players1_idx` (`Players_Id_P` ASC, `Players_Account_Id_Ac` ASC) VISIBLE,
  CONSTRAINT `fk_Players_has_Clans_Players1`
    FOREIGN KEY (`Players_Id_P`)
    REFERENCES `Players` (`Id_P`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Players_has_Clans_Clans1`
    FOREIGN KEY (`Clans_Id_Cl`)
    REFERENCES `Clans` (`Id_Cl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

