-- Clean Property View
-- =========================================
CREATE OR REPLACE VIEW vw_properties_clean AS
SELECT DISTINCT
    property_id,
    property_name,
    market,
    units
FROM stg_properties
WHERE units IS NOT NULL;	--drop incomplete data

-- Clean Occupance Rate View
-- =========================================
CREATE VIEW vw_occupancy_clean AS
SELECT
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
ON o.property_id = p.property_id;

-- Clean Financials View
-- =========================================
CREATE OR REPLACE VIEW vw_financials_clean AS
SELECT
    f.property_id,
    f.month,
    f.revenue,
    f.expenses
FROM stg_financials f
INNER JOIN vw_properties_clean p
    ON f.property_id = p.property_id
WHERE f.revenue IS NOT NULL;