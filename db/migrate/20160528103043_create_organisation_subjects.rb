class CreateOrganisationSubjects < ActiveRecord::Migration
  def change
    create_table :organisation_subjects do |t|
      t.references :organisation, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
