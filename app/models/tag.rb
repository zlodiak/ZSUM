class Tag < ActiveRecord::Base
  validates :tagname,  length: { maximum:  20 }  

  has_and_belongs_to_many :posts
end

