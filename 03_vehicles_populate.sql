-- Vehicles
INSERT INTO vehicle (VIN, Make, Model, Model_Year, EV_Type)
SELECT VIN, Make, Model, Model_Year, EV_Type
FROM ev_population_raw;

-- Locations
INSERT INTO location (County, City, State, Postal_Code)
SELECT DISTINCT County, City, State, Postal_Code
FROM ev_population_raw;

-- Registrations
INSERT INTO registration (VIN)
SELECT VIN
FROM ev_population_raw;

-- CAFV Status
INSERT INTO cafv_status (VIN, DOL_Vehicle_ID, CAFV)
SELECT r.VIN, r.DOL_Vehicle_ID, raw.CAFV_Status
FROM ev_population_raw raw
JOIN registration r ON raw.VIN = r.VIN;

-- Utilities
INSERT INTO utility (Utility_Company)
SELECT DISTINCT Utility_Company
FROM ev_population_raw
WHERE Utility_Company IS NOT NULL;

-- Vehicle_Utility
INSERT INTO vehicle_utility (VIN, Utility_ID)
SELECT raw.VIN, u.Utility_ID
FROM ev_population_raw raw
JOIN utility u ON raw.Utility_Company = u.Utility_Company
WHERE raw.Utility_Company IS NOT NULL;

-- Vehicle_Location
INSERT INTO vehicle_location (VIN, Location_ID)
SELECT raw.VIN, l.Location_ID
FROM ev_population_raw raw
JOIN location l
ON raw.County = l.County AND raw.City = l.City AND raw.Postal_Code = l.Postal_Code;
