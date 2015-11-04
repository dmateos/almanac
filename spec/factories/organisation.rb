FactoryGirl.define do 
  factory :organisation do
    name "Test organisation"
    aka "Test org"
    acronym "to"
    former_name" None"
    accreditation "None"
  end

  factory :invalid_organisation, parent: :organisation do
    name nil
  end
end
