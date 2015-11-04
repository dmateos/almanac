require 'rails_helper'

RSpec.describe State, type: :model do
   it "has a valid factory" do
    expect(FactoryGirl.create(:state)).to be_valid
  end
end
