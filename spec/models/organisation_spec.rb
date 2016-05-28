require 'rails_helper'

RSpec.describe Organisation, type: :model do
  context "data validation" do
    it "is invalid without a org name" do
      expect(FactoryGirl.build(:organisation, name: nil)).to_not be_valid
    end
  end

  context "dataset" do
    let(:dataset) { Dataset.new(name: "test") }

    it "is invalid without a valid dataset" do
      expect(FactoryGirl.build(:organisation, name: "test", dataset: nil)).to_not be_valid
    end

    it "has an associated dataset" do
      org = FactoryGirl.build(:organisation, name: "test", dataset: dataset)
      expect(org.dataset).to be(dataset)
    end
  end

  context "contacts" do
    it "can hold multiple datasets" do
      org = FactoryGirl.create(:organisation)
      contact = FactoryGirl.create(:contact, organisation: org)
      contact_two = FactoryGirl.create(:contact, organisation: org)
      expect(org.contacts).to eq([contact, contact_two])
    end
  end

  context "states" do
    let(:street_state) { FactoryGirl.create(:state) }
    let(:postal_state) { FactoryGirl.create(:state) }
    let(:org) { FactoryGirl.create(:organisation, street_state: street_state, post_state: postal_state) }

    it "has a street state link" do
      expect(org.street_state).to eq(street_state) 
    end

    it "has a postal state link" do
      expect(org.post_state).to eq(postal_state)
    end
  end
end
