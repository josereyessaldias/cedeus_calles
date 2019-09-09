class AddPartundergradToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :partundergrad, :boolean
  end
end
