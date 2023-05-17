CREATE TABLE IF NOT EXISTS SpotifyClone.favorites (
  users_id INT NOT NULL,
  songs_id INT NOT NULL,
  INDEX fk_favorites_users1_idx (users_id ASC) VISIBLE,
  INDEX fk_favorites_songs1_idx (songs_id ASC) VISIBLE,
  CONSTRAINT fk_favorites_users1
    FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_favorites_songs1
    FOREIGN KEY (songs_id)
    REFERENCES SpotifyClone.songs (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT PRIMARY KEY (users_id,songs_id))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.favorites (users_id,songs_id)
VALUES
  (1,3),
  (1,6),
  (1,10),
  (2,4),
  (3,1),
  (3,3),
  (4,7),
  (4,4),
  (5,10),
  (5,2),
  (8,4),
  (9,7),
  (10,3);