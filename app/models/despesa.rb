class Despesa < ApplicationRecord
  belongs_to :politico

  # validates :fornecedor, :data_emissao, :valor_liquido, presence: true
end
