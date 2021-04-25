DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id bigint PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  birthday DATE,
  email_confirmed BOOLEAN,
  email VARCHAR(255) UNIQUE NOT NULL,
  gender VARCHAR(255) NOT NULL,
  password_digest VARCHAR(255) NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  created_at TIMESTAMP NOT NULL
);
