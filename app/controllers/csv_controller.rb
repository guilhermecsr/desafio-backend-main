require 'pry'
class CsvController < ApplicationController
  def index
  end

  def show
  end

  def create
    file_path = params[:csv].tempfile.path
    CsvService.new(file_path).call
    redirect_to :politicos
  end
end
