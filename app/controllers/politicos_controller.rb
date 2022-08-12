# frozen_string_literal: true

class PoliticosController < ApplicationController
  def index
    @presenter = PoliticosPresenter.new
  end

  def show
    @presenter = PoliticoPresenter.new(params[:id])
  end
end
