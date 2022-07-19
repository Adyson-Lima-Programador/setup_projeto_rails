# Este é um modelo para criação de um grafico para uma aplicação de clinicas médicas
# que pode ser adaptado para outras necessidades.
# Para exibir o gráfico no template, basta exibir a imagem gerada na instrução:
# g.write("#{Rails.root}/app/assets/images/charts/consultas.png")

#require 'gruff'

#class Charts

  #attr_reader :consultas, :retornos, :clientes, :clientes18

  #def initialize(consultas, retornos, clientes, clientes18)
    #@consultas = consultas
    #@retornos = retornos

    #@clientes = clientes
    #@clientes18 = clientes18
  #end

  #def gerar_grafico_consultas
    #g = Gruff::Pie.new
    #g.title = 'Gráfico consultas/retornos'
    #g.theme = Gruff::Themes::PASTEL
    
    #g.data(:Consultas, [@consultas])
    #g.data(:Retornos, [@retornos])

    #g.write("#{Rails.root}/app/assets/images/charts/consultas.png")
        
  #end

#end
