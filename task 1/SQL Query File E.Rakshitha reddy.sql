
-- Create Table
CREATE TABLE sales_data (
order_id VARCHAR(20),
order_date DATE,
customer_name VARCHAR(100),
region VARCHAR(50),
category VARCHAR(50),
quantity INT,
sales DECIMAL(10,2),
profit DECIMAL(10,2),
discount DECIMAL(5,2)
);

-- Total Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- Profit by Category
SELECT category, SUM(profit) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;

-- Monthly Sales Trend
SELECT MONTH(order_date) AS month, SUM(sales) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month;

-- Top 10 Customers by Sales
SELECT customer_name, SUM(sales) AS total_sales
FROM sales_data
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Discount Impact on Profit
SELECT discount, AVG(profit) AS avg_profit
FROM sales_data
GROUP BY discount
ORDER BY discount;
