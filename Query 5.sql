-- Que 5
SELECT `Season`, AVG(`AQI`)
FROM `aqi_data`
GROUP BY `Season`
ORDER BY AVG(`AQI`) DESC;