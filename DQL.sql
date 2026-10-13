-- -----------------------------------------------------------------
-- Úloha 1: Vyberte názov a cenu produktov, ktoré stoja viac ako 50 EUR.
-- Zotrieďte dopyt od najdrahšieho po najlacnejší.
-- -----------------------------------------------------------------

-- Riešenie:
SELECT name, price 
FROM products 
WHERE price > 50 
ORDER BY price DESC;


-- -----------------------------------------------------------------
-- Úloha 2: Vyberte názov a počet kusov na sklade pre produkty, 
-- ktorých je na sklade menej ako 20 kusov. 
-- Zotrieďte výsledok od najmenšieho množstva.
-- -----------------------------------------------------------------

-- Riešenie:
SELECT name, stock_quantity 
FROM products 
WHERE stock_quantity < 20 
ORDER BY stock_quantity ASC;


-- -----------------------------------------------------------------
-- Úloha 3: Vyberte meno a email používateľov, ktorí majú zadaný email.
-- Zotrieďte výsledok podľa mena abecedne.
-- -----------------------------------------------------------------

-- Možnosť A (Použitie IS NOT NULL):
SELECT name, email 
FROM users 
WHERE email IS NOT NULL 
ORDER BY name ASC;

-- Možnosť B (Použitie dĺžky reťazca LENGTH):
SELECT name, email 
FROM users 
WHERE LENGTH(email) > 0 
ORDER BY name ASC;


-- -----------------------------------------------------------------
-- Úloha 4: Vyberte názov a popis produktov, ktoré v názve obsahujú 
-- slovo 'bunda' alebo 'kabát'. Zotrieďte ich podľa názvu.
-- -----------------------------------------------------------------

-- Možnosť A (Použitie LIKE a OR):
SELECT name, description 
FROM products 
WHERE name LIKE '%bunda%' OR name LIKE '%kabát%'
ORDER BY name ASC;

-- Možnosť B (Použitie REGEXP / SIMILAR TO):
SELECT name, description 
FROM products 
WHERE name SIMILAR TO '%(bunda|kabát)%'
ORDER BY name ASC;


-- -----------------------------------------------------------------
-- Úloha 5: Vyberte ID objednávky, ID používateľa a celkovú sumu 
-- pre dokončené objednávky ('completed'). Zotrieďte podľa sumy.
-- -----------------------------------------------------------------

-- Riešenie:
SELECT id, user_id, total_amount 
FROM orders 
WHERE status = 'completed' 
ORDER BY total_amount DESC;