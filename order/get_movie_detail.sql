SELECT
  m.id,
  m.title,
  ARRAY_AGG(DISTINCT g.name) AS genres,
  m.synopsis,
  m.release_date,
  d.name AS director,
  m.duration_minutes,
  ARRAY_AGG(DISTINCT a.name) AS actors,
  m.poster_img,
  m.backdrop_img
FROM movies m
JOIN people d ON m.director_id = d.id
JOIN movie_genres mg ON m.id = mg.movie_id
JOIN genre g ON mg.genre_id = g.id
JOIN movie_actors ma ON m.id = ma.movie_id
JOIN people a ON ma.actor_id = a.id
WHERE m.id = 3
GROUP BY m.id, d.name;