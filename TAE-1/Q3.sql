SELECT 
   issue_category ,
   ROUND(AVG(resolution_time_hours),2)
AS resolution_time_hours ,

ROUND(AVG(customer_satisfaction_score),2) AS customer_satisfaction_score 
FROM support_tickets 
WHERE priority ='high'
  AND resolution_status ='Closed' 
GROUP BY issue_category 
HAVING COUNT(*) >5 ;
   