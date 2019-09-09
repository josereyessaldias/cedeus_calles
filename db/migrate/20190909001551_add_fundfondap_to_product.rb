class AddFundfondapToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundfondap, :integer
  end
end
