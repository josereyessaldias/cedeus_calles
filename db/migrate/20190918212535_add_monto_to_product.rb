class AddMontoToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :monto, :integer
  end
end
