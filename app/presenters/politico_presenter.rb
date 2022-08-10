require 'pry'
class PoliticoPresenter < SimpleDelegator
  def initialize
  end

  def ordered_by_total
    array = []

    politicians = Politico.joins(:despesas).group('politicos.id').order('sum(despesas.valor_liquido) desc')
    politicians.each do |politician|
      array << politician
    end
    array
  end
end