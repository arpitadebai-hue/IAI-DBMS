USE dbms_assignment ;
SELECT full_name ,
       email,
       city,
       preferred_channel
FROM customers 
WHERE state IN('California','Texas')
 AND registration_date > '2023-01-01'
 ORDER BY full_name ASC ;
 
 
 
 SELECT 
   c.customer_id ,
   c.full_name ,
   c.email ,
   FORMAT(SUM(t.quantity*t.price) , 2) AS total_spent ,
   COUNT(*) AS total_transactions
FROM customers c
JOIN transactions t 
    ON c.customer_id=t.customer_id
WHERE t.store_location='online'
GROUP BY 
    c.customer_id ,
    c.full_name ,
    c.email 
HAVING 
    SUM(t.quantity * t.price ) >1000
    AND COUNT(*) >= 3 
ORDER BY 
    SUM(t.quantity * t.price) DESC ;
