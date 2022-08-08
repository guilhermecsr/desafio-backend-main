class Politico < ApplicationRecord
  has_many :despesas

  # validates :nome, :sguf, :sgpartido, presence: true
end
