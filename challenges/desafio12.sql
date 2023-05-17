SELECT 
    artist_name AS artista,
    CASE
        WHEN COUNT(s.artists_id) >= 5 THEN 'A'
        WHEN COUNT(s.artists_id) = 4 THEN 'B'
        WHEN COUNT(s.artists_id) = 3 THEN 'B'
        WHEN COUNT(s.artists_id) = 2 THEN 'C'
        WHEN COUNT(s.artists_id) = 1 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    SpotifyClone.songs AS s
        JOIN
    SpotifyClone.albuns AS a ON a.id = s.albuns_id
        JOIN
    SpotifyClone.favorites AS f ON f.songs_id = s.id
        RIGHT JOIN
    SpotifyClone.artists AS ar ON ar.id = a.artists_id
GROUP BY artist_name
ORDER BY COUNT(s.artists_id) DESC , artist_name ASC;