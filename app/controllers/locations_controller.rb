class LocationsController < ApplicationController

  def index
   
  end


  def new
    
  end


  def create
        location = Location.find_or_create_by(
                                              name: params[:name].titleize
                                              )
        location.update(
                        long: params[:long],
                        lat: params[:lat]
                        )

        location_preference = LocationPreference.create!(user_id: current_user.id, location_id: location.id)
        redirect_to "/locations/#{location.id}/edit"
    end


    def show
     
    end


    def edit
      @location = Location.find(params[:id])
      @location_preferences = LocationPreference.find_by(location_id: params[:id], user_id: current_user.id)
      @user = User.find_by(id: session[:user_id])
      @l_locations = current_user.locations
    end

    def update
      @location = Location.find_by(params[:id])
      @location.update(
                            name: params[:name],
                            min: params[:min],
                            max: params[:max]
                            )
    
      @location.save
      flash[:success] = "Location Updated"
      redirect_to "/locations/@location/edit/"
    end



  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:warning] = "Trip Deleted"
    redirect_to "/users/<%= current_user.id %>/"
  end
  
end
