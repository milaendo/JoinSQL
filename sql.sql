# question 1: Get the average rating for a movie
SELECT 
    movies.title, AVG(ratings.rating)
FROM
    movies.movies
        JOIN
    movies.ratings ON movies.movieid = ratings.movieid
WHERE
    title LIKE '%star wars%'
GROUP BY movies.movieid;


# question 2: Get the total ratings for a movie
USE movies;
SELECT 
    title, COUNT(r.rating)
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
WHERE
    title LIKE '%star wars%'
GROUP BY m.movieid;


# question 3: Get the total movies for a genre
USE movies;
SELECT 
    m.title
FROM
    movies m
WHERE
    genres = 'comedy';
    
   
/* Question 4: Get the average rating for a user */ 
USE movies;
SELECT 
    r.userid, AVG(r.rating)
FROM
    ratings r
GROUP BY r.userid;


/* Question 5: Find the user with the most ratings*/
USE movies;
SELECT 
    userid, COUNT(r.rating)
FROM
    ratings r;
  
  
/* Question 6: Find the user with the highest average rating*/
USE movies;
SELECT 
    r.userid, AVG(r.rating) as avgRating 
FROM
    ratings r
GROUP BY r.userid
ORDER BY avgRating DESC
LIMIT 1;


/* Question 7: Find the user with the highest average rating with more than 50 reviews*/
USE movies;
SELECT 
    r.userid, AVG(r.rating) as avgRating,count(r.rating) as countRating
FROM
    ratings r
GROUP BY r.userid
having countRating > 50 
ORDER BY avgRating DESC
LIMIT 1;


/* Question 8: Find the movies with an average rating over 4*/
USE movies;
SELECT 
    m.title, AVG(r.rating) AS ratingAvg
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
GROUP BY m.title
HAVING ratingAvg > 4
ORDER BY ratingAvg DESC;

/* Question 9: For each genre find the total number of reviews as well as the average review sort by highest average review.*/ 

USE movies;
SELECT 
    g.genres,
    COUNT(r.rating) AS ratingCount,
    AVG(r.rating) AS avgRating
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
        JOIN
    movie_genre mg ON mg.movieid = r.movieid
        JOIN
    genre g ON g.id = mg.genre_id
WHERE
    m.movieid < 100
GROUP BY g.genres
ORDER BY avgRating DESC;


/* Joins*/
/* Question 1: Find all comedies*/
USE movies;
SELECT 
    m.title, g.genres
FROM
    movies m
        JOIN
    movie_genre mg ON mg.movieid = m.movieid
        JOIN
    genre g ON mg.genre_id = g.id
WHERE
    g.genres = 'comedy';


/* Question 2: Find all comedies in the year 2000*/
USE movies;
SELECT 
    m.title, g.genres
FROM
    movies m
        JOIN
    movie_genre mg ON mg.movieid = m.movieid
        JOIN
    genre g ON mg.genre_id = g.id
WHERE
    g.genres = 'comedy'
        AND title LIKE '%2000%';

/* Question 3: Find any movies that are about death and are a comedy*/
USE movies;
SELECT 
    t.tag, m.title, m.genres
FROM
    movies m
        JOIN
    tags t ON t.movieid = m.movieid
WHERE
    t.tag like '%death%' and m.genres like "%comedy%";
    
    
/* Question :4 Find any movies from either 2001 or 2002 with a title containing super*/
use movies;
select m.title
from movies m
where (m.title like "%2001%" or m.title like "%2002%" ) and m.title like "%super%"

