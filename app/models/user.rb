class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :replies
  has_many :favorites

  validates :email, presence: true,
                    uniqueness: true
  validates :name, presence: true
  validates :token, uniqueness: true, allow_nil: true

  def update_token
    update!(token: new_valid_token)
  end

  def destroy_token
    update!(token: nil)
  end

  private

  def new_valid_token
    loop do
      token = SecureRandom.uuid
      return token unless self.class.exists?(token: token)
    end
  end
end
