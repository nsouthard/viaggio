class AvailabilitiesController < ApplicationController

  def index

  end


  def new

  end


  def create
    availability = Availability.new(
                                    start_date: params[:start_date],
                                    end_date: params[:end_date]
                                    )
    availability.save
  end


  def show

  end


  def edit
    @availability = Availability.find_by(params[:user_id])
  end

  def update
    availability = Availability.find_by(params[:user_id])
    availability.update(
                          start_date: params[:start_date],
                          end_date: params[:end_date]
                          )
  
    availability.save
    flash[:success] = "Availability Updated"
    redirect_to "/users/#{user.id}"
  end


  def destroy

  end
  
end
