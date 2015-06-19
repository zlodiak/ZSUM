class Guestbook < ActiveRecord::Base
  before_save { self.email  = email.downcase  }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,      presence: true, length: { maximum: 100 }
  validates :message,   presence: true, length: { maximum: 1000, minimum: 10 }

  belongs_to :user
end
