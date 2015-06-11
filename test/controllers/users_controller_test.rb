require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_select 'h1', "Записки сумасшедшего"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
    assert_template layout: "layouts/application"
    assert_select 'h1', "Записки сумасшедшего"
    assert_select 'h2', "Регистрация"    
  end
=begin

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, gender: @user.gender, info: @user.info, name: @user.name, password_digest: @user.password_digest, phone: @user.phone, session_hash: @user.session_hash, skype: @user.skype }
    end

    assert_redirected_to user_path(assigns(:user))
  end
=end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

=begin
  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, gender: @user.gender, info: @user.info, name: @user.name, password_digest: @user.password_digest, phone: @user.phone, session_hash: @user.session_hash, skype: @user.skype }
    assert_redirected_to user_path(assigns(:user))
  end
=end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
