json.key_format! camelize: :lower
json.extract! reply,
              :id,
              :content,
              :created_at,
              :updated_at

json.user do
  json.partial! 'api/v1/users/user', user: reply.user
end
