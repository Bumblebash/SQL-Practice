
USE PRACTICE;

/**Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. 
Refer to the Example Output below for the desired format.

Definition:

Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements taken at 2nd, 4th, 
and 6th times are considered even-numbered measurements.
Effective April 15th, 2023, the question and solution for this question have been revised.**/


/**Explanation
Based on the results,

On 07/10/2022, the sum of the odd-numbered measurements is 2355.75, while the sum of the even-numbered measurements is 1662.74.
On 07/11/2022, there are only two measurements available. The sum of the odd-numbered measurements is 1124.50, and the sum of the even-numbered measurements is 1234.14.
The dataset you are querying against may have different input & output - this is just an example!**/




SELECT * from measurements;

--changing Datatypes 
ALTER TABLE measurements ALTER COLUMN measurement_time datetime2(0);
ALTER TABLE measurements ALTER COLUMN measurement_value decimal(9,2); 



WITH ordered_measurements AS (
    SELECT
        CAST(measurement_time AS DATE) AS measurement_day,
        measurement_value,
        ROW_NUMBER() OVER (
            PARTITION BY CAST(measurement_time AS DATE)
            ORDER BY measurement_time
        ) AS measurement_order
    FROM measurements
)
--SELECT * FROM ordered_measurements;

SELECT
    measurement_day,
    SUM(CASE WHEN measurement_order % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN measurement_order % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM ordered_measurements
GROUP BY measurement_day
ORDER BY measurement_day;
