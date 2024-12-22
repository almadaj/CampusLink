# CampusLink

Wait... There's a software being built

## Tecnologias Usadas
* Ruby on Rails
* PostgreSQL
* Docker
* Node.js
* React, ver [Front-End](https://github.com/almadaj/view4rails)

## Pré-requisitos
* Ruby 3.3.6
* Ruby on Rails 8.0.0
* PostgreSQL
* Docker (opcional)


1. **Instalar dependências**

   - Para instalar as dependências do Ruby, execute:
     ```bash
     bundle install
     ```

2. **Configuração do Banco de Dados**

   - Crie o banco de dados e rode as migrations com o seguinte comando:
     ```bash
     rails db:create
     rails db:migrate
     rails db:seed
     ```
3. **Configuração do Banco de Dados com Docker (opcional)**

   - Crie o banco de dados e rode as migrations com o seguinte comando:
     ```bash
        docker run --name campuslink_dev -e POSTGRES_PASSWORD=(SUASENHA) -e POSTGRES_DB=campuslink_dev -p 5432:5432 -d postgres
     ```

4. **Configurações de Variáveis de Ambiente**

   - Insira suas credenciais em:
     ```bash
        config/database.yml
     ```

5. **Rodando o Projeto**

   - Inicie o Servidor Rails:
     ```bash
        rails s
     ```

   - Acessar aplicação:
     ```bash
        http://localhost:3000
     ```

