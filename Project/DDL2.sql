DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS ticket_categories CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS seats CASCADE;
DROP TABLE IF EXISTS venues CASCADE;
DROP TABLE IF EXISTS organizers CASCADE;

CREATE TABLE venues (
    venue_id INT PRIMARY KEY,
    name     VARCHAR(150) NOT NULL,
    street   VARCHAR(150) NOT NULL,
    city     VARCHAR(100) NOT NULL,
    zip_code VARCHAR(10)  NOT NULL
);

CREATE TABLE seats (
    seat_id  INT PRIMARY KEY,
    venue_id INT NOT NULL REFERENCES venues(venue_id),
    sector   VARCHAR(10) NOT NULL,
    row_no   INT NOT NULL,
    seat_no  INT NOT NULL,
    UNIQUE (venue_id, sector, row_no, seat_no)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    venue_id INT NOT NULL REFERENCES venues(venue_id),
    name     VARCHAR(150) NOT NULL,
    starts_at TIMESTAMP NOT NULL,
    status   VARCHAR(50) NOT NULL
);

CREATE TABLE ticket_categories (
    category_id INT PRIMARY KEY,
    event_id    INT NOT NULL REFERENCES events(event_id),
    name        VARCHAR(50) NOT NULL,
    price       DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    UNIQUE (category_id, event_id)
);

CREATE TABLE tickets (
    ticket_id   INT PRIMARY KEY,
    event_id    INT NOT NULL,
    category_id INT NOT NULL,
    seat_id     INT NOT NULL REFERENCES seats(seat_id),
    status      VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_id, event_id) REFERENCES ticket_categories (category_id, event_id),
    UNIQUE (event_id, seat_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    created_at  TIMESTAMP NOT NULL,
    status      VARCHAR(50) NOT NULL
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id      INT NOT NULL REFERENCES orders(order_id),
    ticket_id     INT NOT NULL UNIQUE REFERENCES tickets(ticket_id),
    price         DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

