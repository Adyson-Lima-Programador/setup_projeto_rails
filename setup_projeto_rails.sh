#!/bin/bash

## Configura cores nas mensagens ;)
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[0;31m'
NEUTRO='\033[0m'

############################################################################
echo "${YELLOW} Digite o nome do projeto: ${NEUTRO}"
read PROJETO
echo "${YELLOW} O projeto é uma API? digite s para sim ou n para não ${NEUTRO}"
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
    echo "${GREEN} projeto: [$PROJETO] criado com sucesso ${NEUTRO}"    
fi
#############################################################################

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