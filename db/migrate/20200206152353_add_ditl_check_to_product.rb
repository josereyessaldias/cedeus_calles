class AddDitlCheckToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ditl_check, :boolean
  end
end
