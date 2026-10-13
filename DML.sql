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