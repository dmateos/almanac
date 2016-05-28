class SubjectLinks < ActiveRecord::Migration
  def change
    create_table :subject_links do |t|
      t.integer :parent_id, index: true, foreign_key: true
      t.integer :child_id, index: true, foreign_key: true 
    end
  end
end
