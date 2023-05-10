SELECT 
    user_name AS pessoa_usuaria,
    CASE
        WHEN MAX(YEAR(reproduction_date)) >= 2021 THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    SpotifyClone.historyc AS h
        JOIN
    SpotifyClone.users AS u ON h.users_id = u.id
GROUP BY u.user_name
ORDER BY u.user_name ASC;   