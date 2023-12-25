--Week 5 - Wednesday Questions 

--1. List all customers who live in Texas (use JOINs) 
SELECT first_name, address FROM customer 
INNER JOIN address ON customer.address_id = address.address_id

--2. Get all payments above $6.99 with the Customer's Full Name 
SELECT first_name, last_name, amount FROM customer 
INNER JOIN payment ON customer.customer_id = payment.customer_id WHERE amount > 6.99

--3. Show all customers names who have made payments over $175(use subqueries) 
SELECT first_name, last_name, amount FROM customer 
INNER JOIN ( SELECT customer_id, amount FROM payment WHERE amount > 175) 
ON customer.customer_id = payment.customer_id

--4. List all customers that live in Nepal (use the city table) 
SELECT first_name, last_name, city FROM customer 
INNER JOIN address ON customer.address_id = address.address_id INNER JOIN city 
ON address.city_id = city.city_id WHERE city.city = ‘Nepal’

--5. Which staff member had the most transactions? 
SELECT first_name, last_name, Count(payment.staff_id) AS payment_count FROM staff 
INNER JOIN payment ON staff.staff_id = payment.staff_id GROUP BY staff.staff_id, staff.first_name, staff.last_name 
ORDER BY payment_count

--6. How many movies of each rating are There?
SELECT Distinct(rating), Count(rating) FROM film 
GROUP BY rating

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, amount FROM customer 
INNER JOIN ( SELECT customer_id, amount FROM payment GROUP BY customer_id HAVING Count(customer_id) = 1 ) 
ON customer.customer_id = payment.customer_id

--8. Howmanyfreerentalsdidourstoresgive away? 
SELECT Count(rental_id) AS free_rentals_count
FROM payment
WHERE amount = 0



