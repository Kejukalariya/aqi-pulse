-- Que 7
SELECT `a`.`City`, `a`.`avg_2015`, `b`.`avg_2020`, (`a`.`avg_2015` - `b`.`avg_2020`) AS `improvement`
FROM
	(SELECT `City`, AVG(`AQI`) AS `avg_2015`
	FROM `aqi_data`
	WHERE `Year` = '2015'
	GROUP BY `City`) AS `a`
JOIN
	(SELECT `City`, AVG(`AQI`) AS `avg_2020`
	FROM `aqi_data`
	WHERE `Year` = '2020'
	GROUP BY `City`) AS `b`
ON `a`.`City` = `b`.`City`
ORDER BY `improvement` DESC;