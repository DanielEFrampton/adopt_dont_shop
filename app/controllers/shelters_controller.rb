class SheltersController < ApplicationController
  def index
    if params[:sort_by] == "adoptable"
      @shelters = Shelter.all.sort_by {|shelter| shelter.pets.where(adoptable: true).count}.reverse
      @adoptable_order = "active_sort"
    elsif params[:sort_by] == "alphabet"
      @shelters = Shelter.order(:name)
      @alphabet_order = "active_sort"
    else
      @shelters = Shelter.all
      @created_order = "active_sort"
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
    if params[:adoptable] == "true"
      @pets = @shelter.pets.where(adoptable: params[:adoptable])
      @show_adoptable = "active_sort"
    elsif params[:adoptable] == "false"
      @pets = @shelter.pets.where(adoptable: params[:adoptable])
      @show_pending = "active_sort"
    else
      @pets = @shelter.pets.order(adoptable: :desc)
      @show_all = "active_sort"
    end
  end
end
