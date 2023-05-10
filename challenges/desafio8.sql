SELECT 
    artist_name AS artista, album_name AS album
FROM
    SpotifyClone.artists AS ar
        JOIN
    SpotifyClone.albuns AS al ON al.artists_id = ar.id
WHERE
    ar.artist_name = 'Elis Regina';
