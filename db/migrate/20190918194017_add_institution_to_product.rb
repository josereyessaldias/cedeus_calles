class AddInstitutionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :institution, :string
  end
end
