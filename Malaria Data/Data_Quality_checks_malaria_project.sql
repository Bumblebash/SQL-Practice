USE Practice1;


SELECT * FROM malaria_data;

--Total Population From Acholi for year 2020
SELECT Region, SUM(TotalPopulation) AS totalpn
FROM malaria_data
WHERE Region = 'North Central' AND YEAR = '2024'
GROUP BY Region;


--Total Population From Acholi for year 2020
SELECT *
FROM malaria_data
WHERE Region = District AND Region = 'South Central' AND YEAR = '2024';


--Number of Districts in North Central 
SELECT Region, COUNT(District) As total_Districts
 FROM malaria_data
 WHERE  Region = 'North Central' AND Year = '2024'
 GROUP BY Region;

 SELECT *
 FROM malaria_data
 WHERE  Region = 'South Central' AND Year = '2024'
 ;


 --Confirming Information for Masaka City and Masaka District
 SELECT *
 FROM malaria_data
 WHERE District IN ('Masaka City', 'Masaka District')  AND Year = '2024';



 ---Confirming Information for Lango
 SELECT  SUM(TotalPopulation) AS totalpn
        FROM malaria_data 
        WHERE YEAR = 2024   AND District  IN  ('Alebtong District','Lira City','Amolatar District', 'Apac District', 'Dokolo District'
        ,'Kole District', 'Kwania District', 'Lira District', 'Otuke District', 'Oyam District'
        )
        ;

 
