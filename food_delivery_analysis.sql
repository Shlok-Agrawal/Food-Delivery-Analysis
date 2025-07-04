-- 🔹 Top 3 restaurants by cuisine based on number of orders
WITH CuisineOrderCount AS (
    SELECT 
        cuisine, 
        restaurant_id, 
        COUNT(*) AS no_of_orders
    FROM orders
    GROUP BY cuisine, restaurant_id
)
SELECT 
    cuisine, 
    restaurant_id, 
    no_of_orders
FROM (
    SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY cuisine ORDER BY no_of_orders DESC) AS rn
    FROM CuisineOrderCount
) ranked
WHERE rn <= 3;

-- 🔹 Daily new customer acquisition count (based on first ever order date)
WITH FirstOrders AS (
    SELECT 
        customer_code, 
        CAST(MIN(placed_at) AS DATE) AS first_order_date
    FROM orders
    GROUP BY customer_code
)
SELECT 
    first_order_date, 
    COUNT(*) AS no_of_new_customers
FROM FirstOrders
GROUP BY first_order_date
ORDER BY first_order_date;

-- 🔹 Customers acquired in Jan 2025 with exactly one order and no further activity
SELECT 
    customer_code, 
    COUNT(*) AS no_of_orders
FROM orders
WHERE 
    YEAR(placed_at) = 2025 
    AND MONTH(placed_at) = 1
    AND customer_code NOT IN (
        SELECT DISTINCT customer_code
        FROM orders
        WHERE YEAR(placed_at) != 2025 OR MONTH(placed_at) != 1
    )
GROUP BY customer_code
HAVING no_of_orders = 1;

-- 🔹 Every 3rd order by customer placed today (used for trigger-like behavior)
WITH OrdersRanked AS (
    SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY customer_code ORDER BY placed_at) AS order_number
    FROM orders
)
SELECT *
FROM OrdersRanked
WHERE 
    order_number % 3 = 0
    AND DATE(placed_at) = CURDATE();

-- 🔹 Customers with more than 1 order and all on promo codes
SELECT 
    customer_code, 
    COUNT(*) AS no_of_orders, 
    COUNT(promo_code_name) AS promo_orders
FROM orders
GROUP BY customer_code
HAVING 
    no_of_orders > 1
    AND no_of_orders = promo_orders;

-- 🔹 % of customers acquired in January whose first order was organic (no promo code)
WITH JanAcquired AS (
    SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY customer_code ORDER BY placed_at) AS rn
    FROM orders
    WHERE MONTH(placed_at) = 1
)
SELECT 
    ROUND(
        COUNT(CASE WHEN rn = 1 AND promo_code_name IS NULL THEN customer_code END) * 100.0 / 
        COUNT(DISTINCT customer_code), 2
    ) AS percent_organic_customers
FROM JanAcquired;

-- 🔹 Customers inactive in last 7 days who were acquired within the last month using a promo
WITH CustomerActivity AS (
    SELECT 
        customer_code, 
        MIN(placed_at) AS first_order_date, 
        MAX(placed_at) AS latest_order_date
    FROM orders
    GROUP BY customer_code
)
SELECT 
    CA.*, 
    o.promo_code_name AS first_order_promo
FROM CustomerActivity CA
JOIN orders o
    ON CA.customer_code = o.customer_code 
    AND CA.first_order_date = o.placed_at
WHERE 
    CA.latest_order_date < DATE_SUB(CURDATE(), INTERVAL 7 DAY)
    AND CA.first_order_date > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND o.promo_code_name IS NOT NULL;
