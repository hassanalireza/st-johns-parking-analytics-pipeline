# Data Mapping Document

## Source to Target Mapping

| Source File | Source Column | Target Column | Transformation |
|---|---|---|---|
| raw_parking_sessions.csv | session_id | session_id | No change |
| raw_parking_sessions.csv | date | date | Converted to date format |
| raw_parking_sessions.csv | street | street | Trim spaces and standardize title case |
| raw_parking_sessions.csv | area | area | Trim spaces and standardize title case |
| raw_parking_sessions.csv | hours_parked | hours_parked | Fill missing values with median |
| raw_parking_sessions.csv | rate_per_hour | rate_per_hour | No change |
| raw_parking_sessions.csv | payment_method | payment_method | Standardize text format |
| raw_parking_sessions.csv | vehicle_type | vehicle_type | Standardize text format |
| raw_parking_sessions.csv | revenue | revenue | Fill missing value using hours_parked multiplied by rate_per_hour |
| weather_sample.csv | avg_temperature_c | avg_temperature_c | Joined by date |
| weather_sample.csv | snowfall_cm | snowfall_cm | Joined by date |
| weather_sample.csv | weather_condition | weather_condition | Joined by date |

## Derived Fields

| New Field | Logic |
|---|---|
| month | Extract year and month from date |
| day_of_week | Extract day name from date |
| is_weekend | 1 if Saturday or Sunday, otherwise 0 |
| snow_impact | High Snow if snowfall is 5 cm or more, Low Snow if snowfall is greater than 0, No Snow if snowfall is 0 |

## Data Quality Rules

1. session_id must not be blank.
2. date must be valid.
3. revenue must not be blank after cleaning.
4. hours_parked must be greater than 0.
5. payment_method should use standard categories.
6. street and area names should not have extra spaces.
