class AddSurnameAndCompletenameToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :surname, :string
    add_column :people, :completename, :string
  end
end
