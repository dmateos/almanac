require "rails_helper"

RSpec.describe "Organisation A-Z listing page /organisations" do
  it "loads the page" do
    visit organisations_path
    expect(page).to have_content("Organisations A-Z")
  end

  context "listing organisations" do
    let!(:org_one) { FactoryGirl.create(:organisation, name: "A test org") }
    let!(:org_two) { FactoryGirl.create(:organisation, name: "B test org") }

    it "shows all the listings" do
      visit organisations_path
      expect(page).to have_content("A test org")
      expect(page).to have_content("B test org")
    end

    it "shows listings limited by alphabetical argument" do
      visit organisations_path
      click_link "A"
      expect(page).to have_content("A test org")
      expect(page).to_not have_content("B test org")
    end
  end
end
