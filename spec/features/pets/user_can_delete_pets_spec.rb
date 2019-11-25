require 'rails_helper'

RSpec.describe 'In Pet deletion process', type: :feature do
  describe 'on a Pet show page' do
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
      visit "/pets/#{@pet_1.id}"
    end

    it 'a user can see a link to delete the pet' do
      expect(page).to have_link('Delete Pet')
    end

    it 'a user can click the delete link to delete the pet and be redirected to pet index without that pet' do
      click_link('Delete Pet')

      expect(current_path).to eq('/pets')
      expect(page).not_to have_content('Bill')
    end
  end
end
