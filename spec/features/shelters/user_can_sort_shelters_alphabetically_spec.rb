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
    @shelter_3 = Shelter.create(name: "Shelter Somewhere",
                               address: "123 Place Pl.",
                               city: "Fakeville",
                               state: "FK",
                               zip: "55551")
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
                                    adoptable: false
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
    @pet_5 = @shelter_3.pets.create({
                                      name: "Shill",
                                      approx_age: 2,
                                      sex: "male",
                                      image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                      description: "Very canine",
                                      adoptable: false
                                    })
    @pet_6 = @shelter_3.pets.create({
                                      name: "Krill",
                                      approx_age: 2,
                                      sex: "male",
                                      image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                      description: "Very canine",
                                      adoptable: true
                                    })
    @pet_7 = @shelter_3.pets.create({
                                      name: "Nill",
                                      approx_age: 2,
                                      sex: "male",
                                      image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                      description: "Very canine",
                                      adoptable: true
                                    })
  end

  describe 'When I visit the Shelter Index Page' do
    it 'Then I see a link to sort shelters alphabetically' do
      visit '/shelters'

      expect(page).to have_link('Sort Alphabetically')
    end
  end

  describe 'When I click on the link' do
    it "I'm taken back to the Shelters Index Page where I see all of the shelters in alphabetical order" do
      visit '/shelters'

      click_link('Sort Alphabetically')

      expect(current_path).to eq('/shelters')
      expect(page.body.index(@shelter_2.name)).to be < page.body.index(@shelter_1.name)
      expect(page.body.index(@shelter_2.name)).to be < page.body.index(@shelter_3.name)
      expect(page.body.index(@shelter_1.name)).to be < page.body.index(@shelter_3.name)
    end
  end
end
