class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name, null: false
      t.string :aka
      t.string :acronym
      t.string :former_name
      t.attachment :logo
      t.string :accreditation
      t.references :dataset

      t.string :website

      t.string :street_address
      t.integer :street_postcode
      t.string :street_suburb
      t.references :street_state

      t.string :post_address
      t.integer :post_postcode
      t.string :post_suburb
      t.references :post_state

      t.text :services
      t.text :eligibility
      t.text :comment

      t.timestamps null: false
    end
  end
end
