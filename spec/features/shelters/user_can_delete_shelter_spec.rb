require 'rails_helper'

RSpec.describe "shelter delete process", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(id: "1",
                               name: "Ridiculous Test Name",
                               address: "124 Fake Ln.",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")
  end

  it "can see link to delete shelter on show view" do
    visit "/shelters/1"

    expect(page).to have_link('Delete Shelter')
  end

  it "can send DELETE request upon clicking link, delete shelter, redirect to updated shelter index" do
    visit "/shelters/1"

    click_link('Delete Shelter')

    expect(current_path).to eq('/shelters')
    expect(page).to have_no_content("#{@shelter_1.name}")
  end
end
