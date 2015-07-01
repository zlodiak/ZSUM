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
    #q = "%#{params[:fld_phrase]}%"

    #if q
    #  sql = Post.where("title like ? or body like ?", q, q).to_sql   
    #  @posts = ActiveRecord::Base.connection.execute(sql) 
    #end
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
      params.permit(:fld_phrase)
    end         
end
