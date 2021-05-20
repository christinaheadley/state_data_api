class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :states, :metro, :decimal, precision: 3, scale: 2
  end
end
