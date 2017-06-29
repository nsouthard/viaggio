class LocationsController < ApplicationController

  def index

  end


  def new
    @location = Location.new
  end


  def create
        user = current_user.id
        location = Location.new(
                            name: params[:name],
                            long: params[:long],
                            lat: params[:lat]
                            )
        location.save
        if location.save
          location_preference = LocationPreference.create!(user_id: current_user.id, location_id: location.id)
          redirect_to "/location_preferences/"
        end
    end


    def show

    end


    def edit
      @location = Location.find(params[:id])
      @location_preferences = LocationPreference.find_by(location_id: params[:id], user_id: current_user.id)
    end

    def update
      @location = Location.find_by(params[:id])
      @location.assign_attributes(
                            name: params[:name],
                            min: params[:min],
                            max: params[:max]
                            )
    
      @location.save
      flash[:success] = "Location Updated"
      redirect_to "/locations/@location/edit/"
    end



  def destroy
    @location = Location.find_by(params[:id])
    @location.destroy
    flash[:warning] = "Trip Deleted"
    redirect_to "/users/<%= current_user.id %>/"
  end
  
end
