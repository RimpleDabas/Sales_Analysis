
USE Sales;

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
ORDER BY Number_of_Orders DESC;

-- Which month sells the most products
SELECT DATENAME(MONTH,Order_Date) AS month, COUNT(*) AS order_count
FROM Sales_cleaned
GROUP BY DATENAME(MONTH,Order_Date)
ORDER BY order_count DESC;

--Find all where sales exceeds average sales

SELECT * 
FROM Sales_cleaned 
WHERE Sales > (SELECT AVG(Sales) FROM Sales_cleaned);


--Common Table expressions
WITH high_value_orders AS (
    SELECT Order_ID, Sales
    FROM Sales_cleaned
    WHERE Sales > (SELECT AVG(Sales) FROM Sales_cleaned)
)
SELECT * FROM high_value_orders;

--Top selling product sub category wise

WITH top_selling_products AS (
    SELECT 
        Sub_Category,
        SUM(Sales) AS total_sales
    FROM Sales_cleaned
    GROUP BY Sub_Category
    ORDER BY total_sales DESC
	OFFSET 0 ROWS
)
SELECT * FROM top_selling_products;


-- Orders percentage shipped the same day

SELECT
    ROUND((COUNT(DISTINCT Order_ID) / (SELECT COUNT(DISTINCT Order_ID) AS total_orders FROM Sales_cleaned)) * 100, 2) AS Shipping_same_day
FROM
    Sales_cleaned
WHERE
    Order_Date = Ship_Date;

--Which city contributes the most
SELECT
    City,
    ROUND(SUM(Sales), 3) AS Total
FROM
   Sales_cleaned
GROUP BY
    City
ORDER BY Total DESC;

--Popular segments state wise

WITH segment_wise AS (
    SELECT
        State,
        Segment,
        COUNT(Order_ID) AS Total_orders,
        RANK() OVER (PARTITION BY State ORDER BY COUNT(ORDER_ID) DESC) AS State_status
    FROM
        Sales_cleaned
    GROUP BY
        State,
        Segment
)
SELECT
   State,
   Segment
FROM
    segment_wise
WHERE
   State_status = 1;
