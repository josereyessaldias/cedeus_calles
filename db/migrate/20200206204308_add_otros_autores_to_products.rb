class AddOtrosAutoresToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :otros_autores, :string
  end
end
