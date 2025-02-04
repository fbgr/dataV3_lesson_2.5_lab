USE sakila;


-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name = 'SCARLETT';

-- 2. How many films (movies) are available for rent and 
-- how many films have been rented?
SELECT COUNT(DISTINCT film_id)
FROM sakila.inventory;

SELECT COUNT(DISTINCT rental_id)
FROM sakila.rental;

-- 3. What are the shortest and longest movie duration? 
--    Name the values max_duration and min_duration.
SELECT max(length) AS max_duration ,min(length) AS min_dutarion
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(CAST(FLOOR(AVG(length)/60) AS CHAR),':',FLOOR(CAST(AVG(length)%60 AS CHAR)))
FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(rental_date),min(rental_date))
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *,WEEKDAY((CONVERT(return_date,date))) AS Weekday_return, DATE_FORMAT(CONVERT(return_date,date), "%M") AS Return_month
FROM sakila.rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
SELECT *,WEEKDAY((CONVERT(return_date,date))) AS Weekday_return, DATE_FORMAT(CONVERT(return_date,date), "%M") AS Return_month, CASE
WHEN WEEKDAY((CONVERT(return_date,date))) = 1 or WEEKDAY((CONVERT(return_date,date))) = 7 THEN 'Weekend'
ELSE 'Workday'
END AS day_type
FROM sakila.rental;

-- 9. Get release years.
SELECT release_year
FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT *
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT *
FROM sakila.film
WHERE special_features LIKE "%Behind the Scenes%";