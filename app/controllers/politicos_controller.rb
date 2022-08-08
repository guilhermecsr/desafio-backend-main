class PoliticosController < ApplicationController
  def index
    @politicos = Politico.all
  end

  def show
    @politico = Politico.find(params[:id])
  end

  private

  def politico_params
    params.require(:politico).permit(:nome, :sguf, :sgpartido)
  end
end
