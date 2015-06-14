class UsersController < ApplicationController
  before_action :signed_in_user, only: [:destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)       
    
    if  @user.save
      sign_in @user
      flash[:success] = "Welcome  to  the Sample  App!"
      redirect_to  @user
    else
      flash.now[:error] = 'Invalid data' 
      render  'new'
    end
  end 

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end 

  private

    def user_params
      params.require(:user).permit(:name, :email, :diary_name, :password, :password_confirmation)
    end    
end
