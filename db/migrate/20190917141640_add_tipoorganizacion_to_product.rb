class AddTipoorganizacionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :tipoorganizacion, :integer
  end
end
