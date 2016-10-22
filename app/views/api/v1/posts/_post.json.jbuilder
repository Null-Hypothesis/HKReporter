json.extract! post, :id, :stars, :comment
json.createdAt post.created_at
json.updatedAt post.updated_at
json.courseId post.course_id
json.userId post.user_id
json.postTagIds post.post_tag_ids
json.url api_v1_post_url(post, format: :json)
