class PagesController < ApplicationController
  def home
  end

  def all_diary
    @diaries = User.paginate(page: params[:page], :per_page => 7)
  end

  def popular_diary
    @diaries = User.paginate(page: params[:page], :per_page => 7).order(views_diary: :DESC)
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

  def my_last_posts
    @user = User.find(params[:id])
    @posts = @user.posts
    # @posts = Post.paginate(page: params[:page], :per_page => 7).order(created_at: :DESC)
  end   

  def lang_toggle
    if params[:locale] == 'ru'
      p 'en'
      I18n.locale = 'en'
    else
      p 'ru'
      I18n.locale = 'ru'
    end

    redirect_to :back
  end   
end
