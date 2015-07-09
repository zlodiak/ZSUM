class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :show_actions, only: [:index, :show]

  def index
    @users = User.paginate(page: params[:page], :per_page => 7)    
  end

  def show   
  end

  def new
    @user = User.new
  end

  def edit 
  end

  def create
    @user = User.new(user_params)   
    
    if @user.save
      sign_in @user
      flash[:success] = t :user_created
      redirect_to  @user
    else
      flash.now[:error] = t :user_not_created
      render  'new'
    end
  end 

  def update
    if @user.update_attributes(user_params)
      if params[:delete_avatar]
        @user.update_attributes(
          avatar_file_name: nil, 
          avatar_content_type: nil, 
          avatar_file_size: nil
        )
      end
      
      flash[:success] = t :profile_updated
      redirect_to @user
    else
      flash[:error] = t :profile_update_failed
      render  'edit'
    end
  end

  def destroy
    if !@user.admin?
      @user.destroy
      flash[:success] = t :user_deleted
    else
      flash[:error] = t :user_not_deleted
    end

    redirect_to users_url    
  end 

  private

    def set_user
      @user = User.find_by_id(params[:id])
      render_404 unless @user
    end  

    def show_actions
      if signed_in? && current_user.admin?
        @show_actions = true
      else
        @show_actions = nil
      end  
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :diary_name, :password, :gender_id, :password_confirmation, :phone, :skype, :info, :avatar, :delete_avatar)
    end         
end

