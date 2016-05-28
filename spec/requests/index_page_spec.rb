require 'rails_helper'

RSpec.describe "Index page", :type => :request do
  it "loads the index page" do
    visit root_url
    expect(page).to have_content("Welcome to SAcommunity!")
  end
end
