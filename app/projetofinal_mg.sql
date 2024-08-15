CREATE DATABASE projetofinal_mg;

USE projetofinal_mg;
-- DDL

CREATE TABLE aluno(
	id INT PRIMARY KEY AUTO_INCREMENT,
    ra CHAR(8) NOT NULL UNIQUE
);
-- DML
INSERT INTO aluno(ra) VALUES ('12345678');
INSERT INTO aluno(ra) VALUES ('23456789');
INSERT INTO aluno(ra) VALUES ('34567890');
INSERT INTO aluno(ra) VALUES ('45678901');
INSERT INTO aluno(ra) VALUES ('56789012');
INSERT INTO aluno(ra) VALUES ('67890123');
INSERT INTO aluno(ra) VALUES ('78901234');
INSERT INTO aluno(ra) VALUES ('89012345');
INSERT INTO aluno(ra) VALUES ('90123456');
INSERT INTO aluno(ra) VALUES ('01234567');
INSERT INTO aluno(ra) VALUES ('54321098');
INSERT INTO aluno(ra) VALUES ('65432109');
INSERT INTO aluno(ra) VALUES ('76543210');
INSERT INTO aluno(ra) VALUES ('87654321');
INSERT INTO aluno(ra) VALUES ('98765432');
INSERT INTO aluno(ra) VALUES ('09876543');
INSERT INTO aluno(ra) VALUES ('98765432');
INSERT INTO aluno(ra) VALUES ('87654321');
INSERT INTO aluno(ra) VALUES ('76543210');
INSERT INTO aluno(ra) VALUES ('65432109');
INSERT INTO aluno(ra) VALUES ('54321098');
INSERT INTO aluno(ra) VALUES ('01234567');
INSERT INTO aluno(ra) VALUES ('90123456');
INSERT INTO aluno(ra) VALUES ('89012345');
INSERT INTO aluno(ra) VALUES ('78901234');
INSERT INTO aluno(ra) VALUES ('67890123');

-- DQL
SELECT * FROM aluno;
SHOW TABLES;

CREATE TABLE diariobordo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT NOT NULL,
    datahora DATETIME NOT NULL,
    fk_aluno_id INT NOT NULL
);

ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;

SELECT * FROM diariobordo;
    
-- Exercício
-- Modelo Conceitual - crie uma nova entidade chamada avaliacao(id pk, nota1 int,nota2 int, nota3 int, nota4 int, fk_aluno_id).
-- Modelo Logico
-- Modelo Físico
-- INSERT de 5 alunos com as notas.
-- SELECT * FROM avaliacao;
-- SELECT JOIN: tabela aluno com tabela avaliação.

CREATE TABLE avaliacao(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nota1 FLOAT NOT NULL,
    nota2 FLOAT NOT NULL,
    nota3 FLOAT NOT NULL,
    nota4 FLOAT NOT NULL,
    fk_aluno_id INT NOT NULL
);

ALTER TABLE avaliacao 
MODIFY nota1 INT NOT NULL,
MODIFY nota2 INT NOT NULL,
MODIFY nota3 INT NOT NULL,
MODIFY nota4 INT NOT NULL;
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;
    
ALTER TABLE avaliacao
ADD CONSTRAINT CHECK(nota1<=25),
ADD CONSTRAINT CHECK(nota2<=25),
ADD CONSTRAINT CHECK(nota3<=25),
ADD CONSTRAINT CHECK(nota4<=25);


ALTER TABLE aluno ADD COLUMN nome VARCHAR(80);
ALTER TABLE aluno ADD COLUMN tempoestudo INT NOT NULL;
ALTER TABLE aluno ADD COLUMN rendafamiliar DECIMAL(10, 2);

DESCRIBE aluno;


INSERT diariobordo(
texto,
datahora,
fk_aluno_id
)
VALUES('a aula foi legal','2024-08-01 09:16:05', 13);
    
