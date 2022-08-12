# frozen_string_literal: true

class CsvController < ApplicationController
  def create
    if params[:csv]
      file_path = params[:csv].tempfile.path
      CsvService.new(file_path).call
      redirect_to :politicos
    else
      flash[:error] = 'Não foi possível encontrar um arquivo.'
      redirect_to action: :create
    end
  end
end
