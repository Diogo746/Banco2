SELECT cat.name AS categoria, COUNT(f.film_id) AS total_filmes
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
HAVING COUNT(f.film_id) > 50
ORDER BY total_filmes DESC;
