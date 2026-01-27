DROP TABLE IF EXISTS ev_population_raw;
CREATE TABLE ev_population_raw (
    VIN VARCHAR(20),
    Make VARCHAR(50),
    Model VARCHAR(50),
    Model_Year INT,
    EV_Type VARCHAR(50),
    County VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(2),
    Postal_Code INT,
    CAFV_Status VARCHAR(100),
    Utility_Company VARCHAR(50)
);

LOAD DATA INFILE "C:\Users\evanc\OneDrive\Documents\GitHub\Electric-Vehicle-Database\Electric_Vehicle_Population_Data.csv"
INTO TABLE ev_population_raw
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
