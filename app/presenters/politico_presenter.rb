require 'pry'
class PoliticoPresenter < SimpleDelegator
  def initialize
  end

  def valor_despesa
    array = []

    ordenado = Politico.joins(:despesas).group('politicos.id').order('sum(despesas.valor_liquido) desc')
    ordenado.each do |politico|
      array << politico
    end
    array
  end
end