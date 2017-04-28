SELECT * FROM customers;
SELECT * FROM films;
SELECT * FROM tickets;


SELECT c.*, t.*, f.* FROM customers c
INNER JOIN tickets t
ON t.customer_id = c.id
INNER JOIN films f
ON f.id = t.film_id
;


SELECT f.*, t.* c.* FROM films c
INNER JOIN tickets t
ON t.film_id = f.id
INNER JOIN customers c
ON c.id = t.customer_id
;