require 'rails_helper'

RSpec.describe "shelter creation page", type: :feature do
  it "can see a link to create a new Shelter" do
    visit "/shelters"

    expect(page).to have_link("Create New Shelter")
  end

  # it "can be taken to '/shelters/new' where it sees a form for a new shelter" do
  #   visit "/shelters"
  #   click_link "Create New Shelter"
  #
  #   expect(current_path).to eq('/shelters/new')
  #   expect(page).to have_content("")
  # end
  #
  # it "can send POST request to '/shelters', a new shelter is created, be redirected to Shelter Index page where it can see the new Shelter listed" do
  # end
end
