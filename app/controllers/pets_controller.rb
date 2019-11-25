class PetsController < ApplicationController
  def index
    @pets = Pet.order(adoptable: :desc)
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
                                name:         params[:name],
                                approx_age:   params[:approx_age],
                                sex:          params[:sex],
                                image_path:   params[:image_path],
                                description:  params[:description]
                              })
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
                name:         params[:name],
                approx_age:   params[:approx_age],
                sex:          params[:sex],
                image_path:   params[:image_path],
                description:  params[:description]
              })
    pet.save

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end
