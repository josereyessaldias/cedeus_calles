class AddCongresoToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :congreso, :string
  end
end
