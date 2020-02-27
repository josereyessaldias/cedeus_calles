class AddDitlCheckToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :ditl_check, :integer
  end
end
