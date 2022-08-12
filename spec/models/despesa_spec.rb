# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Despesa, type: :model do
  let(:politician) { FactoryBot.create(:politico) }
  let(:expense) { FactoryBot.create(:despesa, politico: politician) }
  subject { expense }

  describe 'Associations' do
    it { is_expected.to belong_to(:politico) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:fornecedor) }
    it { is_expected.to validate_presence_of(:data_emissao) }
    it { is_expected.to validate_presence_of(:valor_liquido) }
    it { is_expected.to validate_presence_of(:url_documento) }
  end
end
