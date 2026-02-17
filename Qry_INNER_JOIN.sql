-- EXERCÍCIOS SQL INNER JOIN

/* 1. Escreva uma consulta que retorne os nomes dos livros
e suas respectivos assuntos.*/

SELECT L.NomeLivro Livro, A.NomeAssunto Assunto
FROM Livro L
 INNER JOIN Assunto A 
 ON L.IdAssunto = A.IdAssunto;

/* 2. Precisamos descobrir os nomes e sobrenomes dos autores,
livros escritos por eles e os assuntos dos livros.*/

SELECT 
  AU.NomeAutor 'Nome Autor', 
  AU.SobrenomeAutor 'Sobrenome do Autor',
  L.NomeLivro Livro, 
  A.NomeAssunto Assunto
FROM Autor AU
 INNER JOIN LivroAutor LA ON AU.IdAutor = LA.IdAutor
 INNER JOIN Livro L ON LA.IdLivro = L.IdLivro 
 INNER JOIN Assunto A ON L.IdAssunto = A.IdAssunto;

/* 3. Escreva uma consulta que retorne os nomes dos livros,
seus preços, a editora e o assunto, em ordem alfabética de
nomes de livros.*/

SELECT 
 L.NomeLivro 'Nome Livro', 
 L.PreçoLivro Preço, 
 E.NomeEditora Editora, 
 A.NomeAssunto Assunto
FROM Livro L
 INNER JOIN Editora E ON L.IdEditora = E.IdEditora 
 INNER JOIN Assunto A ON L.IdAssunto = A.IdAssunto
ORDER BY L.NomeLivro;


/* 4. Retornar os nomes de livros e datas de publicação dos
livros cujo sobrenome do autor se inicia com a letra B.*/

SELECT L.NomeLivro Livro, L.DataPub 'Data de Publicação', 
       AU.SobrenomeAutor
FROM Livro L
 INNER JOIN LivroAutor LA ON L.IdLivro = LA.IdLivro
 INNER JOIN Autor AU ON LA.IdAutor = AU.IdAutor 
 WHERE AU.SobrenomeAutor LIKE 'B%';

/* 5. Retornar os assuntos e sobrenomes de autores de livros
que custam mais do que R$ 80,00.*/

SELECT NomeAssunto, SobrenomeAutor, PreçoLivro
FROM Livro 
 JOIN LivroAutor
 ON Livro.IdLivro = LivroAutor.IdLivro
 JOIN Autor 
 ON LivroAutor.IdAutor = Autor.IdAutor
 JOIN Assunto
 ON Livro.IdAssunto = Assunto.IdAssunto
 WHERE Livro.PreçoLivro > 10.00;

/* 6. Consultar preços, assuntos e nomes dos livros que custam
entre R$ 70,00 e R$ 170,00, ordenando do mais cara para o mais barato.*/

SELECT 
 PreçoLivro, NomeAssunto, NomeLivro 
FROM Livro 
 INNER JOIN Assunto 
 ON Livro.IdAssunto = Assunto.IdAssunto
 INNER JOIN LivroAutor 
 ON Livro.IdLivro = LivroAutor.IdLivro
WHERE Livro.PreçoLivro BETWEEN 70.00 AND 170.00
ORDER BY Livro.PreçoLivro DESC;



