class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :signed_in_user
  before_action :admin_user

  layout 'adminpanel'

  def index
    quantity = params[:fld_quantity] || 10
    order = params[:fld_order] || t('ascending')

    if params[:fld_order] == t('descending')
      @users = ::User.paginate(page: params[:page], :per_page => quantity).order(name: :DESC)
    else
      @users = ::User.paginate(page: params[:page], :per_page => quantity).order(name: :ASC)
    end

    render :index, :locals => {:quantity => quantity, :order => order}
  end

  def edit  
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

      flash[:success] = "Profile  updated"
      redirect_to admin_users_path
    else
      flash[:error] = "Profile  updated failed"
      render  'edit'
    end
  end

  def destroy
    if !@user.admin?
      @user.destroy
      flash[:success] = "User deleted."
    else
      flash[:error] = "admin_not_delete"
    end

    redirect_to admin_users_path
  end 

  private

    def set_user
      @user = ::User.find_by_id(params[:id])  
      render_404 unless @user
    end

    def user_params
      params.require(:user).permit( :name, :email, :diary_name, :password, :gender_id, 
                                    :password_confirmation, :phone, :skype, :info, 
                                    :avatar, :delete_avatar, :admin, :fld_order, :fld_quantity)
    end  
end
