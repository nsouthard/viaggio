class UsersController < ApplicationController

  def new

  end


  def create
    user = User.new(
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    address_1: params[:address_1],
                    address_2: params[:address_2],
                    city: params[:city],
                    state: params[:state],
                    zip_code: params[:zip_code],
                    country: params[:country],
                    gender: params[:gender],
                    birthdate: params[:birthdate],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    if user.save
      flash[:success] = "Your account has successfully been created!"
      redirect_to "/"
    else
      flash[:warning] = "An error occurred while your account was being created"
      redirect_to "/signup"
    end
  end

  
end
