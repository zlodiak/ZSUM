require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get page all_diary" do
    get :all_diary
    assert_response :success
  end

  test "should get popular_diary" do
    get :popular_diary
    assert_response :success
  end

  test "should get lasts_diary" do
    get :lasts_diary
    assert_response :success
  end

end
