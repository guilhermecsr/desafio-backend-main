# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CsvController, type: :request do
  describe 'POST/create' do
    context 'when params is valid' do
      let!(:params) { { csv: fixture_file_upload('spec/fixtures/Ano-2020-test.csv', 'file/csv') } }
      before { post csv_index_path, params: params }

      it { expect(response).to have_http_status(302) }
    end

    context 'when params is invalid' do
      let!(:params) { { csv: nil } }
      before { post csv_index_path, params: params }

      it { expect(response).to have_http_status(302) }
      it { expect(flash[:alert]).to match(/Atenção! Não foi possível carregar um arquivo./) }
    end
  end
end
