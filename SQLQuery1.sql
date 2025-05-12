CREATE TABLE dbo.orders (  
customer_id VARCHAR,  
order_id INT, 
qty INT  
);  

INSERT INTO dbo.orders(customer_id, order_id,qty)
VALUES('A', 30001, 10),
  ('A', 40005, 10 ),       
  ('A', 10001, 12),         
  ('A', 40001, 40),        
  ('B', 20001, 12),         
  ('B',30003, 15),        
  ('B', 10005, 20),          
  ('C', 10006, 14),         
  ('C', 20002, 20),         
  ('C', 30004, 22),       
  ('D', 30007, 30);


  SELECT
  customer_id,
  order_id,
  qty,
  RANK() OVER(PARTITION BY customer_id ORDER BY qty) AS rnk,
  DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY qty) AS drnk
FROM dbo.orders;


   SELECT 
  customer_id,
  order_id,
  qty,
  qty - LAG(qty) OVER(PARTITION BY customer_id ORDER BY order_id) AS diffprev,
  qty - LEAD(qty) OVER(PARTITION BY customer_id ORDER BY order_id) AS diffnext
FROM dbo.orders;