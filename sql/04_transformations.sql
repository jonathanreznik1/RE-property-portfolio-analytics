-- --------------------------------------------------
-- 04_transformations.sql
-- --------------------------------------------------
-- Purpose:
-- Create clean reporting views from raw staging tables
-- by filtering invalid, incomplete, and duplicate records.
--
-- Source Tables:
-- stg_properties
-- stg_occupancy
-- stg_financials
--
-- Output Views:
-- vw_properties_clean
-- vw_occupancy_clean
-- vw_financials_clean
--
-- Note:
-- Source data remains unchanged. Data quality issues are
-- addressed through SQL transformations and clean views.
--
-- Development Note:
-- If view column definitions change, dependent views may
-- need to be dropped and recreated before executing this file.
-- --------------------------------------------------


-- Clean Property View
-- Retain first occurrence of each PropertyID
-- ------------------------------------------

CREATE OR REPLACE VIEW vw_properties_clean AS
SELECT *
FROM stg_properties
WHERE units IS NOT NULL
  AND property_id NOT IN (
      SELECT property_id
      FROM stg_properties
      GROUP BY property_id
      HAVING COUNT(*) > 1
  );


-- Clean Occupance Rate View
-- ------------------------------------------

CREATE OR REPLACE VIEW vw_occupancy_clean AS
SELECT
	p.property_id,
    p.property_name,
	o.month,
    o.occupied_units,
    p.units,
    ROUND(
        (o.occupied_units::numeric / p.units) * 100,
        2
    ) AS occupancy_rate
FROM stg_occupancy o
JOIN vw_properties_clean p
ON o.property_id = p.property_id
WHERE o.occupied_units IS NOT NULL
AND o.occupied_units <= p.units;


-- Clean Financials View
-- ------------------------------------------

CREATE OR REPLACE VIEW vw_financials_clean AS
SELECT
    f.property_id,
    f.month,
    f.revenue,
    f.expenses
FROM stg_financials f
INNER JOIN vw_properties_clean p
    ON f.property_id = p.property_id
WHERE f.revenue IS NOT NULL
  AND f.expenses IS NOT NULL;


-- Clean View Validation
-- --------------------------------------------------

-- Verify no missing units remain

SELECT *
FROM vw_properties_clean
WHERE units IS NULL;

-- Verify no missing occupancy values remain

SELECT *
FROM vw_occupancy_clean
WHERE occupied_units IS NULL;

-- Verify no missing revenue values remain

SELECT *
FROM vw_financials_clean
WHERE revenue IS NULL;

-- Verify no null occupancy values

SELECT *
FROM vw_occupancy_clean
WHERE occupied_units IS NULL;

-- Verify occupancy rate does not exceed 100%

SELECT *
FROM vw_occupancy_clean
WHERE occupancy_rate > 100;

-- Verify occupancy rate is not negative

SELECT *
FROM vw_occupancy_clean
WHERE occupancy_rate < 0;