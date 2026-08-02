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
   
   
use dbms_assignment ;

SELECT COUNT(*)
FROM support_tickets
WHERE priority = 'High';


SELECT COUNT(*)
FROM support_tickets
WHERE priority = 'High'
  AND resolution_status = 'Resolved';
  
  


SELECT
    issue_category,
    COUNT(*) AS total
FROM support_tickets
WHERE priority = 'High'
  AND resolution_status = 'Resolved'
GROUP BY issue_category;






with
   interaction_summary as (
                 select customer_id , count(*) as add_to_cart_count 
                 from interactions 
                 where interaction_type ='add to cart '
                 group by customer_id ) ,
	
    transaction_summary as ( 
                select customer_id ,
                sum(quantity*price) as total_revenue 
				from transactions 
                group by customer_id ),
	
    support_summary as (
               select customer_id ,
               count(*) as total_support_tickets 
               from support_tickets 
               group by customer_id )


select 
     c.preferred_channel ,
     count(distinct c.customer_id ) as total_registered_customers ,
     coalesce(sum(i.add_to_cart_count),0) as total_add_to_cart_interactions ,
     coalesce(round(sum(t.total_revenue),2),0.00) as total_revenue_generated ,
     coalesce(sum(s.total_support_tickets) , 0) as total_support_tickets 
from customers c
left join interaction_summary i on c.customer_id = i.customer_id 
left join transaction_summary t on c.customer_id = t.customer_id 
left join support_summary     s on c.customer_id = s.customer_id

group by c.preferred_channel 
order by total_revenue_generated desc ;
