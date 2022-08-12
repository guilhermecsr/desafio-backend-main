# frozen_string_literal: true

class Politico < ApplicationRecord
  has_many :despesas

  accepts_nested_attributes_for :despesas

  validates :nome, :sguf, :sgpartido, :id_cadastro, :cpf, presence: true
end
