-- Duplicate Property IDs

SELECT
    property_id,
    COUNT(*)
FROM stg_properties
GROUP BY property_id
HAVING COUNT(*) > 1;

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

-- Missing Revenue

SELECT *
FROM stg_financials
WHERE revenue IS NULL;

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