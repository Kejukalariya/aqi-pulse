-- Que 6
SELECT `City`, COUNT(`AQI_Bucket`)
FROM `aqi_data`
WHERE `AQI_Bucket` = 'Severe'
GROUP BY `City`;