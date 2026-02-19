USE vehicles;

-- View 1: Electric Vehicles by Make and Model
DROP VIEW IF EXISTS ElectricVehiclesByMakeModel;
CREATE VIEW ElectricVehiclesByMakeModel AS
SELECT 
    v.Make,
    v.Model,
    v.EV_Type,
    COUNT(r.VIN) AS RegisteredVehicles
FROM vehicle v
JOIN registration r ON v.VIN = r.VIN
GROUP BY v.Make, v.Model, v.EV_Type
ORDER BY RegisteredVehicles DESC;

-- View 2: Vehicle Range Summary
DROP VIEW IF EXISTS VehicleRangeSummary;
CREATE VIEW VehicleRangeSummary AS
SELECT 
    Make,
    EV_Type,
    ROUND(AVG(EV_Range), 2) AS AvgRange,
    MAX(EV_Range) AS MaxRange,
    MIN(EV_Range) AS MinRange
FROM vehicle
GROUP BY Make, EV_Type
ORDER BY Make, EV_Type;

-- View 3: Latest Models by Make
DROP VIEW IF EXISTS LatestModelsByMake;
CREATE VIEW LatestModelsByMake AS
SELECT 
    Make,
    Model,
    MAX(Model_Year) AS LatestModelYear
FROM vehicle
GROUP BY Make, Model
ORDER BY Make, Model;

-- View 4: Detailed EV Specifications
DROP VIEW IF EXISTS DetailedEvSpecifications;
CREATE VIEW DetailedEvSpecifications AS
SELECT 
    VIN,
    Make,
    Model,
    Model_Year,
    EV_Type,
    EV_Range
FROM vehicle
WHERE EV_Range > 0
ORDER BY Make, Model;

-- View 5: Top Selling EVs by Location
DROP VIEW IF EXISTS TopSellingEVsByLocation;
CREATE VIEW TopSellingEVsByLocation AS
SELECT 
    l.City,
    l.County,
    v.Make,
    v.Model,
    COUNT(r.VIN) AS RegisteredCount
FROM vehicle v
JOIN registration r ON v.VIN = r.VIN
JOIN vehicle_location vl ON v.VIN = vl.VIN
JOIN location l ON vl.Location_ID = l.Location_ID
GROUP BY l.City, l.County, v.Make, v.Model
ORDER BY l.City, RegisteredCount DESC;

-- View 6: EV Charging Utility Support
DROP VIEW IF EXISTS EVChargingUtilitySupport;
CREATE VIEW EVChargingUtilitySupport AS
SELECT 
    u.Utility_Company,
    COUNT(vu.VIN) AS SupportedEVs
FROM utility u
JOIN vehicle_utility vu ON u.Utility_ID = vu.Utility_ID
GROUP BY u.Utility_Company
ORDER BY SupportedEVs DESC;