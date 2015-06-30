class Admin::UsersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  layout 'adminpanel'

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = ::User.paginate(page: params[:page], :per_page => 20)   
  end

  def edit
    @user = ::User.find(params[:id]) 
  end

  def update
    @user = ::User.find(params[:id])   

    logger.debug '===============================' 
    #logger.debug  params[:created_at][:day]
    #logger.debug  params[:created_at][:month]
    #logger.debug  params[:created_at][:year]
    #logger.debug  Time.parse(params[:created_at][:year] + params[:created_at][:month] + params[:created_at][:day]).utc
    
    if @user.update_attributes(user_params)
      if params[:delete_avatar]
        @user.update_attributes(
          avatar_file_name: nil, 
          avatar_content_type: nil, 
          avatar_file_size: nil
        )
      end

      flash[:success] = "Profile  updated"
      redirect_to admin_users_path
    else
      flash[:error] = "Profile  updated failed"
      render  'edit'
    end
  end

  def destroy
    @user = ::User.find(params[:id])

    if !@user.admin?
      @user.destroy
      flash[:success] = "User deleted."
    else
      flash[:error] = "admin_not_delete"
    end

    redirect_to admin_users_path
  end 

  private

    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end


    def user_params
      params.require(:user).permit( :name, :email, :diary_name, :password, :gender_id, 
                                    :password_confirmation, :phone, :skype, :info, 
                                    :avatar, :delete_avatar, :admin)
    end  


end
