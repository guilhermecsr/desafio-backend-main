class PoliticiansByExpensesQuery
  def initialize(politicians = Politico.all)
    @politicians = politicians
  end

  attr_reader :politicians

  def call
    politicians.joins(:despesas).group('politicos.id').order('sum(despesas.valor_liquido) desc')
  end
end