require 'rails_helper'

RSpec.describe 'In the Pet edit process', type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name: "Ridiculous Test Name",
                               address: "124 Fake Ln.",
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
  end

  describe 'the Pet Show page' do
    it 'can display link to edit that pet' do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_link('Edit Pet Info')
    end

    it 'has link that takes user to Pet Edit page when clicked' do
      visit "/pets/#{@pet_1.id}"
      click_link('Edit Pet Info')

      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end
  end

  describe 'the Pet Edit page' do
    it 'has a form to edit pet data' do
      visit "/pets/#{@pet_1.id}/edit"

      expect(page).to have_selector('form')
      expect(page).to have_field('Name')
      expect(page).to have_field('Sex')
      expect(page).to have_field('Approximate Age')
      expect(page).to have_field('Description')
      expect(page).to have_field('Image Path')
    end

    it 'has submit button which when clicked sends PATCH request, updates pet, redirects to Pet Show page with updated data' do
      visit "/pets/#{@pet_1.id}/edit"

      fill_in 'Name', with: 'Philippa'
      fill_in 'Approximate Age', with: 67
      fill_in 'Sex', with: 'female'
      fill_in 'Description', with: "Somewhat cute"
      fill_in 'Image Path', with: "https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg"

      click_button 'Submit'

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content("Philippa")
      expect(page).to have_content("Adoptable: true")
      expect(page).to have_content("Approximate Age: 67")
      expect(page).to have_content("Sex: female")
      expect(page).to have_content("Description: Somewhat cute")
      expect(page).to have_xpath("//img[@alt='https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg']")
    end

    it "can update pet info when only some fields are modified and others remain intact" do
      visit "/pets/#{@pet_1.id}/edit"
      fill_in 'Name', with: 'Philippa'
      click_button 'Submit'

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content("Philippa")
      expect(page).to have_content("Adoptable: true")
      expect(page).to have_content("Approximate Age: 3")
      expect(page).to have_content("Sex: male")
      expect(page).to have_content("Description: Very canine")
      expect(page).to have_xpath("//img[@alt='https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg']")
    end
  end
end
