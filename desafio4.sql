SELECT us.usuario_nome AS 'usuario',
IF (MAX(hi.data_reproducao) > '2021-01-01', 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.usuarios AS us
left JOIN SpotifyClone.historico_reproducao AS hi ON hi.usuario_id = us.usuario_id
GROUP BY us.usuario_id
ORDER BY us.usuario_nome ASC;