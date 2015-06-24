class Guestbook < ActiveRecord::Base
  validates :name,      presence: true, length: { maximum: 200 }
  validates :message,   presence: true, length: { maximum: 1000, minimum: 10 }

  belongs_to :user
end
