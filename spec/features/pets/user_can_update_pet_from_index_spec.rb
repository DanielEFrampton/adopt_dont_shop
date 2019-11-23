require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name: "Ridiculous Test Name",
                               address: "124 Fake Ln.",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")
    @shelter_2 = Shelter.create(name: "Even Worse Test Name",
                               address: "45 Dumpster Fire Alley",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")
    @pet_1 = @shelter_1.pets.create({
                                    name: "Bill",
                                    approx_age: 3,
                                    sex: "male",
                                    image_path: "image1.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_2 = @shelter_2.pets.create({
                                    name: "Jill",
                                    approx_age: 5,
                                    sex: "female",
                                    image_path: "image2.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_3 = @shelter_2.pets.create({
                                    name: "Will",
                                    approx_age: 2,
                                    sex: "male",
                                    image_path: "image3.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    visit '/pets'
  end

  it "can display link to update each individual pet" do
    expect(page).to have_link('Edit Pet Info', count: 3)
  end

  it "has link that lets user navigate to edit page for each pet" do
    within "#pet-#{@pet_1.id}-section" do
      click_link('Edit Pet Info')
    end

    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

    visit '/pets'

    within "#pet-#{@pet_2.id}-section" do
      click_link('Edit Pet Info')
    end

    expect(current_path).to eq("/pets/#{@pet_2.id}/edit")

    visit '/pets'

    within "#pet-#{@pet_3.id}-section" do
      click_link('Edit Pet Info')
    end

    expect(current_path).to eq("/pets/#{@pet_3.id}/edit")
  end
end
