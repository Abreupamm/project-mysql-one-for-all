SELECT ar.artista_nome AS 'artista',
al.album_nome AS 'album'
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al ON al.artista_id = ar.artista_id
where ar.artista_nome = 'Elis Regina'
GROUP BY al.album_id
ORDER BY album ASC;