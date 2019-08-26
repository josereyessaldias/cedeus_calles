class CreateClusterPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :cluster_people do |t|
      t.references :person, foreign_key: true
      t.references :cluster, foreign_key: true

      t.timestamps
    end
  end
end
