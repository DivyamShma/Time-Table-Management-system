-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rdbms_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rdbms_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rdbms_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rdbms_project` ;

-- -----------------------------------------------------
-- Table `rdbms_project`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`course` (
  `Course_code` VARCHAR(10) NOT NULL,
  `Course_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`faculty` (
  `F_code` VARCHAR(7) NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`F_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`friday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`friday` (
  `Course_code` VARCHAR(10) NULL DEFAULT NULL,
  `Timing` VARCHAR(20) NOT NULL,
  `Class_Room` VARCHAR(7) NULL DEFAULT NULL,
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `SNo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Timing`),
  INDEX `Course_code` (`Course_code` ASC) VISIBLE,
  CONSTRAINT `friday_ibfk_1`
    FOREIGN KEY (`Course_code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`lab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`lab` (
  `Day` VARCHAR(20) NULL DEFAULT NULL,
  `Course_Code` VARCHAR(10) NULL DEFAULT NULL,
  `Class_Room` VARCHAR(7) NULL DEFAULT NULL,
  `Batch` INT NULL DEFAULT NULL,
  `Timing` VARCHAR(20) NULL DEFAULT NULL,
  `F_code` VARCHAR(7) NULL DEFAULT NULL,
  `Section` VARCHAR(2) NULL DEFAULT NULL,
  `SNo` INT NULL DEFAULT NULL,
  INDEX `Course_Code` (`Course_Code` ASC) VISIBLE,
  INDEX `F_code` (`F_code` ASC) VISIBLE,
  CONSTRAINT `lab_ibfk_1`
    FOREIGN KEY (`Course_Code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`),
  CONSTRAINT `lab_ibfk_2`
    FOREIGN KEY (`F_code`)
    REFERENCES `rdbms_project`.`faculty` (`F_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`monday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`monday` (
  `Course_code` VARCHAR(10) NULL DEFAULT NULL,
  `Timing` VARCHAR(20) NOT NULL,
  `Class_Room` VARCHAR(7) NULL DEFAULT NULL,
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `SNo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Timing`),
  INDEX `Course_code` (`Course_code` ASC) VISIBLE,
  CONSTRAINT `monday_ibfk_1`
    FOREIGN KEY (`Course_code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`rooms` (
  `Room Number` INT NOT NULL,
  `Academic Block` INT NULL DEFAULT NULL,
  `Status` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`Room Number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student` (
  `RegNo` INT NOT NULL,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Year` INT NULL DEFAULT NULL,
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `Dept` VARCHAR(50) NULL DEFAULT NULL,
  `Semester` VARCHAR(5) NULL DEFAULT NULL,
  `Gender` VARCHAR(10) NULL DEFAULT NULL,
  `Batch` INT NULL DEFAULT NULL,
  PRIMARY KEY (`RegNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`teach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`teach` (
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `Semester` VARCHAR(5) NULL DEFAULT NULL,
  `F_code` VARCHAR(7) NULL DEFAULT NULL,
  `Course_code` VARCHAR(10) NULL DEFAULT NULL,
  INDEX `F_code` (`F_code` ASC) VISIBLE,
  INDEX `Course_code` (`Course_code` ASC) VISIBLE,
  CONSTRAINT `teach_ibfk_1`
    FOREIGN KEY (`F_code`)
    REFERENCES `rdbms_project`.`faculty` (`F_code`),
  CONSTRAINT `teach_ibfk_2`
    FOREIGN KEY (`Course_code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`thursday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`thursday` (
  `Course_code` VARCHAR(10) NULL DEFAULT NULL,
  `Timing` VARCHAR(20) NOT NULL,
  `Class_Room` VARCHAR(7) NULL DEFAULT NULL,
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `SNo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Timing`),
  INDEX `Course_code` (`Course_code` ASC) VISIBLE,
  CONSTRAINT `thursday_ibfk_1`
    FOREIGN KEY (`Course_code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`tuesday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`tuesday` (
  `Course_code` VARCHAR(10) NULL DEFAULT NULL,
  `Timing` VARCHAR(20) NOT NULL,
  `Class_Room` VARCHAR(7) NULL DEFAULT NULL,
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `SNo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Timing`),
  INDEX `Course_code` (`Course_code` ASC) VISIBLE,
  CONSTRAINT `tuesday_ibfk_1`
    FOREIGN KEY (`Course_code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rdbms_project`.`wednesday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`wednesday` (
  `Course_code` VARCHAR(10) NULL DEFAULT NULL,
  `Timing` VARCHAR(20) NOT NULL,
  `Class_Room` VARCHAR(7) NULL DEFAULT NULL,
  `Section` VARCHAR(1) NULL DEFAULT NULL,
  `SNo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Timing`),
  INDEX `Course_code` (`Course_code` ASC) VISIBLE,
  CONSTRAINT `wednesday_ibfk_1`
    FOREIGN KEY (`Course_code`)
    REFERENCES `rdbms_project`.`course` (`Course_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `rdbms_project` ;

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_friday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_friday` (`SNo` INT, `Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_friday_lab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_friday_lab` (`Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT, `Batch` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_monday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_monday` (`SNO` INT, `Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_thurday_lab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_thurday_lab` (`Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT, `Batch` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_thursday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_thursday` (`SNo` INT, `Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_tuesday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_tuesday` (`SNo` INT, `Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_wednesday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_wednesday` (`SNo` INT, `Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT);

-- -----------------------------------------------------
-- Placeholder table for view `rdbms_project`.`student_wednesday_lab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdbms_project`.`student_wednesday_lab` (`Class_Room` INT, `Timing` INT, `Name` INT, `Course_name` INT, `Section` INT, `Semester` INT, `Batch` INT);

-- -----------------------------------------------------
-- View `rdbms_project`.`student_friday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_friday`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_friday` AS select distinct `rdbms_project`.`friday`.`SNo` AS `SNo`,`rdbms_project`.`friday`.`Class_Room` AS `Class_Room`,`rdbms_project`.`friday`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`friday`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`friday`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`friday`.`Course_code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`)) order by `rdbms_project`.`friday`.`SNo`;

-- -----------------------------------------------------
-- View `rdbms_project`.`student_friday_lab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_friday_lab`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_friday_lab` AS select distinct `rdbms_project`.`lab`.`Class_Room` AS `Class_Room`,`rdbms_project`.`lab`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`lab`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester`,`rdbms_project`.`lab`.`Batch` AS `Batch` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`lab`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`lab`.`Course_Code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`) and (`rdbms_project`.`lab`.`Day` = 'Friday'));

-- -----------------------------------------------------
-- View `rdbms_project`.`student_monday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_monday`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_monday` AS select distinct `rdbms_project`.`monday`.`SNo` AS `SNO`,`rdbms_project`.`monday`.`Class_Room` AS `Class_Room`,`rdbms_project`.`monday`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`monday`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`monday`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`monday`.`Course_code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`)) order by `rdbms_project`.`monday`.`SNo`;

-- -----------------------------------------------------
-- View `rdbms_project`.`student_thurday_lab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_thurday_lab`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_thurday_lab` AS select distinct `rdbms_project`.`lab`.`Class_Room` AS `Class_Room`,`rdbms_project`.`lab`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`lab`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester`,`rdbms_project`.`lab`.`Batch` AS `Batch` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`lab`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`lab`.`Course_Code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`) and (`rdbms_project`.`lab`.`Day` = 'Thursday'));

-- -----------------------------------------------------
-- View `rdbms_project`.`student_thursday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_thursday`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_thursday` AS select distinct `rdbms_project`.`thursday`.`SNo` AS `SNo`,`rdbms_project`.`thursday`.`Class_Room` AS `Class_Room`,`rdbms_project`.`thursday`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`thursday`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`thursday`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`thursday`.`Course_code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`)) order by `rdbms_project`.`thursday`.`SNo`;

-- -----------------------------------------------------
-- View `rdbms_project`.`student_tuesday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_tuesday`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_tuesday` AS select distinct `rdbms_project`.`tuesday`.`SNo` AS `SNo`,`rdbms_project`.`tuesday`.`Class_Room` AS `Class_Room`,`rdbms_project`.`tuesday`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`tuesday`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`tuesday`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`tuesday`.`Course_code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`)) order by `rdbms_project`.`tuesday`.`SNo`;

-- -----------------------------------------------------
-- View `rdbms_project`.`student_wednesday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_wednesday`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_wednesday` AS select distinct `rdbms_project`.`wednesday`.`SNo` AS `SNo`,`rdbms_project`.`wednesday`.`Class_Room` AS `Class_Room`,`rdbms_project`.`wednesday`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`wednesday`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`wednesday`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`wednesday`.`Course_code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`)) order by `rdbms_project`.`wednesday`.`SNo`;

-- -----------------------------------------------------
-- View `rdbms_project`.`student_wednesday_lab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rdbms_project`.`student_wednesday_lab`;
USE `rdbms_project`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rdbms_project`.`student_wednesday_lab` AS select distinct `rdbms_project`.`lab`.`Class_Room` AS `Class_Room`,`rdbms_project`.`lab`.`Timing` AS `Timing`,`rdbms_project`.`faculty`.`Name` AS `Name`,`rdbms_project`.`course`.`Course_name` AS `Course_name`,`rdbms_project`.`lab`.`Section` AS `Section`,`rdbms_project`.`teach`.`Semester` AS `Semester`,`rdbms_project`.`lab`.`Batch` AS `Batch` from (((`rdbms_project`.`teach` join `rdbms_project`.`faculty`) join `rdbms_project`.`course`) join `rdbms_project`.`lab`) where ((`rdbms_project`.`course`.`Course_code` = `rdbms_project`.`teach`.`Course_code`) and (`rdbms_project`.`teach`.`Course_code` = `rdbms_project`.`lab`.`Course_Code`) and (`rdbms_project`.`teach`.`F_code` = `rdbms_project`.`faculty`.`F_code`) and (`rdbms_project`.`lab`.`Day` = 'Wednesday'));

INSERT INTO course (Course_code, Course_name) VALUES ('IS2201', 'Operating Systems');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2202', 'RDBMS');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2203', 'Web Technologies');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2204', 'Automata Theory And Compiler Design');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2230', 'Operating System Lab');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2231', 'RDBMS Lab');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2232', 'Web Technologies Lab');
INSERT INTO course (Course_code, Course_name) VALUES ('IS2270', 'Project Based Learning-II');
INSERT INTO course (Course_code, Course_name) VALUES ('LAB', 'not a real course but a placeholder');
INSERT INTO course (Course_code, Course_name) VALUES ('MA2201', 'Engineering Maths IV');

