class Pet < ApplicationRecord
  validates_presence_of :name, :sex, :approx_age, :image_path
  belongs_to :shelter
end
