#!/bin/bash

## Configura cores nas mensagens ;)
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NEUTRO='\033[0m'

############################################################################
echo -n "${YELLOW} Digite o nome do projeto: ${NEUTRO}"
read PROJETO
echo -n "${YELLOW} O projeto é uma API? [digite s para sim ou n para não]: ${NEUTRO}"
read TIPO
if [ $TIPO = "s" ]; then
    echo "${YELLOW} criando api: $PROJETO "
    if ! rails new $PROJETO --api; then
        echo "${RED} erro ao criar api: $PROJETO ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} api: [$PROJETO] criada com sucesso ${NEUTRO}"
else
    echo "${YELLOW} criando projeto: $PROJETO "
    if ! rails new $PROJETO -c bootstrap; then
        echo "${RED} erro ao criar projeto: $PROJETO ${NEUTRO}"
        exit 1
    fi
    cd $PROJETO
    mkdir documentacao
    cd ..
    cp -a modelos_de_arquivos/documentacao.txt $PROJETO/documentacao
    ###########################################################################
    echo "${YELLOW} configurando Gemfile ${NEUTRO}"
    rm -rf $PROJETO/Gemfile
    if ! cp -a modelos_de_arquivos/fullstack/Gemfile $PROJETO; then
        echo "${RED} erro ao configurar Gemfile ${NEUTRO}"
        exit 1
    fi
    cd $PROJETO
    bundle install
    cd ..
    echo "${GREEN} configuração do Gemfile executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando css ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/fullstack/templates_bootstrap/css/*.css $PROJETO/app/assets/stylesheets; then
        echo "${RED} erro ao configurar css ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do css executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando manifest.js ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/fullstack/templates_bootstrap/js/*.js $PROJETO/app/assets/config; then
        echo "${RED} erro ao configurar manifest.js ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do manifest.js executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando application.html.erb ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/fullstack/templates_bootstrap/application.html.erb $PROJETO/app/views/layouts; then
        echo "${RED} erro ao configurar application.html.erb ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do application.html.erb executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando partial _navbar.html.erb ${NEUTRO}"
    mkdir $PROJETO/app/views/shared
    if ! cp -a modelos_de_arquivos/fullstack/templates_bootstrap/_navbar.html.erb $PROJETO/app/views/shared; then
        echo "${RED} erro ao configurar partial _navbar.html.erb ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração da partial _navbar.html.erb executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando database.yml ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/database.yml $PROJETO/config; then
        echo "${RED} erro ao configurar database.yml ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do database.yml executado com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando rspec ${NEUTRO}"
    cd $PROJETO
    rm -rf test
    if ! rails generate rspec:install; then
        echo "${RED} erro ao configurar rspec ${NEUTRO}"
        exit 1
    fi
    cd ..
    cp -a modelos_de_arquivos/rspec.txt $PROJETO/.rspec
    cp -a modelos_de_arquivos/application.rb $PROJETO/config
    cd $PROJETO
    rspec
    cd ..
    echo "${GREEN} configuração do rspec executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando seeds.rb ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/seeds.rb $PROJETO/db; then
        echo "${RED} erro ao configurar seeds.rb ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do seeds.rb executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando I18n ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/pt-BR.yml $PROJETO/config/locales; then
        echo "${RED} erro ao configurar I18n ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do I18n executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando PRAWN ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/show.pdf.prawn $PROJETO/app/views; then
        echo "${RED} erro ao configurar PRAWN ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do PRAWN executada com sucesso ${NEUTRO}"
    ############################################################################
    # echo "${YELLOW} configurando GRUFF ${NEUTRO}"
    # if ! cp -a modelos_de_arquivos/pt-BR.yml $PROJETO/config/locales; then
    #     echo "${RED} erro ao configurar GRUFF ${NEUTRO}"
    #     exit 1
    # fi
    # echo "${GREEN} configuração do GRUFF executada com sucesso ${NEUTRO}"
    ############################################################################
    # echo "${YELLOW} configurando TWILIO SMS ${NEUTRO}"
    # if ! cp -a modelos_de_arquivos/pt-BR.yml $PROJETO/config/locales; then
    #     echo "${RED} erro ao configurar TWILIO SMS ${NEUTRO}"
    #     exit 1
    # fi
    # echo "${GREEN} configuração do TWILIO SMS executada com sucesso ${NEUTRO}"
    ############################################################################
    # echo "${YELLOW} configurando ACTION MAILER ${NEUTRO}"
    # if ! cp -a modelos_de_arquivos/pt-BR.yml $PROJETO/config/locales; then
    #     echo "${RED} erro ao configurar ACTION MAILER ${NEUTRO}"
    #     exit 1
    # fi
    # echo "${GREEN} configuração do ACTION MAILER executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando pagina inicial ${NEUTRO}"
    cd $PROJETO
    if ! rails g controller home index; then
        echo "${RED} erro ao configurar pagina inicial ${NEUTRO}"
        exit 1
    fi
    cd ..
    cp -a modelos_de_arquivos/fullstack/routes.rb $PROJETO/config
    echo "${GREEN} configuração da página inicial executada com sucesso ${NEUTRO}"
    ############################################################################
    echo
    echo "${GREEN} projeto: [$PROJETO] criado com sucesso ${NEUTRO}"
fi
#############################################################################
