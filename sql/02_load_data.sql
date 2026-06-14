-- DATA LOAD VALIDATION
-- CSV files imported via pgAdmin Import Wizard

SELECT COUNT(*) AS properties_count
FROM stg_properties;

SELECT COUNT(*) AS occupancy_count
FROM stg_occupancy;

SELECT COUNT(*) AS financials_count
FROM stg_financials;

SELECT * FROM stg_properties;
SELECT * FROM stg_occupancy;
SELECT * FROM stg_financials;