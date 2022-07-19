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
    cd $PROJETO
    mkdir documentacao
    cd ..
    cp -a modelos_de_arquivos/documentacao.txt $PROJETO/documentacao
    ###########################################################################
    echo "${YELLOW} configurando Gemfile ${NEUTRO}"
    rm -rf $PROJETO/Gemfile
    if ! cp -a modelos_de_arquivos/api/Gemfile $PROJETO; then
        echo "${RED} erro ao configurar Gemfile ${NEUTRO}"
        exit 1
    fi
    cd $PROJETO
    bundle install
    cd ..
    echo "${GREEN} configuração do Gemfile executada com sucesso ${NEUTRO}"
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
    cp -a modelos_de_arquivos/api/application.rb $PROJETO/config
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
    echo "${YELLOW} configurando JWT ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/api/application_controller.rb $PROJETO/app/controllers; then
        echo "${RED} erro ao configurar JWT ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do JWT executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando TWILIO SMS ${NEUTRO}"
    cd $PROJETO/app
    mkdir services
    cd ..
    cd ..
    if ! cp -a modelos_de_arquivos/sms_twilio/send_sms.rb $PROJETO/app/services | cp -a modelos_de_arquivos/sms_twilio/modelo_sms_controller.rb $PROJETO/app/controllers; then
        echo "${RED} erro ao configurar TWILIO SMS ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do TWILIO SMS executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando RACK-CORS ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/api/cors.rb $PROJETO/config/initializers; then
        echo "${RED} erro ao configurar RACK-CORS ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do RACK-CORS executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando RACK-ATTACK ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/api/rack_attack.rb $PROJETO/config/initializers; then
        echo "${RED} erro ao configurar RACK-ATTACK ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do RACK-ATTACK executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${GREEN} api: [$PROJETO] criada com sucesso ${NEUTRO}"
    ######################## Fim da Configuração da API ########################
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
    cp -a modelos_de_arquivos/fullstack/application.rb $PROJETO/config
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
    if ! cp -a modelos_de_arquivos/fullstack/pt-BR.yml $PROJETO/config/locales; then
        echo "${RED} erro ao configurar I18n ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do I18n executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando PRAWN ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/fullstack/show.pdf.prawn $PROJETO/app/views; then
        echo "${RED} erro ao configurar PRAWN ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do PRAWN executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando GRUFF ${NEUTRO}"
    cd $PROJETO/app
    mkdir services
    cd ..
    cd ..
    if ! cp -a modelos_de_arquivos/fullstack/graficos/charts.rb $PROJETO/app/services | cp -a modelos_de_arquivos/fullstack/graficos/chart_controller.rb $PROJETO/app/controllers | cp -a modelos_de_arquivos/fullstack/graficos/chart.html.erb $PROJETO/app/views; then
        echo "${RED} erro ao configurar GRUFF ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do GRUFF executada com sucesso ${NEUTRO}"
    ############################################################################
    echo "${YELLOW} configurando TWILIO SMS ${NEUTRO}"
    if ! cp -a modelos_de_arquivos/sms_twilio/send_sms.rb $PROJETO/app/services | cp -a modelos_de_arquivos/sms_twilio/modelo_sms_controller.rb $PROJETO/app/controllers; then
        echo "${RED} erro ao configurar TWILIO SMS ${NEUTRO}"
        exit 1
    fi
    echo "${GREEN} configuração do TWILIO SMS executada com sucesso ${NEUTRO}"
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
