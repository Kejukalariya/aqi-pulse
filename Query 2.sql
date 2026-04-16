-- Que 2
SELECT `Month`, AVG(`AQI`)
FROM `aqi_data`
GROUP BY `Month`
ORDER BY AVG(`AQI`) DESC;