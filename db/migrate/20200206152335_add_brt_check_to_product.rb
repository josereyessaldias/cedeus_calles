class AddBrtCheckToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :brt_check, :boolean
  end
end
