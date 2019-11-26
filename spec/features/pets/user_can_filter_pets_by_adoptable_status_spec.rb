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

  describe 'When I visit the pets index page or a shelter pets index page' do
    it 'I see a links to show only adoptable or adoption-pending pets' do
      visit '/pets'

      expect(page).to have_link('Show Only Adoptable Pets')
      expect(page).to have_link('Show Only Adoption-Pending Pets')

      visit "/shelters/#{@shelter_1.id}/pets"

      expect(page).to have_link('Show Only Adoptable Pets')
      expect(page).to have_link('Show Only Adoption-Pending Pets')
    end
  end

  describe 'When I click the link' do
    it "Then my path is something like '/pets?adoptable=true' or '/pets?adoptable=false' (respectively)" do
      visit '/pets'

      click_link('Show Only Adoptable Pets')

      expect(current_path).to eq('/pets?adoptable=true')

      visit '/pets'

      click_link('Show Only Adoption-Pending Pets')

      expect(current_path).to eq('/pets?adoptable=false')

      visit "/shelters/#{@shelter_1.id}/pets"

      click_link('Show Only Adoptable Pets')

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets?adoptable=true")

      visit "/shelters/#{@shelter_1.id}/pets"

      click_link('Show Only Adoption-Pending Pets')

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets?adoptable=false")
    end

    it "And I see only the pets that are adoptable/pending adoption (respectively)" do
      visit '/pets?adoptable=true'

      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_4.name)
      expect(page).to_not have_content(@pet_3.name)
      expect(page).to_not have_content(@pet_1.name)

      visit '/pets?adoptable=false'

      expect(page).to_not have_content(@pet_2.name)
      expect(page).to_not have_content(@pet_4.name)
      expect(page).to have_content(@pet_3.name)
      expect(page).to have_content(@pet_1.name)

      visit "/shelters/#{@shelter_1.id}/pets?adoptable=true"

      expect(page).to have_content(@pet_2.name)
      expect(page).to_not have_content(@pet_1.name)

      visit "/shelters/#{@shelter_2.id}/pets?adoptable=true"

      expect(page).to have_content(@pet_4.name)
      expect(page).to_not have_content(@pet_3.name)

      visit "/shelters/#{@shelter_1.id}/pets?adoptable=false"

      expect(page).to_not have_content(@pet_2.name)
      expect(page).to have_content(@pet_1.name)

      visit "/shelters/#{@shelter_2.id}/pets?adoptable=false"

      expect(page).to_not have_content(@pet_4.name)
      expect(page).to have_content(@pet_3.name)
    end
  end
end
