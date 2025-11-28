--Find customers who have placed more than 1 order.
SELECT c.name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;
--Find the product that generated the highest total revenue.
SELECT p.product_name, SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 1;
--Find the city with the highest total revenue.
SELECT c.city, SUM(o.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC
LIMIT 1;
--Show each customer’s latest order date.
SELECT c.name, MAX(o.order_date) AS latest_order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
--Use a CASE statement to categorize products as ‘High’, ‘Medium’, or ‘Low’ price.
SELECT product_name,
       CASE
           WHEN price > 50000 THEN 'High'
           WHEN price BETWEEN 10000 AND 50000 THEN 'Medium'
           ELSE 'Low'
       END AS price_category
FROM products;
--List customers who have never placed an order.
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
--Find the rank of each product by total revenue using a window function.
WITH customer_spend AS (
    SELECT c.customer_id, c.name, SUM(o.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN products p ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.name
)
SELECT name, total_spent
FROM customer_spend
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_spend);
--left join
-- List customers who have never placed an order.
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;







































