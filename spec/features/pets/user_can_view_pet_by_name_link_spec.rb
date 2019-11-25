require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
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
                                    image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_2 = @shelter_2.pets.create({
                                    name: "Jill",
                                    approx_age: 5,
                                    sex: "female",
                                    image_path: "https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_3 = @shelter_2.pets.create({
                                    name: "Will",
                                    approx_age: 2,
                                    sex: "male",
                                    image_path: "https://boygeniusreport.files.wordpress.com/2016/11/puppy-dog.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
  end

  describe "when I click on the name of a pet" do
    it "on the pets index page that link takes me to that pets show page" do
      visit '/pets'

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end

    it "on the pet show page that link takes me to that pets show page" do
      visit "/pets/#{@pet_1.id}"

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end

    it "on the shelter pets index that link takes me to that pets show page" do
      visit "/shelters/#{@shelter_1.id}/pets"

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end
  end
end
