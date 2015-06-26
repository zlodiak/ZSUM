require 'test_helper'

class RecallsControllerTest < ActionController::TestCase
  fixtures :recalls

  setup do
    @recall = recalls(:one)
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recalls)
  end
=begin
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recall" do
    assert_difference('recall.count') do
      post :create, recall: {  }
    end

    assert_redirected_to recall_path(assigns(:recall))
  end

  test "should show recall" do
    get :show, id: @recall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recall
    assert_response :success
  end

  test "should update recall" do
    patch :update, id: @recall, recall: {  }
    assert_redirected_to recall_path(assigns(:recall))
  end

  test "should destroy recall" do
    assert_difference('recall.count', -1) do
      delete :destroy, id: @recall
    end

    assert_redirected_to recalls_path
  end
=end

end
