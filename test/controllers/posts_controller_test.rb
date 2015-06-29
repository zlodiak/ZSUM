require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  fixtures :users, :posts

  setup do
    @user = users(:one)  
    @post = posts(:five)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_template :index
    assert_template layout: "layouts/application"    
    assert_select '.next_page', 'Next Label'    
  end
=begin
  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
    assert_template :new
    assert_template layout: "layouts/application"    
    assert_select 'form', true 
    assert_select 'form input', 2 
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { body: @post.body, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end
=end


  test "should show post" do
    get :show, :user_id => @user, :id => @post
    assert_response :success
  end
=begin
  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { body: @post.body, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
=end

  #test "should route to post show" do
  #  assert_generates "/users/@user.id/posts/@post.id", controller: 'posts', action: 'show', user_id: @user, id: @post  
  #end   

end
