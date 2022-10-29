#
# TABLE STRUCTURE FOR: Account
#

DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account` (
  `Id_Ac` int(11) NOT NULL,
  `Login` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Players_Id_P` int(11) NOT NULL,
  PRIMARY KEY (`Id_Ac`,`Players_Id_P`),
  KEY `fk_Account_Players1_idx` (`Players_Id_P`),
  CONSTRAINT `fk_Account_Players1` FOREIGN KEY (`Players_Id_P`) REFERENCES `Players` (`Id_P`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Cat_Cl
#

DROP TABLE IF EXISTS `Cat_Cl`;

CREATE TABLE `Cat_Cl` (
  `id_Cat` int(11) NOT NULL,
  `Cat_Gr` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Clans_Id_Cl` int(11) NOT NULL,
  `Clans_Players_Id_P` int(11) NOT NULL,
  PRIMARY KEY (`id_Cat`,`Clans_Id_Cl`,`Clans_Players_Id_P`),
  KEY `fk_Cat_Cl_Clans1_idx` (`Clans_Id_Cl`,`Clans_Players_Id_P`),
  CONSTRAINT `fk_Cat_Cl_Clans1` FOREIGN KEY (`Clans_Id_Cl`) REFERENCES `Clans` (`Id_Cl`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Clans
#

DROP TABLE IF EXISTS `Clans`;

CREATE TABLE `Clans` (
  `Id_Cl` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Players_id` int(11) DEFAULT NULL,
  `Admin_id` int(11) DEFAULT NULL,
  `Cat_id` int(11) DEFAULT NULL,
  `Clanscol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id_Cl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Friends
#

DROP TABLE IF EXISTS `Friends`;

CREATE TABLE `Friends` (
  `Id_F` int(11) NOT NULL,
  `From_User_id` int(11) DEFAULT NULL,
  `To_User_Id` int(11) DEFAULT NULL,
  `Status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Players_Id_P` int(11) NOT NULL,
  PRIMARY KEY (`Id_F`,`Players_Id_P`),
  KEY `fk_Friends_Players1_idx` (`Players_Id_P`),
  CONSTRAINT `fk_Friends_Players1` FOREIGN KEY (`Players_Id_P`) REFERENCES `Players` (`Id_P`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Inventory
#

DROP TABLE IF EXISTS `Inventory`;

CREATE TABLE `Inventory` (
  `id_In` int(11) NOT NULL,
  `Player_id` int(11) DEFAULT NULL,
  `Item_Id` int(11) DEFAULT NULL,
  `Size` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Players_Id_P` int(11) NOT NULL,
  `Players_Account_Id_Ac` int(11) NOT NULL,
  PRIMARY KEY (`id_In`,`Players_Id_P`,`Players_Account_Id_Ac`),
  KEY `fk_Inventory_Players1_idx` (`Players_Id_P`,`Players_Account_Id_Ac`),
  CONSTRAINT `fk_Inventory_Players1` FOREIGN KEY (`Players_Id_P`) REFERENCES `Players` (`Id_P`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Players
#

DROP TABLE IF EXISTS `Players`;

CREATE TABLE `Players` (
  `Id_P` int(11) NOT NULL,
  `Nickname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Class` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Species` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id_P`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Players_has_Clans
#

DROP TABLE IF EXISTS `Players_has_Clans`;

CREATE TABLE `Players_has_Clans` (
  `Players_Id_P` int(11) NOT NULL,
  `Players_Account_Id_Ac` int(11) NOT NULL,
  `Clans_Id_Cl` int(11) NOT NULL,
  PRIMARY KEY (`Players_Id_P`,`Players_Account_Id_Ac`,`Clans_Id_Cl`),
  KEY `fk_Players_has_Clans_Clans1_idx` (`Clans_Id_Cl`),
  KEY `fk_Players_has_Clans_Players1_idx` (`Players_Id_P`,`Players_Account_Id_Ac`),
  CONSTRAINT `fk_Players_has_Clans_Clans1` FOREIGN KEY (`Clans_Id_Cl`) REFERENCES `Clans` (`Id_Cl`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Players_has_Clans_Players1` FOREIGN KEY (`Players_Id_P`) REFERENCES `Players` (`Id_P`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

