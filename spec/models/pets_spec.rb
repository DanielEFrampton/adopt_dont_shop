require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :image_path}
    it {should validate_presence_of :approx_age}
    it {should validate_presence_of :description}

    # The following test produces a warning, but is the only way to test for presence of boolean
    it {should validate_inclusion_of(:adoptable).in_array([true, false])}
  end

  describe "relationships" do
    it {should belong_to :shelter}
  end

  describe "methods" do
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
                                   image_path: "http://www.thing.com/image.png",
                                   description: "Very canine",
                                   adoptable: true
                                 })
      @pet_2 = @shelter_1.pets.create({
                                   name: "Jill",
                                   approx_age: 5,
                                   sex: "female",
                                   image_path: "http://www.thing.com/image.png",
                                   description: "Very canine",
                                   adoptable: false
                                 })
    end

    it "can generate appropriate arguments for adoption status change link" do
      expected_result_1 = ['Change to Adoption Pending', "/pets/#{@pet_1.id}/pending", method: :patch]
      expect(@pet_1.adoptable_link_args).to eq(expected_result_1)

      expected_result_2 = ['Change to Adoptable', "/pets/#{@pet_2.id}/adoptable", method: :patch]
      expect(@pet_2.adoptable_link_args).to eq(expected_result_2)
    end
  end
end
