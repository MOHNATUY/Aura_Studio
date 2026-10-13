-- -----------------------------------------------------------------
-- Úloha 1: Vymyslite 5 vlastných zadaní/otázok a ku každému napíšte 
-- riešenie pomocou SQL s použitím funkcií v SELECT, WHERE a ORDER BY.
-- -----------------------------------------------------------------

-- Zadanie 1.1: Vyberte názov produktu veľkými písmenami a zaokrúhlenú cenu 
-- pre produkty, ktorých kategória je 1 alebo 2. Výsledok zotrieďte podľa ceny zostupne.
SELECT UPPER(name) AS product_name, ROUND(price, 0) AS rounded_price
FROM products
WHERE category_id IN (1, 2)
ORDER BY price DESC;


-- -----------------------------------------------------------------
-- Zadanie 1.2: Vyberte meno používateľa a jeho telefónne číslo. 
-- Zobrazte iba tých, ktorých meno začína na písmeno 'A' (funkcia LEFT alebo LIKE).
-- Výsledok zotrieďte podľa abecedy.
-- -----------------------------------------------------------------

SELECT name, phone
FROM users
WHERE LEFT(name, 1) = 'A'
ORDER BY name ASC;


-- Zadanie 1.3: Vypočítajte cenu produktu s 20% DPH (price * 1.2) a zobrazte názov 
-- pre produkty, kde táto vypočítaná cena presahuje 50 EUR. 
-- Zotrieďte podľa vypočítanej ceny vzostupne.
SELECT name, (price * 1.2) AS price_with_vat
FROM products
WHERE (price * 1.2) > 50
ORDER BY price_with_vat ASC;


-- Zadanie 1.4: Vyberte dátum vytvorenia objednávky vo formáte roku (EXTRACT) 
-- a celkovú sumu pre objednávky, ktoré boli vytvorené v konkrétnom mesiaci/roku.
-- Zotrieďte podľa sumy od najväčšej.
SELECT id, total_amount, EXTRACT(YEAR FROM created_at) AS order_year
FROM orders
WHERE EXTRACT(MONTH FROM created_at) <= 12
ORDER BY total_amount DESC;


-- Zadanie 1.5: Vyberte názov produktu a dĺžku jeho popisu (funkcia LENGTH).
-- Zobrazte iba tie produkty, ktorých popis obsahuje viac ako 20 znakov.
-- Zotrieďte podľa dĺžky popisu zostupne.
SELECT name, LENGTH(description) AS desc_length
FROM products
WHERE LENGTH(description) > 20
ORDER BY desc_length DESC;



-- -----------------------------------------------------------------
-- Úloha 2: Agregačné funkcie, WHERE, GROUP BY a HAVING
-- Zadanie: Zistite súhrnné štatistiky pre kategórie produktov. 
-- Zobrazte ID kategórie, priemernú cenu produktov v kategórii a celkový počet kusov na sklade,
-- ale iba pre tie kategórie, kde je celkový počet kusov na sklade väčší ako 10,
-- a priemerná cena produktov je väčšia ako 30 EUR. Výsledok zotrieďte podľa priemernej ceny.
-- -----------------------------------------------------------------

SELECT 
    category_id, 
    ROUND(AVG(price), 2) AS avg_price, 
    SUM(stock_quantity) AS total_stock
FROM products
WHERE category_id IS NOT NULL
GROUP BY category_id
HAVING AVG(price) > 30 AND SUM(stock_quantity) > 10
ORDER BY avg_price DESC;