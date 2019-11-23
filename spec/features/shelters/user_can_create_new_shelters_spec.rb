require 'rails_helper'

RSpec.describe "shelter creation page", type: :feature do
  it "can see a link to create a new Shelter" do
    visit "/shelters"

    expect(page).to have_link("Create New Shelter")
  end

  it "will be taken to '/shelters/new'" do
    visit "/shelters"
    click_link "Create New Shelter"

    expect(current_path).to eq('/shelters/new')
  end

  it "can see a form for a new shelter" do
    visit "/shelters/new"

    expect(page).to have_selector('form')
    expect(page).to have_field('Name')
    expect(page).to have_field('Address')
    expect(page).to have_field('City')
    expect(page).to have_field('State')
    expect(page).to have_field('Zip')
  end

  it "can send POST request to '/shelters', a new shelter is created, be redirected to Shelter Index page where it can see the new Shelter listed" do
    visit 'shelters/new'

    fill_in 'Name', with: "Ridiculous Test Name 2"
    fill_in 'Address', with: "125 Fake Ln."
    fill_in 'City', with: "Faketown"
    fill_in 'State', with: "FK"
    fill_in 'Zip', with: "55555"

    click_button 'Submit'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Ridiculous Test Name 2")
  end
end
