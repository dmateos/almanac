class CreateCouncils < ActiveRecord::Migration
  def change
    create_table :councils do |t|
      t.string :name
      t.integer :cuid

      t.timestamps null: false
    end
  end
end
