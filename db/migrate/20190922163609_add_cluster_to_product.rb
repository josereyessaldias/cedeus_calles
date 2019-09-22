class AddClusterToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :cluster, foreign_key: true
  end
end
