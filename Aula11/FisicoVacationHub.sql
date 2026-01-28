/* Lógico_1: */

CREATE TABLE usuario (
    ID_usuario bigint PRIMARY KEY,
    nome varchar (200),
    email varchar (200),
    instagram varchar (200),
    facebook varchar (200)
);

CREATE TABLE viagem (
    titulo VARCHAR (200),
    destino VARCHAR (200),
    data_inicio DATE,
    data_termino DATE,
    ID_viagem NUMERIC (9) PRIMARY KEY
);

CREATE TABLE local (
    nome varchar (200),
    endereco varchar (200),
    tipo varchar (200),
    ID_local bigint PRIMARY KEY
);

CREATE TABLE avaliacao_local_vai (
    nota smallint,
    comentario varchar (2000),
    ID_avaliacao bigint PRIMARY KEY,
    fk_local_ID_local bigint,
    fk_usuario_ID_usuario bigint
);

CREATE TABLE despesas (
    data date,
    hora timestamp,
    descricao varchar (2000),
    categoria varchar (200),
    valor bigint,
    ID_despesa bigint PRIMARY KEY,
    fk_local_ID_local bigint
);

CREATE TABLE E__Assoc__1_tem (
    fk_local_ID_local bigint,
    fk_viagem_ID_viagem bigint
);

CREATE TABLE faz (
    fk_Usuario_ID_usuario bigint,
    fk_Viagem_ID_viagem bigint
);
 
ALTER TABLE avaliacao_local_vai ADD CONSTRAINT FK_avaliacao_local_vai_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES Local (ID_local);
 
ALTER TABLE avaliacao_local_vai ADD CONSTRAINT FK_avaliacao_local_vai_3
    FOREIGN KEY (fk_usuario_ID_usuario)
    REFERENCES usuario (ID_usuario);
 
ALTER TABLE despesas ADD CONSTRAINT FK_despesas_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES Local (ID_local)
    ON DELETE RESTRICT;
 
ALTER TABLE E__Assoc__1_tem ADD CONSTRAINT FK_E__Assoc__1_tem_1
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES Local (ID_local);
 
ALTER TABLE E__Assoc__1_tem ADD CONSTRAINT FK_E__Assoc__1_tem_2
    FOREIGN KEY (fk_viagem_ID_viagem)
    REFERENCES viagem (ID_viagem);
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_1
    FOREIGN KEY (fk_usuario_ID_usuario)
    REFERENCES usuario (ID_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_2
    FOREIGN KEY (fk_viagem_ID_viagem)
    REFERENCES viagem (ID_viagem)
    ON DELETE RESTRICT;