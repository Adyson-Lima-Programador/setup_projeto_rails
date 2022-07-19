# Este é um modelo para envio de sms

#require 'twilio-ruby'

#account_sid e auth_token salvos em config/credentials.yml.enc
#JUNTOS COM O TWILIO NUMBER DISPONIBILIZADO PELO TWILIO 
#para editar config/credentials.yml.enc, napasta config, use o comando
#EDITOR=nano rails credentials:edit

#class SendSms
  #attr_reader :message, :number

  #def initialize(message, number)
    #@message = message
    #@number = number
  #end

  #def call
    #account_sid = Rails.application.credentials.twilio_account_sid
    #auth_token = Rails.application.credentials.twilio_account_token
    #client = Twilio::REST::Client.new(account_sid, auth_token)

    #from = Rails.application.credentials.twilio_phone_number # Número Twilio 
    #to = "+#{@number}" # Número que receberá o SMS, vindo do controller   

    #client.messages.create(
    #from: from,
    #to: to,
    #body: @message # Mensagem vinda do Controller após salvar/editar usuário
    #)
  #end

#end



