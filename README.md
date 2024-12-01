# Aplicativo de Biblioteca

Este é um aplicativo de biblioteca desenvolvido em Python, que permite aos usuários fazerem review e resenha de livros. Além disso, o aplicativo conta com um simples algoritmo de recomendação de Cosine Similarity usando a biblioteca scikit-learn. O aplicativo utiliza o padrão MVC (Model-View-Controller) para estruturar o código, o que ajuda a separar as responsabilidades de cada parte do sistema. Os livros foram inseridos no banco de dados através de uma API da openlibrary.org

## O que o Programa Faz

O aplicativo oferece as seguintes funcionalidades:

- **Cadastro de Livros**: Usuários administradores podem cadastrar novos livros na biblioteca, fornecendo informações como título, autor, editora e data de publicação, sinopse, ISBN e gênero.
- **Resenhas de Livros**: Usuários podem escrever e visualizar resenhas de livros, incluindo avaliações de 1 a 5 estrelas.

## Como Foi Feito

Este programa foi desenvolvido com as seguintes tecnologias:

- **Python**: Linguagem de programação utilizada para o desenvolvimento do sistema.
- **Flet**: Biblioteca usada para criar a interface gráfica do usuário (GUI). Flet permite criar interfaces de forma simples e interativa.
- **MySQL**: Sistema de banco de dados usado para armazenar os dados dos livros, usuários, reviews e gêneros.
- **Padrão MVC**: O código segue o padrão MVC (Model-View-Controller), o que significa que a lógica do programa é separada da interface e dos dados. Isso torna o código mais organizado e fácil de manter.
  
### Estrutura do Código

1. **Model**: Responsável pela interação com o banco de dados. Aqui, são feitas operações como cadastrar livros, adicionar resenhas e autentificação de usuário.
2. **View**: A interface gráfica foi criada com a biblioteca Flet. A view permite que os usuários vejam livros, escrevam resenhas e vejam recomendações de livros.
3. **Controller**: O controller gerencia a lógica do aplicativo, assimilando a view ao model, para melhor organização dos métodos.
