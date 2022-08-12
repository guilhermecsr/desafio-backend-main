# frozen_string_literal: true

FactoryBot.define do
  factory :despesa do
    fornecedor { 'Fornecedor' }
    data_emissao { Date.today }
    valor_liquido { 100.0 }
    url_documento { 'url.com' }
    sequence(:numero_doc) { |n| "Doc#{n}" }

    association :politico
  end
end
