class AddTipocolaboracionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :tipocolaboracion, :string
  end
end
