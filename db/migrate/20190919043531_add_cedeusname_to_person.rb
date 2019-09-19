class AddCedeusnameToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :cedeusname, :string
  end
end
