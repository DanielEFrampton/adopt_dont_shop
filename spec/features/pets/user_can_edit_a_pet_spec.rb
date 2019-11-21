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
                                     image_path: "image1.png",
                                     description: "Very canine",
                                     adoptable: true
                                   })
  end

  describe 'the Pet Show page' do
    it 'can display link to edit that pet' do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_link('Edit Pet Info')
    end

    xit 'has link that takes user to Pet Edit page' do

    end
  end

  describe 'the Pet Edit page' do
    xit 'has a form to edit pet data' do
    end

    xit 'has submit button which when clicked sends PATCH request, updates pet, redirects to Pet Show page with updated data' do
    end
  end
end