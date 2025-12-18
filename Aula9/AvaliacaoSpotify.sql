/* LogicoSpotify: */

CREATE TABLE Usuario (
    ID_usuario NUMERIC(9) PRIMARY KEY,
    Nome VARCHAR(250),
    Email VARCHAR(64),
    Senha VARCHAR(64),
    fk_Endereco_Endereco_PK VARCHAR(250),
    fk_Assinatura_ID_assinatura NUMERIC(9)
);

CREATE TABLE Conteudo (
    Data_lancamento DATE,
    Nome VARCHAR(250),
    ID_conteudo NUMERIC(9) PRIMARY KEY,
    feats VARCHAR(1000),
    fk_Genero_ID_genero NUMERIC(9),
    fk_Artista_ID_artista NUMERIC(9)
);

CREATE TABLE Artista (
    ID_artista NUMERIC(9) PRIMARY KEY,
    Nome VARCHAR(250),
    Pais_origem VARCHAR(250),
    Tipo_artista VARCHAR(250),
    Biografia VARCHAR(1000)
);

CREATE TABLE stream_Consome (
    tempo_reproducao TIME,
    fk_Usuario_ID_usuario NUMERIC(9),
    fk_Conteudo_ID_conteudo NUMERIC(9)
);

CREATE TABLE Playlist_Consumira (
    Quantidade_musicas NUMERIC(10),
    ID_playlist NUMERIC(9) PRIMARY KEY,
    fk_Usuario_ID_usuario NUMERIC(9),
    fk_Conteudo_ID_conteudo NUMERIC(9)
);

CREATE TABLE Historico_reproducao_Consumiu (
    Data DATE,
    ID_historico NUMERIC(9) PRIMARY KEY,
    fk_Usuario_ID_usuario NUMERIC(9),
    fk_Conteudo_ID_conteudo NUMERIC(9)
);

CREATE TABLE Assinatura (
    ID_assinatura NUMERIC(9) PRIMARY KEY,
    Data_assinatura DATE,
    CPF_usuario VARCHAR(11)
);

CREATE TABLE Gratuita (
    limites_pulos_musica NUMERIC(1),
    fk_Assinatura_ID_assinatura NUMERIC(9) PRIMARY KEY
);

CREATE TABLE Premium (
    Mensalidade NUMERIC(9),
    numero_dipositivos NUMERIC(1),
    fk_Assinatura_ID_assinatura NUMERIC(9) PRIMARY KEY
);

CREATE TABLE Musica (
    Duracao TIME,
    Album VARCHAR(250),
    fk_Conteudo_ID_conteudo NUMERIC(9) PRIMARY KEY
);

CREATE TABLE Album (
    Quantidade_musicas NUMERIC(9)
);

CREATE TABLE Genero (
    ID_genero NUMERIC(9) PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Endereco (
    Endereco_PK VARCHAR(250) NOT NULL PRIMARY KEY,
    Rua VARCHAR(250),
    Cidade VARCHAR(250),
    Estado VARCHAR(250),
    Pais VARCHAR(250),
    CEP NUMERIC(9)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco (Endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_3
    FOREIGN KEY (fk_Assinatura_ID_assinatura)
    REFERENCES Assinatura (ID_assinatura)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Genero_ID_genero)
    REFERENCES Genero (ID_genero)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_3
    FOREIGN KEY (fk_Artista_ID_artista)
    REFERENCES Artista (ID_artista)
    ON DELETE RESTRICT;
 
ALTER TABLE stream_Consome ADD CONSTRAINT FK_stream_Consome_1
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario);
 
ALTER TABLE stream_Consome ADD CONSTRAINT FK_stream_Consome_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo);
 
ALTER TABLE Playlist_Consumira ADD CONSTRAINT FK_Playlist_Consumira_2
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario);
 
ALTER TABLE Playlist_Consumira ADD CONSTRAINT FK_Playlist_Consumira_3
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo);
 
ALTER TABLE Historico_reproducao_Consumiu ADD CONSTRAINT FK_Historico_reproducao_Consumiu_2
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario);
 
ALTER TABLE Historico_reproducao_Consumiu ADD CONSTRAINT FK_Historico_reproducao_Consumiu_3
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo);
 
ALTER TABLE Gratuita ADD CONSTRAINT FK_Gratuita_2
    FOREIGN KEY (fk_Assinatura_ID_assinatura)
    REFERENCES Assinatura (ID_assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_2
    FOREIGN KEY (fk_Assinatura_ID_assinatura)
    REFERENCES Assinatura (ID_assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo)
    ON DELETE CASCADE;