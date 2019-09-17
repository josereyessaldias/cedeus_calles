class RemoveEditoresFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :editores, :string
  end
end
