CREATE TABLE user_activity(
	user_id INT,
    activity_date DATE
    );
    INSERT INTO user_activity VALUES 
    (1, '2023-07-10'), (3, '2023-07-10'), (3, '2023-07-15'),
    (1, '2023-08-03'), (4, '2023-08-08');
    
    SELECT * FROM user_activity;
    
    #Churn Rate Calculation
    #Users active last month but not active this month
    WITH last_month AS (
		SELECT DISTINCT user_id FROM user_activity WHERE MONTH(activity_date) = 7
        ),
        this_month AS(
			SELECT DISTINCT user_id FROM user_activity WHERE MONTH(activity_date)= 8
            )
            SELECT COUNT(*) AS churned_users
            FROM last_month
            WHERE user_id NOT IN (SELECT user_id FROM this_month);