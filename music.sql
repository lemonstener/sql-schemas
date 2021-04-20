-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO producers
(name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Affanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO artists
(name)
VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz 2 Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  by INT REFERENCES artists(id)
);

INSERT INTO albums
(name,by)
VALUES
('Middle of Nowhere',1),
('A night at the Opera',2),
('Daydream',3),
('A Star is Born',5),
('Silver Side Up',7),
('The Blueprint 3',8),
('Prism',10),
('Hands all over',12),
('Let Go',14),
('The Writing''s on the Wall',15);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date,album)
VALUES
  ('MMMBop', 238, '04-15-1997',1),
  ('Bohemian Rhapsody', 355, '10-31-1975',2),
  ('One Sweet Day', 282, '11-14-1995',3),
  ('Shallow', 216, '09-27-2018',4),
  ('How You Remind Me', 223,'08-21-2001',5),
  ('New York State of Mind', 276, '10-20-2009',6),
  ('Dark Horse', 215, '12-17-2013',7),
  ('Moves Like Jagger', 201, '06-21-2011',8),
  ('Complicated', 244, '05-14-2002',9),
  ('Say My Name', 240, '11-07-1999',10);

CREATE TABLE performances
(
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists(id),
  song_id INT REFERENCES songs(id)
);

CREATE TABLE credits 
(
  id SERIAL PRIMARY KEY,
  producer_id INT REFERENCES producers(id),
  album_id INT REFERENCES albums(id)
);

INSERT INTO performances
(artist_id,song_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,3),
(5,4),
(6,4),
(7,5),
(8,6),
(9,6),
(10,7),
(11,7),
(12,8),
(13,8),
(14,9),
(15,10);

INSERT INTO credits
(producer_id,album_id)
VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(7,6),
(8,7),
(9,7),
(10,8),
(11,8),
(12,9),
(13,10);