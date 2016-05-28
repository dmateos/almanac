require "rails_helper"

RSpec.describe "Organisation listing page /organisation/:id" do
  let!(:subject_one) { FactoryGirl.create(:subject, name: "Test subject one") }
  let!(:subject_two) { FactoryGirl.create(:subject, name: "Test subject two") }
  let!(:subject_three) { FactoryGirl.create(:subject, name: "Test subject three") }
  let!(:organisation) { FactoryGirl.create(:organisation, name: "Test organisation", subjects: [ subject_one, subject_two ] ) }

  it "loads a listing page" do
    visit organisation_path(organisation.id)
    expect(page).to have_content("Test organisation")
  end

  context "categories" do
    it "shows the categories the organisation is listed under on the page" do
      visit organisation_path(organisation.id)
      expect(page).to have_content("Test subject one")
      expect(page).to have_content("Test subject two")
    end

    it "doesnt show subjects that the organistion isn't under" do
      visit organisation_path(organisation.id)
      expect(page).to_not have_content("Test subject three")
    end
  end
  
end
