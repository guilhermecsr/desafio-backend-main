class PoliticosController < ApplicationController
  def index
    presenter = PoliticoPresenter.new
    @politicos = presenter.valor_despesa
  end

  def show
    @politico = Politico.find(params[:id])
  end

  private

  def politico_params
    params.require(:politico).permit(:nome, :sguf, :sgpartido)
  end
end
