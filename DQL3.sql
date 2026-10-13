CREATE TABLE IF NOT EXISTS suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS reviews (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO suppliers (name, country) VALUES 
('FashionTex s.r.o.', 'Slovensko'),
('Global Style Co.', 'Taliansko'),
('EcoTextile Ltd.', 'Turecko');

-- -----------------------------------------------------------------
-- Úloha 1: INNER JOIN
-- Zadanie: Vyberte názov produktu a názov jeho kategórie 
-- pre všetky produkty, ktoré majú priradenú kategóriu.
-- -----------------------------------------------------------------
SELECT p.name AS product_name, c.name AS category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.id
ORDER BY c.name ASC;


-- -----------------------------------------------------------------
-- Úloha 2: LEFT JOIN
-- Zadanie: Vyberte meno používateľa a celkovú sumu jeho objednávok.
-- Zobrazte VŠETKÝCH používateľov (aj tých, ktorí nič neobjednali).
-- -----------------------------------------------------------------
SELECT u.name AS user_name, o.id AS order_id, o.total_amount
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
ORDER BY u.name ASC;


-- -----------------------------------------------------------------
-- Úloha 3: RIGHT JOIN
-- Zadanie: Vyberte názov produktu a informácie o jeho položkách v objednávkach.
-- Použite RIGHT JOIN tak, aby sa zobrazili všetky položky objednávok 
-- a priradené produkty.
-- -----------------------------------------------------------------
SELECT p.name AS product_name, oi.quantity, oi.price
FROM products p
RIGHT JOIN order_items oi ON p.id = oi.product_id
ORDER BY oi.price DESC;


-- -----------------------------------------------------------------
-- Úloha 4: FULL OUTER JOIN
-- Zadanie: Prepojte tabuľku používateľov a tabuľku objednávok 
-- pomocou FULL OUTER JOIN, aby ste videli kompletný prehľad 
-- všetkých ľudí a všetkých objednávok naraz.
-- -----------------------------------------------------------------
SELECT u.name AS user_name, o.id AS order_id, o.status, o.total_amount
FROM users u
FULL OUTER JOIN orders o ON u.id = o.user_id
ORDER BY o.total_amount DESC NULLS LAST;


-- -----------------------------------------------------------------
-- Úloha 5: VIACERONÁSOBNÝ JOIN (Viaceré tabuľky naraz)
-- Zadanie: Zistite detaily o objednávkach: meno zákazníka, 
-- ID objednávky, stav a celkovú sumu. Spojte tabuľky users a orders.
-- -----------------------------------------------------------------
SELECT 
    u.name AS customer_name,
    u.phone AS customer_phone,
    o.id AS order_id,
    o.status AS order_status,
    o.total_amount
FROM orders o
INNER JOIN users u ON o.user_id = u.id
ORDER BY o.total_amount DESC;