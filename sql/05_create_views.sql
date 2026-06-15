-- --------------------------------------------------
-- 05_reporting_views.sql
-- --------------------------------------------------
-- Purpose:
-- Create business reporting views from validated
-- transformation views for use in Tableau dashboards.
--
-- Source Views:
-- vw_properties_clean
-- vw_occupancy_clean
-- vw_financials_clean
--
-- Reporting Views:
-- vw_noi
-- vw_property_performance
-- vw_market_summary
--
-- Note:
-- These views contain business metrics and aggregations
-- used for portfolio and market-level reporting.
-- --------------------------------------------------


-- Property Performance Dashboard View
-- -------------------------------------------

CREATE OR REPLACE VIEW vw_property_performance AS
SELECT
    p.property_name,
    p.market,
    f.month,
    f.revenue,
    f.expenses,
    f.revenue - f.expenses AS noi,
    o.occupied_units,
    p.units,
    ROUND(
        (o.occupied_units::numeric / p.units) * 100,
        2
    ) AS occupancy_rate
FROM vw_properties_clean p
JOIN vw_financials_clean f
    ON p.property_id = f.property_id
JOIN vw_occupancy_clean o
    ON p.property_id = o.property_id
    AND f.month = o.month;


-- Market-level Summary View
-- -------------------------------------------

CREATE OR REPLACE VIEW vw_market_summary AS
SELECT
    market,
    COUNT(DISTINCT property_name) AS properties,
    SUM(revenue) AS total_revenue,
    SUM(expenses) AS total_expenses,
    SUM(noi) AS total_noi,
    AVG(occupancy_rate) AS avg_occupancy_rate
FROM vw_property_performance
GROUP BY market;