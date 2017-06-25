class BudgetsController < ApplicationController

  def index
    @budget = Budget.all
  end


  def new
    @budget = Budget.new
  end


  def create
      budget = Budget.new(
                          min: params[:min],
                          max: params[:max]
                          )
      budget.save
  end


  def show

  end


  def edit
    @budget = Budget.find_by(user_id: params[:id])
  end

  def update
    budget = Budget.find_by(user_id: params[:id])
    budget.assign_attributes(
                          min: params[:min],
                          max: params[:max]
                          )
  
    budget.save
    flash[:success] = "Budget Updated"
    redirect_to "/users/#{current_user.id}"
  end


  def destroy

  end
  
end
