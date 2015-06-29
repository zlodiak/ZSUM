require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  setup do
    @user = users(:one)  
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_template :index
    assert_template layout: "layouts/application"     
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
    assert_template :new
    assert_template layout: "layouts/application"   
    assert_select 'form input', 10
  end
=begin

  test "should create user" do
    assert_difference('User.count') do
      post :create, 
      user: {
        email: 'yhyhyhad.ad', 
        gender_id: 1, 
        info: 'u76u67u67u', 
        name: 'fsdfsdf', 
        password: 'qwerty', 
        password_confirmation: 'qwerty', 
        phone: '435345345',
        skype: 'sdggdfgdfgfdgd'
    }  
    end
    assert_not_equal [], @user.errors.full_messages



    assert_redirected_to user_path(assigns(:user))
  end
=end

  test "should show user" do
    get :show, id: @user
    assert_response :success
    assert_template :show
    assert_template layout: "layouts/application"       
  end
=begin
  test "should get edit" do
    sign_in(@user)
    get :edit, id: @user
    assert_response :success
    assert_template :edit
    assert_template layout: "layouts/application"           
  end

  test "should update user" do
    patch :update, id: user, user: { email: user.email, gender: user.gender, info: user.info, name: user.name, password_digest: user.password_digest, phone: user.phone, session_hash: user.session_hash, skype: user.skype }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: user
    end

    assert_redirected_to users_url
  end
=end  

  test "should route to user" do
    assert_routing "/users/@user", { controller: "users", action: "show", id: "@user" }
  end
end
