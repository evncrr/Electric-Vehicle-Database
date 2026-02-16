CREATE DATABASE IF NOT EXISTS vehicles;
USE vehicles;

-- Drop tables in proper order
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
    VIN VARCHAR(20) NOT NULL PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Model_Year INT,
    EV_Type VARCHAR(50),
    EV_Range INT DEFAULT 0,
    Base_MSRP INT DEFAULT 0
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

-- District table
CREATE TABLE district (
    District_ID INT AUTO_INCREMENT PRIMARY KEY,
    Legislative_District INT DEFAULT NULL
);

-- Registration table
CREATE TABLE registration (
    DOL_Vehicle_ID INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(20),
    District_ID INT DEFAULT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY (District_ID) REFERENCES district(District_ID)
);

-- Utility table
CREATE TABLE utility (
    Utility_ID INT AUTO_INCREMENT PRIMARY KEY,
    Utility_Company VARCHAR(50)
);

-- Vehicle_Utility table
CREATE TABLE vehicle_utility (
    VIN VARCHAR(20),
    Utility_ID INT,
    PRIMARY KEY(VIN, Utility_ID),
    FOREIGN KEY(VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY(Utility_ID) REFERENCES utility(Utility_ID)
);

-- Vehicle_Location table
CREATE TABLE vehicle_location (
    VIN VARCHAR(20),
    Location_ID INT,
    PRIMARY KEY(VIN, Location_ID),
    FOREIGN KEY(VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY(Location_ID) REFERENCES location(Location_ID)
);

-- CAFV status table
CREATE TABLE cafv_status (
    VIN VARCHAR(20),
    DOL_Vehicle_ID INT,
    CAFV VARCHAR(100),
    PRIMARY KEY(VIN, DOL_Vehicle_ID),
    FOREIGN KEY(VIN) REFERENCES vehicle(VIN),
    FOREIGN KEY(DOL_Vehicle_ID) REFERENCES registration(DOL_Vehicle_ID)
);

-- Census table
CREATE TABLE census (
    Census_ID INT AUTO_INCREMENT PRIMARY KEY,
    Census_Tract_2020 VARCHAR(50),
    DOL_Vehicle_ID INT,
    FOREIGN KEY(DOL_Vehicle_ID) REFERENCES registration(DOL_Vehicle_ID)
);
