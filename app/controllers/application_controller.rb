class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, :with => :render_404 
  
  before_action :set_locale

  protect_from_forgery with: :exception

  include SessionsHelper
   
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end  

  def default_url_options(options={})
    { locale: I18n.locale }
  end  

  private
  
    def render_403
       render file: "public/403.html", status: 403
    end
   
    def render_404
       render file: "public/404.html", status: 404
    end  
end
