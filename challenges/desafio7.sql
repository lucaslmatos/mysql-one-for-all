SELECT 
    artist_name AS artista,
    album_name AS album,
    COUNT(f.users_id) AS pessoas_seguidoras
FROM
    SpotifyClone.artists AS ar
        JOIN
    SpotifyClone.albuns AS al ON al.artists_id = ar.id
        JOIN
    SpotifyClone.followers AS f ON f.artists_id = ar.id
GROUP BY ar.id , al.id
ORDER BY COUNT(f.users_id) DESC , 
ar.artist_name , al.album_name; 
