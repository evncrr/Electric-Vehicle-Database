USE vehicles;

-- 1. Vehicles
INSERT INTO vehicle (VIN, Make, Model, Model_Year, EV_Type, EV_Range)
SELECT DISTINCT
    VIN,
    Make,
    Model,
    `Model Year`,
    `Electric Vehicle Type`,
    `Electric Range`
FROM ev_population_raw
WHERE VIN IS NOT NULL;

-- 2. Districts
INSERT INTO district (Legislative_District)
SELECT DISTINCT `Legislative District`
FROM ev_population_raw
WHERE `Legislative District` IS NOT NULL;

-- 3. Registration
INSERT INTO registration (DOL_Vehicle_ID, VIN, District_ID)
SELECT DISTINCT
    raw.`DOL Vehicle ID`,
    raw.VIN,
    d.District_ID
FROM ev_population_raw raw
LEFT JOIN district d
ON raw.`Legislative District` = d.Legislative_District
WHERE raw.`DOL Vehicle ID` IS NOT NULL;

-- 4. Location
INSERT INTO location (County, City, State, Postal_Code, Vehicle_Location)
SELECT DISTINCT
    County,
    City,
    State,
    `Postal Code`,
    `Vehicle Location`
FROM ev_population_raw;

-- 5. Utility
INSERT INTO utility (Utility_Company)
SELECT DISTINCT `Electric Utility`
FROM ev_population_raw
WHERE `Electric Utility` IS NOT NULL
AND `Electric Utility` <> '';

-- 6. Vehicle_Utility
INSERT INTO vehicle_utility (VIN, Utility_ID)
SELECT DISTINCT
    raw.VIN,
    u.Utility_ID
FROM ev_population_raw raw
JOIN utility u
ON raw.`Electric Utility` = u.Utility_Company;

-- 7. Vehicle_Location
INSERT INTO vehicle_location (VIN, Location_ID)
SELECT DISTINCT
    raw.VIN,
    l.Location_ID
FROM ev_population_raw raw
JOIN location l
ON raw.County = l.County
AND raw.City = l.City
AND raw.`Postal Code` = l.Postal_Code;

-- 8. CAFV Status
INSERT INTO cafv_status (VIN, DOL_Vehicle_ID, CAFV)
SELECT DISTINCT
    VIN,
    `DOL Vehicle ID`,
    `Clean Alternative Fuel Vehicle (CAFV) Eligibility`
FROM ev_population_raw;

-- 9. Census
INSERT INTO census (Census_Tract_2020, DOL_Vehicle_ID)
SELECT DISTINCT `2020 Census Tract`, `DOL Vehicle ID`
FROM ev_population_raw;