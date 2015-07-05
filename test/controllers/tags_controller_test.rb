require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  fixtures :tags

  setup do
    @tag = tags(:one)        
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
    assert_template :index
    assert_template layout: "layouts/application"        
  end  

  test "should get show" do
    get :show, :id => @tag
    assert_response :success
    assert_not_nil assigns(:tag)
    assert_template :show
    assert_template layout: "layouts/application"        
  end    

  test "should route to show tag posts" do
    assert_generates "/tags/@tag", controller: 'tags', action: 'show', id: "@tag"  # определенный набор опций создает конкретный путь
  end  

  test "should route to show all tags" do
    assert_generates "/tags", controller: 'tags', action: 'index'  
  end    
end
