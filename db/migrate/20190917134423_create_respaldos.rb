class CreateRespaldos < ActiveRecord::Migration[5.2]
  def change
    create_table :respaldos do |t|
      t.references :product, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
