 # Bem vindo(a) ao Setup_Projeto_Rails

### Autor

Adyson Lima. <a href="https://www.linkedin.com/in/adyson-lima-programador/">Meu LinkedIn</a> 

### Sobre o projeto

Este é um shell script que **cria** e **configura** projetos de API's e projetos fullstack em Ruby on Rails 7.

### Recursos para aplicações fullstack
- [X] Cria projeto
- [X] Configura Gemfile
- [X] Configura projeto para deploy no Heroku
- [X] Configura template base com Bootstrap
- [X] Cria modelo para o seeds.rb
- [X] Configura o RSPEC, I18n, PRAWN, GRUFF, Twilio SMS

### Recursos para aplicações API
- [X] Cria projeto
- [X] Configura Gemfile
- [X] Configura projeto para deploy no Heroku
- [X] Cria modelo para o seeds.rb
- [X] Configura o RSPEC, JWT, RACK-ATTACK, RACK-CORS, Twilio SMS

### Layout da execução
<img src="https://github.com/Adyson-Lima-Programador/setup_projeto_rails/blob/main/imagens/appgif.gif" alt="setup.png"/>

### Tecnologias utilizadas

- shell script

## Como executar o projeto

```bash
# clonar repositório
git clone git@github.com:Adyson-Lima-Programador/setup_projeto_rails.git

# entrar na pasta setup_projeto_rails
cd setup_projeto_rails

# executar o script
sh setup_projeto_rails.sh

# Depois de criar o projeto, editar o nome no modulo em config/application.rb para o nome do projeto, seguindo o padrão:
# A inicial e cada inicial depois de underline são escritas em maiúsculo, exemplo:
# rails new meu_novo_projeto -- api
# deve ser feita a edição para: MeuNovoProjeto 

```



