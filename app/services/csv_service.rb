# frozen_string_literal: true

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
    @data ||= CSV.parse(File.read(temp_file, encoding: 'bom|utf-8'), col_sep: ';', headers: true)
  end

  def create_from_upload
    filtered_grouped.each do |_cpf, expenses|
      politician = Politico.find_or_create_by(politician_params(expenses))
      array = expense_params(politician, expenses)
      array.each do |element|
        Despesa.find_or_create_by(element)
      end
    end
  end

  def filtered_grouped
    filtered_data = data.select { |row| row['sgUF'] == 'RJ' }
    filtered_data.group_by { |h| h['cpf'] }
  end

  def politician_params(expenses)
    { nome: expenses.first['txNomeParlamentar'],
      id_cadastro: expenses.first['ideCadastro'],
      cpf: expenses.first['cpf'],
      sguf: expenses.first['sgUF'],
      sgpartido: expenses.first['sgPartido'] }
  end

  def expense_params(politician, expenses)
    expenses.map do |expense|
      { valor_liquido: expense['vlrLiquido'],
        numero_doc: expense['txtNumero'],
        data_emissao: expense['datEmissao'],
        fornecedor: expense['txtFornecedor'],
        url_documento: expense['urlDocumento'],
        politico_id: politician.id }
    end
  end
end
