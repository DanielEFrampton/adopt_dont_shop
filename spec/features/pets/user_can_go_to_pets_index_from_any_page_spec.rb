require 'rails_helper'

RSpec.describe "pets index navbar link", type: :feature do
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
  end

  it "is on top of page on home page and takes user to pets index" do
    visit '/'

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of pet edit page and takes user to pets index" do
    visit "/pets/#{@pet_1.id}/edit"

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of pets index page and takes user to pets index" do
    visit '/pets'

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of new pet page and takes user to pets index" do
    visit "/shelters/#{@shelter_1.id}/pets/new"

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of pet show page and takes user to pets index" do
    visit "/pets/#{@pet_1.id}"

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of shelter edit page and takes user to pets index" do
    visit "/shelters/#{@shelter_1.id}"

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of shelters index and takes user to pets index" do
    visit '/shelters'

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of new shelter page and takes user to pets index" do
    visit '/shelters/new'

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of shelter pets index and takes user to pets index" do
    visit "/shelters/#{@shelter_1.id}/pets"

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end

  it "is on top of shelter show page and takes uer to pets index" do
    visit "/shelters/#{@shelter_1.id}"

    click_link('Pet Index')

    expect(current_path).to eq('/pets')
  end
end
