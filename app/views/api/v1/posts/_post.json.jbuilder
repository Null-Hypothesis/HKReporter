json.key_format! camelize: :lower
json.extract! post,
              :id,
              :stars,
              :title,
              :comment,
              :created_at,
              :updated_at,
              :course_id,
              :user_id,
              :post_tag_ids
