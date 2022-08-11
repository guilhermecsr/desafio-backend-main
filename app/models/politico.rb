class Politico < ApplicationRecord
  has_many :despesas

  validates :nome, :sguf, :sgpartido, :id_cadastro, presence: true
end
