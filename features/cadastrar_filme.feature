Feature: Cadastrar filme 
As um usuário 
I want to cadastar um novo filme na plataforma
So that eu possa aumentar o catálogo de filmes do sistema.

    Scenario: Cadastro bem-sucedido
    Given eu estou logado com o usuário "fulano123" no formato "usuario-comum"
    And eu estou no "formulário de cadastro de filmes"
    When eu preencho as informações de nome: "Harry Potter", data de lançamento: "1998", Descrição do filme: "Descrição"
    And não existe nenhum filme já cadastrado no sistema com nome "Harry Potter".
    And eu submeto o formulário 
    Then eu recebo um alerta na tela informando que o cadastro foi bem sucedido
    And sou direcionada para a tela inicial da plataforma.

    Scenario: Cadastro de filme já existente na plataforma
    Given eu estou logado com o usuário "fulano123" no formato "usuario-comum"
    And eu estou no "formulário de cadastro de filmes"
    When eu preencho as informações de nome: "Harry Potter e a pedra filosofal", data de lançamento: "1998", Descrição do filme: "Descrição"
    And já existe um filme cadastrado na plataforma com o nome "Harry Potter e a pedra filosofal"
    And eu submeto o formulário
    Then eu recebo um alerta que o filme "Harry Potter e a pedra filosofal" já foi cadastrado no sistema e não pode ser colocado novamente
    And o formulário é limpo.

    Scenario: Cadastrar filme sem preencher corretamente algum campo obrigatório do formulário
    Given eu estou logado com o usuário "fulano123" no formato "usuario-comum"
    And eu estou no "formulário de cadastro de filmes"
    When eu preencho as informações de data de lançamento: "1998", Descrição do filme: "Descrição"
    And não preencho o campo de "Nome" do filme
    And eu submeto o formulário
    Then eu recebo um alerta informando o campo em questão não preenchido.
    And o formulário é recarregado com as informações salvas até o momento.

    Scenario: O usuário fechou o cadastro de filmes antes de submeter as informações
    Given eu estou logado com o usuário "fulano123" no formato "usuario-comum"
    And eu estou no "formulário de cadastro de filmes"
    When eu preencho as informações de nome: "Harry Potter", data de lançamento: "1998", Descrição do filme: "Descrição"
    And eu saio do formulário de cadastro de filmes
    Then as informações até então digitadas não ficam salvas
    And eu preciso voltar para o "O formulário de cadastro de filmes"
    And escrever as informações de "Nome", "Data de lançamento" e "Descrição" novamente.
    Then subemter o formulário novamente.