require 'rails_helper'

RSpec.describe "pet show page", type: :feature do
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
    visit "/pets/#{@pet_1.id}"
  end

  it "can display pet name with given id" do
    expect(page).to have_content(@pet_1.name)
  end

  it "can display pet image" do
    expect(page).to have_xpath("//img[@src='#{@pet_1.image_path}']")
  end

  it "can display pet description" do
    expect(page).to have_content("Description: #{@pet_1.description}")
  end

  xit "can display approximate age of pet" do
    expect(page).to have_content("Approximate Age: #{@pet_1.approx_age}")
  end

  xit "can display gender of pet" do
    expect(page).to have_content("Sex: #{@pet_1.sex}")
  end

  xit "can display adoptable status of pet" do
    expect(page).to have_content("Adoptable: #{@pet_1.adoptable}")
  end
end
