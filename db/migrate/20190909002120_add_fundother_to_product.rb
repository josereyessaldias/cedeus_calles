class AddFundotherToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundother, :integer
  end
end
