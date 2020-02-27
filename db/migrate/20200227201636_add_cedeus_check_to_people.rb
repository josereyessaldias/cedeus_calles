class AddCedeusCheckToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :cedeus_check, :boolean
  end
end
