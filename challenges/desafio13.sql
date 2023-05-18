SELECT
    CASE
        WHEN age <= 30 THEN 'Até 30 anos'
        WHEN age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN age > 60 THEN 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT id) AS total_pessoas_usuarias,
    COUNT(users_id) AS total_favoritadas
FROM
    SpotifyClone.users AS u
        LEFT JOIN
    SpotifyClone.favorites AS f ON u.id = f.users_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria ASC;