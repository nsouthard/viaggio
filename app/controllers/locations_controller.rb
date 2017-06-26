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
      @location = Location.find_by(params[:location_id])
      @location_preferences = current_user.location_preferences
    end

    def update
      location = Location.find_by(params[:location_id])
      location.assign_attributes(
                            name: params[:name],
                            min: params[:min],
                            max: params[:max]
                            )
    
      location.save
      flash[:success] = "Location Updated"
      redirect_to "/location_preferences/"
    end



  def destroy

  end
  
end
