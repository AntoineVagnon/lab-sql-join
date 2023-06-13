#Here is the list of the number of films per category.
SELECT 
	c.name,
	COUNT(*)
FROM film_category fc
JOIN category c
	ON c.category_id = fc.category_id
GROUP BY 
	c.category_id;

#Here are the first, the last names and the address of each staff member.

SELECT
	s.first_name,
    s.last_name,
    a.address
FROM 
	staff s
JOIN 
	address a 
ON 
	a.address_id = s.address_id ;

#Here is the total amount rung up by each staff member in August 2005.

SELECT
	s.first_name,
    s.last_name, 
    COUNT(r.rental_id) AS Nb_rental
FROM 
	staff s
JOIN rental r 
	ON s.staff_id = r.staff_id
WHERE 
	DATE_FORMAT(r.rental_date, '%Y-%m') = '2005-03'
GROUP BY 
	s.staff_id;


#Here is the list of all films and the number of actors who are listed for each of them

SELECT
	f.title,
    count(fa.actor_id) as Nb_actors
FROM 
	film f
JOIN 
	film_actor fa 
ON 
	fa.film_id = f.film_id
GROUP BY 
	f.film_id;


#Here is the total amount paid for each customer sorted by alphabetic order for the last name
SELECT
	c.first_name,
    c.last_name,
    sum(p.amount) as total_payment
FROM 
	customer c
JOIN 
	payment p 
ON
	c.customer_id = p.customer_id
GROUP BY 
	c.first_name, c.last_name
ORDER BY 
	c.last_name ASC
;