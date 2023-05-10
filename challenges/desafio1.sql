DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
CREATE TABLE IF NOT EXISTS SpotifyClone.plans (
  id INT NOT NULL AUTO_INCREMENT,
  plan_name VARCHAR(45) NOT NULL,
  price DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (id)) 
ENGINE = InnoDB;
  
CREATE TABLE IF NOT EXISTS SpotifyClone.users (
  id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(45) NOT NULL,
  age INT NOT NULL,
  plans_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_users_plans1_idx (plans_id ASC) VISIBLE,
  CONSTRAINT fk_users_plans1
    FOREIGN KEY (plans_id)
    REFERENCES SpotifyClone.plans (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artists (
  id INT NOT NULL AUTO_INCREMENT,
  artist_name VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.albuns (
  id INT NOT NULL AUTO_INCREMENT,
  album_name VARCHAR(45) NULL,
  release_year YEAR NOT NULL,
  artists_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_albuns_artists1_idx (artists_id ASC) VISIBLE,
  CONSTRAINT fk_albuns_artists1
    FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.songs (
  id INT NOT NULL AUTO_INCREMENT,
  song_name VARCHAR(45) NULL,
  duration INT NOT NULL,
  artists_id INT NOT NULL,
  albuns_id INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_song_UNIQUE (id ASC) VISIBLE,
  INDEX fk_songs_artists1_idx (artists_id ASC) VISIBLE,
  INDEX fk_songs_albuns1_idx (albuns_id ASC) VISIBLE,
  CONSTRAINT fk_songs_artists1
    FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_songs_albuns1
    FOREIGN KEY (albuns_id)
    REFERENCES SpotifyClone.albuns (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.historyc (
  users_id INT NOT NULL,
  songs_id INT NOT NULL,
  reproduction_date DATETIME NOT NULL,
  INDEX fk_history_users1_idx (users_id ASC) VISIBLE,
  INDEX fk_history_songs1_idx (songs_id ASC) VISIBLE,
  CONSTRAINT fk_history_users1
    FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_history_songs1
    FOREIGN KEY (songs_id)
    REFERENCES SpotifyClone.songs (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT PRIMARY KEY (users_id,songs_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.sign (
  users_id INT NOT NULL,
  plans_id INT NOT NULL,
  date_sign DATE NOT NULL,
  INDEX fk_sign_users1_idx (users_id ASC) VISIBLE,
  INDEX fk_sign_plans1_idx (plans_id ASC) VISIBLE,
  CONSTRAINT fk_sign_users1
    FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_sign_plans1
    FOREIGN KEY (plans_id)
    REFERENCES SpotifyClone.plans (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.followers (
  users_id INT NOT NULL,
  artists_id INT NOT NULL,
  INDEX fk_followers_users1_idx (users_id ASC) VISIBLE,
  INDEX fk_followers_artists1_idx (artists_id ASC) VISIBLE,
  CONSTRAINT fk_followers_users1
    FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_followers_artists1
    FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT PRIMARY KEY (users_id,artists_id))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name,price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (user_name,age,plans_id)
VALUES
  ('Barbara Liskov', 82,1),
  ('Robert Cecil Martin', 58,1),
  ('Ada Lovelace',37,2),
  ('Martin Fowler',46,2),
  ('Sandi Metz',58,2),
  ('Paulo Freire',19,3),
  ('Bell Hooks',26,3),
  ('Christopher Alexander',85,4),
  ('Judith Butler',45,4),
  ('Jorge Amado',58,4);
  
INSERT INTO SpotifyClone.artists (artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.albuns (album_name,artists_id,release_year)
VALUES
  ('Renaissance',1,'2022'),
  ('Jazz',2,'1978'),
  ('Hot Space',2,'1982'),
  ('Falso Brilhante',3,'1998'),
  ('Vento de Maio',3,'2001'),
  ('QVVJFA?',4,'2003'),
  ('Somewhere Far Beyond',5,'2007'),
  ('I Put A Spell On You',6,'2012');
  
INSERT INTO SpotifyClone.songs (song_name,duration,artists_id,albuns_id )
VALUES
  ('BREAK MY SOUL',279,1,1),
  ("VIRGO'S GROOVE",369,1,1),
  ("ALIEN SUPERSTAR",116,1,1),
  ("Don't Stop Me Now",203,2,2),
  ('Under Pressure',152,2,3),
  ('Como Nossos Pais',105,3,4),
  ('O Medo de Amar é o Medo de Ser Livre',207,3,5),
  ('Samba em Paris',267,4,6),
  ("The Bard's Song",244,5,7),
  ("Feeling Good",100,6,8);

INSERT INTO SpotifyClone.historyc (users_id,songs_id,reproduction_date)
VALUES
  (1,8,'2022-02-28 10:45:55'),
  (1,2,'2022-02-28 05:30:35'),
  (1,10,'2020-03-06 11:22:33'),
  (2,10,'2022-08-05 08:05:17'),
  (2,7,'2020-01-02 07:40:33'),
  (3,10,'2020-11-13 16:55:13'),
  (3,2,'2020-12-05 18:38:30'),
  (4,8,'2021-08-15 17:10:10'),
  (5,8,'2022-01-09 01:44:33'),
  (5,5,'2020-08-06 15:23:43'),
  (6,7,'2017-01-24 00:31:17'),
  (6,1,'2017-10-12 12:35:20'),
  (7,4,'2011-12-15 22:30:49'),
  (8,4,'2012-03-17 14:56:41'),
  (9,9,'2022-02-24 21:14:22'),
  (10,3,'2015-12-13 08:30:22');
  
  INSERT INTO SpotifyClone.followers (users_id,artists_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,1),
  (7,6),
  (9,3),
  (10,2);