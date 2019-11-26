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

  describe 'When I visit a Pet Show page' do
    describe "Then I see a link to change the pet's adoptable status" do
      it 'Adoptable pets should have the link "Change to Adoption Pending"' do
        visit "/pets/#{@pet_2.id}"

        expect(page).to have_link('Change to Adoption Pending')
      end

      it 'Adoption Pending pets should have the link "Change to Adoptable"' do
        visit "/pets/#{@pet_1.id}"

        expect(page).to have_link('Change to Adoptable')
      end
    end
  end

  describe 'When I click the link' do
    it "Then a 'PATCH' request is sent to '/pets/:id/adoptable' or 'pets/:id/pending' (depending on the link) and I am redirected to the Pet Show page where I see the pet's status has been changed" do
      visit "/pets/#{@pet_2.id}"
      expect(page).to have_content("Adoptable: true")

      click_link('Change to Adoption Pending')

      expect(current_path).to eq("/pets/#{@pet_2.id}")
      expect(page).to have_content("Adoptable: false")

      visit "/pets/#{@pet_1.id}"
      expect(page).to have_content("Adoptable: false")

      click_link('Change to Adoptable')

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content("Adoptable: true")
    end
  end
end
