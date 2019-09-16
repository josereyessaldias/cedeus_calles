class AddContactToPersonProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :person_products, :contact, :integer
  end
end
