class User < ActiveRecord::Base
  before_save { self.email  = email.downcase  }
  before_create :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  validates :diary_name, presence: true, uniqueness: { case_sensitive: false }
  validates :password,  length: { minimum:  6 }  
  validates :name,  presence: true, length: { maximum:  50  }, uniqueness: { case_sensitive: false }

  has_secure_password

  has_many    :recalls
  has_many    :posts,  dependent:  :destroy
  belongs_to  :gender

  has_attached_file :avatar, :styles => { :large => "300x300>", :medium => "100x100>", :thumb => "30x30>" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end  

  GENDER_TYPES = [['-', 1], ['Муж', 2], ['Жен', 3]]

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end    
end
