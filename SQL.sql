DROP TABLE Emprestimo;
DROP TABLE Professor;
DROP TABLE Aluno;
DROP TABLE Pessoa;
DROP TABLE Obra;
DROP TABLE Autor;
DROP TABLE TipoDeObra;

CREATE TABLE TipoDeObra(
	codigo NUMERIC(10),
    descricao VARCHAR(200),
    
	CONSTRAINT pk_TipoDeObra PRIMARY KEY(codigo)
);

CREATE TABLE Autor(
    codigo NUMERIC(10),
    nome VARCHAR(200),

    CONSTRAINT pk_Autor PRIMARY KEY(codigo)
);

CREATE TABLE Obra(
    codigo NUMERIC(10),
    titulo VARCHAR(200),
    codigo_autor NUMERIC(10),
    num_paginas NUMERIC(10),
    codigo_TipoDeObra NUMERIC(10),

    CONSTRAINT pk_Obra PRIMARY KEY(codigo),
    CONSTRAINT fk_ObraAutor FOREIGN KEY(codigo_autor) REFERENCES Autor(codigo),
    CONSTRAINT fk_TipoDeObra FOREIGN KEY(codigo_TipoDeObra) REFERENCES TipoDeObra(codigo)
);

CREATE TABLE Pessoa(
    cpf NUMERIC(20),
    nome VARCHAR(200),
    email VARCHAR(200),
    telefone NUMERIC(20),
    genero VARCHAR(1),

    CONSTRAINT pk_Pessoa PRIMARY KEY(cpf),
    CONSTRAINT ck_Pessoa CHECK(genero in ('M','F'))
);

CREATE TABLE Professor(
    cpf_Professor NUMERIC(20),
    data_contratacao DATE NOT NULL,

	CONSTRAINT pk_Professor PRIMARY KEY(cpf_Professor),
    CONSTRAINT fk_Prof_pessoas FOREIGN KEY(cpf_Professor) REFERENCES Pessoa(cpf)
);

CREATE TABLE Aluno(
    cpf_Aluno NUMERIC(20),
    nro_matricula NUMERIC(20),
    nro_creditos NUMERIC(20),

    CONSTRAINT pk_Aluno PRIMARY KEY(cpf_Aluno),
    CONSTRAINT fk_Aluno_pessoas FOREIGN KEY(cpf_Aluno) REFERENCES Pessoa(cpf)
    
);

CREATE TABLE Emprestimo(
    id NUMERIC(20),
    cpf_Pessoa NUMERIC(20),
    codigo_Obra NUMERIC(20),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    


    CONSTRAINT pk_Emprestimo PRIMARY KEY(id),
    CONSTRAINT fk_Empr_pessoa FOREIGN KEY(cpf_Pessoa) REFERENCES Pessoa(cpf),
    CONSTRAINT fk_Empr_Obra FOREIGN KEY(codigo_Obra) REFERENCES Obra(codigo)
    
);


INSERT INTO TipoDeObra VALUES (1, 'Romance');
INSERT INTO TipoDeObra VALUES (2, 'Ficção Científica');
INSERT INTO TipoDeObra VALUES (3, 'Fantasia');


INSERT INTO Autor VALUES (1, 'George Orwell');
INSERT INTO Autor VALUES (2, 'Antoine de Saint-Exupéry');
INSERT INTO Autor VALUES (3, 'Jeff Kinney');
       

INSERT INTO Obra VALUES(2, 'O Pequeno Principe', 2, 96, 1);
INSERT INTO Obra VALUES(3, 'Revolução dos Bichos', 1, 152, 2);
INSERT INTO Obra VALUES(1, 'Diario de Um Banana', 3, 224, 3);


INSERT INTO Pessoa VALUES (12345678900, 'Bernardo', 'bernardo@gmail.com', 987654321, 'M');
INSERT INTO Pessoa VALUES (23456789012, 'Julia', 'julia@gmail.com', 876543210, 'F');
INSERT INTO Pessoa VALUES (34567890123, 'Tulio', 'tulio@gmail.com', 765432109, 'M');
INSERT INTO Pessoa VALUES (45678901234, 'Daniela', 'daniela@gmail.com', 654321098, 'F');
INSERT INTO Pessoa VALUES (56789012345, 'Maria', 'maria@gmail.com', 543210987, 'F');

INSERT INTO Professor VALUES(34567890123, to_date('2006-12-03','yyyy-mm-dd'));

INSERT INTO Aluno VALUES(12345678900, 22103098, 16);


INSERT INTO Emprestimo VALUES (1, 12345678900, 1, to_date('2023-05-01','yyyy-mm-dd'), to_date('2023-05-08','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (2, 23456789012, 2, to_date('2023-05-03','yyyy-mm-dd'), to_date('2023-05-10','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (3, 34567890123, 3, to_date('2023-05-05','yyyy-mm-dd'), to_date('2023-05-12','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (4, 45678901234, 1, to_date('2023-05-07','yyyy-mm-dd'), to_date('2023-05-14','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (5, 56789012345, 2, to_date('2023-05-09','yyyy-mm-dd'), to_date('2023-05-16','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (6, 12345678900, 3, to_date('2023-05-11','yyyy-mm-dd'), to_date('2023-05-18','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (7, 23456789012, 1, to_date('2023-05-13','yyyy-mm-dd'), to_date('2023-05-20','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (8, 34567890123, 2, to_date('2023-05-15','yyyy-mm-dd'), to_date('2023-05-22','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (9, 45678901234, 3, to_date('2023-05-17','yyyy-mm-dd'), to_date('2023-05-24','yyyy-mm-dd'));
INSERT INTO Emprestimo VALUES (10, 56789012345, 1, to_date('2023-05-19','yyyy-mm-dd'), to_date('2023-05-26','yyyy-mm-dd'));


-- SELECT 1

SELECT Obra.titulo FROM
Emprestimo 
JOIN Obra ON Emprestimo.codigo_obra = Obra.codigo
WHERE Obra.num_paginas > 100;

-- SELECT 2

SELECT AVG(Emprestimo.data_devolucao - Emprestimo.data_emprestimo) as media FROM 
Emprestimo 
JOIN Obra ON Obra.codigo = Emprestimo.codigo_obra
JOIN TipoDeObra ON TipoDeObra.codigo = Obra.codigo_TipoDeObra
WHERE TipoDeObra.descricao like '%Romance%';

-- SELECT 3 : Os titulos dos livros emprestados para Mulheres, mostrando o genero 

SELECT Obra.titulo as titulo, Pessoa.genero as genero
FROM Emprestimo
Join Pessoa ON Pessoa.cpf = Emprestimo.cpf_Pessoa
JOIN Obra ON Obra.codigo = Emprestimo.codigo_obra
WHERE Pessoa.genero = 'F';
