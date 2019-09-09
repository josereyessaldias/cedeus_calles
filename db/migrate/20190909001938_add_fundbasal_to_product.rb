class AddFundbasalToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundbasal, :integer
  end
end
