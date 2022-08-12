# frozen_string_literal: true

class PoliticosController < ApplicationController
  def index
    @presenter = PoliticosPresenter.new
    @pagy, @records = pagy(@presenter.politicians, items: 5)
  end

  def show
    @presenter = PoliticoPresenter.new(params[:id])
    @pagy, @records = pagy(@presenter.ordered_expenses, items: 20)
  end
end
