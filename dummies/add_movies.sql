-- Directors (people)
INSERT INTO
  people (name)
VALUES
  ('Christopher Nolan'),
  ('Frank Darabont'),
  ('Anthony Russo'),
  ('James Cameron'),
  ('Peter Jackson');

-- Movies
INSERT INTO movies (title, synopsis, poster_img, backdrop_img, duration_minutes, release_date, director_id, age_rating_id)
VALUES
  ('Inception', 'A thief who enters the dreams of others to steal secrets.', 'inception.jpg', 'inception_bg.jpg', 148, '2010-07-16', 1, 2),
  ('The Shawshank Redemption', 'Two men form a bond while serving time in prison.', 'shawshank.jpg', 'shawshank_bg.jpg', 142, '1994-09-23', 2, 2),
  ('Avengers: Endgame', 'The Avengers assemble once more to undo Thanos'' snap.', 'endgame.jpg', 'endgame_bg.jpg', 181, '2019-04-26', 3, 2),
  ('Avatar', 'A Marine on Pandora becomes torn between following orders and protecting his new home.', 'avatar.jpg', 'avatar_bg.jpg', 162, '2009-12-18', 4, 1),
  ('The Lord of the Rings: The Return of the King', 'The final confrontation against Sauron begins.', 'lotr.jpg', 'lotr_bg.jpg', 201, '2003-12-17', 5, 2);
