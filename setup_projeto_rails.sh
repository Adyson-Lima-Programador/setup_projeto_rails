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
    echo "${GREEN} api: $PROJETO criada com sucesso ${NEUTRO}"
else
    echo "${YELLOW} criando projeto: $PROJETO "
    if ! rails new $PROJETO -c bootstrap; then
        echo "${RED} erro ao criar projeto: $PROJETO ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} projeto: $PROJETO criado com sucesso ${NEUTRO}"    
fi
#############################################################################

###########################################################################
echo
echo "${YELLOW} configurando Gemfile ${NEUTRO}"
echo
rm -rf $PROJETO/Gemfile
if ! cp -a modelos_de_arquivos/fullstack/Gemfile $PROJETO; then
    echo "${RED} erro ao configurar Gemfile ${NEUTRO}"
    exit 1
fi
echo
echo "${GREEN} configuração do Gemfile executada com sucesso ${NEUTRO}"
############################################################################
