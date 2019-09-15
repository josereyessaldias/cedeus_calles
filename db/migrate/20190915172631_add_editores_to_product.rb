class AddEditoresToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :editores, :string
  end
end
