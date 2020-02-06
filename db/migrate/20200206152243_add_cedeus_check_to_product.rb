class AddCedeusCheckToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :cedeus_check, :boolean
  end
end
