class PagesController < ApplicationController
  def home
  end

  def all_diary
    @diaries = User.all
  end

  def popular_diary
    @diaries = User.all.order(views_diary: :DESC)
  end

  def lasts_diary
    @diaries = User.all.order(created_at: :DESC)
  end
end
