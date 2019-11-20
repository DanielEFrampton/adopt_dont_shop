class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new({
                          name:     params[:shelter][:name],
                          address:  params[:shelter][:address],
                          city:     params[:shelter][:city],
                          state:    params[:shelter][:state],
                          zip:      params[:shelter][:zip]
                         })
    shelter.save
    redirect_to '/shelters'
  end

  def edit
  end
end
