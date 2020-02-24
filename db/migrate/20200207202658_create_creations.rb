class CreateCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :creations do |t|
      t.references :product, foreign_key: true
      t.datetime :date
      t.integer :stage

      t.timestamps
    end
  end
end
