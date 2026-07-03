USE Practice1;

-----Distribution By Loan Status

WITH loan_dist AS (
SELECT 
     COUNT(*) AS total_loans,
     loan_status
     FROM loans
     GROUP BY loan_status
 ),
 loan_total AS (
     SELECT 
            SUM(total_loans) AS total_loans1
     FROM loan_dist
 )
 SELECT 
    d.loan_status, d.total_loans,
     ROUND(( (d.total_loans*100) /  t.total_loans1),2) AS percentage_distribution 
FROM loan_dist d
    CROSS  JOIN loan_total t
    ORDER BY percentage_distribution DESC; 
            




--- Loan Distribution By Health , Problematic Category.



WITH loan_dist AS (
		SELECT 
			COUNT(*) AS total_loans,
			loan_status
			FROM loans
			GROUP BY loan_status
		),
		loan_total AS(
		SELECT 
				SUM(total_loans) AS total_loans
				FROM loan_dist
		),
		 health_status1 AS(
		SELECT 
			CASE 
				WHEN loan_status IN ('Active', 'Closed') THEN 'Healthy'
				WHEN loan_status IN ('Overdue', 'Defaulted') THEN 'Problematic'
				ELSE 'Unknown'
			END AS health_status,
            SUM(total_loans) AS total_loans
			FROM loan_dist
					GROUP BY
					CASE 
							WHEN loan_status IN ('Active', 'Closed') THEN 'Healthy'
				WHEN loan_status IN ('Overdue', 'Defaulted') THEN 'Problematic'
				ELSE 'Unknown'
				END
				)
				SELECT 
			  h.health_status,
			h.total_loans,
				ROUND((h.total_loans * 100 / SUM(l.total_loans)), 2) AS Percentage_distribution
				FROM health_status1 h
				CROSS JOIN loan_total l
				GROUP BY health_status, l.total_loans, h.total_loans;



