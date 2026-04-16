-- Que 4
SELECT `Year`, AVG(`AQI`) AS `average_AQI`
FROM `aqi_data`
GROUP BY `Year`
ORDER BY `Year`;