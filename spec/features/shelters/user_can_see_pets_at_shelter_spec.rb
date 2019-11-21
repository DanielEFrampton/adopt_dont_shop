require 'rails_helper'

RSpec.describe "shelter pets index", type: :feature do
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
    @pet_1 = @shelter_1.pets.create({
                                    name: "Bill",
                                    approx_age: 3,
                                    sex: "male",
                                    image_path: "image1.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_2 = @shelter_2.pets.create({
                                    name: "Jill",
                                    approx_age: 5,
                                    sex: "female",
                                    image_path: "image2.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_3 = @shelter_2.pets.create({
                                    name: "Will",
                                    approx_age: 2,
                                    sex: "male",
                                    image_path: "image3.png",
                                    description: "Very canine",
                                    adoptable: true
                                  })
  end

  it "can display names of each pet at that shelter" do
    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_selector('h3', count: 1)

    visit "/shelters/#{@shelter_2.id}/pets"
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_3.name)
    expect(page).to have_selector('h3', count: 2)
  end

  it "can display pet images" do
    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_xpath("//img[@src='#{@pet_1.image_path}']")

    visit "/shelters/#{@shelter_2.id}/pets"
    expect(page).to have_xpath("//img[@src='#{@pet_2.image_path}']")
    expect(page).to have_xpath("//img[@src='#{@pet_3.image_path}']")
  end

  it "can display pets' approximate ages" do
    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_content("Approximate Age: #{@pet_1.approx_age}")

    visit "/shelters/#{@shelter_2.id}/pets"
    expect(page).to have_content("Approximate Age: #{@pet_2.approx_age}")
    expect(page).to have_content("Approximate Age: #{@pet_3.approx_age}")
  end

  it "can display gender of pet" do
    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_content("Sex: #{@pet_1.sex}")

    visit "/shelters/#{@shelter_2.id}/pets"
    expect(page).to have_content("Sex: #{@pet_2.sex}")
    expect(page).to have_content("Sex: #{@pet_3.sex}")
  end
end
