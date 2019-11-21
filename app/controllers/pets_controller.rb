class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create({
                                name:         params[:pet][:name],
                                approx_age:   params[:pet][:approx_age],
                                sex:          params[:pet][:sex],
                                image_path:   params[:pet][:image_path],
                                description:  params[:pet][:description]
                              })
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end
end
