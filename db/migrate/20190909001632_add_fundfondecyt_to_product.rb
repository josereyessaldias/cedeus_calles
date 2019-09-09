class AddFundfondecytToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundfondecyt, :integer
  end
end
