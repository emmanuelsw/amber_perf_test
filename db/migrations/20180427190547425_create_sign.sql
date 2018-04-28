-- +micrate Up
CREATE TABLE signs (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  email VARCHAR,
  phone VARCHAR,
  birthdate DATE,
  sign TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS signs;
