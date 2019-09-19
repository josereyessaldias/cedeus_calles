class AddRegistroToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :registro, :integer
  end
end
