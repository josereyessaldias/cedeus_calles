class AddIndexacionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :indexacion, :string
  end
end
