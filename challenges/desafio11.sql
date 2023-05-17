SELECT 
    album_name AS album, COUNT(album_name) AS favoritadas
FROM
    SpotifyClone.songs AS s
        JOIN
    SpotifyClone.albuns AS a ON a.id = s.albuns_id
        JOIN
    SpotifyClone.favorites AS f ON f.songs_id = s.id
GROUP BY a.album_name
ORDER BY COUNT(album_name) DESC , album_name ASC
LIMIT 3;