class PoliticosController < ApplicationController
  def index
    presenter = PoliticoPresenter.new
    @politicians = presenter.ordered_by_total
  end

  def show
    @politician = Politico.find(params[:id])
  end

  private

  def politico_params
    params.require(:politico).permit(:nome, :sguf, :sgpartido)
  end
end
