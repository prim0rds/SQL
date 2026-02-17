--EXERCICIOS
-- 1. Retornar os nomes de livro, preços e data de publicações
SELECT NomeLivro, PreçoLivro, DataPub
FROM Livro;

-- 2. Monstrar apenas os sobrenomes dos autores
SELECT SobrenomeAutor 
FROM Autor;

-- 3. Retornar a lista de assuntos
SELECT NomeAssunto 
FROM Assunto;

/* 4. Mostrar a lista de editoras com os IDs de cada uma,
com a coluna de nomes de editoras a esquerda da coluna IDs.
*/
SELECT NomeEditora, IdEditora
FROM Editora;

/* 5. Mostrar os IDs de assuntos dos quais existem livros
cadastrados na tabela de livros, sem repetição
*/
SELECT IdAssunto
FROM Livro;

SELECT DISTINCT IdAssunto
FROM Livro;

/* 6. Criar uma nova tabela chamada "LivrosFiccao" que
contenha todos os dados dos livros relacionados ao assunto ID 1
*/ 
SELECT *
INTO LivrosFiccao
FROM Livro
WHERE IdAssunto = 1;

SELECT * FROM LivrosFiccao;
DROP TABLE LivrosFiccao;