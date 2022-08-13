# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PoliticosController, type: :request do
  let(:politician) { FactoryBot.create(:politico) }
  let!(:expense) { FactoryBot.create(:despesa, politico: politician) }

  describe 'GET/index' do
    before { get politicos_path }

    it { expect(response).to have_http_status(200) }
    it 'returns politician attributes' do
      expect(response.body).to match(politician.nome)
      expect(response.body).to match(politician.sguf)
      expect(response.body).to match(politician.sgpartido)
    end
  end

  describe 'GET/show' do
    context 'when params is valid' do
      before { get politico_path(politician) }

      it { expect(response).to have_http_status(200) }
      it { expect(response.body).to include("#{politician.nome} (#{politician.sgpartido})") }
    end

    context 'when params is invalid' do
      before { get politico_path(0) }

      it { expect(response).to have_http_status(302) }
      it { expect(flash[:error]).to match("Erro ao encontrar Politico com ID = 0. Você foi redirecionado!") }
    end
  end
end
