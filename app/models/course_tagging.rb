class CourseTagging < ApplicationRecord
  belongs_to :course
  belongs_to :course_tag
end
