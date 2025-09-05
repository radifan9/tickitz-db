INSERT INTO genre (name) VALUES
('Action'),
('Drama'),
('Crime'),
('Fantasy'),
('Adventure'),
('Thriller'),
('Sci-Fi');

-- The Dark Knight (id = 1 for example)
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(1, 1), -- Action
(1, 3), -- Crime
(1, 6); -- Thriller

-- The Shawshank Redemption (id = 2)
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(2, 2), -- Drama
(2, 3); -- Crime

-- Avengers: Endgame (id = 3)
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(3, 1), -- Action
(3, 5), -- Adventure
(3, 4), -- Fantasy
(3, 7); -- Sci-Fi

-- Braveheart (id = 4)
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(4, 2), -- Drama
(4, 1), -- Action
(4, 5); -- Adventure

-- Inception (id = 5)
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(5, 6), -- Thriller
(5, 7), -- Sci-Fi
(5, 2); -- Drama