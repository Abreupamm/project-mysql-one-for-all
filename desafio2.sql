SELECT  COUNT(musica_id) AS 'cancoes', 
COUNT(distinct artista_id) AS 'artistas', 
COUNT(distinct album_id) AS 'albuns'
FROM SpotifyClone.musicas;
