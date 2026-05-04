-- St. John's Parking Analytics Pipeline
-- Database: SQLite

DROP TABLE IF EXISTS parking_sessions;
DROP TABLE IF EXISTS parking_zones;
DROP TABLE IF EXISTS weather_sample;

CREATE TABLE parking_sessions (
    session_id INTEGER PRIMARY KEY,
    date TEXT,
    street TEXT,
    area TEXT,
    hours_parked REAL,
    rate_per_hour REAL,
    payment_method TEXT,
    vehicle_type TEXT,
    revenue REAL,
    month TEXT,
    day_of_week TEXT,
    is_weekend INTEGER,
    avg_temperature_c REAL,
    snowfall_cm REAL,
    weather_condition TEXT,
    snow_impact TEXT
);

CREATE TABLE parking_zones (
    area TEXT PRIMARY KEY,
    parking_type TEXT,
    max_time_limit_hours INTEGER,
    business_priority TEXT
);

CREATE TABLE weather_sample (
    date TEXT PRIMARY KEY,
    avg_temperature_c REAL,
    snowfall_cm REAL,
    weather_condition TEXT
);
