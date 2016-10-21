class PostTag < ApplicationRecord
  has_many :post_taggings
  has_many :post, through: :post_taggings
end
