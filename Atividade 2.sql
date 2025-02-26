SELECT cat.name AS categoria, COUNT(f.film_id) AS total_filmes  --Seleciona a categoria (cat.name), conta o número de filmes nas categorias e renomeia como "total_filmes"
FROM film f                                                     --Cria o alias para definir fim como "f" para facilitar as próximas linhas
JOIN film_category fc ON f.film_id = fc.film_id                 --Faz o join, ou seja, junta duas tabelas: film_categoria e film_id como = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id           --Faz o join, ou seja, junta duas tabelas: category cat e fc.category_id como = cat.category_id
GROUP BY cat.name                                               --Mostra os nomes agrupados pelo nome da categoria por categoria
HAVING COUNT(f.film_id) > 50                                    --Filtra para mostrar apenas as categorias que possuam mais de 50 filmes
ORDER BY total_filmes DESC;                                     --Ordena a consulta "total_filmes" de forma decrescente por categorias e seus números de filmes, da categoria com mais filmes para a com menos filmes
