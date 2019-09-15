class AddEditorialToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :editorial, :string
  end
end
