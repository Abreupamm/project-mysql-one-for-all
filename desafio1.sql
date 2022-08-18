DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT NOT NULL AUTO_INCREMENT,
    plano_tipo VARCHAR(20) NOT NULL,
    valor DOUBLE NOT NULL,
    PRIMARY KEY (plano_id),
    UNIQUE (plano_tipo)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    usuario_nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    artista_nome VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    album_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    album_nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidores(
    artista_id INTEGER,
    usuario_id INTEGER,
    PRIMARY key (artista_id, usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musica_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    musica_nome VARCHAR(50) NOT NULL,
    duracao_segundos INT,
    ano YEAR,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducao(
    historico_id INT AUTO_INCREMENT NOT NULL,
    musica_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (historico_id, musica_id, usuario_id),
	  FOREIGN KEY (musica_id) REFERENCES musicas(musica_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_tipo, valor)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('pessoal', 6.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.usuarios(usuario_nome, idade, data_assinatura, plano_id)
VALUES
  ('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin',58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 2),
  ('Martin Fowler', 46, '2017-01-17', 2),
  ('Sandi Metz', 58, '2018-04-29', 2),
  ('Paulo Freire', 19, '2018-02-14', 4),
  ('Bell Hooks', 26, '2018-01-05', 4),
  ('Christopher Alexander', 85, '2019-06-05', 3),
  ('Judith Butler', 45, '2020-05-13', 3),
  ('Jorge Amado', 58, '2017-02-17', 3);
  
  INSERT INTO SpotifyClone.artistas( artista_nome)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
  INSERT INTO SpotifyClone.albuns (album_nome, artista_id)
VALUES
  ('Renaissance', 1),
  ('Jazz', 2),
  ('Hot Space', 2),
  ('Falso Brilhante', 3),
  ('Vento de Maio', 3),
  ('QVVJFA?', 4),
  ('Somewhere Far Beyond', 5),
  ('I Put A Spell On You', 6);
     
  INSERT INTO SpotifyClone.seguidores(usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);
  
    INSERT INTO SpotifyClone.musicas(musica_nome, duracao_segundos, ano, artista_id, album_id)
VALUES
  ('BREAK MY SOUL', 279, 2022, 1, 1),
  ('VIRGO’S GROOVE', 369, 2022, 1, 1),
  ('ALIEN SUPERSTAR', 116, 2022, 1, 1),
  ('Don’t Stop Me Now', 203, 1978, 2, 2),
  ('Under Pressure', 152, 1982, 2, 3),
  ('Como Nossos Pais', 105, 1998, 3, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 3, 5), 
  ('Samba em Paris', 267, 2003, 4, 6),
  ('The Bard’s Song', 244, 2007, 5, 7),
  ('Feeling Good', 100, 2012, 6, 8);

  INSERT INTO SpotifyClone.historico_reproducao(musica_id, data_reproducao, usuario_id)
VALUES
  (8, '2022-02-28 10:45:55', 1),
  (2, '2020-05-02 05:30:35', 1),
  (10, '2020-03-06 11:22:33', 1),
  (10, '2022-08-05 08:05:17', 2),
  (7, '2020-01-02 07:40:33', 2),
  (10, '2020-11-13 16:55:13', 3),
  (2, '2020-12-05 18:38:30', 3),
  (8, '2021-08-15 17:10:10', 4),
  (5, '2022-01-09 01:44:33', 5),
  (8, '2020-08-06 15:23:43', 5),
  (7, '2017-01-24 00:31:17', 6),
  (1, '2017-10-12 12:35:20', 6),
  (4, '2011-12-15 22:30:49', 7),
  (4, '2012-03-17 14:56:41', 8),
  (9, '2022-02-24 21:14:22', 9),
  (3, '2015-12-13 08:30:22', 10);
