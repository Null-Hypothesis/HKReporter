class AddTeacherToCourse < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :teacher, foreign_key: true
  end
end
