class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true
  validates :name, presence: true
  validates :token, uniqueness: true, allow_nil: true
end
