class Admin::UsersController < ApplicationController
  layout 'adminpanel'

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = ::User.paginate(page: params[:page], :per_page => 20)   
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    #@admin_user = Admin::User.new
  end


  def edit
  end

  def create
    @admin_user = Admin::User.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
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


    def admin_user_params
      params[:admin_user]
    end


end
