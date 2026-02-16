USE vehicles;

-- Vehicles
INSERT INTO vehicle (VIN, Make, Model, Model_Year, EV_Type)
SELECT DISTINCT
    VIN,
    Make,
    Model,
    Model_Year,
    EV_Type
FROM ev_population_raw
WHERE VIN IS NOT NULL
AND VIN NOT IN (SELECT VIN FROM vehicle);


-- Locations
INSERT INTO location (County, City, State, Postal_Code)
SELECT DISTINCT
    County,
    City,
    State,
    Postal_Code
FROM ev_population_raw raw
WHERE County IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM location l
    WHERE l.County = raw.County
      AND l.City = raw.City
      AND l.Postal_Code = raw.Postal_Code
);


-- Registrations
INSERT INTO registration (VIN)
SELECT DISTINCT VIN
FROM ev_population_raw raw
WHERE VIN IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM registration r
    WHERE r.VIN = raw.VIN
);


-- CAFV Status
INSERT INTO cafv_status (VIN, DOL_Vehicle_ID, CAFV)
SELECT
    r.VIN,
    r.DOL_Vehicle_ID,
    raw.CAFV_Status
FROM ev_population_raw raw
JOIN registration r
    ON raw.VIN = r.VIN
WHERE raw.CAFV_Status IS NOT NULL;


-- Utilities
INSERT INTO utility (Utility_Company)
SELECT DISTINCT Utility_Company
FROM ev_population_raw raw
WHERE Utility_Company IS NOT NULL
AND Utility_Company <> ''
AND NOT EXISTS (
    SELECT 1
    FROM utility u
    WHERE u.Utility_Company = raw.Utility_Company
);


-- Vehicle_Utility
INSERT INTO vehicle_utility (VIN, Utility_ID)
SELECT DISTINCT
    raw.VIN,
    u.Utility_ID
FROM ev_population_raw raw
JOIN utility u
    ON raw.Utility_Company = u.Utility_Company
WHERE raw.Utility_Company IS NOT NULL;


-- Vehicle_Location
INSERT INTO vehicle_location (VIN, Location_ID)
SELECT DISTINCT
    raw.VIN,
    l.Location_ID
FROM ev_population_raw raw
JOIN location l
  ON raw.County = l.County
 AND raw.City = l.City
 AND raw.Postal_Code = l.Postal_Code;
