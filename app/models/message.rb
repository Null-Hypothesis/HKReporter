class Message < ApplicationRecord
  belongs_to :from_user, class_name: User
  belongs_to :to_user, class_name: User
end
