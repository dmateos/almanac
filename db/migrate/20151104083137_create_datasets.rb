class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :dataset_id

      t.timestamps null: false
    end
  end
end
