require 'test_helper'

class GuestbookTest < ActiveSupport::TestCase
  test "should save guestbook for guest user" do
    guestbook = Guestbook.new(name: 'qwery', email: 'bbbb@ad.ad', message: 'dfsdfsf gdfgfdghfghfghf ghfgh ')
    assert guestbook.save
  end

  test "should save guestbook for signin user" do
    guestbook = Guestbook.new(user_id: 2, email: 'bbbb@ad.ad', message: 'dfsdfsf gdfgfdghfghfghf ghfgh ')
    assert guestbook.save
  end  
end
