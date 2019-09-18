class AddInicioAndTerminoAndEtapaToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :inicio, :string
    add_column :products, :termino, :string
    add_column :products, :etapa, :integer
  end
end
