class AddPartgradToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :partgrad, :boolean
  end
end
