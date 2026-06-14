# RE-property-portfolio-analytics
An end-to-end BI project demonstrating ETL, data quality validation, PostgreSQL reporting views, and Tableau dashboards for multifamily property performance analysis.

## Project Overview
This project demonstrates an end-to-end Business Intelligence workflow using PostgreSQL and Tableau. The objective was to transform raw property management data into clean reporting datasets and interactive dashboards.

## Technologies Used
* PostgreSQL/SQL
* Tableau
* CSV Data Sources
* GitHub

## ETL Process
Raw property, occupancy, and financial data were imported from CSV files into PostgreSQL staging tables. Data quality validation checks were performed to identify duplicates, missing values, and invalid records before creating clean reporting views.

The reporting layer calculates key business metrics including Net Operating Income (NOI) and Occupancy Rate. These views serve as the data source for Tableau dashboards used to analyze portfolio and market performance.

**CSV Files → PostgreSQL Staging Tables → Data Validation → Reporting Views → Tableau Dashboards**

For additional technical details, see:
- docs/data_pipeline.md
- docs/data_quality_assessment.md 

## Visualize
Tableau dashboards were connected directly to PostgreSQL reporting views.

Dashboards include:
1. Property Portfolio Performance Dashboard
3. Market Performance Analysis Dashboard

## Key Business Metrics
* Revenue
* Expenses
* Net Operating Income (NOI)
* Occupancy Rate

## Tableau Public Dashboard
https://public.tableau.com/app/profile/jonathan.reznik/viz/MultifamilyProject/Dashboard1
