-- =========================================
-- STAGING TABLES
-- Raw data loaded directly from CSV files
-- =========================================

DROP TABLE IF EXISTS stg_financials;
DROP TABLE IF EXISTS stg_occupancy;
DROP TABLE IF EXISTS stg_properties;

-- =========================================
-- Properties
-- =========================================

CREATE TABLE stg_properties (
    property_id INTEGER,
    property_name VARCHAR(100),
    market VARCHAR(50),
    units INTEGER
);

-- =========================================
-- Occupancy
-- =========================================

CREATE TABLE stg_occupancy (
    property_id INTEGER,
    month VARCHAR(7),
    occupied_units INTEGER
);

-- =========================================
-- Financials
-- =========================================

CREATE TABLE stg_financials (
    property_id INTEGER,
    month VARCHAR(7),
    revenue NUMERIC(12,2),
    expenses NUMERIC(12,2)
);
