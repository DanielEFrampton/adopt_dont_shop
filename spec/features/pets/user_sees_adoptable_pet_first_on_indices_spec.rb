require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
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
    @pet_1 = @shelter_1.pets.create!({
                                    name: "Bill",
                                    approx_age: 3,
                                    sex: "male",
                                    image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                    description: "Very canine",
                                    adoptable: false
                                  })
    @pet_2 = @shelter_1.pets.create({
                                    name: "Phil",
                                    approx_age: 5,
                                    sex: "male",
                                    image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_3 = @shelter_2.pets.create!({
                                    name: "Jill",
                                    approx_age: 5,
                                    sex: "female",
                                    image_path: "https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg",
                                    description: "Very canine",
                                    adoptable: false
                                  })
    @pet_4 = @shelter_2.pets.create({
                                    name: "Will",
                                    approx_age: 2,
                                    sex: "male",
                                    image_path: "https://boygeniusreport.files.wordpress.com/2016/11/puppy-dog.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
  end

  describe 'when I visit a shelter pets index' do
    it 'I see adoptable pets listed before pending pets' do
      visit "/shelters/#{@shelter_2.id}/pets"

      page.body.index("Will").should < page.body.index("Jill")

      visit "/shelters/#{@shelter_1.id}/pets"

      page.body.index("Phil").should < page.body.index("Bill")
    end
  end

  describe 'when I visit a pets index' do
    it 'I see adoptable pets listed before pending pets' do
      visit '/pets'

      page.body.index("Will").should < page.body.index("Jill")
      page.body.index("Phil").should < page.body.index("Bill")
      page.body.index("Phil").should < page.body.index("Will")
      page.body.index("Bill").should < page.body.index("Jill")
    end
  end
end
