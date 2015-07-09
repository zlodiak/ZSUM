class SessionsController < ApplicationController
  def new
  end

  def create
    user  = User.find_by(email: params[:session][:email].downcase)
    if  user  &&  user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = t :signin_successfull
      redirect_to user
    else
      flash.now[:error] = t :signin_failed  
      render  'new'
    end   

    return
  end

  def destroy
    sign_out
    flash[:success] = t :sign_out_successfull
    redirect_to root_url    
  end  
end
