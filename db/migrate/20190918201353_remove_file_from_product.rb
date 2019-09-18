class RemoveFileFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :file, :string
  end
end
