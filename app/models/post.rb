class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum:  500 }
  validates :body, presence: true,  length: { minimum:  10 }  
  # validates :tagnames, presence: true

  belongs_to  :user
  has_and_belongs_to_many :tags
end

