require 'pry'
class PoliticoPresenter < SimpleDelegator
  attr_reader :politicos

  def initialize(politicos)
    @politicos = politicos
  end

  def ordena_por(ordem)
    valor_despesa if ordem == "valor"
    alfabetica if ordem == "alfabetica"
  end

  def valor_despesa
    array = []
    ordenado = @politicos.sort_by {|a| -a.despesas.first.valor_liquido}
    ordenado.each do |politico|
      array << [politico.id_cadastro,
                politico.nome,
                politico.sgpartido,
                politico.despesas.first.valor_liquido]
    end
    array
  end

  def alfabetica

  end

  def normal
    array = []
    @politicos.each do |politico|
      array << [politico.id_cadastro,
       politico.nome,
       politico.sgpartido,
       politico.despesas.first.valor_liquido]
    end
    array
  end
end