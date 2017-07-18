class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    
  end


  def create
    user = User.new(
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    if user.save
      budget = Budget.create(user_id: user.id)
      availability = Availability.create!(user_id: user.id)
      location = Location.create!()
        if location.save
          location_preference = LocationPreference.create!(user_id: user.id, location_id: location.id)
        end

      # user_answer = UserAnswer.create!(user_id: user.id)
                          
      flash[:success] = "Your account has successfully been created!"
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:warning] = "An error occurred while your account was being created"
      redirect_to "/users/#{user.id}"
    end

  end

  def show
    @user = User.find_by(id: session[:user_id])
    @budgets = @user.budgets
    # @location_preferences = current_user.location_preferences
    @locations = current_user.locations
    @l_matches = @user.l_matches
    @b_matches = @user.b_matches
  end

   def edit
     @user = User.find(params[:id])
     @locations = current_user.locations
   end

    def update
      user = User.find(params[:id])
      user.update(
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
                            bio: params[:bio],
                            email: params[:email],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation]
                            )
    
      user.save
      flash[:success] = "Profile Updated"
      redirect_to "/users/#{user.id}"
    end


    def destroy
      user = User.find_by(params[:id])
      user.destroy
      flash[:warning] = "Profile Deleted"
      redirect_to "/"
    end
  
end
