require 'rails_helper'

RSpec.describe "shelter pet creation process", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name: "Ridiculous Test Name",
                                 address: "124 Fake Ln.",
                                 city: "Faketown",
                                 state: "FK",
                                 zip: "55555")
  end

  it "can display link to add adoptable pet" do
    visit "/shelters/#{@shelter_1.id}/pets"

    expect(page).to have_link("Add Adoptable Pet")
  end

  it "can navigate user to pet creation form" do
    visit "/shelters/#{@shelter_1.id}/pets"
    click_link("Add Adoptable Pet")

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
    expect(page).to have_selector('form')
    expect(page).to have_field('pet[name]')
    expect(page).to have_field('pet[sex]')
    expect(page).to have_field('pet[approx_age]')
    expect(page).to have_field('pet[description]')
    expect(page).to have_field('pet[image_path]')
  end

  it "can create new adoptable pet and redirect user to updated shelter pet index" do
    visit "/shelters/#{@shelter_1.id}/pets/new"

    fill_in 'pet[name]', with: "Phil"
    fill_in 'pet[approx_age]', with: 1
    fill_in 'pet[description]', with: "Very cute"
    fill_in 'pet[image_path]', with: "image4.png"

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    expect(page).to have_content("Phil")
    expect(page).to have_content("Very cute")
    expect(page).to have_xpath("//img[@alt='image4.png']")
  end
end
