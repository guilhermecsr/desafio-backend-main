class CreatePoliticos < ActiveRecord::Migration[6.0]
  def change
    create_table :politicos do |t|
      t.string :nome
      t.string :cpf
      t.string :sguf
      t.string :sgpartido
      t.string :id_cadastro

      t.timestamps
    end
  end
end
