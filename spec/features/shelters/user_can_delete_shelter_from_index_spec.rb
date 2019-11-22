require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
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

  it "has link to delete each individual shelter" do
    visit '/shelters'

    expect(page).to have_link('Delete Shelter', count: 2)
  end

  it "has link which when clicked deletes shelter and displays updated index without that shelter" do
    visit '/shelters'

    within "#shelter-#{@shelter_1.id}-section" do
      click_link('Delete Shelter')
    end

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end
end
