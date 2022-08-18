 
 
 SELECT MIN(pl.valor) AS 'faturamento_minimo',
 MAX(pl.valor) AS 'faturamento_maximo',
 ROUND(AVG(pl.valor), 2) AS 'faturamento_medio',
 ROUND(SUM(pl.valor), 2) AS 'faturamento_total'
 FROM SpotifyClone.planos AS pl
 INNER JOIN SpotifyClone.usuarios AS us ON us.plano_id = pl.plano_id;