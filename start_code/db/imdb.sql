DROP TABLE IF EXISTS castings;
DROP TABLE IF EXISTS performers;
DROP TABLE IF EXISTS movies;

CREATE TABLE performers (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE castings (
  id SERIAL4 PRIMARY KEY,
  movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  performer_id INT4 REFERENCES performers(id) ON DELETE CASCADE,
  fee INT4
);
