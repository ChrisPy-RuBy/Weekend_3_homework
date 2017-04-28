DROP TABLE IF EXISTS tickets; --this table is removed first as it is dependant on the other tables
DROP TABLE IF EXISTS customers; -- these are not so important as they are not dependant on any of the other information.
DROP TABLE IF EXISTS films; 


CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE, --on DELETE cascade removes everything when it is deleted
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);
