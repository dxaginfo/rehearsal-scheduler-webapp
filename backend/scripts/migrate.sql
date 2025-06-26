-- Users
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL
);

-- Studios
CREATE TABLE IF NOT EXISTS studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  description TEXT
);

-- Rooms
CREATE TABLE IF NOT EXISTS rooms (
  id SERIAL PRIMARY KEY,
  studio_id INTEGER REFERENCES studios(id),
  name VARCHAR(255) NOT NULL,
  capacity INTEGER
);

-- Equipment
CREATE TABLE IF NOT EXISTS equipment (
  id SERIAL PRIMARY KEY,
  room_id INTEGER REFERENCES rooms(id),
  name VARCHAR(255) NOT NULL,
  status VARCHAR(50) DEFAULT 'available',
  description TEXT
);

-- Bookings
CREATE TABLE IF NOT EXISTS bookings (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  room_id INTEGER REFERENCES rooms(id),
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  status VARCHAR(50) NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- Payments
CREATE TABLE IF NOT EXISTS payments (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER REFERENCES bookings(id),
  user_id INTEGER REFERENCES users(id),
  amount NUMERIC(10,2) NOT NULL,
  status VARCHAR(50) NOT NULL,
  created_at TIMESTAMP
);

-- Notifications
CREATE TABLE IF NOT EXISTS notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  booking_id INTEGER REFERENCES bookings(id),
  type VARCHAR(50),
  sent_at TIMESTAMP,
  status VARCHAR(50)
);
