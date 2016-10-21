class Course < ApplicationRecord
  has_many :course_taggings
  has_many :course_tags, through: :course_taggings

  belongs_to :teacher
end
