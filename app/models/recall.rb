class Recall < ActiveRecord::Base
  validates :message,   presence: true, length: { maximum: 1000, minimum: 10 }

  belongs_to :user
end
