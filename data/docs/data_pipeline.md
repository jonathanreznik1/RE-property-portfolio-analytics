**Raw CSV**
property_master.csv	      (Property Dimension)
occupancy_history.csv	    (Occupancy Fact Table)
financial_performance.csv	(Financial Fact Table)
        ↓
**PostgreSQL Staging Tables**
stg_properties
stg_occupancy
stg_financials
        ↓
**Data Quality Checks**
03_data_quality_checks.sql
        ↓
**Data Transformations & Reporting Views**
vw_properties_clean
vw_occupancy_clean
vw_financials_clean
        ↓
**Business Reporting Views**
vw_property_performance
        ↓
**Tableau Dashboard**
Property Portfolio Performance Dashboard
Market Performance Analysis Dashboard