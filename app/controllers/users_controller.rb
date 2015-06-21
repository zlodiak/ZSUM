class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  #before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page], :per_page => 7)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      if params[:delete_avatar]
        @user.update_attributes(
          avatar_file_name: nil, 
          avatar_content_type: nil, 
          avatar_file_size: nil
        )
      end
      
      flash[:success] = "Profile  updated"
      redirect_to @user
    else
      flash[:error] = "Profile  updated failed"
      render  'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    # if @user.id != 1
    if !@user.admin?
      @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    else
      flash[:error] = "admin_not_delete"
      redirect_to users_url
    end
  end 

  private

    def user_params
      params.require(:user).permit(:name, :email, :diary_name, :password, :gender_id, :password_confirmation, :phone, :skype, :info, :avatar, :delete_avatar)
    end         
end

