class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :code
      t.integer :income
      t.decimal :unemployed, precision: 4, scale: 3
      t.decimal :metro, precision: 3, scale: 3
      t.decimal :grads, precision: 4, scale: 3

      t.timestamps
    end
  end
end
