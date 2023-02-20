---Find out how many films there are for each rating.
SELECT rating, COUNT(*) as number_films
FROM film
GROUP BY rating;

---Get a list of all the movies that have a rating of G or PG-13.
---Filter this list further: look for only movies that are under 2 hours long, and whose rental price (rental_rate) is under 3.00. Sort the list alphabetically.
SELECT title, rating, length, rental_rate
FROM film
WHERE rating IN ('G', 'PG-13')
AND length < 120
AND rental_rate < 3.00
ORDER BY title ASC;

---Find a customer in the customer table, and change his/her details to your details, using SQL UPDATE.
UPDATE customer
SET first_name = 'Serge',
    last_name = 'Konan',
    email = 'serge.konan.@skonan.com'
WHERE customer_id = 3;

---Now find the customer’s address, and use UPDATE to change the address to your address (or make one up).
UPDATE address
SET address = 'Abidjan, Plateau', city_id = 2
WHERE address_id = (SELECT address_id FROM customer WHERE customer_id = 3);