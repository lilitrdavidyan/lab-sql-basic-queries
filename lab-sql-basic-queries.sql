-- 1. Show all tables.
SHOW TABLES;

-- 2. Retrieve all data from the actor table.
SELECT * FROM actor;

-- Retrieve all data from the film table.
SELECT * FROM film;

-- Retrieve all data from the customer table.
SELECT * FROM customer;

-- 3. Retrieve specific columns from tables:
-- 3.1. Titles of all films.
SELECT title FROM film;

-- 3.2. List of languages used in films, aliased as language.
SELECT name AS language FROM language;

-- 3.3. List of first names of all employees.
SELECT first_name FROM staff;

-- 4. Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- 5. Counting records for database insights:
-- 5.1. Number of stores.
SELECT COUNT(*) FROM store;

-- 5.2. Number of employees.
SELECT COUNT(*) FROM staff;

-- 5.3. Number of films available for rent and number of films rented.
SELECT 
    (SELECT COUNT(DISTINCT film_id) FROM inventory) AS films_available_for_rent,
    (SELECT COUNT(DISTINCT i.film_id) 
     FROM rental r 
     JOIN inventory i ON r.inventory_id = i.inventory_id) AS films_rented;


-- 5.4. Number of distinct last names of actors.
SELECT COUNT(DISTINCT last_name) FROM actor;

-- 6. Retrieve the 10 longest films.
SELECT title, length 
FROM film 
ORDER BY length DESC 
LIMIT 10;

-- 7. Use filtering techniques:
-- 7.1. Actors with the first name "SCARLETT".
SELECT * FROM actor WHERE first_name = 'SCARLETT';

-- 7.2. Movies with ARMAGEDDON in their title and longer than 100 minutes.
SELECT * FROM film 
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 7.3. Number of films with Behind the Scenes content.
SELECT COUNT(*) 
FROM film 
WHERE special_features LIKE '%Behind the Scenes%';
