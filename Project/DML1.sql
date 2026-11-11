INSERT INTO city VALUES (1, 'Košice'), (2, 'Bratislava');
 
INSERT INTO event_status VALUES (1, 'Plánovaná', 1), (2, 'Predaj otvorený', 2), (3, 'Zrušená', 3);
INSERT INTO ticket_status VALUES (1, 'Voľný', 1), (2, 'Predaný', 2);
INSERT INTO order_status VALUES (1, 'Nová', 1), (2, 'Zaplatená', 2), (3, 'Odoslaná', 3);
 
INSERT INTO venues VALUES
 (1, 'Aura Hall',  'Hlavná 10',   '04001', 1),
 (2, 'Aura Arena', 'Dunajská 25', '81108', 2);
 
INSERT INTO seats VALUES
 (1, 1, 'A', 1, 1), (2, 1, 'A', 1, 2), (3, 1, 'A', 1, 3),
 (4, 1, 'B', 1, 1), (5, 1, 'B', 1, 2), (6, 1, 'B', 1, 3),
 (7, 2, 'A', 1, 1), (8, 2, 'A', 1, 2);
 
INSERT INTO events VALUES
 (1, 1, 'Jazz Night',  '2026-12-05 19:00:00', 2),
 (2, 2, 'Rock Festival', '2026-12-20 18:00:00', 2);
 
INSERT INTO ticket_categories VALUES
 (1, 1, 'VIP',      50.00),
 (2, 1, 'Štandard', 25.00),
 (3, 2, 'Štandard', 30.00);
INSERT INTO tickets VALUES
 (1, 1, 1, 1, 2),
 (2, 1, 1, 2, 2),
 (3, 1, 1, 3, 1),
 (4, 1, 2, 4, 2),
 (5, 1, 2, 5, 1),
 (6, 1, 2, 6, 1),
 (7, 2, 3, 7, 1),
 (8, 2, 3, 8, 1);
 
INSERT INTO customers VALUES
 (1, 'Ján',  'Novák',  'jan.novak@example.com'),
 (2, 'Mária', 'Kováčová', 'maria.kovacova@example.com');
 
INSERT INTO orders VALUES
 (1, 1, '2026-11-01 10:15:00', 2),
 (2, 2, '2026-11-02 14:40:00', 1);

INSERT INTO order_items VALUES
 (1, 1, 1, 50.00),
 (2, 1, 2, 50.00),
 (3, 2, 4, 25.00);
 