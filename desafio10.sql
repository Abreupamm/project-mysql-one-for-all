SELECT mu.musica_nome AS 'nome',
COUNT(hi.usuario_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS mu
INNER JOIN SpotifyClone.historico_reproducao AS hi ON hi.musica_id = mu.musica_id
INNER JOIN SpotifyClone.usuarios AS us ON us.usuario_id = hi.usuario_id
WHERE us.plano_id = 1 OR us.plano_id = 3
GROUP BY mu.musica_nome
ORDER BY mu.musica_nome ASC;