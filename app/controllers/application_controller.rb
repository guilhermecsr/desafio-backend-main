class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(exception)
    flash[:error] = "Erro ao encontrar #{exception.model}. Você foi redirecionado!"
    redirect_to action: :index
  end
end
