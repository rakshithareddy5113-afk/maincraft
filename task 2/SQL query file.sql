-- INNER JOIN (Orders + Customers)
SELECT 
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    c.Segment,
    o.Product_Category,
    o.Sales,
    o.Quantity,
    o.Profit,
    o.Discount
FROM Orders o
INNER JOIN Customers c
ON o.Customer_ID = c.Customer_ID;


-- 1. Total Sales by Region
SELECT 
    c.Region,
    SUM(o.Sales) AS Total_Sales
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region;


-- 2. Profit Margin by Category
SELECT 
    Product_Category,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM Orders
GROUP BY Product_Category;


-- 3. Monthly Sales Trend
SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;


-- 4. Top 5 Customers by Revenue
SELECT 
    c.Customer_Name,
    SUM(o.Sales) AS Total_Revenue
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;