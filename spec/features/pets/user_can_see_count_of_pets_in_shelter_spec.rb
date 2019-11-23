require 'rails_helper'

RSpec.describe 'shelter pets index', type: :feature do
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
                                    image_path: "http://www.thing.com/image.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_2 = @shelter_2.pets.create({
                                    name: "Jill",
                                    approx_age: 5,
                                    sex: "female",
                                    image_path: "http://www.thing.com/image.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_3 = @shelter_2.pets.create({
                                    name: "Will",
                                    approx_age: 2,
                                    sex: "male",
                                    image_path: "http://www.thing.com/image.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
  end

  it 'displays number of pets in that shelter' do
    visit "/shelters/#{@shelter_1.id}/pets"

    expect(page).to have_content("1 Pet")

    visit "/shelters/#{@shelter_2.id}/pets"

    expect(page).to have_content("2 Pets")
  end
end
