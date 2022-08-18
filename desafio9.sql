SELECT count(hi.musica_id) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.usuarios AS us
INNER JOIN SpotifyClone.historico_reproducao AS hi ON hi.usuario_id = us.usuario_id
where us.usuario_nome = 'Barbara Liskov';