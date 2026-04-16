-- Que 8
SELECT `Region`, AVG(`AQI`) AS `avg_aqi`
FROM (
SELECT `City`, `AQI`,
	CASE
    WHEN `City` = 'Delhi' then 'North_City'
    WHEN `City` = 'Gurugram' then 'North_City'
    WHEN `City` = 'Lucknow' then 'North_City'
    WHEN `City` = 'Patna' then 'North_City'
    WHEN `City` = 'Amritsar' then 'North_City'
    WHEN `City` = 'Jaipur' then 'North_City'
    WHEN `City` = 'Chandigarh' then 'North_City'
    WHEN `City` = 'Chennai' then 'South_City'
    WHEN `City` = 'Hyderabad' then 'South_City'
    WHEN `City` = 'Bengaluru' then 'South_City'
    WHEN `City` = 'Visakhapatnam' then 'South_City'
    WHEN `City` = 'Coimbatore' then 'South_City'
    WHEN `City` = 'Kochi' then 'South_City'
    WHEN `City` = 'Thiruvananthapuram' then 'South_City'
    WHEN `City` = 'Ernakulam' then 'South_City'
    WHEN `City` = 'Kolkata' then 'East'
    WHEN `City` = 'Guwahati' then 'East'
    WHEN `City` = 'Shillong' then 'East'
    WHEN `City` = 'Aizawl' then 'East'
    WHEN `City` = 'Jorapokhar' then 'East'
    WHEN `City` = 'Brajrajnagar' then 'East'
    WHEN `City` = 'Talcher' then 'East'
    WHEN `City` = 'Ahmedabad' then 'West'
    WHEN `City` = 'Mumbai' then 'West'
    WHEN `City` = 'Bhopal' then 'Central'
    WHEN `City` = 'Amaravati' then 'Central'
    ELSE 'No_Data'
    END AS `Region`
FROM `aqi_data`
) AS `region_data`
GROUP BY `Region`
ORDER BY `avg_aqi` DESC;