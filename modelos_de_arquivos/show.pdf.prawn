# Para gerar um pdf, basta copiar este arquivo para a pasta das views do model desejado e
# criar em um template show, o link para a rota show com format pdf, como abaixo:
#<%= link_to 'Imprimir', algum_path(format: :pdf), target: "_blank",class: "btn btn-sm " %>

#prawn_document do |pdf|
  # Configura borda da página
  #pdf.bounding_box([0,750], :width => 520, :height => 750) do
    # Cor da borda da página em hexadecimal
    #pdf.stroke_color '088C7F'
    # Insere borda na página
    #pdf.stroke_bounds
    # Adiciona cabecalho com imagem
    #pdf.image "#{Rails.root}/app/assets/images/logo.png", :at => [10,745], :width => 80, #:height=> 80
    # Adiciona texto
    #pdf.draw_text "CONSULTA MÉDICA", :at => [210,670], :style => :bold
    # Adiciona espaço de 20px
    #pdf.move_down 20
    # Imprime data da consulta
    #pdf.draw_text "Data da consulta: #{@appointment.date}", :at => [10,650]
    # Pesquisa cliente pelo id
    #paciente = Customer.find(@appointment.customer_id)
    # Imprime nome do cliente
    #pdf.draw_text "Paciente: #{paciente.name}", :at => [10,630]
    # Pesquisa profissional pelo id
    #profissional = Professional.find(@appointment.professional_id)
    # Imprime nome do profissional
    #pdf.draw_text "Profissional: #{profissional.name}", :at => [10,610]
    # Imprime receita do cliente
    #pdf.text_box "Medicações:\n\n #{@medical_appointment.medical_prescription}", :at => [10,590], #:overflow => :shrink_to_fit
  #end  
#end
