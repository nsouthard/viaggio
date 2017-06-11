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

  end


  def update

  end


  def destroy

  end
  
end
