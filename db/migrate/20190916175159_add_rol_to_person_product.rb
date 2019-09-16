class AddRolToPersonProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :person_products, :rol, :integer
  end
end
