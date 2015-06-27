require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_template :home
    assert_template layout: "layouts/application"    
    assert_select 'h2', 'Начало'
  end

  test "should get page all_diary" do
    get :all_diary
    assert_response :success
    assert_template :all_diary
    assert_template layout: "layouts/application"    
    assert_not_nil assigns(:diaries) 
    assert_routing '/pages/all_diary', { controller: "pages", action: "all_diary" }  
  end

  test "should get popular_diary" do
    get :popular_diary
    assert_response :success
    assert_template :popular_diary
    assert_template layout: "layouts/application"     
    assert_not_nil assigns(:diaries) 
  end

  test "should get lasts_diary" do
    get :lasts_diary
    assert_response :success
    assert_template :lasts_diary
    assert_template layout: "layouts/application"    
    assert_not_nil assigns(:diaries)   
  end

  test "should get confidencial_politics" do
    get :confidencial_politics
    assert_response :success
    assert_template :confidencial_politics
    assert_template layout: "layouts/application"      
  end

  test "should get rules" do
    get :rules
    assert_response :success
    assert_template :rules
    assert_template layout: "layouts/application"      
  end  
    
end
