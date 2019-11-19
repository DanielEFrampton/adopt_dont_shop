require 'rails_helper'

RSpec.describe "shelter info page", type: :feature do
  it "see the shelter with id and its name, address, city, state, and zip" do
    shelter_1 = Shelter.create(name: "Ridiculous Test Name",
                               address: "124 Fake Ln.",
                               city: "Faketown",
                               state: "FK",
                               zip: "55555")
    # shelter_2 = Shelter.create(name: "Even Worse Test Name",
    #                            address: "45 Dumpster Fire Alley",
    #                            city: "Faketown",
    #                            state: "FK",
    #                            zip: "55555")

    visit "/shelters/1"

    expect(page).to have_content("Name: #{shelter_1.name}")
    expect(page).to have_content("Address: #{shelter_1.address}")
    expect(page).to have_content("City: #{shelter_1.city}")
    expect(page).to have_content("State: #{shelter_1.state}")
    expect(page).to have_content("Zip: #{shelter_1.zip}")
  end
end
