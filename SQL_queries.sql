
--USE Sales;

--SELECT * FROM dbo.Sales_cleaned;


-- Common shipping mode 

SELECT Ship_Mode, COUNT(*) AS total_orders
FROM   Sales_cleaned
GROUP BY Ship_Mode
ORDER BY total_orders DESC;

-- who uses first class the most

SELECT Segment, COUNT(Order_ID) AS Number_of_Orders
FROM   Sales_cleaned
WHERE (Ship_Mode = 'First Class')
GROUP BY Segment
ORDER BY Number_of_Orders DESC