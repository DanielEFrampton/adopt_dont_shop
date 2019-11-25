require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
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
                                    image_path: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_2 = @shelter_2.pets.create({
                                    name: "Jill",
                                    approx_age: 5,
                                    sex: "female",
                                    image_path: "https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })
    @pet_3 = @shelter_2.pets.create({
                                    name: "Will",
                                    approx_age: 2,
                                    sex: "male",
                                    image_path: "https://boygeniusreport.files.wordpress.com/2016/11/puppy-dog.jpg",
                                    description: "Very canine",
                                    adoptable: true
                                  })

    visit '/pets'
  end

  it "displays all pet names" do
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_3.name)
  end

  it "displays all pet approximate ages" do
    expect(page).to have_content("Approximate Age: #{@pet_1.approx_age}")
    expect(page).to have_content("Approximate Age: #{@pet_2.approx_age}")
    expect(page).to have_content("Approximate Age: #{@pet_3.approx_age}")
  end

  it "displays sex of all pets" do
    expect(page).to have_content("Sex: #{@pet_1.sex}")
    expect(page).to have_content("Sex: #{@pet_2.sex}")
    expect(page).to have_content("Sex: #{@pet_3.sex}")
  end

  it "displays all pet images" do
    expect(page).to have_xpath("//img[@alt='#{@pet_1.image_path}']")
    expect(page).to have_xpath("//img[@alt='#{@pet_2.image_path}']")
    expect(page).to have_xpath("//img[@alt='#{@pet_3.image_path}']")
  end

  it "displays name of shelter where pet is located" do
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name, count: 2)
  end
end
