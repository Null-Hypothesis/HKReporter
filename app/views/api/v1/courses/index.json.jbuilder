json.array! @courses do |course|
  json.partial! 'course', course: course
end
