# SQL-Practice
- Collection of SQL practice queries and exercises.
- SQL scripts for Data Analytics and data Manipulation

#  Customer Churn, With CTE (28/08/2025)
- Step 1. last_month CTE

Grabs all unique users active in July (MONTH(activity_date) = 7).

Result: {1, 3}

- Step 2. this_month CTE

Grabs all unique users active in August (MONTH(activity_date) = 8).

Result: {1, 4}

- Step 3. Compare sets

From last_month (July users), check who is NOT IN this_month (August users).

{1, 3} minus {1, 4} = {3}

- Step 4. Count them

Only user 3 churned.

Final Output: churned_users = 1
