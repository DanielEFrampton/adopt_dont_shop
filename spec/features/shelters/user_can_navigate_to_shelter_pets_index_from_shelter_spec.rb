require 'rails_helper'

RSpec.describe "shelter pet index link", type: :feature do
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
  end

  it "exists on shelter show page and when clicked takes user to shelter pets index" do
    visit "/shelters/#{@shelter_1.id}"

    click_link('All Pets at This Shelter')

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")

    visit "/shelters/#{@shelter_2.id}"

    click_link('All Pets at This Shelter')

    expect(current_path).to eq("/shelters/#{@shelter_2.id}/pets")
  end
end
