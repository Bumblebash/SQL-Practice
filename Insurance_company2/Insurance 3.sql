USE PRACTICE;
SELECT * from brokers;
SELECT * FROM policies;


WITH broker_id_cte AS (
SELECT b.BrokerID, b.BrokerName, p.Premium, b.ReportsTo FROM brokers b
LEFT JOIN policies p
ON b.BrokerID = p.BrokerID
)

SELECT BrokerID, BrokerName, Premium, ReportsTo,
DENSE_RANK()OVER(ORDER BY Premium DESC) AS Ranked_broker
FROM broker_id_cte;


---SUMMATION BY Broker
---Determine the Brokers who collect more money($) Per Month 
SELECT b.BrokerID, b.BrokerName, SUM(p.Premium) As Total_Premium , b.ReportsTo
--DENSE_RANK()OVER (PARTITION BY b.BrokerID ORDER BY SUM(p.Premium) DESC) AS ranked_broker
FROM brokers b 
LEFT JOIN policies p
ON b.BrokerID = p.BrokerID 
GROUP BY b.BrokerID, b.BrokerName, b.ReportsTo
ORDER BY Total_Premium DESC
;