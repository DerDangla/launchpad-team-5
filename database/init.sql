CREATE TABLE Payee (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(50)
);

CREATE TABLE Transactions (
  transaction_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES Payee(user_id),
  transaction_amount DECIMAL(10, 2) NOT NULL,
  merchant VARCHAR(255),
  country VARCHAR(100),
  status VARCHAR(50)
);

CREATE TABLE Fraud_scores (
  score_id SERIAL PRIMARY KEY,
  transaction_id INT REFERENCES Transactions(transaction_id),
  user_id INT REFERENCES Payee(user_id),
  fraud_score DECIMAL(5, 2) NOT NULL,
  risk_level VARCHAR(50)
);
