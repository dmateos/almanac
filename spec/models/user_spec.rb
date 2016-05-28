require 'rails_helper'

RSpec.describe User, type: :model do
  context "data validation" do
    it "is invalid without a username" do
      expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
    end

    it "is invalid without a email address" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it "is invalid without a correct email address" do
      expect(FactoryGirl.build(:user, email: "wrong")).to_not be_valid
    end

    it "is valid with a correct email address" do
      expect(FactoryGirl.build(:user, email: "correct@correct.com")).to be_valid
    end

    it "is invalid without a first name" do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it "is invalid without a last name" do
      expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
    end

    it "is invalid without a phone" do
      expect(FactoryGirl.build(:user, phone: nil)).to_not be_valid
    end

    it "is invalid without a mobile phone" do
      expect(FactoryGirl.build(:user, mobile: nil)).to_not be_valid
    end

    it "is invalid without a position" do
      expect(FactoryGirl.build(:user, position: nil)).to_not be_valid
    end
  end
end
