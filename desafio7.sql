SELECT ar.artista_nome AS 'artista',
al.album_nome AS 'album',
COUNT(se.artista_id) AS 'seguidores'
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al ON al.artista_id = ar.artista_id
INNER JOIN SpotifyClone.seguidores AS se ON se.artista_id = ar.artista_id
GROUP BY al.album_id
ORDER BY seguidores DESC, artista ASC, album ASC;