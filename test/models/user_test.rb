require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user_exist = User.create(
                          name: 'adminn', 
                          email: 'adv@ad.ad', 
                          diary_name: 'd55555d', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
  end

  test "should signup guest user" do
    @user = User.create(
                          name: 'namee', 
                          email: 'adddd@ad.ad', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert @user.save!
  end

  test "should not valid signup user without name" do
    @user = User.create(
                          name: '', 
                          email: 'adddd@ad.ad', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end  

  test "should not valid signup user with fake email" do
    @user = User.create(
                          name: 'jshgdkjsgfsdg', 
                          email: 'adddd#ad.ad', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end   

  test "should not valid signup user without email" do
    @user = User.create(
                          name: 'jshgdkjsgfsdg', 
                          email: '', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end   

  test "should not valid signup user without diary_name" do
    @user = User.create(
                          name: 'jshgdkjsgfsdg', 
                          email: 'dnndndnппппппnd@ad.ad', 
                          diary_name: '', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end   

  test "should not valid signup user with fake password_confirm" do
    @user = User.create(
                          name: 'jshgdkjsgfsdg', 
                          email: 'ddd@ad.ad', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwertyqwqw'
                        )
    assert_not @user.valid?
  end  

  test "should not valid signup user with no unique email" do
    @user = User.create(
                          name: 'jfffg', 
                          email: 'adv@ad.ad', 
                          diary_name: 'dnndd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end      

  test "should not valid signup user with no unique name" do
    @user = User.create(
                          name: 'adminn', 
                          email: 'adsdv@ad.ad', 
                          diary_name: 'dnndd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end    

  test "should not valid signup user with no unique diary_name" do
    @user = User.create(
                          name: 'admfffinn', 
                          email: 'adsdv@ad.ad', 
                          diary_name: 'd55555d', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
    assert_not @user.valid?
  end      
end
