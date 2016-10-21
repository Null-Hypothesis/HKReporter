class CreateCourseTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :course_taggings do |t|
      t.belongs_to :course, foreign_key: true
      t.belongs_to :course_tag, foreign_key: true

      t.timestamps
    end
  end
end
