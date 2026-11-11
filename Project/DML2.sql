INSERT INTO event_status (event_status_id, nazov, poradie) VALUES
(1, 'upcoming', 1),
(2, 'active', 2),
(3, 'finished', 3),
(4, 'cancelled', 4);

INSERT INTO ticket_status (ticket_status_id, nazov, poradie) VALUES
(1, 'available', 1),
(2, 'reserved', 2),
(3, 'sold', 3),
(4, 'used', 4);

INSERT INTO order_status (order_status_id, nazov, poradie) VALUES
(1, 'pending', 1),
(2, 'paid', 2),
(3, 'cancelled', 3),
(4, 'refunded', 4);

INSERT INTO venues (venue_id, nazov, ulica, mesto, psc) VALUES
(1, 'NTC Arena', 'Pragova 2', 'Bratislava', '831 04'),
(2, 'Ondrej Nepela Arena', 'Odbojárov 9', 'Bratislava', '831 04');

INSERT INTO seats (seat_id, venue_id, sector, row_no, seat_no) VALUES
(1, 2, 'A', 1, 1),
(2, 2, 'A', 1, 2),
(3, 2, 'A', 1, 3),
(4, 2, 'VIP', 1, 1),
(5, 2, 'VIP', 1, 2),
(6, 1, 'Standing', 1, 1),
(7, 1, 'Standing', 1, 2);

INSERT INTO events (event_id, venue_id, nazov, starts_at, event_status_id) VALUES
(1, 2, 'HC Bratislava vs. HC Košice', '2026-03-15 18:00:00', 1),
(2, 1, 'Rock Symphony Orchestra', '2026-04-10 19:30:00', 1);

INSERT INTO ticket_categories (category_id, event_id, nazov, price) VALUES
(1, 1, 'Štandard sedenie', 15.00),
(2, 1, 'VIP All-Inclusive', 50.00),
(3, 2, 'Fanklub Státie', 25.00);

INSERT INTO tickets (ticket_id, event_id, category_id, seat_id, ticket_status_id) VALUES
(1, 1, 1, 1, 3),
(2, 1, 1, 2, 3),
(3, 1, 2, 4, 3),
(4, 2, 3, 6, 1);

INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
(1, 'Ján', 'Mrkvička', 'jan.mrkvicka@gmail.com'),
(2, 'Mária', 'Hubová', 'maria.hubova@azet.sk'),
(3, 'Peter', 'Kováč', 'peter.kovac@zoznam.sk');

INSERT INTO orders (order_id, customer_id, created_at, order_status_id) VALUES
(1, 1, '2026-03-01 10:15:00', 2),
(2, 2, '2026-03-02 14:20:00', 2);

INSERT INTO order_items (order_item_id, order_id, ticket_id, price) VALUES
(1, 1, 1, 15.00),
(2, 1, 2, 15.00),
(3, 2, 3, 50.00);