SELECT us.usuario_nome AS 'usuario',
COUNT(hi.usuario_id) AS 'qt_de_musicas_ouvidas',
ROUND(SUM(mu.duracao_segundos/60),2) AS 'total_minutos'
FROM SpotifyClone.historico_reproducao AS hi
INNER JOIN SpotifyClone.usuarios AS us ON us.usuario_id = hi.usuario_id
INNER JOIN SpotifyClone.musicas AS mu ON mu.musica_id = hi.musica_id
GROUP BY hi.usuario_id
ORDER BY us.usuario_nome ASC;