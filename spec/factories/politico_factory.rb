# frozen_string_literal: true

FactoryBot.define do
  factory :politico do
    nome { 'Nome Politico' }
    cpf { '123456789-10' }
    sguf { 'RJ' }
    sgpartido { 'PDG' }
    id_cadastro { '123456' }
  end
end
