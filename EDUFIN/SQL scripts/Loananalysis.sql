USE PRACTICE1;


SELECT * FROM loans;

SELECT COUNT(*) FROM loans;


SELECT 
	COUNT(*) AS total_loans,
	COUNT(DISTINCT loan_status) AS status_types,
	COUNT(DISTINCT customer_id) AS unique_customers,
	MIN(loan_amount) AS min_loan,
	MAX(loan_amount) AS max_loan
FROM loans;