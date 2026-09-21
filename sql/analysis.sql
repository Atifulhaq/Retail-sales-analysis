-- Retail Sales Analysis
-- SQL analysis of the Superstore retail sales dataset

CREATE TABLE retail_sales (
    row_id INT,
    order_id INT,
    order_date DATE,
    order_priority VARCHAR(20),
    order_quantity INT,
    sales DECIMAL(12,2),
    discount DECIMAL(5,2),
    ship_mode VARCHAR(50),
    profit DECIMAL(12,2),
    unit_price DECIMAL(12,2),
    shipping_cost DECIMAL(12,2),
    customer_name VARCHAR(100),
    province VARCHAR(100),
    region VARCHAR(100),
    customer_segment VARCHAR(50),
    product_category VARCHAR(50),
    product_sub_category VARCHAR(100),
    product_name VARCHAR(255),
    product_container VARCHAR(100),
    product_base_margin DECIMAL(5,2),
    ship_date DATE
);

-- 1. Overall sales and profit

SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales;

-- 2. Sales and profit by product category

SELECT
    product_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_category
ORDER BY total_profit DESC;

-- 3. Products generating a loss

SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- 4. Profit by product sub-category

SELECT
    product_sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_sub_category
ORDER BY total_profit ASC;

-- 5. Average discount and profit by product sub-category

SELECT
    product_sub_category,
    AVG(discount) AS average_discount,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_sub_category
ORDER BY total_profit ASC;

-- 6. Sales and profit by region

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM retail_sales
GROUP BY region
ORDER BY total_profit DESC;

-- 7. Profit margin by product category

SELECT
    product_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM retail_sales
GROUP BY product_category
ORDER BY profit_margin DESC;
