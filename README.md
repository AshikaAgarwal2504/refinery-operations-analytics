# Refinery Operations Analytics: Production and Energy

> **Simulated data.** All data in this project is simulated for learning and portfolio purposes. It is **not** real data from IOCL or any actual refinery.

## Project summary
An end-to-end analysis of daily production and energy use for a fictional refinery with 6 process units (CDU, VDU, FCC, HCU, HDT, REF), from 2024-01-01 to 2025-12-31 (4,386 rows, 19 columns).

**Main KPI:** energy intensity (GJ per tonne of feed) = total energy / total feed. It is always computed as a ratio of sums, never an average of daily ratios.

## Tools used
| Tool | What I did |
|------|-----------|
| Python | Generated the simulated dataset (`generate_refinery_data.py`, fixed seed) |
| Excel | PivotTables, calculated field, line and column charts |
| MySQL | Aggregation queries with GROUP BY and DATE_FORMAT |
| Power BI | DAX measure, KPI card, line chart, unit and crude blend charts, slicer |

## Key findings
1. **Overall energy intensity is 2.07 GJ/tonne** (about 71.9 million GJ used for 34.7 million tonnes of feed).
2. **HCU (hydrocracker) is the most energy-hungry at 4.38 GJ/t**, followed by REF (3.66) and FCC (3.37). VDU is the most efficient at 1.21 GJ/t.
3. **Heavy Sour crude uses about 7% more energy per tonne than Light Sweet** (2.154 vs 2.011 GJ/t), and gives roughly 2 percentage points lower yield.
4. **Seasonality:** energy intensity peaked in July 2024 (2.163) and was lowest in November 2024 (1.993), so summer is less efficient.

## Method check
The same three questions (by unit, by crude blend, by month) were answered in Excel, MySQL and Power BI, and the numbers match across all three.

## Repository structure
```
data/      refinery_production_energy_simulated.csv, data_dictionary.md
excel/     refinery_analysis.xlsx
sql/       refinery_mysql_setup.sql, refinery_queries.sql
python/    generate_refinery_data.py
powerbi/   refinery_dashboard.pbix, dashboard screenshot
```

## Limitations
- Data is simulated from simple rules, so patterns are built in by design.
- Energy conversion factors (1 MWh = 3.6 GJ, steam = 2.7 GJ/tonne) and prices are simplified assumptions.
