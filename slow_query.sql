-- Slow query example
SELECT u.name, SUM(oi.quantity * p.price) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY u.id
ORDER BY total_spent DESC;