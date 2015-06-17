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
end
