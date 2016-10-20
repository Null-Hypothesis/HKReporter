class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true
  validates :name, presence: true
  validates :token, uniqueness: true, allow_nil: true

  def update_token
    update!(token: new_valid_token)
  end

  private

  def new_valid_token
    loop do
      token = SecureRandom.uuid
      return token unless self.class.exists?(token: token)
    end
  end
end
