# frozen_string_literal: true

class SumExpensesQuery
  def initialize(politicians = Politico.all)
    @politicians = politicians
  end

  attr_reader :politicians

  def call
    politicians.joins(:despesas).group('politicos.id').sum('despesas.valor_liquido')
  end
end
