SELECT mu.musica_nome AS 'cancao', 
count(hi.usuario_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS mu
INNER JOIN SpotifyClone.historico_reproducao AS hi ON hi.musica_id = mu.musica_id
group by hi.musica_id
ORDER BY reproducoes DESC, cancao ASC LIMIT 2; 