require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
                          name: 'adminn', 
                          email: 'adv@ad.ad', 
                          diary_name: 'd55555d', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
  end

  test "should signin user create post" do
    @post = Post.create(
                          title: 'namee', 
                          body: 'dnndndnппhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhппппnd', 
                          user_id: @user
                        )
    assert @post.save!
  end

  test "should not valid post within body" do
    @post = Post.new(
                          title: 'namee', 
                          body: '', 
                          user_id: @user
                        )
    assert_not @post.valid?
  end  

  test "should not valid post with short body" do
    @post = Post.new(
                          title: 'namee', 
                          body: 'ff', 
                          user_id: @user
                        )
    assert_not @post.valid?
  end    

  test "should not valid post within title" do
    @post = Post.new(
                          title: '', 
                          body: 'fffffffffffffffffffffff', 
                          user_id: @user
                        )
    assert_not @post.valid?
  end    
end
