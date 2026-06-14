-- NOI View
-- =========================================
CREATE VIEW vw_noi AS
SELECT
    property_id,
    month,
    revenue,
    expenses,
    revenue - expenses AS noi
FROM vw_financials_clean;

-- Market-level Summary View
-- =========================================
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

-- Executive Dashboard View
-- =========================================
CREATE VIEW vw_property_performance AS
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
    ON p.property_name = o.property_name
    AND f.month = o.month;

