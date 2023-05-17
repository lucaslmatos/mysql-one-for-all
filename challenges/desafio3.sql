SELECT
    user_name AS pessoa_usuaria,
    COUNT(songs_id) AS musicas_ouvidas,
    ROUND(SUM(s.duration / 60), 2) AS total_minutos
FROM
    SpotifyClone.historyc AS h
        JOIN
    SpotifyClone.users AS u ON h.users_id = u.id
        JOIN
    SpotifyClone.songs AS s ON h.songs_id = s.id
GROUP BY u.user_name
ORDER BY u.user_name ASC;   