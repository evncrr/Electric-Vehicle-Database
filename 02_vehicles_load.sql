USE vehicles;

-- Load raw CSV data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/Electric_Vehicle_Population_Data.csv'
INTO TABLE ev_population_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
VIN,
County,
City,
State,
@PostCode,
@ModelYear,
Make,
Model,
`Electric Vehicle Type`,
`Clean Alternative Fuel Vehicle (CAFV) Eligibility`,
@ElectricRange,
@LegDistrict,
@DOLID,
`Vehicle Location`,
`Electric Utility`,
`2020 Census Tract`
)
SET
`Postal Code` = NULLIF(@PostCode,''),
`Model Year` = NULLIF(@ModelYear,''),
`Electric Range` = NULLIF(@ElectricRange,''),
`Legislative District` = NULLIF(@LegDistrict,''),
`DOL Vehicle ID` = NULLIF(@DOLID,'');
