DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS ticket_categories CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS seats CASCADE;
DROP TABLE IF EXISTS sections CASCADE;
DROP TABLE IF EXISTS venues CASCADE;
DROP TABLE IF EXISTS organizers CASCADE;
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(30),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE organizers (
    organizer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    phone VARCHAR(30),
    bio TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE venues (
    venue_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE sections (
    section_id SERIAL PRIMARY KEY,
    venue_id INT REFERENCES venues(venue_id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE seats (
    seat_id SERIAL PRIMARY KEY,
    section_id INT REFERENCES sections(section_id) ON DELETE CASCADE,
    row_number VARCHAR(20) NOT NULL,
    seat_number VARCHAR(20) NOT NULL,
    is_standing BOOLEAN DEFAULT FALSE,
    CONSTRAINT unique_seat_in_section UNIQUE (section_id, row_number, seat_number)
);

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    organizer_id INT REFERENCES organizers(organizer_id) ON DELETE CASCADE,
    venue_id INT REFERENCES venues(venue_id) ON DELETE RESTRICT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE,
    status VARCHAR(50) DEFAULT 'upcoming'
);

CREATE TABLE ticket_categories (
    category_id SERIAL PRIMARY KEY,
    event_id INT REFERENCES events(event_id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    description TEXT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE SET NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INT REFERENCES events(event_id) ON DELETE CASCADE,
    seat_id INT REFERENCES seats(seat_id) ON DELETE RESTRICT,
    category_id INT REFERENCES ticket_categories(category_id) ON DELETE RESTRICT,
    order_id INT REFERENCES orders(order_id) ON DELETE SET NULL,
    status VARCHAR(50) DEFAULT 'available',
    barcode VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT unique_event_seat UNIQUE (event_id, seat_id)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
    ticket_id INT REFERENCES tickets(ticket_id) ON DELETE RESTRICT,
    price_at_purchase NUMERIC(10, 2) NOT NULL
);