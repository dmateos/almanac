require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "data validation" do
    it "requires a valid organisation" do

    end
  end

  context "contact types" do
    it "can hold a phone number" do
      expect(FactoryGirl.create(:contact, c_type: :phone)).to be_valid
    end

    it "can hold a mobile number" do
      expect(FactoryGirl.create(:contact, c_type: :mobile)).to be_valid
    end

    it "can hold a email address" do 
      expect(FactoryGirl.create(:contact, c_type: :email)).to be_valid
    end

    it "can hold a fax number" do
      expect(FactoryGirl.create(:contact, c_type: :fax)).to be_valid
    end

    it "can hold a website address" do
      expect(FactoryGirl.create(:contact, c_type: :website)).to be_valid
    end

    it "cant hold an invalid type" do
      expect { FactoryGirl.create(:contact, c_type: :unknown) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
