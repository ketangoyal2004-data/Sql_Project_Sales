select * from `super_market_sales`;

alter table `super_market_sales` rename `Sales`;
select * from `Sales`;
-- q-1-Total Sales Count
SELECT COUNT(*) AS total_sales
FROM sales;

-- q-2-Unique Branches List
SELECT DISTINCT Branch
FROM sales;

-- q-3-Gender-wise Customer Count
SELECT Gender, COUNT(*) AS total_customers
FROM sales
GROUP BY Gender;

-- q-4-Total Quantity Sold per Product Line
SELECT Product_line, SUM(Quantity) AS total_qty
FROM sales
GROUP BY Product_line;

-- q-5-Most Used Payment Method
SELECT Payment, COUNT(*) AS usage_count
FROM sales
GROUP BY Payment
ORDER BY usage_count DESC;

-- q-6-Overall Revenue (Unit Price × Quantity)
SELECT SUM(`Unit price` * Quantity) AS total_revenue
FROM sales;

-- q-7-Branch with Highest Revenue
SELECT Branch, SUM(`Unit price` * Quantity) AS revenue
FROM sales
GROUP BY Branch
ORDER BY revenue DESC
LIMIT 1;

-- q-8-Average Rating per Product Line
SELECT `Product line`, AVG(Rating) AS avg_rating
FROM sales
GROUP BY `Product line`;

-- q-9-Best Selling Product Line (by Quantity)
SELECT `Product line`, SUM(Quantity) AS qty
FROM sales
GROUP BY `Product line`
ORDER BY qty DESC
LIMIT 1;

-- q-10-Customer Type Revenue Comparison
SELECT `Customer type`, SUM(`Unit price` * Quantity) AS total_spent
FROM sales
GROUP BY `Customer type`;

-- q-11-Gender-wise Product Line Preference
SELECT Gender, `Product line`, SUM(Quantity) AS qty
FROM sales
GROUP BY Gender, `Product line`
ORDER BY Gender, qty DESC;

-- q-12-Month-wise Sales Revenue
select `Month`,sum(`Unit price` * `Quantity`) as "revenue" from sales
group by `Month`;

-- q-13-Rating Category Analysis
SELECT 
    CASE 
        WHEN Rating >= 4 THEN 'High'
        WHEN Rating >= 3 THEN 'Medium'
        ELSE 'Low'
    END AS rating_category,
    COUNT(*) AS total_count
FROM sales
GROUP BY rating_category;

-- q-14-Branch-wise Average Rating
SELECT Branch, AVG(Rating) AS avg_rating
FROM sales
GROUP BY Branch;

-- q-15-Most Popular Payment Method per Branch
SELECT Branch, Payment, COUNT(*) AS count
FROM sales
GROUP BY Branch, Payment
ORDER BY Branch, count DESC;
