USE PRACTICE1;

SELECT * from malaria_data;

SELECT COUNT(DISTINCT(column1)) FROM malaria_data;

SELECT DISTINCT(column1) FROM malaria_data;


SELECT COUNT(*) AS NumberOfColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'malaria_data'



--Renaming Columns

EXEC sp_rename 'malaria_data.[column1]',  'Region', 'COLUMN';
EXEC sp_rename 'malaria_data.[column2]',  'District', 'COLUMN';

EXEC sp_rename 'malaria_data.[column3]',  '0-28Days_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column4]',  '0_28Days_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column5]',  '0_28Days_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column6]',  '10_19Days_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column7]',  '10_19Days_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column8]',  '10_19Days_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column9]',  '20+YRS_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column10]', '20+YRS_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column11]', '20+YRS_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column12]', '5_9YRS_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column13]', '5_9YRS_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column14]', '5_9YRS_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column15]', '29Days_4Yrs_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column16]', '29Days_4Yrs_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column17]', '29Days_4Yrs_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column18]', '0_28Days(BSRDT)_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column19]', '0_28Days(BSRDT)_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column20]', '0_28Days(BSRDT)_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column21]', '10_19YRS(BSRDT)_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column22]', '10_19YRS(BSRDT)_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column23]', '10_19YRS(BSRDT)_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column24]', '20+YRS_(BSRDT)_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column25]', '20+YRS_(BSRDT)_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column26]', '20+YRS_(BSRDT)_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column27]', '29Days_4Yrs(BSRDT)_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column28]', '29Days_4Yrs(BSRDT)_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column29]', '29Days_4Yrs(BSRDT)_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column30]', '5_9YRS(BSRDT)_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column31]', '5_9YRS(BSRDT)_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column32]', '5_9YRS(BSRDT)_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column33]', 'TotalCasesConfirmed_BSRDT', 'COLUMN';

EXEC sp_rename 'malaria_data.[column34]', '0_28Days_CT_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column35]', '0_28Days_CT_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column36]', '0_28Days_CT_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column37]', '10_19YRS_CT_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column38]', '10_19YRS_CT_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column39]', '10_19YRS_CT_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column40]', '20+YRS_CT_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column41]', '20+YRS_CT_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column42]', '20+YRS_CT_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column43]', '29Days_4Yrs_CT_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column44]', '29Days_4Yrs_CT_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column45]', '29Days_4Yrs_CT_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column46]', '5_9YRS_CT_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column47]', '5_9YRS_CT_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column48]', '5_9YRS_CT_Total', 'COLUMN';
EXEC sp_rename 'malaria_data.[column49]', 'Preg_10_19', 'COLUMN';
EXEC sp_rename 'malaria_data.[column50]', 'Preg_20Plus', 'COLUMN';
EXEC sp_rename 'malaria_data.[column51]', 'Preg_Total', 'COLUMN';

EXEC sp_rename 'malaria_data.[column52]', 'TotalCases_Female', 'COLUMN';
EXEC sp_rename 'malaria_data.[column53]', 'TotalCases_Male', 'COLUMN';
EXEC sp_rename 'malaria_data.[column54]', 'GrandTotalCases', 'COLUMN';

EXEC sp_rename 'malaria_data.[column55]', 'Under5_Female_Total', 'COLUMN';
EXEC sp_rename 'malaria_data.[column56]', 'Under5_Male_Total', 'COLUMN';
EXEC sp_rename 'malaria_data.[column57]', 'Under5_GrandTotal', 'COLUMN';

EXEC sp_rename 'malaria_data.[column58]', 'Area_km2', 'COLUMN';
EXEC sp_rename 'malaria_data.[column59]', 'TotalPopulation', 'COLUMN';
EXEC sp_rename 'malaria_data.[column60]', 'PopulationDensityPerKm2', 'COLUMN';

EXEC sp_rename 'malaria_data.[column61]', 'Latitude', 'COLUMN';
EXEC sp_rename 'malaria_data.[column62]', 'Longitude', 'COLUMN';

EXEC sp_rename 'malaria_data.[column63]', 'Year', 'COLUMN';
EXEC sp_rename 'malaria_data.[column64]', 'IncidenceRate', 'COLUMN';
EXEC sp_rename 'malaria_data.[column65]', 'PopulationDensity', 'COLUMN';


--Number of Rows 
SELECT COUNT(*)  From malaria_data;

