class UsersController < ApplicationController
	def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
			redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
		@user = User.find(params[:id])
  end

  def update
		@user.update(user_params)
		if @user.save
			redirect_to user_path(@user)
    else
			redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