INSERT INTO faculty (F_code, Name, Email) VALUES ('MUJ0366', 'Anamika Jain', 'anamika.jain@jaipur.manipal.edu');
INSERT INTO faculty (F_code, Name, Email) VALUES ('MUJ0489', 'Manoj Kumar', 'manojkumar.bohra@jaipur.manipal.edu');
INSERT INTO faculty (F_code, Name, Email) VALUES ('MUJ0964', 'Deepak Sinwar', 'deepak.sinwar@jaipur.manipal.edu');
INSERT INTO faculty (F_code, Name, Email) VALUES ('MUJ0968', 'Geeta Rani', 'geeta.rani@jaipur.manipal.edu');
INSERT INTO faculty (F_code, Name, Email) VALUES ('MUJ1011', 'Vaihsali Yadav', 'vaishali.yadav@jaipur.manipal.edu');
INSERT INTO faculty (F_code, Name, Email) VALUES ('MUJ1384', 'GL Saini', 'gaindi.lal@jaipur.manipal.edu');

INSERT INTO friday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('LAB', '10:30 AM - 12:00 PM', NULL, 'C', 2);
INSERT INTO friday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2204', '2:15 PM - 3:00 PM', 'AB1-211', 'C', 3);
INSERT INTO friday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('LAB', '9:00 AM - 10:30 AM', NULL, 'C', 1);

