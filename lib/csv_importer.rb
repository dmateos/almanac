require "csv"

class CsvImporter
  def import_organisations(file)
     CSV.foreach(file, :headers => true) do |row|
      first = row if first.nil?

      org = Organisation.new
      org.name = row[0]

      org.street_address = "%s %s %s" % [row[1], row[2], row[3]]
      org.street_suburb = row[4]
      org.street_postcode = row[5]
      org.street_state = State.find_by_name(row[6])

      org.post_address = "%s %s %s" % [row[7], row[8], row[9]]
      org.post_suburb = row[10]
      org.post_postcode = row[11]
      org.post_state = State.find_by_name(row[12])

      org.aka = row[129]

      new_contact(org, 0, row[13], row[14])
      new_contact(org, 0, row[15], row[16])
      new_contact(org, 0, row[17], row[18])
      new_contact(org, 0, row[19], row[20])
      new_contact(org, 0, row[21], row[22])
      
      new_contact(org, 1, row[23], row[24])
      new_contact(org, 1, row[25], row[26])
      new_contact(org, 1, row[27], row[28])
      new_contact(org, 1, row[29], row[30])
      
      new_contact(org, 3, row[31], row[32])
      new_contact(org, 3, row[33], row[34])
      new_contact(org, 3, row[35], row[36])
      new_contact(org, 3, row[37], row[38])

      new_contact(org, 2, row[45], nil)
      new_contact(org, 2, row[47], nil)
      new_contact(org, 2, row[48], nil)

      new_contact(org, 4, row[46], nil)

      org.services = row[61]
      org.eligibility = row[54]
      org.comment = row[60]
      org.hours = row[52]

      org.save
   end
  end

  def new_contact(organisation, type, data = nil, comment = nil)
    organisation.contacts << Contact.create(c_type: type, c_value: data, comment: comment) if data
  end
end
