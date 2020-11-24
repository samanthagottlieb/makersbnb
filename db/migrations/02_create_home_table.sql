CREATE TABLE homes(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(60) NOT NULL,
  description VARCHAR(140),
  price NUMERIC(6,2) NOT NULL,
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
  	  REFERENCES users(id)
);
