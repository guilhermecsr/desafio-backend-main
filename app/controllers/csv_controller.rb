# frozen_string_literal: true

class CsvController < ApplicationController
  def create
    if csv_file
      CsvService.new(csv_file).call
      flash[:notice] = 'Sucesso! Arquivo carregado. Políticos atualizados!'
      redirect_to :politicos
    else
      flash[:alert] = 'Atenção! Não foi possível carregar um arquivo.'
      redirect_to action: :create
    end
  end
  
  private
  
  def csv_file
    @csv_file ||= params[:csv].tempfile.path if params[:csv] && params[:csv].content_type == 'text/csv'
  end
end
