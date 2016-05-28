FactoryGirl.define do 
  factory :organisation do
    name "Test organisation"
    aka "Test org"
    acronym "to"
    former_name" None"
    accreditation "None"

    street_address "123 fake street"
    street_postcode 3141
    street_suburb "South Yarra"
    street_state { FactoryGirl.create(:state) }

    post_address "123 fake street"
    post_postcode 3141
    post_suburb "South Yarra"
    post_state { FactoryGirl.create(:state) }

    dataset { FactoryGirl.create(:dataset) }
  end
end
