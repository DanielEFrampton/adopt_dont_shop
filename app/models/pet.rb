class Pet < ApplicationRecord
  validates_presence_of :name, :sex, :approx_age, :image_path, :description, :adoptable
  belongs_to :shelter
end
