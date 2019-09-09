class AddFundfondefToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundfondef, :integer
  end
end
