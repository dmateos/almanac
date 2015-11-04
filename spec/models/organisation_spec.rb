require 'rails_helper'

RSpec.describe Organisation, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:organisation)).to be_valid
  end

  it "is invalid without a org name" do
    expect(FactoryGirl.build(:invalid_organisation)).to_not be_valid
  end

  it "can hold contacts" do
    org = FactoryGirl.create(:organisation)
    expect(org.contacts.first.c_value).to eq("0408033220")
  end
end
