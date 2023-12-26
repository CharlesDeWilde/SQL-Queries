#--This Query is based around a datset from a local Movie store.
#--In summary, this particular query retrieves information about films released in or after the year 2005, joning the "film" table with the "film_category" table. 
#--It then groups the results by various film attributes and orders them alphabetically by movie title.
SELECT
    film.film_id,
    film.title AS Movie_Title,
    film.description AS Movie_Description,
    film.release_year AS Year_Released,
    film.rental_duration AS Days_Rented,
    film.rental_rate AS Rental_Cost,
    film.length AS Runtime,
    film.replacement_cost AS Replacement_Fee,
    film.rating AS Rating, 
    film.last_update AS Last_Updated,
    film.special_features AS Special_Features,
    film.fulltext
FROM
    film
JOIN
    film_category ON film.film_id = film_category.film_id
WHERE
    release_year >= 2005
GROUP BY
    film.film_id,  -- Making sure to include all non-aggregated columns in the GROUP BY
    film.title,
    film.description,
    film.release_year,
    film.rental_duration,
    film.rental_rate,
    film.length,
    film.replacement_cost,
    film.rating,
    film.last_update,
    film.special_features,
    film.fulltext
ORDER BY
    film.title ASC;
