# UAT Test Cases

## Test Case 1: Raw CSV Import

Test Objective:
Confirm that all raw CSV files are available and can be opened.

Steps:
1. Open raw_parking_sessions.csv
2. Open parking_zones.csv
3. Open weather_sample.csv

Expected Result:
All files open successfully and contain data.

## Test Case 2: ETL Script Runs Successfully

Test Objective:
Confirm that the ETL process creates clean output files.

Steps:
1. Run python etl/clean_transform_data.py
2. Check data/processed folder

Expected Result:
clean_parking_analytics.csv and parking_summary_by_area.csv are created.

## Test Case 3: Missing Revenue Is Fixed

Test Objective:
Confirm that missing revenue values are calculated.

Steps:
1. Check processed file
2. Filter revenue column for blanks

Expected Result:
No blank revenue values exist.

## Test Case 4: SQL Revenue by Area Query

Test Objective:
Confirm that SQL can calculate revenue by area.

Steps:
1. Run revenue by area query from analysis_queries.sql

Expected Result:
Query returns total revenue grouped by area.

## Test Case 5: Power BI Dashboard Loads Data

Test Objective:
Confirm that Power BI can load the processed CSV.

Steps:
1. Open Power BI
2. Import clean_parking_analytics.csv
3. Create a card for Total Revenue

Expected Result:
Total Revenue card displays a value.

## Test Case 6: Snow Impact Analysis

Test Objective:
Confirm that dashboard can compare parking sessions by snow impact.

Steps:
1. Create bar chart using snow_impact and session_id
2. Compare No Snow, Low Snow, and High Snow

Expected Result:
Chart displays parking session count by snow impact category.
