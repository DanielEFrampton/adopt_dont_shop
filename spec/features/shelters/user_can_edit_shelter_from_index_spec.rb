require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
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
  end

  it "has link to edit each shelter" do
    visit '/shelters'

    expect(page).to have_link('Edit Shelter', count: 2)
  end

  it "has links that navigates to shelter edit page for each individual shelter" do
    visit '/shelters'

    within "#shelter-#{@shelter_1.id}-section" do
      click_link('Edit Shelter')
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

    visit '/shelters'

    within "#shelter-#{@shelter_2.id}-section" do
      click_link('Edit Shelter')
    end

    expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")
  end
end
