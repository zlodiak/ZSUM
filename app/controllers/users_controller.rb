class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)       
    
    if  @user.save
      sign_in @user
      flash[:success] = "Welcome  to  the Sample  App!"
      redirect_to  @user
    else
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
      # params.require(:user).permit(:name, :email, :password, :password_confirmation, :skype, :phone, :info, :gender, )
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
