USE sakila;
-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'penelope'; -- done

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT count(distinct(film_id)) FROM sakila.inventory; -- 958 movies available for rent
SELECT count(distinct(inventory_id)) FROM sakila.rental; -- 4581 movies have been rented

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) FROM sakila.film; -- 45
SELECT max(length) FROM sakila.film; -- 185

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT round(avg(length)) AS hours, round((avg(length)-round(avg(length)))*60) AS minutes FROM sakila.film; -- done

-- 5. How many distinct (different) actors' last names are there?
SELECT count(DISTINCT(last_name)) FROM sakila.actor; -- 121

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT * FROM sakila.rental;
SELECT DATEDIFF((SELECT MAX(last_update) FROM sakila.rental),
	(SELECT MIN(last_update) FROM sakila.rental)); -- Done
   
-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, 
date_format(rental_date, '%M') AS "month", 
date_format(rental_date, '%D') AS "weekday" 
FROM sakila.rental
LIMIT 20; -- Done

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
date_format(rental_date, '%M') AS "month", 
date_format(rental_date, '%D') AS "weekday",
(date_format(rental_date, '%w') IN (1,7)) AS "weekend",
(date_format(rental_date, '%w') IN (2,3,4,5,6)) AS "workday"
FROM sakila.rental
LIMIT 20; -- Done

-- 9. Get release years.
SELECT title,release_year FROM sakila.film; -- Done

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE "%ARMAGEDDON%"; -- Done

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE "%APOLLO"; -- Done

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10; -- Done

-- 13. How many films include Behind the Scenes content?
SELECT count(film_id) FROM sakila.film
WHERE special_features LIKE "%Behind the Scenes%"; -- 538