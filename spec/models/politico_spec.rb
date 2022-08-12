# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Politico, type: :model do
  let(:politician) { FactoryBot.create(:politico) }
  let(:expense) { FactoryBot.create(:despesa, politico: politician) }
  subject { politician }

  describe 'Associations' do
    it { is_expected.to have_many(:despesas) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_presence_of(:sguf) }
    it { is_expected.to validate_presence_of(:sgpartido) }
    it { is_expected.to validate_presence_of(:id_cadastro) }
  end
end
