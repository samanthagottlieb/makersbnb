CREATE TABLE booking(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  home_id INT NOT NULL,
  date DATE NOT NULL,
  confirmed BOOLEAN NOT NULL,
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
  	  REFERENCES users(id),
  CONSTRAINT fk_homes
    FOREIGN KEY(home_id)
      REFERENCES homes(id)
);
