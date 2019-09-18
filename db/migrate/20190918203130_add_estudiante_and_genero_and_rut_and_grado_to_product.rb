class AddEstudianteAndGeneroAndRutAndGradoToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :estudiante, :string
    add_column :products, :genero, :integer
    add_column :products, :rut, :string
    add_column :products, :grado, :integer
  end
end
