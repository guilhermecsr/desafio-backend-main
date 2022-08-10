class PoliticoPresenter
  def initialize(politico_id)
    @politico_id = politico_id
  end

  attr_reader :politico_id

  def ordered_expenses
    politician.despesas.order(valor_liquido: :desc)
  end

  def politician
    @politician ||= Politico.find(politico_id)
  end
end
