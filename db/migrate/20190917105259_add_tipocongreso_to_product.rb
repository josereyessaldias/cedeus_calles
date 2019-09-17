class AddTipocongresoToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :tipocongreso, :integer
  end
end
