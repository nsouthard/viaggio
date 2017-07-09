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

    # @user = User.create(user_params)

    # respond_to do |format|
    #   if @user.save
    #     format.html {redirect_to @user, notice: 'Post was successfully created.'}
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @budgets = @user.budgets
    @location_preferences = current_user.location_preferences
  end

   def edit
     @user = User.find(params[:id])
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
                            email: params[:email],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation]
                            )
    
      user.save
      flash[:success] = "Profile Updated"
      redirect_to "/users/#{user.id}"
    end

    # private

    # Use strong_parameters for attribute whitelisting
    # Be sure to update your create() and update() controller methods.

    # def set_user
    #   @user = User.find(params[:id])
    # end

    # def user_params
    #   params.require(:post).permit(:image)
    # end

    def destroy
      user = User.find_by(params[:id])
      user.destroy
      flash[:warning] = "Profile Deleted"
      redirect_to "/"
    end
  
end
