class AddFundicmToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fundicm, :integer
  end
end
