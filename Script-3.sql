DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id) ON DELETE SET NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    total_amount NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT REFERENCES products(id) ON DELETE SET NULL,
    quantity INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

INSERT INTO users (name, phone, email) VALUES
('Alexander Ivanov', '+421912345678', 'alex.ivanov@example.com'),
('Mária Petrová', '+421923456789', NULL),
('Dmitrij Smirnov', '+421934567890', 'dmitry.smirnov@example.com');

INSERT INTO categories (name) VALUES
('Vrchné oblečenie'),
('Džínsy a nohavice'),
('Obuv'),
('Príslušenstvo');

INSERT INTO products (category_id, name, description, price, stock_quantity) VALUES
(1, 'Zimná bunda Oversize', 'Teplá bunda s kapucňou chrániaca pred mrazom a vetrom.', 149.99, 15),
(1, 'Klasický kabát', 'Elegantný vlnený kabát do chladného počasia.', 120.50, 10),
(2, 'Džínsy Slim Fit', 'Pohodlné klasické modré džínsy z pevného denimu.', 59.99, 30),
(2, 'Tepláky Joggers', 'Mäkké bavlnené tepláky na šport a každodenné nosenie.', 39.99, 25),
(3, 'Kožené tenisky', 'Štýlové každodenné tenisky z pravej kože.', 89.00, 20),
(4, 'Kožený opasok', 'Klasický čierny opasok s kovovou prackou.', 24.50, 40);

INSERT INTO orders (user_id, status, total_amount) VALUES
(1, 'completed', 209.98),
(2, 'pending', 89.00),
(3, 'processing', 149.99);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 3, 1, 59.99),
(1, 5, 1, 89.00),
(1, 4, 1, 39.99),
(2, 5, 1, 89.00),
(3, 1, 1, 149.99);

SELECT name, price FROM products WHERE price > 50 ORDER BY price DESC;

SELECT * FROM products WHERE stock_quantity < 20 ORDER BY stock_quantity ASC;

SELECT name, email FROM users WHERE email IS NOT NULL;

SELECT * FROM products WHERE name LIKE '%bunda%' OR name LIKE '%kabát%';

SELECT * FROM orders WHERE status = 'completed';