class LocationPreferencesController < ApplicationController

  def index
    @location_preferences = current_user.location_preferences
  end


  def new
    @location_preference = LocationPreference.new
  end


  def create
      location_preference = LocationPreference.new(
                          min: params[:min],
                          max: params[:max]
                          )
      location_preference.save
  end


  def show

  end


  def edit
    @location_preference = LocationPreference.find_by(user_id: params[:id])
  end

  def update
    location_preference = LocationPreference.find_by(location_id: params[:id])
    location_preference.update(
                          min_budget: params[:min_budget],
                          max_budget: params[:max_budget]
                          )
  
    location_preference.save
    flash[:success] = "Destination Updated"
    redirect_to "/users/#{current_user.id}"
  end


  def destroy
    location_preference = LocationPreference.find_by(params[:id])
    location_preference.destroy
    flash[:warning] = "Trip Deleted"
    redirect_to "/users/<%= current_user.id %>/"
  end
  
end
