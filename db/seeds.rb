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
importer.import_datasets(File.join(Rails.root, "db", "seed_data", "datasets.csv"))
importer.import_councils(File.join(Rails.root, "db", "seed_data", "councils.csv"))

