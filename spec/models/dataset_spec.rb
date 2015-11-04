require 'rails_helper'

RSpec.describe Dataset, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:dataset)).to be_valid
  end
end
