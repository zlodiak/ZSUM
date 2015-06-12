class PagesController < ApplicationController
  def page1
  end

  def all_diary
    @all_diary = User.all
  end

  def page3
  end

  def page4
  end
end