INSERT INTO avaliacao(nota1,nota2,nota3,nota4,fk_aluno_id)VALUE(5,7,8,7,13);

INSERT diariobordo(
texto,
datahora,
fk_aluno_id
)
VALUES('Bem legal!','2024-08-07 11:14:05', 55);
    
INSERT INTO avaliacao(nota1,nota2,nota3,nota4,fk_aluno_id)VALUE(25,20,8,7,55);

INSERT diariobordo(
texto,
datahora,
fk_aluno_id
)
VALUES('Bem doido!','2024-08-07 11:14:05', 55);
    
INSERT INTO avaliacao(nota1,nota2,nota3,nota4,fk_aluno_id)VALUE(25,20,10,7,56);


INSERT diariobordo(
texto,
datahora,
fk_aluno_id
)
VALUES('também foi legal','2024-08-01 11:43:05', 10);

INSERT INTO avaliacao(nota1,nota2,nota3,nota4,fk_aluno_id)VALUE(15,20,8,7,10);



SELECT aluno.ra,
avaliacao.nota1,
avaliacao.nota2,
avaliacao.nota3,
avaliacao.nota4,
diariobordo.texto,
diariobordo.datahora
FROM aluno
INNER JOIN avaliacao
ON aluno.id = avaliacao.fk_aluno_id
INNER JOIN diariobordo
ON aluno.id = diariobordo.fk_aluno_id;

-- Desafio: Faça um insert considerando a sequência do último RA inserido
-- + 50 aluno com todos os dados agora. 

SELECT * FROM aluno;

INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365400','James Bond Silva','50','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365401','Ana Clara Santos','30','1500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365402','Pedro Henrique Oliveira','45','2500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365403','Luana Ribeiro','60','3000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365404','Carlos Eduardo Lima','20','1800');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365405','Mariana Gomes','55','2200');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365406','Gabriel Martins','40','1700');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365407','Fernanda Almeida','35','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365408','Ricardo Souza','50','2300');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365409','Juliana Costa','25','1600');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365410','Tiago Ferreira','45','2900');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365411','Aline Mendes','70','3100');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365412','André Luiz','15','1400');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365413','Beatriz Santos','60','2800');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365414','Lucas Rocha','50','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365415','Carla Dias','40','1900');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365416','Roberto Silva','30','1600');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365417','Sofia Pires','55','2500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365418','Eduardo Gomes','45','2200');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365419','Natália Lima','65','2900');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365420','Felipe Almeida','25','1800');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365421','Lívia Costa','35','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365422','Rafael Ferreira','50','3000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365423','Letícia Martins','40','2100');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365424','Thiago Santos','15','1500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365425','Gabriela Mendes','60','2800');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365426','Murilo Rodrigues','55','2200');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365427','Camila Dias','45','2700');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365428','Vinícius Lima','30','1900');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365429','Alice Costa','65','3500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365430','Fernando Almeida','20','1600');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365431','Julia Santos','50','3000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365432','Leonardo Silva','35','1800');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365433','Tatiane Ferreira','60','2900');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365434','Danilo Gomes','15','1400');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365435','Rafaela Almeida','70','3200');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365436','Samuel Oliveira','40','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365437','Priscila Rocha','50','2300');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365438','João Pedro Santos','25','1700');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365439','Vanessa Mendes','45','2500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365440','Marcos Silva','60','3000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365441','Sabrina Costa','35','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365442','Júlio Ferreira','15','1400');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365443','Michele Santos','55','2400');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365444','Felipe Martins','70','3500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365445','Tamires Lima','60','2800');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365446','Otávio Gomes','30','1500');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365447','Flávia Almeida','50','2300');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365448','Igor Rodrigues','45','2200');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365449','Cynthia Dias','35','2000');
INSERT INTO aluno(ra,nome,tempoestudo,rendafamiliar) VALUES('12365450','Rogério Santos','20','1700');