INSERT INTO student (RegNo, Name, Year, Section, Dept, Semester, Gender, Batch) VALUES (219310002, 'purusharth', 2, 'E', 'AIML', 'IV', 'M', 2);
INSERT INTO student (RegNo, Name, Year, Section, Dept, Semester, Gender, Batch) VALUES (219311022, 'devendra', 2, 'C', 'IOT', 'IV', 'M', 1);
INSERT INTO student (RegNo, Name, Year, Section, Dept, Semester, Gender, Batch) VALUES (219311033, 'animesh', 2, 'C', 'IOT', 'IV', 'M', 2);
INSERT INTO student (RegNo, Name, Year, Section, Dept, Semester, Gender, Batch) VALUES (219311167, 'abhimanyu', 2, 'C', 'IOT', 'IV', 'M', 1);
INSERT INTO student (RegNo, Name, Year, Section, Dept, Semester, Gender, Batch) VALUES (219311183, 'divyam', 2, 'C', 'IOT', 'IV', 'M', 2);

INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Wednesday', 'IS2270', 'AB2-114', 1, '3:00 PM - 5:15 PM', 'MUJ0489', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Wednesday', 'IS2232', 'AB1-115', 2, '3:00 PM - 5:15 PM', 'MUJ1384', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Thursday', 'IS2231', 'AB1-120', 2, '10:30 AM - 12:00 PM', 'MUJ1011', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Thursday', 'IS2230', 'AB1-115', 1, '10:30 AM - 12:00 PM', 'MUJ1011', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Friday', 'IS2270', 'AB2-114', 2, '9:00 AM - 10:30 AM', 'MUJ0489', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Friday', 'IS2232', 'AB1-120', 1, '9:00 AM - 10:30 AM', 'MUJ1384', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Friday', 'IS2231', 'AB1-120', 1, '10:30 AM - 12:00 PM', 'MUJ0968', 'C', NULL);
INSERT INTO lab (Day, Course_Code, Class_Room, Batch, Timing, F_code, Section, SNo) VALUES ('Friday', 'IS2230', 'AB1-115', 2, '10:30 AM - 12:00 PM', 'MUJ1011', 'C', NULL);

