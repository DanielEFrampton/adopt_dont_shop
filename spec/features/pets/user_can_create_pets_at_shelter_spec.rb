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
    expect(page).to have_field('Name')
    expect(page).to have_field('Sex')
    expect(page).to have_field('Approximate Age')
    expect(page).to have_field('Description')
    expect(page).to have_field('Image Path')
  end

  it "can create new adoptable pet and redirect user to updated shelter pet index" do
    visit "/shelters/#{@shelter_1.id}/pets/new"

    fill_in 'Name', with: "Phil"
    fill_in 'Sex', with: "male"
    fill_in 'Approximate Age', with: "1"
    fill_in 'Description', with: "Very cute"
    fill_in 'Image Path', with: "http://files.alfresco.mjh.group/alfresco_images/DVM360//2019/02/27/c23624de-1b4c-4e61-961f-db10dcf27341/veterinary-black-puppy-licking-wood-AdobeStock_211167675-450.jpg"

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    expect(page).to have_content("Phil")
    expect(page).to have_content("Approximate Age: 1")
    expect(page).to have_content("Sex: male")
    expect(page).to have_xpath("//img[@alt='http://files.alfresco.mjh.group/alfresco_images/DVM360//2019/02/27/c23624de-1b4c-4e61-961f-db10dcf27341/veterinary-black-puppy-licking-wood-AdobeStock_211167675-450.jpg']")
  end
end
