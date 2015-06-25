require 'test_helper'

class GuestbookTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
                          name: 'namee', 
                          email: 'adddd@ad.ad', 
                          diary_name: 'dnndndnппппппnd', 
                          password: 'qwerty', 
                          password_confirmation: 'qwerty'
                        )
  end

  test "should save guestbook for guest user" do
    guestbook = Guestbook.new(name: 'qwery', message: 'dfsdfsf gdfgfdghfghfghf ghfgh ')
    assert guestbook.save!
  end

  test "should save guestbook for signin user" do
    guestbook = Guestbook.new(message: 'dfsdfsf gdfgfdghfghfghf ghfgh ', user_id: @user)
    assert guestbook.save!
  end  
end
