# Source Data Quality Issues

## properties.csv
- Missing Units value for Desert Ridge (PropertyID: 12)
- Duplicate record for Palm Gardens (PropertyID: 3)
- Two properties with the same property ID (PropertyID: 10 x2)

## occupancy.csv
- Missing OccupiedUnits values for 4 records
- Invalid PropertyID: 99

## financials.csv
- Missing Revenue or Expenses in several records
- Invalid PropertyID: 99

## Validation Approach
- Duplicate checks using GROUP BY and HAVING
- Missing value checks using IS NULL
- Orphan record checks using LEFT JOIN

# Additional Validation Checks Performed

## Referential Integrity
- Verified all occupancy records have a matching property record.
- Verified all financial records have a matching property record.

## Duplicate Detection
- Checked for duplicate PropertyIDs in the property master data.
- Checked for duplicate PropertyID + Month combinations in occupancy and financial datasets.

## Missing Values
- Checked for missing Units values.
- Checked for missing Occupied Units values.
- Checked for missing Revenue and Expense values.

## Business Rule Validation
- Occupied Units cannot exceed Total Units.
- Revenue must be greater than or equal to Expenses.
- Occupancy Rate must be between 0% and 100%.

## Date Validation
- Verified month values are valid dates.
- Verified reporting periods are consistent across financial and occupancy datasets.

# Resolution Strategy
* Raw source data remained unchanged after ingestion into PostgreSQL staging tables.
* Data quality checks were used to identify duplicate records, missing values, and invalid PropertyIDs within the staging tables.
* Referential integrity checks were performed to detect orphan occupancy and financial records.
* Clean reporting views were created to exclude invalid or incomplete records from downstream analysis.
* Tableau dashboards were connected only to validated reporting views to ensure consistent and reliable reporting.