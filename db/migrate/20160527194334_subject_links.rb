class SubjectLinks < ActiveRecord::Migration
  def change
    create_table :subject_links do |t|
      t.integer :parent_id
      t.integer :child_id 
    end
  end
end
