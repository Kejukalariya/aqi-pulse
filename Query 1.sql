-- Que 1
SELECT `City`, AVG(`AQI`) AS `average_aqi`
FROM `aqi_data`
GROUP BY `City`
ORDER BY AVG(`AQI`) DESC;