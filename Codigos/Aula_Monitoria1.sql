--Criação de tabelas n x n

CREATE TABLE aluno(
	id SERIAL PRIMARY KEY, --SERIAL: É um tipo incremental, ao usa-lo não é necessario inserir 				   
	nome TEXT,			   --id por id, ele automaticamente preenche o campo em ordem crescente.
	matricula char(3)
);

CREATE TABLE Turma(
	id INT PRIMARY KEY,
	nome TEXT,
	numero_sala INT
);

CREATE TABLE Aluno_Turma(
	id INT PRIMARY KEY,
	Fk_id_turma INT,
	Fk_id_Aluno INT,
	FOREIGN KEY(Fk_id_Aluno) REFERENCES aluno(id)ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(Fk_id_turma) REFERENCES turma(id)ON UPDATE CASCADE ON DELETE CASCADE
	--CASCADE: Ao apagar uma tabela, todas as informações dela que estavam em outras tabelas
	--tambem seram apagadas.
);


drop table turma;--Apaga a tabela;
select * from aluno;
select * from turma;
select * from Aluno_Turma;

--Insere informações na tabela com o campo id do tipo serial.
INSERT INTO aluno(nome,matricula) VALUES('vitinho','100');
INSERT INTO aluno(nome,matricula) VALUES('judi','170');
INSERT INTO aluno(nome,matricula) VALUES('Silvio','20');
INSERT INTO aluno(nome,matricula) VALUES('andre','135');


--Insere informações na tabela com o campo id do tipo int.
INSERT INTO turma VALUES(1,'algoritmo',2);
INSERT INTO turma VALUES(2,'BD',3);
INSERT INTO turma VALUES(3,'portugues',4);
INSERT INTO turma VALUES(4,'poo',10);
INSERT INTO turma VALUES(5,'estatistica',5);


INSERT INTO Aluno_Turma VALUES(1,1,1);
INSERT INTO Aluno_Turma VALUES(2,1,4);
INSERT INTO Aluno_Turma VALUES(3,4,3);
INSERT INTO Aluno_Turma VALUES(4,2,2);
INSERT INTO Aluno_Turma VALUES(5,2,3);
INSERT INTO Aluno_Turma VALUES(6,5,1);



SELECT A.nome, T.nome -- Campos a serem mostrados pela busca.
FROM aluno A, turma T, Aluno_Turma AT 
WHERE A.id = AT.Fk_id_Aluno AND
		T.id = AT.Fk_id_turma AND
		A.id = 1;

-- Na tabela 'nome' e 'turma' existe um campo com nomes iguais (campo nome), ao fazer uma busca pelo
-- nome do aluno e o nome da turma, deve-se atribuir uma variavel para essas tabelas para identificar
-- os campos ao fazer uma busca.

-- Select: <variavel>.<nome do campo>


