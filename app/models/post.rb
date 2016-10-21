class Post < ApplicationRecord
  belongs_to :course
  belongs_to :user

  has_many :post_taggings
  has_many :post_tags, through: :post_taggings
end
