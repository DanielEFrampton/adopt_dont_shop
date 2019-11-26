class PetsController < ApplicationController
  def index
    if params[:adoptable] != nil
      @pets = Pet.where(adoptable: params[:adoptable])
    else
      @pets = Pet.order(adoptable: :desc)
    end
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

  def update_status
    pet = Pet.find(params[:id])
    pet.update({
                adoptable: params[:new_status] == "adoptable" ? true : false
              })
    pet.save

    redirect_to "/pets/#{pet.id}"
  end
end
