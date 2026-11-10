INSERT INTO users (email, password_hash, first_name, last_name, phone) VALUES
('jan.mrkvicka@gmail.com', '$2b$10$e8...hash1', 'Ján', 'Mrkvička', '+421901123456'),
('maria.hubova@azet.sk', '$2b$10$e8...hash2', 'Mária', 'Hubová', '+421902987654'),
('peter.kovac@zoznam.sk', '$2b$10$e8...hash3', 'Peter', 'Kováč', '+421903555444');

INSERT INTO organizers (name, contact_email, phone, bio) VALUES
('Live Nation Slovakia', 'info@livenation.sk', '+421255566677', 'Popredný organizátor hudobných koncertov a festivalov.'),
('Hockey Club Bratislava', 'tickets@hcba.sk', '+421233344455', 'Oficiálny klubový manažment a organizátor domácich zápasov.');

INSERT INTO venues (name, city, address, capacity) VALUES
('NTC Arena', 'Bratislava', 'Pragova 2', 4500),
('Ondrej Nepela Arena', 'Bratislava', 'Odbojárov 9', 10000);

INSERT INTO sections (venue_id, name, description) VALUES
(2, 'Sektor A - Tribúna', 'Hlavná krytá tribúna s výhľadom na stred ľadu.'),
(2, 'Sektor B - VIP', 'VIP sedenie vrátane občerstvenia.'),
(1, 'Fón-zóna (Státie)', 'Voľný priestor priamo pod pódiom.');

INSERT INTO seats (section_id, row_number, seat_number, is_standing) VALUES
(1, '1', '1', FALSE),
(1, '1', '2', FALSE),
(1, '1', '3', FALSE),
(2, 'VIP-1', '1', FALSE),
(2, 'VIP-1', '2', FALSE),
(3, 'STÁTIE', '001', TRUE),
(3, 'STÁTIE', '002', TRUE);

INSERT INTO events (organizer_id, venue_id, title, description, start_time, end_time, status) VALUES
(2, 2, 'HC Bratislava vs. HC Košice', 'Hokejový zápas slovenskej extraligy.', '2026-03-15 18:00:00+01', '2026-03-15 20:30:00+01', 'upcoming'),
(1, 1, 'Rock Symphony Orchestra', 'Najväčšie rockové hity v symfonickom podaní.', '2026-04-10 19:30:00+02', '2026-04-10 22:00:00+02', 'upcoming');

INSERT INTO ticket_categories (event_id, name, price, description) VALUES
(1, 'Štandard sedenie', 15.00, 'Bežné miesto na tribúne.'),
(1, 'VIP All-Inclusive', 50.00, 'Sedenie v prvej rade + catering.'),
(2, 'Fanklub Státie', 25.00, 'Lístok do prvej línie na státie.');

INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 30.00, 'paid'),
(2, 50.00, 'paid');

INSERT INTO tickets (event_id, seat_id, category_id, order_id, status, barcode) VALUES
(1, 1, 1, 1, 'sold', 'TKT-2026-0001'),
(1, 2, 1, 1, 'sold', 'TKT-2026-0002'),
(1, 4, 2, 2, 'sold', 'TKT-2026-0003'),
(2, 6, 3, NULL, 'available', 'TKT-2026-0004');

INSERT INTO order_items (order_id, ticket_id, price_at_purchase) VALUES
(1, 1, 15.00),
(1, 2, 15.00),
(2, 3, 50.00);