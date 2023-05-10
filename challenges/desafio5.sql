SELECT 
    song_name AS cancao, 
    COUNT(songs_id) AS reproducoes
FROM
    SpotifyClone.historyc AS h
        JOIN
    SpotifyClone.songs AS s ON h.songs_id = s.id
GROUP BY song_name
ORDER BY COUNT(songs_id) DESC , song_name ASC LIMIT 2;  
