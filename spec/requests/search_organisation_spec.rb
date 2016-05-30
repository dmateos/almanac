require "rails_helper"

RSpec.describe "Search /search/" do
  it "loads the search response page when a query is made from /" do
    visit root_path
    click_button("submit")
    expect(page).to have_content("Search results")
  end

  context "searching for organisations" do
    before :all do
      Organisation.__elasticsearch__.create_index!(force: true)
    end

    it "searches for a given organisation and the organisation is found" do
      organisation = FactoryGirl.create(:organisation, name: "test org")
      Organisation.import

      visit root_path
      fill_in("search", with: "test org")
      click_button("submit")
      expect(page).to have_content("test org")
    end

    it "does not include an irrelevent organisation in results" do
      visit root_path
      fill_in("search", with: "whatever man")
      click_button("submit")
      expect(page).to_not have_content("test org")
    end
  end

  context "searching for organisations limited by council" do
    it "searches for a given organisation and a result is found within that council" do

    end

    it "does not return a matching result that is not in that council" do

    end
  end
end
