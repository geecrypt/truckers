class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      puts @user.errors.full_messages
      puts 'User creation failed'
      render action: 'new'
    end
  end

  def user_params
    params.permit(:name, :email, :password, :company_id, :phone_number, :role)
  end
end
