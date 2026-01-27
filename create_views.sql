-- 1. ElectricVehiclesByMakeModel
CREATE OR REPLACE VIEW ElectricVehiclesByMakeModel AS
SELECT v.Make, v.Model, v.EV_Type, COUNT(r.DOL_Vehicle_ID) AS VehicleCount
FROM vehicle v
JOIN registration r ON v.VIN = r.VIN
GROUP BY v.Make, v.Model, v.EV_Type
ORDER BY VehicleCount DESC;

-- 2. VehicleRangeSummary
CREATE OR REPLACE VIEW VehicleRangeSummary AS
SELECT
    v.Make,
    v.EV_Type,
    AVG(v.Range) AS Avg_Range,
    MAX(v.Range) AS Max_Range,
    MIN(v.Range) AS Min_Range
FROM vehicle v
GROUP BY v.Make, v.EV_Type
ORDER BY v.Make, v.EV_Type;

-- 3. LatestModelsByMake
CREATE OR REPLACE VIEW LatestModelsByMake AS
SELECT Make, MAX(Model_Year) AS LatestModelYear
FROM vehicle
GROUP BY Make;

-- 4. DetailedEvSpecifications
CREATE OR REPLACE VIEW DetailedEvSpecifications AS
SELECT VIN, Make, Model, Model_Year, EV_Type, Range, Base_MSRP
FROM vehicle
WHERE Base_MSRP > 0 AND Range > 0;

-- 5. TopSellingEVsByLocation
CREATE OR REPLACE VIEW TopSellingEVsByLocation AS
SELECT l.City, v.Make, v.Model, COUNT(r.DOL_Vehicle_ID) AS TotalRegistrations
FROM vehicle v
JOIN registration r ON v.VIN = r.VIN
JOIN vehicle_location vl ON vl.VIN = v.VIN
JOIN location l ON l.Location_ID = vl.Location_ID
GROUP BY l.City, v.Make, v.Model
ORDER BY l.City, TotalRegistrations DESC;

-- 6. EVChargingUtilitySupport
CREATE OR REPLACE VIEW EVChargingUtilitySupport AS
SELECT u.Utility_Company, COUNT(vu.VIN) AS SupportedVehicles
FROM utility u
JOIN vehicle_utility vu ON vu.Utility_ID = u.Utility_ID
GROUP BY u.Utility_Company
ORDER BY SupportedVehicles DESC;
