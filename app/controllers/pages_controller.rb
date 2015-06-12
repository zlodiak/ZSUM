class PagesController < ApplicationController
  def home
  end

  def all_diary
    @all_diary = User.all
  end

  def popular_diary
    @popular_diary = User.all.order(views_diary: :DESC)
  end

  def lasts_diary
    @lasts_diary = User.all.order(created_at: :DESC)
  end
end
