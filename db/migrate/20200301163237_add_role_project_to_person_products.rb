class AddRoleProjectToPersonProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :person_products, :role_project, :integer
  end
end
