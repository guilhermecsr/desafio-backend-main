require 'rails_helper'

RSpec.describe CsvController, type: :request do
  let(:politician) { FactoryBot.create(:politico) }
  let!(:expense) { FactoryBot.create(:despesa, politico: politician) }

  describe "POST/create" do
    let!(:params) { { csv: fixture_file_upload('spec/fixtures/Ano-2020-test.csv', 'file/csv') } }
    before { post csv_index_path, params: params }

    it { expect(response).to have_http_status(302) }
    # it {
    #   # binding.pry
    #   expect(subject).to change(Politico.all, :count).by(1) }
  end
end
