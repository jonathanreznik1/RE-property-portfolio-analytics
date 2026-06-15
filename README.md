# Multifamily Property Portfolio Analytics
An end-to-end BI project demonstrating ETL, data quality validation, PostgreSQL reporting views, and Tableau dashboards for multifamily property performance analysis.

## Project Overview
This project demonstrates an end-to-end Business Intelligence workflow using PostgreSQL and Tableau. The objective was to transform raw property management data into clean reporting datasets and interactive dashboards.

## Business Objective
Analyze multifamily property performance across multiple markets by tracking revenue, expenses, net operating income (NOI), and occupancy metrics. The project demonstrates how raw operational data can be transformed into actionable business insights through a structured BI workflow.

## Technologies Used
* PostgreSQL/SQL
* Tableau
* CSV Data Sources
* GitHub

## ETL Process
Raw property, occupancy, and financial data were imported from CSV files into PostgreSQL staging tables. Data quality validation checks were performed to identify duplicates, missing values, and invalid records before creating clean reporting views.

The reporting layer calculates key business metrics including Net Operating Income (NOI) and Occupancy Rate. These views serve as the data source for Tableau dashboards used to analyze portfolio and market performance.

```text
Raw CSV Files
        ↓
PostgreSQL Staging Tables
        ↓
Data Quality Validation
        ↓
Transformation Views
        ↓
Reporting Views
        ↓
Tableau Dashboards
```
For additional technical details, see:
- docs/data_pipeline.md
- docs/data_quality_assessment.md 

## SQL Workflow
1. 01_create_tables.sql – Create staging tables
2. 02_load_data.sql – Validate successful data loads
3. 03_data_quality_checks.sql – Identify data quality issues
4. 04_transformations.sql – Create clean transformation views
5. 05_reporting_views.sql – Create business reporting views
   
## Dashboards
Tableau dashboards were connected directly to PostgreSQL reporting views.

Dashboards include:
1. Property Portfolio Performance Dashboard
   <img width="1285" height="705" alt="image" src="https://github.com/user-attachments/assets/e8ab9d80-d668-4ffe-9337-fc06281b810d" />

2. Market Performance Analysis Dashboard
   <img width="1124" height="680" alt="image" src="https://github.com/user-attachments/assets/5f3a1e8b-a272-49d4-a537-e3ffa26f3f5e" />

## Key Business Metrics
* Revenue
* Expenses
* Net Operating Income (NOI)
* Occupancy Rate

## Tableau Public Dashboard
[View Interactive Dashboard on Tableau Public]https://public.tableau.com/app/profile/jonathan.reznik/viz/MultifamilyPropertyPortfolioAnalytics/Dashboard1
