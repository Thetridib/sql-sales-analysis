--Show all customer details who live in "Mumbai".
Select * from customers where city = 'Mumbai';
--List all products priced above ₹10,000.
SELECT * FROM products WHERE price > 10000;
--Find all orders placed after '2024-11-03'
SELECT * FROM orders WHERE order_date > '2024-11-03';
--Display customer names along with the products they purchased.
SELECT c.name, p.product_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
--Count total number of orders per customer.
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
--Find total revenue generated from all orders.
SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;
--Find the average order value (AOV).
SELECT AVG(o.quantity * p.price) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;
--Show the top 3 cities with the most orders.
SELECT c.city, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_orders DESC
LIMIT 3;
--Find total quantity of each product sold.
SELECT p.product_name, SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;
--Get the number of orders placed each day.
SELECT order_date, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY order_date;













