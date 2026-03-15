-- SALES KPI VIEW
CREATE OR REPLACE VIEW v_sales_kpis AS
SELECT
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data;

-- REGIONAL PERFORMANCE VIEW
CREATE OR REPLACE VIEW v_regional_performance AS
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- CATEGORY PERFORMANCE VIEW
CREATE OR REPLACE VIEW v_category_performance AS
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- SUB-CATEGORY PROFITABILITY VIEW
CREATE OR REPLACE VIEW v_subcategory_profitability AS
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY sub_category
ORDER BY total_profit ASC;

-- MONTHLY SALES TREND VIEW
CREATE OR REPLACE VIEW v_monthly_sales_trend AS
SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY month
ORDER BY month;

-- DISCOUNT ANALYSIS VIEW
CREATE OR REPLACE VIEW v_discount_analysis AS
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.2 THEN 'Low Discount'
        WHEN discount > 0.2 AND discount <= 0.5 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY discount_level
ORDER BY total_profit DESC;

-- PRODUCT PROFITABILITY VIEW
CREATE OR REPLACE VIEW v_product_profitability AS
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY product_name;