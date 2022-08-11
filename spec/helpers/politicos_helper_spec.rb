require 'rails_helper'

RSpec.describe PoliticosHelper, type: :helper do
  let(:politician) { FactoryBot.create(:politico) }
  let(:expense) { FactoryBot.create(:despesa, politico: politician) }
  subject { politico }

  describe "#politician_photo" do
    it 'returns politician photo' do
      expect(helper.politician_photo(politician)).
        to eq(image_tag("http://www.camara.leg.br/internet/deputado/bandep/#{politician.id_cadastro}.jpg",
                        style: 'height:auto; width:114px;'))
    end
  end
end
