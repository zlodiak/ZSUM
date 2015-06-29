require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get signin form" do
    get :new
    assert_response :success
    assert_template :new
    assert_template layout: "layouts/application"    
    assert_select 'form', true 
    assert_select 'form input', 4
  end

end
