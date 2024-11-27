-- Initialize Payee Table
CREATE TABLE payee (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  phone_number VARCHAR(15)
);
