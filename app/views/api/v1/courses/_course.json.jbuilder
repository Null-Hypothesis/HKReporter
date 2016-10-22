json.key_format! camelize: :lower
json.extract! course,
              :id,
              :name,
              :course_id,
              :description,
              :created_at,
              :updated_at,
              :teacher_id,
              :course_tag_ids
