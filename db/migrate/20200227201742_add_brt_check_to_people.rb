class AddBrtCheckToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :brt_check, :boolean
  end
end
