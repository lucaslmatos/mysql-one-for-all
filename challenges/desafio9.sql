SELECT 
    COUNT(songs_id) AS musicas_no_historico
FROM
    SpotifyClone.users AS u
        JOIN
    SpotifyClone.historyc AS h ON h.users_id = u.id
WHERE
    u.user_name = 'Barbara Liskov';
