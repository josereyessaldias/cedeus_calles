class AddProyectoToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :proyecto, :integer
  end
end
