require "rails_helper"

RSpec.describe "Organisation A-Z listing page /organisations" do
  it "loads the page" do
    visit subjects_path
    expect(page).to have_content("Services A-Z")
  end

  context "listing subjects" do 
    let!(:subject_one) { FactoryGirl.create(:subject, name: "A test subject") }
    let!(:subject_two) { FactoryGirl.create(:subject, name: "B test subject") }

    it "shows all the subjects" do
      visit subjects_path
      expect(page).to have_content("A test subject")
      expect(page).to have_content("B test subject")
    end

    it "shows listing subjects by alphabetical argument" do
      visit subjects_path
      click_link "A"
      expect(page).to have_content("A test subject")
      expect(page).to_not have_content("B test subject")
    end
  end
end
