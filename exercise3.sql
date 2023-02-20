--Part I

--Create a table named purchases. It should have 3 columns :
--id : the primary key of the table
--customer_id : this column references the table customers
--item_id : this column references the table items
--quantity_purchased : this column is the quantity of items purchased by a certain customer
CREATE TABLE purchases (
	id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	item_id INTEGER NOT NULL,
	quantity_purchased INT NOT NULL,
	
	CONSTRAINT fk_customer FOREIGN KEY(customer_id) 
	REFERENCES customers(id) 
	ON UPDATE CASCADE 
	ON DELETE RESTRICT,
		
	CONSTRAINT fk_items FOREIGN KEY(item_id) 
	REFERENCES items(id) 
	ON UPDATE CASCADE 
	ON DELETE RESTRICT
);


SELECT * FROM items;
SELECT * FROM customers;

--Insert purchases for the customers, use subqueries:
--Scott Scott bought one fan
--Melanie Johnson bought ten large desks
--Greg Jones bougth two small desks

INSERT INTO purchases (customer_id, item_id, quantity_purchased) VALUES (
	(SELECT id FROM customers WHERE first_name = 'Scott' AND last_name = 'Scott'), 
	(SELECT id FROM items WHERE name = 'Fan'), 
	1), 
	(
		(SELECT id FROM customers WHERE first_name = 'Melanie' AND last_name = 'Johson'), 
		(SELECT id FROM items WHERE name = 'Large Desk'), 
		10),
	(
		(SELECT id FROM customers WHERE first_name = 'Greg' AND last_name = 'Jones'), 
		(SELECT id FROM items WHERE name = 'Small Desk'), 
		2);

--Part II

--Use SQL to get the following from the database:
--All purchases. Is this information useful to us?
SELECT * FROM purchases;

--All purchases, joining with the customers table.
SELECT c.first_name, c.last_name, i.name, p.quantity_purchased
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id
INNER JOIN items i ON p.item_id = i.id;

--Purchases of the customer with the ID equal to 5.
SELECT i.name, p.quantity_purchased
FROM purchases p
INNER JOIN items i ON p.item_id = i.id
WHERE p.customer_id = 5;

--Purchases for a large desk AND a small desk
SELECT c.first_name, c.last_name, i.name, p.quantity_purchased
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id
INNER JOIN items i ON p.item_id = i.id
WHERE i.name IN ('Large Desk', 'Small Desk');

--Use SQL to show all the customers who have made a purchase. Show the following fields/columns:
--Customer first name
--Customer last name
--Item name
SELECT c.first_name, c.last_name, i.name
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id
INNER JOIN items i ON p.item_id = i.id
GROUP BY c.first_name, c.last_name, i.name;

--Add a row which references a customer by ID, but does not reference an item by ID (leave it blank). Does this work? Why/why not?
