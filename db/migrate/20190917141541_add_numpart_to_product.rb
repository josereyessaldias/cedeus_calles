class AddNumpartToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :numpart, :integer
  end
end
