class PagesController < ApplicationController
  def home
  end

  def all_diary
    @all_diary = User.all
  end

  def popular_diary
  end

  def lasts_diary
  end
end
