# Source Data Quality Issues

## properties.csv
- Duplicate PropertyID: 3
- Missing Units value for PropertyID: 4

## occupancy.csv
- Invalid PropertyID: 99
- Missing OccupiedUnits value for PropertyID: 4

## financials.csv
- Missing Revenue value for PropertyID: 4
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
- Duplicate records were removed.
- Missing values were corrected or excluded from reporting views.
- Invalid PropertyIDs were identified through referential integrity checks.
- Clean reporting views were created to ensure Tableau dashboards only consume validated data.