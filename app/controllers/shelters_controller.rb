class SheltersController < ApplicationController
  def index
    if params[:sort_by] == "adoptable"
      @shelters = Shelter.all.sort_by {|shelter| shelter.pets.where(adoptable: true).count}.reverse
    elsif params[:sort_by] == "alphabet"
      @shelters = Shelter.order(:name)
    else
      @shelters = Shelter.all
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new({
                          name:     params[:name],
                          address:  params[:address],
                          city:     params[:city],
                          state:    params[:state],
                          zip:      params[:zip]
                         })
    shelter.save
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
                    name:     params[:name],
                    address:  params[:address],
                    city:     params[:city],
                    state:    params[:state],
                    zip:      params[:zip]
                   })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  def pets
    @shelter = Shelter.find(params[:id])
    if params[:adoptable] != nil
      @pets = @shelter.pets.where(adoptable: params[:adoptable])
    else
      @pets = @shelter.pets.order(adoptable: :desc)
    end
  end
end
