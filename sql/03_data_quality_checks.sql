-- --------------------------------------------------
-- 03_data_quality_checks.sql
-- --------------------------------------------------
-- Purpose:
-- Validation suite for source data loaded into PostgreSQL staging tables:
-- stg_properties
-- stg_occupancy
-- stg_financials
--
-- Expected Result:
-- Validation queries identify intentionally introduced
-- data quality issues within the raw source data.
-- --------------------------------------------------
-- Duplicate Checks
-- --------------------------------------------------
-- Duplicate Property IDs

SELECT
    property_id,
    COUNT(*)
FROM stg_properties
GROUP BY property_id
HAVING COUNT(*) > 1;

-- Duplicate PropertyID + Month combinations

SELECT
    property_id,
    month,
    COUNT(*)
FROM stg_financials
GROUP BY property_id, month
HAVING COUNT(*) > 1;

-- --------------------------------------------------
-- Missing Value Checks
-- --------------------------------------------------
-- Missing Units

SELECT *
FROM stg_properties
WHERE units IS NULL;

-- Missing Property Name

SELECT *
FROM stg_properties
WHERE property_name IS NULL;

-- Missing Occupancy

SELECT *
FROM stg_occupancy
WHERE occupied_units IS NULL;

-- Missing Market

SELECT *
FROM stg_properties
WHERE market IS NULL;

-- Missing Revenue

SELECT *
FROM stg_financials
WHERE revenue IS NULL;

-- Missing Expenses

SELECT *
FROM stg_financials
WHERE expenses IS NULL;

-- --------------------------------------------------
-- Referential Integrity Checks
-- --------------------------------------------------

-- Orphan Occupancy Records

SELECT *
FROM stg_occupancy o
LEFT JOIN stg_properties p
    ON o.property_id = p.property_id
WHERE p.property_id IS NULL;

-- Orphan Financial Records

SELECT *
FROM stg_financials f
LEFT JOIN stg_properties p
    ON f.property_id = p.property_id
WHERE p.property_id IS NULL;

-- --------------------------------------------------
-- Business Rule Checks
-- --------------------------------------------------
-- Occupancy Exceeds Available Units

SELECT
    o.property_id,
    o.month,
    o.occupied_units,
    p.units
FROM stg_occupancy o
JOIN stg_properties p
    ON o.property_id = p.property_id
WHERE o.occupied_units > p.units;

