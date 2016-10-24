class Course < ApplicationRecord
  has_many :course_taggings
  has_many :course_tags, through: :course_taggings
  has_many :posts

  belongs_to :teacher

  def self.query(query)
    if query
      Course.where('name ILIKE ?', "%#{query}%")
    else
      Course.all
    end
  end
end
