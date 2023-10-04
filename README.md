# Banco-de-Dados-II

## Universo de Discurso
+ Uma pequena escola precisa gerenciar os empréstimos de obras de sua biblioteca. Cada obra é classificada
como sendo de um tipo específico (livro, revista, artigo, material especial), tem um título, possui pelo menos
um autor e tem também a informação do número de páginas. Professores e alunos podem realizar
empréstimos das obras e, para isso, deve-se registrar a data do empréstimo e a data prevista da devolução
da obra. Professores podem retirar uma obra por até 14 dias e alunos, por até 7 dias. Dos professores é
necessário armazenar a sua data de contratação; e para os alunos deseja-se saber seu número de matrícula
bem como o número de créditos até então concluídos.

## TAREFAS
- [x] TAREFA I – Modelo Conceitual (1 pt)
• Localize o arquivo BrModelo fornecido com este enunciado.
• Renomeie o arquivo com o seu nome.
• Abra o arquivo no BrModelo
• Acrescente ao modelo pelo menos mais um atributo qualquer à sua escolha, e que faça sentido
neste contexto.
- [x]  TAREFA II – Modelos Relacional e Físico para Oracle (1 pt)
• No BrModelo, gere o esquema relacional equivalente para bancos de dados Oracle.
• Escolha tipos de dados adequados.
• Gere o script SQL e o execute em uma instância Oracle.
• Acrescente comandos para garantia de integridade dos dados (identidade, domínio e referencial).
- [x]  TAREFA III – Objetos/Instâncias (2 pts)
• Elabore dados de instâncias de objetos/registros para o modelo gerado.
o Pelo menos 03 obras, 05 pessoas e 10 empréstimos.
o Elabore dados próximos da realidade (não utilizar 'Pessoa A', 'Pessoa B' etc).
o Acrescente seus próprios dados como um aluno.
o As instâncias devem ser distribuídas entre as entidades existentes. Todas as entidades
devem possuir instâncias.
• Escreva os comandos SQL para inserir os registos no banco de dados Oracle.
- [x]  TAREFA IV – Modelo Não-relacional (4 pts)
• Elabore um esquema não-relacional equivalente, para ser utilizado no MongoDB Atlas, que
represente a perspectiva dos dados dos empréstimos.
• Atenção: Crie apenas uma coleção para todo o conjunto de dados do trabalho.
• Utilizando apenas aninhamentos, represente os dados dos empréstimos em JSON de forma que
fique equivalente ao modelo relacional e aos dados que você definiu nas tarefas anteriores.
• Dica: utilize o verificador de JSON disponível no card Referências e Materiais no Moodle.
• Carregue os dados para a sua instância do MongoDB Atlas.
- [x]  TAREFA V – Consultas (2 pts)
• Escrever comandos SELECT para o banco Oracle e comandos MongoDB para:
a) (0,5) Os títulos dos “livros” emprestados que tenham mais de 100 páginas;
b) (1,0) O tempo médio de empréstimo das obras do tipo “revista”;
c) (0,5) (uma outra consulta à sua escolha; definir também o enunciado em português)
