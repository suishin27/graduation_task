class User < ApplicationRecord
  validates :user_name,  presence: true, length: { maximum: 30 }    #30文字以内
  before_validation { login_id.downcase! }
  validates :login_id, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password                                               #パスワードのハッシュ化
  validates :password, presence: true, length: { minimum: 6 }       #6文字以上
end
