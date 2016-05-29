require "rails_helper"

RSpec.describe SearchService do
  subject(:search) { SearchService.new }

  it "returns nothing important" do
    expect(subject.search).to eq("nothing") 
  end
end
