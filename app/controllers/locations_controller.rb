class LocationsController < ApplicationController

  def index

  end


  def new

  end


  def create
        location = Location.new(
                            min: params[:min],
                            max: params[:max]
                            )
        location.save
    end


    def show

    end


    def edit
      @location = Location.find_by(params[:user_id])
    end

    def update
      location = Location.find_by(params[:user_id])
      location.assign_attributes(
                            min: params[:min],
                            max: params[:max]
                            )
    
      location.save
      flash[:success] = "Location Updated"
      redirect_to "/users/#{user.id}"
    end



  def destroy

  end
  
end
