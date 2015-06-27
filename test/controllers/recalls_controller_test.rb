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
    assert_template :index
    assert_template layout: "layouts/application"        
  end


  test "should create recall for guest user" do
    assert_difference('Recall.count') do
      post :create, recall: {
        name: 'fdfdffffff',
        message: 'fdfdffffffccccccccccc'
      }
    end

    assert_redirected_to recalls_path
  end

  test "should name empty valid ok recall for guest user" do
    assert_difference('Recall.count') do
      post :create, recall: {
        name: '',
        message: 'fdfdffffffccccccccccc'
      }
    end

    assert_redirected_to recalls_path
  end

  test "should message empty valid failed recall for guest user" do
    assert_no_difference('Recall.count') do
      post :create, recall: {
        name: 'fdfdffffffccccccccccc',
        message: ''
      }
    end

    assert_template :index
    assert_template layout: "layouts/application"   
  end

=begin
  test "should destroy recall" do
    assert_difference('recall.count', -1) do
      delete :destroy, id: @recall
    end

    assert_redirected_to recalls_path
  end
=end

end
