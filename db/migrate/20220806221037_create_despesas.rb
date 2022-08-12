# frozen_string_literal: true

class CreateDespesas < ActiveRecord::Migration[6.0]
  def change
    create_table :despesas do |t|
      t.string :numero_doc
      t.string :fornecedor
      t.date :data_emissao
      t.decimal :valor_liquido
      t.references :politico, foreign_key: true
      t.string :url_documento

      t.timestamps
    end
  end
end