INSERT INTO monday (Course_Code, Timing, Class_Room, Section, SNo) VALUES ('IS2202', '10:30 AM - 11:15 AM', 'AB1-131', 'C', 3);
INSERT INTO monday (Course_Code, Timing, Class_Room, Section, SNo) VALUES ('MA2201', '11:15 AM - 12:00 PM', 'AB1-131', 'C', 4);
INSERT INTO monday (Course_Code, Timing, Class_Room, Section, SNo) VALUES ('IS2204', '2:15 PM - 3:00 PM', 'AB1-131', 'C', 5);
INSERT INTO monday (Course_Code, Timing, Class_Room, Section, SNo) VALUES ('IS2203', '9:00 AM - 9:45 AM', 'AB1-131', 'C', 1);
INSERT INTO monday (Course_Code, Timing, Class_Room, Section, SNo) VALUES ('IS2201', '9:45 AM - 10:30 AM', 'AB1-131', 'C', 2);

INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (1, 1, 'N');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (2, 1, 'N');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (3, 1, 'N');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (4, 1, 'N');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (5, 1, 'N');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (114, 1, 'Y');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (115, 1, 'Y');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (129, 1, 'Y');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (130, 1, 'Y');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (131, 1, 'Y');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (210, 1, 'Y');
INSERT INTO rooms (Room_Number, Academic_Block, Status) VALUES (211, 1, 'Y');

INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ0366', 'MA2201');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ1011', 'IS2201');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ0968', 'IS2202');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ1384', 'IS2203');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ0964', 'IS2204');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ1011', 'IS2230');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ0968', 'IS2231');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ1384', 'IS2232');
INSERT INTO teach (Section, Semester, F_code, Course_code) VALUES ('C', 'IV', 'MUJ0489', 'IS2270');

INSERT INTO Thursday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('LAB', '10:30 AM - 12:00 PM', '', 'C', 3);
INSERT INTO Thursday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2203', '3:45 PM - 4:30 PM', 'AB1-129', 'C', 4);
INSERT INTO Thursday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2201', '9:00 AM - 9:45 AM', 'AB1-131', 'C', 1);
INSERT INTO Thursday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2202', '9:45 AM - 10:30 AM', 'AB1-131', 'C', 2);

INSERT INTO Tuesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2204', '10:30 AM - 11:15 AM', 'AB1-210', 'C', 3);
INSERT INTO Tuesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2202', '2:15 PM - 3:00 PM', 'AB1-131', 'C', 4);
INSERT INTO Tuesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2203', '3:00 PM - 3:45 PM', 'AB1-131', 'C', 5);
INSERT INTO Tuesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2201', '9:00 AM - 9:45 AM', 'AB1-210', 'C', 1);
INSERT INTO Tuesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('MA2201', '9:45 AM - 10:30 AM', 'AB1-210', 'C', 2);

INSERT INTO Wednesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2201', '10:30 AM - 11:15 AM', 'AB1-211', 'C', 3);
INSERT INTO Wednesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2202', '11:15 AM - 12:00 PM', 'AB1-211', 'C', 4);
INSERT INTO Wednesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2203', '2:15 PM - 3:00 PM', 'AB1-131', 'C', 5);
INSERT INTO Wednesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('LAB', '3:45 PM - 5:15 PM', NULL, 'C', 6);
INSERT INTO Wednesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('MA2201', '9:00 AM - 9:45 AM', 'AB1-211', 'C', 1);
INSERT INTO Wednesday (Course_code, Timing, Class_Room, Section, SNo) VALUES ('IS2204', '9:45 AM - 10:30 AM', 'AB1-211', 'C', 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
