SELECT * FROM Sales.Orders;
WITH Orders AS (
   SELECT
   custid,
   orderid,
   orderdate,
   freight,

	ROW_NUMBER() OVER(PARTITION BY custid ORDER BY orderdate DESC) AS row_num
  FROM
  Sales.Orders
)
SELECT
   custid,
   orderid,
   orderdate,
   freight
FROM Orders
WHERE row_num <= 3

ORDER BY
  custid,
  orderdate DESC;