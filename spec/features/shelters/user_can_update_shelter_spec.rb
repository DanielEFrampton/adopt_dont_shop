require 'rails_helper'

RSpec.describe "shelter update process", type: :feature do
  before(:each) do
    shelter_1 = Shelter.create(id: "1",
                               name: "Ridiculous Test Name",
                               address: "124 Fake Ln.",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")
  end

  it "can see link on show page to update the shelter" do
    visit '/shelters/1'

    expect(page).to have_link('Edit Shelter')
  end

  it "can take user to '/shelters/:id/edit'" do
    visit '/shelters/1'
    click_link 'Edit Shelter'

    expect(current_path).to eq('/shelters/1/edit')
  end

  # it "can see form to edit shelter's data" do
  # end
  #
  # it "can send patch request, update shelter, and redirect to shelters index with updated info" do
  # end
end
