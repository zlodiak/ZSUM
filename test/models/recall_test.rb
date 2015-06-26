require 'test_helper'

class RecallTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
                          name: 'namee', 
                          email: 'adddd@ad.ad', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
  end

  test "should save recall for guest user" do
    @recall = Recall.new(name: 'qwery', message: 'dfsdfsf gdfgfdghfghfghf ghfgh ')
    assert @recall.save!
  end

  test "should save recall for signin user" do
    @recall = Recall.new(message: 'dfsdfsf gdfgfdghfghfghf ghfgh ', user_id: @user)
    assert @recall.save!
  end  

  test "should not valid recall for short message for signin user" do
    @recall = Recall.new(message: 'dfsdfsf', user_id: @user)
    assert_not @recall.valid?
  end    

  test "should not valid recall for short message for guest user" do
    @recall = Recall.new(name: 'qwery', message: 'dh ')
    assert_not @recall.valid?
  end     

  test "should valid recall for empty name for guest user" do
    @recall = Recall.new(name: '', message: 'dggggggggggggggggggh ')
    assert @recall.valid?
  end    
end
