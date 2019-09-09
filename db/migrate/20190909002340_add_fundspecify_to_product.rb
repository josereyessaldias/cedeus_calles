class AddFundspecifyToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundspecify, :string
  end
end
