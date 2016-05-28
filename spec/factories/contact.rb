FactoryGirl.define do
  factory :contact do
    c_type :phone
    c_value "0408033220"
    comment "lol"
    organisation
  end
end
