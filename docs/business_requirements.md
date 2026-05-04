# Business Requirements Document

## Project Name

St. John's Parking Analytics Pipeline

## Business Objective

The objective of this project is to create a structured reporting solution that helps parking operations teams understand parking demand, revenue patterns, payment behaviour, and winter weather impact.

## Stakeholders

- Parking Operations Team
- City Planning Team
- Finance and Revenue Reporting Team
- Business Analysts
- Data Analysts
- IT and Data Support Team

## Current Problem

Parking data is often stored in separate files or systems. This can make it difficult to understand trends, compare parking areas, and identify issues quickly.

The business needs a simple reporting process that combines parking session data, zone details, and weather information into one clean dataset.

## Functional Requirements

1. The system must import parking session CSV data.
2. The system must import parking zone CSV data.
3. The system must import weather CSV data.
4. The system must clean inconsistent text formatting.
5. The system must handle missing values in parking duration and revenue.
6. The system must calculate total revenue by street and area.
7. The system must calculate total parking sessions by street and area.
8. The system must compare parking activity during snow and no snow conditions.
9. The system must support Power BI dashboard reporting.
10. The system must provide SQL queries for business analysis.

## Non Functional Requirements

1. The solution should be easy to run locally.
2. The data files should be in CSV format.
3. SQL queries should be readable and reusable.
4. Dashboard fields should be easy to understand by non technical users.
5. Documentation should be clear enough for a new analyst to follow.

## Business Questions

1. Which parking areas generate the most revenue?
2. Which streets have the highest parking demand?
3. Which payment methods are most commonly used?
4. Does snow reduce parking demand?
5. Are weekdays busier than weekends?
6. Which areas should be reviewed for planning or operational improvement?

## Success Criteria

The project is successful if:

- Clean processed data is created
- SQL queries answer the main business questions
- Power BI dashboard shows clear KPIs and trends
- Documentation explains the process from raw data to reporting
