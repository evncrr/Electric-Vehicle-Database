-- Create database
DROP DATABASE IF EXISTS vehicles;
CREATE DATABASE vehicles;
USE vehicles;

-- Raw CSV table
DROP TABLE IF EXISTS ev_population_raw;
CREATE TABLE ev_population_raw (
    VIN VARCHAR(20),
    County VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(2),
    `Postal Code` INT NULL,
    `Model Year` INT NULL,
    Make VARCHAR(50),
    Model VARCHAR(50),
    `Electric Vehicle Type` VARCHAR(100),
    `Clean Alternative Fuel Vehicle (CAFV) Eligibility` VARCHAR(100),
    `Electric Range` INT NULL,
    `Legislative District` INT NULL,
    `DOL Vehicle ID` BIGINT NULL,
    `Vehicle Location` VARCHAR(100),
    `Electric Utility` VARCHAR(150),
    `2020 Census Tract` VARCHAR(50)
);

-- Normalized tables
DROP TABLE IF EXISTS cafv_status;
DROP TABLE IF EXISTS vehicle_utility;
DROP TABLE IF EXISTS vehicle_location;
DROP TABLE IF EXISTS census;
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS utility;
DROP TABLE IF EXISTS district;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS vehicle;

-- Vehicle table
CREATE TABLE vehicle (
    VIN VARCHAR(20) PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Model_Year INT,
    EV_Type VARCHAR(100),
    EV_Range INT
);

-- District table
CREATE TABLE district (
    District_ID INT AUTO_INCREMENT PRIMARY KEY,
    Legislative_District INT
);

-- Registration table
CREATE TABLE registration (
    DOL_Vehicle_ID BIGINT PRIMARY KEY,
    VIN VARCHAR(20),
    District_ID INT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY (District_ID) REFERENCES district(District_ID)
);

-- Location table
CREATE TABLE location (
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    County VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(2),
    Postal_Code INT,
    Vehicle_Location VARCHAR(100)
);

-- Utility table
CREATE TABLE utility (
    Utility_ID INT AUTO_INCREMENT PRIMARY KEY,
    Utility_Company VARCHAR(150)
);

-- Bridge tables
CREATE TABLE vehicle_utility (
    VIN VARCHAR(20),
    Utility_ID INT,
    PRIMARY KEY (VIN, Utility_ID),
    FOREIGN KEY (VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY (Utility_ID) REFERENCES utility(Utility_ID)
);

CREATE TABLE vehicle_location (
    VIN VARCHAR(20),
    Location_ID INT,
    PRIMARY KEY (VIN, Location_ID),
    FOREIGN KEY (VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY (Location_ID) REFERENCES location(Location_ID)
);

-- CAFV Status
CREATE TABLE cafv_status (
    VIN VARCHAR(20),
    DOL_Vehicle_ID BIGINT,
    CAFV VARCHAR(100),
    PRIMARY KEY (VIN, DOL_Vehicle_ID),
    FOREIGN KEY (VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY (DOL_Vehicle_ID) REFERENCES registration(DOL_Vehicle_ID)
);

-- Census table
CREATE TABLE census (
    Census_ID INT AUTO_INCREMENT PRIMARY KEY,
    Census_Tract_2020 VARCHAR(50),
    DOL_Vehicle_ID BIGINT,
    FOREIGN KEY (DOL_Vehicle_ID) REFERENCES registration(DOL_Vehicle_ID)
);