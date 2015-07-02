class PagesController < ApplicationController
  def home
  end

  def all_diary
    @diaries = User.paginate(page: params[:page], :per_page => 7)
  end

  def popular_diary
    # @diaries = User.paginate(page: params[:page], :per_page => 7).order(views_diary: :DESC)
    @diaries = User.paginate(page: params[:page], :per_page => 7).joins(:posts).group(:user_id).order('SUM(posts.views) DESC')
  end

  def lasts_diary
    @diaries = User.paginate(page: params[:page], :per_page => 7).order(created_at: :DESC)
  end

  def rules
  end   

  def confidencial_politics
  end  

  def popular_posts
    @posts = Post.paginate(page: params[:page], :per_page => 7).order(views: :DESC)
  end    

  def last_posts
    @posts = Post.paginate(page: params[:page], :per_page => 7).order(created_at: :DESC)
  end   

  def search
    if params[:search] && params[:search] != ''
      @posts = Post.paginate(page: params[:page], :per_page => 7).where("body like ? or title like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @posts = nil
    end    
  end     

  def my_last_posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end   

  def lang_toggle
    if params[:locale] == 'ru'
      I18n.locale = 'ru'
    else
      I18n.locale = 'en'
    end

    # redirect_to request.referer
    redirect_to root_url,  :flash => { :success => t('lang_changed') }
  end   

  private
    def user_params
      params.permit(:search)
    end           
end
