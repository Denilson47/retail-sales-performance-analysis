-- REGION PERFORMANCE ANALYSIS
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- CATEGORY PERFORMANCE ANALYSIS
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- DISCOUNT IMPACT ANALYSIS
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount BETWEEN 0.01 AND 0.2 THEN 'Low Discount'
        WHEN discount BETWEEN 0.21 AND 0.5 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales_data
GROUP BY discount_level
ORDER BY total_sales DESC;

-- TOP SELLING PRODUCTS ANALYSIS
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- TIME TREND ANALYSIS
SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales_data
GROUP BY month
ORDER BY month;

-- NEGATIVE PROFIT PRODUCTS ANALYSIS
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- SUB-CATEGORY PROFITABILITY ANALYSIS
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY sub_category
ORDER BY total_profit ASC;