class CsvController < ApplicationController
  def index
  end

  def show
  end

  def create
    file_path = params[:csv].tempfile.path
    CsvService.create_from_upload(file_path)
  end
end
