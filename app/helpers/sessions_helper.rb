module SessionsHelper
  def sign_in(user)
    remember_token  = User.new_remember_token
    cookies.permanent[:remember_token]  = remember_token
    user.update_attribute(:remember_token,  User.encrypt(remember_token))
    self.current_user = user
  end  

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token  = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token:  remember_token)
  end 

  def current_user?(user)
    user == current_user
  end 

  def signed_in?
    !current_user.nil?
  end  

  def signed_and_not_self?(user)
    !current_user.nil? && current_user != user
  end   

  def sign_out
    current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end  

  def signed_in_user
    unless  signed_in?
      flash[:notice] = "Please sign"
      redirect_to signin_url
    end
  end   

  def admin_user
    unless current_user.admin?
      flash[:error] = "you are not admin"
      redirect_to signin_url 
    end
  end  
  
  def correct_user
    @user = User.find(params[:id])
    unless  current_user?(@user) || current_user.admin?
      flash[:error] = "no permitted operation"
      redirect_to signin_url
    end     
  end   
end
