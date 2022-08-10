# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'pry'
require 'csv'
#
# table = CSV.parse(File.read('lib/Ano-2022.csv'), col_sep: ";", quote_char: "\x00", headers: true)
# hash = {}
#
# table.each do |row|
#   valor_liquido = row[19].remove("\"").to_i
#   data_emissao = row[16].remove("\"")
#   fornecedor = row[12].remove("\"")
#   url = row[-1].remove("\"")
#   despesa = [valor_liquido, data_emissao, fornecedor, url]
#
#   nome = row[0].remove("\"")
#   id = row[2].remove("\"")
#   uf = row[5].remove("\"")
#   partido = row[6].remove("\"")
#   politico = [nome, id, uf, partido]
#
#   if uf == "RJ"
#     if hash.keys.include? politico
#       hash[politico].push despesa
#     else
#       hash[politico] = [despesa]
#     end
#   end
# end
#
# hash.each do |key, values|
#   politico = Politico.create(nome: key[0], id_cadastro: key[1], sguf: key[2], sgpartido: key[3])
#   values.each do |value|
#     Despesa.create(valor_liquido: value[0], data_emissao: value[1], fornecedor: value[2], url_documento: value[3], politico: politico)
#   end
# end
