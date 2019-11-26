class Pet < ApplicationRecord
  validates_presence_of :name, :sex, :approx_age, :image_path, :description
  validates_inclusion_of :adoptable, :in => [true, false]
  belongs_to :shelter

  def adoptable_link_args
    if adoptable
      ['Change to Adoption Pending', "/pets/#{id}/pending", method: :patch]
    else
      ['Change to Adoptable', "/pets/#{id}/adoptable", method: :patch]
    end
  end
end
