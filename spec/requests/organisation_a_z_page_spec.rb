require "rails_helper"

RSpec.describe "Organisation A-Z listing page /organisations" do
  it "loads the page" do
    visit organisations_path
    expect(page).to have_content("Organisations A-Z")
  end

  it "shows all the listings" do
    org = FactoryGirl.create(:organisation, name: "A test org")
    org2 = FactoryGirl.create(:organisation, name: "B test org")

    visit organisations_path
    expect(page).to have_content("A test org")
    expect(page).to have_content("B test org")
  end

  it "shows listings limited by alphabetical argument" do
    org = FactoryGirl.create(:organisation, name: "A test org")
    org2 = FactoryGirl.create(:organisation, name: "B test org")

    visit organisations_path
    click_link "A"
    expect(page).to have_content("A test org")
    expect(page).to_not have_content("B test org")
  end
end
