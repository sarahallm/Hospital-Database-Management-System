CREATE SCHEMA hospital_system;
USE hospital_system;

CREATE TABLE Patient (
    pid INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    minit VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    bdate DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(50) NOT NULL,
    medicalHistory VARCHAR(255) NOT NULL
);


CREATE TABLE Doctor (
    did INT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    minit VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL
);




CREATE TABLE Department (
    depId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    HeadDoctorID INT NOT NULL,
    FOREIGN KEY (HeadDoctorID) REFERENCES Doctor(Did) ON DELETE CASCADE  ON UPDATE CASCADE
);


ALTER TABLE Doctor ADD COLUMN depId INT ;

ALTER TABLE Doctor 
ADD CONSTRAINT FK_Doctor_Department
FOREIGN KEY (depId) REFERENCES Department(depId)
ON DELETE CASCADE
ON UPDATE CASCADE;



CREATE TABLE DoctorSchedule (
    scheduleID INT PRIMARY KEY AUTO_INCREMENT,
    did INT NOT NULL,
    day ENUM('Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') NOT NULL,
    timeAvailable VARCHAR(20) NOT NULL,
    FOREIGN KEY (did) REFERENCES Doctor(did) ON DELETE CASCADE  ON UPDATE CASCADE
);


CREATE TABLE Appointment (
    aid INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    reason VARCHAR(50) NOT NULL,
    pid INT NOT NULL,
    did INT NOT NULL,
    FOREIGN KEY (pid) REFERENCES Patient(pid) ON DELETE CASCADE,
    FOREIGN KEY (did) REFERENCES Doctor(did) ON DELETE CASCADE
);




CREATE TABLE Prescription (
    presId INT PRIMARY KEY AUTO_INCREMENT,
    medication VARCHAR(255) NOT NULL,
    dosage VARCHAR(255) NOT NULL,
    duration VARCHAR(255) NOT NULL,
    pid INT NOT NULL,
    did INT NOT NULL,
    FOREIGN KEY (pid) REFERENCES Patient(pid) ON DELETE CASCADE,
    FOREIGN KEY (did) REFERENCES Doctor(did) ON DELETE CASCADE
);


