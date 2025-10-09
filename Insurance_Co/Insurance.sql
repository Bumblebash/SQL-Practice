USE PRACTICE1;

SELECT *from insurance_employees;

SELECT avg(salary) FROM insurance_employees;

/*Changing Datatypes*/
alter table insurance_employees alter column employee_id INT NOT NULL ;
alter table insurance_employees alter column age INT;
alter table insurance_employees alter column department_id INT;
alter table insurance_employees alter column salary DECIMAL(18,2);
alter table insurance_employees alter column hire_date DATE;

/*Adding a Primary key*/
alter table insurance_employees ADD CONSTRAINT pk_insurance_employee
PRIMARY KEY (employee_id);

/*To ensure No Duplicates*/
SELECT employee_id, COUNT(*) AS cnt
FROM insurance_employees
GROUP BY employee_id
HAVING COUNT(*) > 1;

/**No Nulls **/
SELECT COUNT(*) AS null_count FROM insurance_employees WHERE employee_id IS NULL;


/** QUESTION: Find Employees who earn more than average salary within 
their respective departments*/
SELECT e1.department_id, e1.first_name, e1.last_name, department_name, e1.salary FROM 
		insurance_employees e1
	WHERE e1.salary > (
						SELECT 
							AVG(e2.salary) As Avg_salary
							FROM insurance_employees e2 
							WHERE e2.department_id = e1.department_id
							)
	ORDER BY 
	  e1.salary DESC;
