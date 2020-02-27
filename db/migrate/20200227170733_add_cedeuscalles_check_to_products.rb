class AddCedeuscallesCheckToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :cedeuscalles_check, :boolean
  end
end
