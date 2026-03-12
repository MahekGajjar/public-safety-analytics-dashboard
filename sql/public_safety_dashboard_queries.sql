USE PublicSafetyAnalytics;
GO

SELECT COUNT(*) AS crime_incident_rows
FROM dbo.crime_incidents_clean;

SELECT COUNT(*) AS arrest_rows
FROM dbo.arrests_clean;

SELECT primary_type, COUNT(*) AS total_incidents
FROM dbo.crime_incidents_clean
GROUP BY primary_type
ORDER BY total_incidents DESC;

SELECT incident_year, incident_month, incident_month_name, COUNT(*) AS total_incidents
FROM dbo.crime_incidents_clean
GROUP BY incident_year, incident_month, incident_month_name
ORDER BY incident_year, incident_month;

SELECT arrest_weekday, COUNT(*) AS total_arrests
FROM dbo.arrests_clean
GROUP BY arrest_weekday
ORDER BY total_arrests DESC;

SELECT arrest_hour, COUNT(*) AS total_arrests
FROM dbo.arrests_clean
GROUP BY arrest_hour
ORDER BY arrest_hour;

SELECT facility_name, AVG(jail_population) AS avg_jail_population
FROM dbo.jail_operations
GROUP BY facility_name;

SELECT facility_name, AVG(capacity) AS avg_capacity
FROM dbo.jail_operations
GROUP BY facility_name;

SELECT facility_name, SUM(bookings) AS total_bookings, SUM(releases) AS total_releases
FROM dbo.jail_operations
GROUP BY facility_name;

SELECT facility_name, SUM(maintenance_requests) AS total_maintenance_requests
FROM dbo.jail_operations
GROUP BY facility_name;

SELECT facility_name, SUM(critical_incidents) AS total_critical_incidents
FROM dbo.jail_operations
GROUP BY facility_name;

SELECT risk_flag, COUNT(*) AS risk_event_count
FROM dbo.risk_analysis_table
GROUP BY risk_flag
ORDER BY risk_event_count DESC;

SELECT facility_name, risk_flag, COUNT(*) AS risk_event_count
FROM dbo.risk_analysis_table
GROUP BY facility_name, risk_flag
ORDER BY facility_name, risk_event_count DESC;