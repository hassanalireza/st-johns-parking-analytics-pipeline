-- St. John's Parking Analytics Pipeline
-- SQL Analysis Queries

-- 1. Total revenue and sessions by area
SELECT
    area,
    COUNT(session_id) AS total_sessions,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(hours_parked), 2) AS avg_hours_parked
FROM parking_sessions
GROUP BY area
ORDER BY total_revenue DESC;

-- 2. Revenue by street
SELECT
    street,
    area,
    COUNT(session_id) AS total_sessions,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM parking_sessions
GROUP BY street, area
ORDER BY total_revenue DESC;

-- 3. Payment method usage
SELECT
    payment_method,
    COUNT(session_id) AS total_transactions,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM parking_sessions
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- 4. Winter weather impact on parking demand
SELECT
    snow_impact,
    COUNT(session_id) AS total_sessions,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(hours_parked), 2) AS avg_hours_parked
FROM parking_sessions
GROUP BY snow_impact
ORDER BY total_sessions DESC;

-- 5. Weekday vs weekend demand
SELECT
    CASE WHEN is_weekend = 1 THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    COUNT(session_id) AS total_sessions,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM parking_sessions
GROUP BY is_weekend;

-- 6. Top 5 busiest streets
SELECT
    street,
    COUNT(session_id) AS total_sessions
FROM parking_sessions
GROUP BY street
ORDER BY total_sessions DESC
LIMIT 5;

-- 7. Average parking duration by street
SELECT
    street,
    ROUND(AVG(hours_parked), 2) AS avg_parking_duration
FROM parking_sessions
GROUP BY street
ORDER BY avg_parking_duration DESC;

-- 8. Monthly revenue trend
SELECT
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue,
    COUNT(session_id) AS monthly_sessions
FROM parking_sessions
GROUP BY month
ORDER BY month;

-- 9. Business priority and revenue comparison
SELECT
    ps.area,
    pz.parking_type,
    pz.business_priority,
    COUNT(ps.session_id) AS total_sessions,
    ROUND(SUM(ps.revenue), 2) AS total_revenue
FROM parking_sessions ps
LEFT JOIN parking_zones pz
    ON ps.area = pz.area
GROUP BY ps.area, pz.parking_type, pz.business_priority
ORDER BY total_revenue DESC;

-- 10. Data quality check
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN session_id IS NULL THEN 1 ELSE 0 END) AS missing_session_id,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN street IS NULL THEN 1 ELSE 0 END) AS missing_street,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS missing_revenue
FROM parking_sessions;
