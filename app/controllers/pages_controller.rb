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
  end      
end
