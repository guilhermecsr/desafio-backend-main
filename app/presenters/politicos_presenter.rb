require 'pry'
class PoliticosPresenter
  def initialize
  end

  def politicians
    @politicians ||= PoliticiansByExpensesQuery.new.call
  end

  def expenses
    @expenses ||= SumExpensesQuery.new(politicians).call
  end
end
