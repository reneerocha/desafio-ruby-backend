class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :type
      t.string :date
      t.string :value
      t.string :cpf
      t.string :card
      t.string :hour
      t.string :owner
      t.string :store

      t.timestamps
    end
  end
end
