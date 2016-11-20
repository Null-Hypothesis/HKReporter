json.key_format! camelize: :lower
json.extract! reply,
              :id,
              :content,
              :created_at,
              :updated_at
