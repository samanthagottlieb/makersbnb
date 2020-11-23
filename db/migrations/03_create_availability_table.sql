CREATE TABLE availability(
  id SERIAL PRIMARY KEY,
  home_id INT NOT NULL,
  date DATE,
  CONSTRAINT fk_homes
    FOREIGN KEY(home_id)
  	  REFERENCES homes(id)
);
