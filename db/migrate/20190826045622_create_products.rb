class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :titulo
      t.integer :type
      t.string :revista
      t.string :year

      t.timestamps
    end
  end
end
