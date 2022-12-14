# frozen_string_literal: true

class Despesa < ApplicationRecord
  belongs_to :politico

  validates :fornecedor, :data_emissao, :valor_liquido, :url_documento, :numero_doc, presence: true
end
