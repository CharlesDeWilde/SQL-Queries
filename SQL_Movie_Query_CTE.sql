# Using the same data from the Movie Store, I wanted to create a Common Table Expression (or a CTE) to showcase some more film data findings. 
    
# This query now retrieves film data from a my Movie Rental Store Database, filtering films released in or after 2005. 
# It then creates a Common Table Expression (CTE) named "FilmData" to organize and simplify the displayed data. 
# Finally, the main query selects specific film attributes from the CTE, showcasing essential information such as movie title, release year, rental cost, runtime, replacement fee, and rating.

    WITH FilmData AS (
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
        film.film_id,
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
        film.title ASC
)
-- Main query using the CTE
SELECT
    Movie_Title,
    Year_Released,
    Rental_Cost,
    Runtime,
    Replacement_Fee,
    Rating
FROM
    FilmData;
