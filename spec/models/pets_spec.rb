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
  end
end
