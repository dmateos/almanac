# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

["SA", "VIC", "TAS", "NSW", "ACT", "WA", "NT"].each { |s| 
  State.create({ name: s }) 
}

["Adelaide Hills", "Salisbury Council"].each { |d|
  Dataset.create({ name: d })
}

importer = CsvImporter.new
importer.import_subjects(File.join(Rails.root, "db", "seed_data", "subjects.csv"))
importer.import_datasets(File.join(Rails.root, "db", "seed_data", "datasets.csv"))
importer.import_councils(File.join(Rails.root, "db", "seed_data", "councils.csv"))
importer.import_organisations(File.join(Rails.root, "db", "seed_data", "orgs.csv"))
