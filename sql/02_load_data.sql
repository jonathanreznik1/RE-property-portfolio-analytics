-- =========================================
-- 02_load_data.sql
-- =========================================
-- Reload Process:
-- 1. TRUNCATE staging tables
-- 2. Import CSV files using pgAdmin
-- 3. Execute validation queries below
--
-- Purpose:
-- Validate successful loading of source data into staging tables.
--
-- Source Files:
-- property_master.csv
-- occupancy_history.csv
-- financial_performance.csv
--
-- Load Method:
-- CSV files imported to PostgreSQL using the pgAdmin Import Wizard.
--
-- Staging Tables:
-- stg_properties
-- stg_occupancy
-- stg_financials
--

-- Optional: Clear staging tables before reload

-- TRUNCATE TABLE stg_properties;
-- TRUNCATE TABLE stg_occupancy;
-- TRUNCATE TABLE stg_financials;


-- Post-Load Validation

-- Expected Row Counts:
-- stg_properties: 18
-- stg_occupancy: 76
-- stg_financials: 76

SELECT COUNT(*) AS properties_count
FROM stg_properties;

SELECT COUNT(*) AS occupancy_count
FROM stg_occupancy;

SELECT COUNT(*) AS financials_count
FROM stg_financials;


-- Sample Data Review

SELECT *
FROM stg_properties
LIMIT 10;

SELECT *
FROM stg_occupancy
LIMIT 10;

SELECT *
FROM stg_financials
LIMIT 10;