require "rails_helper"

RSpec.describe "Subject A-Z listing page /subjects" do
  it "loads the page" do
    visit subjects_path
    expect(page).to have_content("Services A-Z")
  end

  context "listing subjects" do 
    let!(:subject_one) { FactoryGirl.create(:subject, name: "A test subject") }
    let!(:subject_two) { FactoryGirl.create(:subject, name: "B test subject") }
    let!(:organisation) { FactoryGirl.create(:organisation, name: "test", subjects: [ subject_one, subject_two ]) }

    it "shows all the subjects with orgs in them" do
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
