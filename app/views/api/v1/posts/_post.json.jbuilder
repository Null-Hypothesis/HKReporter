json.key_format! camelize: :lower
json.extract! post,
              :id,
              :stars,
              :title,
              :comment,
              :created_at,
              :updated_at,
              :course_id,
              :post_tag_ids

json.replies_count post.replies.count

json.user do
  json.partial! 'api/v1/users/user', user: post.user
end
