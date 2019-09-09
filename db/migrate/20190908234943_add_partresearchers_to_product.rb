class AddPartresearchersToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :partresearchers, :boolean
  end
end
