class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :organisation, index: true, foreign_key: true
      t.string :c_type
      t.integer :c_value
      t.string :comment

      t.timestamps null: false
    end
  end
end
