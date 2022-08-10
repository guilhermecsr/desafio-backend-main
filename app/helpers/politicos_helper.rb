module PoliticosHelper
  def politician_photo(politician)
    image_tag("http://www.camara.leg.br/internet/deputado/bandep/#{politician.id_cadastro}.jpg",
              style: 'height:auto; width:114px;')
  end
end
