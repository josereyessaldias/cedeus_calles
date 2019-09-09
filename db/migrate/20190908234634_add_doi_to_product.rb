class AddDoiToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :doi, :string
  end
end
