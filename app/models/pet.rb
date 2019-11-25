class Pet < ApplicationRecord
  validates_presence_of :name, :sex, :approx_age, :image_path, :description
  validates_inclusion_of :adoptable, :in => [true, false]
  belongs_to :shelter
end