--Changing Datatypes

  ALTER TABLE malaria_data ALTER  COLUMN Region NVARCHAR(30);
  ALTER TABLE malaria_data  ALTER  COLUMN District NVARCHAR(30);
  ALTER TABLE malaria_data  ALTER COLUMN "0-28Days_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19Days_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19Days_Male" INT;
  ALTER TABLE malaria_data ALTER  COLUMN "10_19Days_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_Male" INT;
  ALTER TABLE malaria_data ALTER  COLUMN "20+YRS_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS_Female" INT;
  ALTER TABLE malaria_data ALTER  COLUMN "5_9YRS_Male" INT;
  ALTER TABLE malaria_data ALTER  COLUMN "5_9YRS_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days(BSRDT)_Female" INT;
  ALTER  TABLE malaria_data ALTER  COLUMN "0_28Days(BSRDT)_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days(BSRDT)_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19YRS(BSRDT)_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19YRS(BSRDT)_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19YRS(BSRDT)_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_(BSRDT)_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_(BSRDT)_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_(BSRDT)_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs(BSRDT)_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs(BSRDT)_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs(BSRDT)_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS(BSRDT)_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS(BSRDT)_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS(BSRDT)_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "TotalCasesConfirmed_BSRDT" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days_CT_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days_CT_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "0_28Days_CT_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19YRS_CT_Female" INT;
  ALTER  TABLE malaria_data ALTER COLUMN "10_19YRS_CT_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "10_19YRS_CT_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_CT_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_CT_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "20+YRS_CT_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs_CT_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "29Days_4Yrs_CT_Male" INT;
  ALTER  TABLE malaria_data ALTER COLUMN "29Days_4Yrs_CT_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS_CT_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS_CT_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "5_9YRS_CT_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Preg_10_19" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Preg_20Plus" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Preg_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "TotalCases_Female" INT;
  ALTER TABLE malaria_data ALTER COLUMN "TotalCases_Male" INT;
  ALTER TABLE malaria_data ALTER COLUMN "GrandTotalCases" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Under5_Female_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Under5_Male_Total" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Under5_GrandTotal" INT;
  ALTER TABLE malaria_data ALTER COLUMN "Area_km2" DECIMAL(18,8);
  ALTER TABLE malaria_data ALTER COLUMN TotalPopulation DECIMAL(18,8);
  ALTER TABLE malaria_data ALTER COLUMN "PopulationDensityPerKm2" DECIMAL(18,8);
  ALTER TABLE malaria_data ALTER COLUMN "Latitude" DECIMAL(9,6);
  ALTER TABLE malaria_data ALTER COLUMN "Longitude" DECIMAL(9,6);
  ALTER TABLE malaria_data ALTER COLUMN "Year" INT;
  ALTER TABLE malaria_data ALTER COLUMN "IncidenceRate" DECIMAL(18,8);
  ALTER TABLE malaria_data ALTER COLUMN "PopulationDensity" DECIMAL(18,8);


  --Realise Duplicates in Region Column and District Column
  SELECT DISTINCT(Region) 
  FROM malaria_data
  WHERE Region IN (
		SELECT DISTINCT(District)
		FROM malaria_data
  ) AND  YEAR = '2020'
  ORDER BY Region;


    --Realise Duplicates in Region Column and District Column
  SELECT DISTINCT(TotalCasesConfirmed_BSRDT) , Region 
  FROM malaria_data
  WHERE Region IN (
		SELECT DISTINCT(District)
		FROM malaria_data
  ) AND Year = '2020'
  ;

  /** PERFOMING DATA QUALITY CHECKS ON B/S & RDT confirmed **/

  WITH Total_cases As(
  SELECT Region, SUM(TOTALCasesConfirmed_BSRDT) As TotalConfirmed_2020
  FROM malaria_data
  WHERE Region IN (
		SELECT DISTINCT District 
		FROM malaria_data  
  )
  AND YEAR = '2020'
 GROUP BY Region
  --ORDER BY Region
  )
  --SELECT * FROM Total_caseS;
  SELECT SUM(TotalConfirmed_2020) As Total_cases
  FROM Total_cases;




  SELECT Region, SUM(TotalCasesConfirmed_BSRDT) AS TotalConfirmed_2020
FROM malaria_data
WHERE Region IN (
    SELECT DISTINCT District
    FROM malaria_data
)
AND Year = 2020
GROUP BY Region
ORDER BY Region;

SELECT Region, SUM(TotalCasesConfirmed_BSRDT) AS TotalConfirmed_2020
FROM malaria_data
WHERE Region IN (
    SELECT DISTINCT District
    FROM malaria_data
)
AND Year = 2020
--AND Region <> District
GROUP BY Region
ORDER BY Region;

WITH Total_Cases2_cte AS(
SELECT Region, TotalCasesConfirmed_BSRDT
FROM malaria_data
WHERE Region = District
AND Year = 2020
--ORDER BY Region
)
--SELECT * FROM Total_Cases2_cte;
SELECT SUM(TotalCasesConfirmed_BSRDT) As Total_Cases1
FROM Total_Cases2_cte;

WITH Total_cte AS (
SELECT Region, District, [10_19Days_Total] FROM malaria_data
WHERE Region = 'Lango' AND YEAR = '2020'
)
--SELECT * FROM Total_cte;

SELECT SUM([10_19Days_Total]) As total_cases
FROM Total_cte;


--Total population By District 
SELECT 
    Year,
    SUM(TotalPopulation) AS total_population
FROM malaria_data
WHERE Year = 2021
  AND LOWER(District) LIKE '% district'
GROUP BY Year;


--Total Population by region


    WITH valid_districts AS (
    SELECT *
    FROM malaria_data
    WHERE LOWER(District) LIKE '%district%'
)
SELECT 
    Year,
    SUM(TotalPopulation) AS total_population
FROM valid_districts
WHERE Year = 2020
AND District IN ('Buhweju District','Bushenyi District', 'Ibanda District', 'Isingiro District','Kazo District','Kiruhura District', 
'Mbarara District', 'Mitooma District', 'Ntugamo District', 'Rubirirzi District', 'Rwampara District',
'Sheema District', 'Mbarara City')
GROUP BY Year;


--Region Level
SELECT
Year,
SUM(TotalPopulation) AS Total_Population
FROM malaria_data
WHERE Region = District AND  Year = 2020
AND Region = 'Ankole'

GROUP BY  Year;



    WITH valid_districts AS (
    SELECT *
    FROM malaria_data
   WHERE LOWER(District) LIKE '%district%'
)

SELECT 
    Year,
    SUM(TotalPopulation) AS total_population
FROM valid_districts
WHERE Year = 2020
AND District IN ( 'Mbarara district')
GROUP BY Year;

--Find Out How many Districts do we have
SELECT COUNT(*) As TotalDistricts 
 FRom malaria_data 
 WHERE LOWER(District) LIKE '%district%' AND Year = 2020;


--Find Out How many Regions we have
 SELECT COUNT(*) As TotalRegions 
 FRom malaria_data 
 WHERE District = Region AND Year = 2020;
