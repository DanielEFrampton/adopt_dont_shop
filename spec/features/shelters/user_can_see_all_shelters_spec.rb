require 'rails_helper'

RSpec.describe "shelters index page", type: feature do
  it "can see the name of each shelter in the system" do
    shelter_1 = Shelter.create(name: "Ridiculous Test Name",
                               address: "124 Fake Ln.",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")
    shelter_2 = Shelter.create(name: "Even Worse Test Name",
                               address: "45 Dumpster Fire Alley",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("Street Address: #{shelter_1.address}")
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content("Street Address: #{shelter_2.address}")
  end
end
