SELECT 
    s.cancoes AS cancoes,
    a.artistas AS artistas,
    al.albuns AS albuns
FROM 
    (SELECT COUNT(*) AS cancoes FROM SpotifyClone.songs) s
    JOIN (SELECT COUNT(*) AS artistas FROM SpotifyClone.artists) a ON 1=1
    JOIN (SELECT COUNT(*) AS albuns FROM SpotifyClone.albuns) al ON 1=1;