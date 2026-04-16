-- Que 3
SELECT `Dominant_Pollutant`, COUNT(`Dominant_Pollutant`)
FROM `aqi_data`
GROUP BY `Dominant_Pollutant`
ORDER BY COUNT(`Dominant_Pollutant`) DESC;