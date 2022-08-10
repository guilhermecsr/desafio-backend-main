require 'pry'
class CsvService
  def initialize(temp_file)
    @temp_file = temp_file
  end

  def call
    create_from_upload
  end

  private

  attr_reader :temp_file

  def data
    @data ||= CSV.parse(File.read(temp_file, encoding: 'bom|utf-8'), col_sep: ";", quote_char: "\x00", headers: true)
  end

  def create_from_upload
    hash = {}

    data.each do |row|
      if row[5] == "\"RJ\""
        despesa = monta_despesa(row)
        politico = monta_politico(row)
        monta_hash(politico, despesa, hash)
      end
    end
    cria_objetos(hash)
  end

  def monta_despesa(row)
    valor_liquido = row[19].remove("\"").to_f
    data_emissao = row[16].remove("\"")
    fornecedor = row[12].remove("\"")
    url = row[-1].remove("\"")
    [valor_liquido, data_emissao, fornecedor, url]
  end

  def monta_politico(row)
    nome = row[0].remove("\"")
    id = row[2].remove("\"")
    uf = row[5].remove("\"")
    partido = row[6].remove("\"")
    [nome, id, uf, partido]
  end

  def monta_hash(politico, despesa, hash)
    if hash.keys.include? politico
      hash[politico].push despesa
    else
      hash[politico] = [despesa]
    end
  end

  def cria_objetos(hash)
    hash.each do |key, values|
      if Politico.find_by(nome: key[0]).present?
        politico = Politico.find_by(nome: key[0])
        values.each do |value|
          Despesa.create(valor_liquido: value[0],
                         data_emissao: value[1],
                         fornecedor: value[2],
                         url_documento: value[3],
                         politico_id: politico.id)
        end
      else
        politico = Politico.create(nome: key[0],
                                   id_cadastro: key[1],
                                   sguf: key[2],
                                   sgpartido: key[3])
        values.each do |value|
          Despesa.create(valor_liquido: value[0],
                         data_emissao: value[1],
                         fornecedor: value[2],
                         url_documento: value[3],
                         politico: politico)
        end

      end
    end
  end
end