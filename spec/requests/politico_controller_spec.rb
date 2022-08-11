require 'rails_helper'

RSpec.describe PoliticosController, type: :request do
  let(:politician) { FactoryBot.create(:politico) }
  let!(:expense) { FactoryBot.create(:despesa, politico: politician) }

  describe "GET/index" do
    before(:each) do
      get politicos_path
    end

    it { expect(response).to have_http_status(200) }

    it do
      expect(response.body).to match(politician.nome)
      expect(response.body).to match(politician.sguf)
      expect(response.body).to match(politician.sgpartido)
    end
  end

  describe "GET/show" do
    before(:each) do
      get politico_path(politician)
    end

    it { expect(response).to have_http_status(200) }

    it do
      expect(response.body).to include("#{politician.nome} (#{politician.sgpartido})")
    end
  end
end
