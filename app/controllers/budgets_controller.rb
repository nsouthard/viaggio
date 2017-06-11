class BudgetsController < ApplicationController

  def index

  end


  def new

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

  end


  def update

  end


  def destroy

  end
  
end
