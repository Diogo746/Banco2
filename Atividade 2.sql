SELECT cat.name AS categoria, COUNT(f.film_id) AS total_filmes  --Seleciona a categoria (cat.name), conta o número de filmes nas categorias e renomeia como "total_filmes"
FROM film f                                                     --Seleciona a tabela "film" para a consulta e cria o alias para definir film como "f" para facilitar as próximas linhas
JOIN film_category fc ON f.film_id = fc.film_id                 --Faz o join, ou seja, junta duas tabelas: film_categoria e film_id como = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id           --Faz o join, ou seja, junta duas tabelas: category cat e fc.category_id como = cat.category_id
GROUP BY cat.name                                               --Mostra os nomes agrupados pelo nome da categoria por categoria
HAVING COUNT(f.film_id) > 50                                    --Filtra para mostrar apenas as categorias que possuam mais de 50 filmes
ORDER BY total_filmes DESC;                                     --Ordena a consulta "total_filmes" de forma decrescente por categorias e seus números de filmes, da categoria com mais filmes para a com menos filmes








SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_gasto   --Seleciona as tabelas (c.customer_id, c.first_name, c.last_name) e soma o total gasto (p.amount) de cada um e renomeia para "total_gasto"
FROM customer c                                                                 --Seleciona a tabela "customer" para consulta e cria o alias "c" como apelido para facilitar as próximas linhas
JOIN payment p ON c.customer_id = p.customer_id                                 --Faz o join, ou seja, junta a tabela "payment" com "customer_id" e define como  = "p.customer_id"
GROUP BY c.customer_id                                                          --Agrupa os resultados da consulta pelo c.customer_id
HAVING SUM(p.amount) > 100                                                      --Retorna apenas os customer com gasto total superior a 100
ORDER BY total_gasto DESC;                                                      --Ordena o total_gasto de forma decrescente, ou seja, do maior para o menor

