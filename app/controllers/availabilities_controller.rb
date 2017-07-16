class AvailabilitiesController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    @availabilities = Availability.where(user_id: current_user.id)
        sort_attribute = params[:sort]
        sort_order = params[:sort_order]
        search_term = params[:search_term]
        category_search_term  = params[:category]
    @user = User.find_by(id: session[:user_id])
    @budgets = @user.budgets
    # @location_preferences = current_user.location_preferences
    @locations = current_user.locations
  end


  def new
    @availability = Availability.new
    @user = User.find_by(id: session[:user_id])
    @budgets = @user.budgets
    # @location_preferences = current_user.location_preferences
    @locations = current_user.locations

  end


  def create
    availability = Availability.new(
                                    user_id: current_user.id,
                                    start_date: params[:start_date],
                                    end_date: params[:end_date]
                                    )
    availability.save
    @user = User.find_by(id: session[:user_id])
    @budgets = @user.budgets
    # @location_preferences = current_user.location_preferences
    @locations = current_user.locations
    flash[:success] = "Availability Added"
    redirect_to "/users/#{current_user.id}"
  end


  def show

  end


  def edit
    @availability = Availability.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    @locations = current_user.locations
  end

  def update
    @availability = Availability.find(params[:id])
    @availability.update(
                          start_date: params[:start_date],
                          end_date: params[:end_date]
                          )
  
    @availability.save
    @user = User.find_by(id: session[:user_id])
    flash[:success] = "Availability Updated"
    redirect_to "/users/<%= current_user.id %>"
  end


  def destroy

  end
  
end
