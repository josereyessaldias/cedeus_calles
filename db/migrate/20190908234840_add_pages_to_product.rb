class AddPagesToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pages, :string
  end
end
