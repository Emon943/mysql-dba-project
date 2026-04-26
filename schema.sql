-- =========================================
-- Database: ecommerce
-- =========================================

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- =========================================
-- Table: users
-- =========================================
CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================
-- Table: products
-- =========================================
CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(150) NOT NULL,
price DECIMAL(10,2) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================
-- Table: orders
-- =========================================
CREATE TABLE orders (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

```
CONSTRAINT fk_orders_user 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE
```

) ENGINE=InnoDB;

-- =========================================
-- Table: order_items
-- =========================================
CREATE TABLE order_items (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
order_id BIGINT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,

```
CONSTRAINT fk_order_items_order 
FOREIGN KEY (order_id) REFERENCES orders(id)
ON DELETE CASCADE,

CONSTRAINT fk_order_items_product 
FOREIGN KEY (product_id) REFERENCES products(id)
ON DELETE CASCADE
```

) ENGINE=InnoDB;

-- =========================================
-- Indexes (Performance Optimization)
-- =========================================

-- Users
CREATE INDEX idx_users_email ON users(email);

-- Orders
CREATE INDEX idx_orders_user_id ON orders(user_id);

-- Order Items
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Composite Index (Advanced)
CREATE INDEX idx_order_items_order_product
ON order_items(order_id, product_id);

-- =========================================
-- Optional: Sample Slow Query for Testing
-- =========================================
-- SELECT u.name, SUM(oi.quantity * p.price) AS total_spent
-- FROM users u
-- JOIN orders o ON u.id = o.user_id
-- JOIN order_items oi ON o.id = oi.order_id
-- JOIN products p ON oi.product_id = p.id
-- GROUP BY u.id
-- ORDER BY total_spent DESC;

-- =========================================
-- End of schema
-- =========================================
