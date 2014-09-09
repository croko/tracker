json.comments @comments do |comment|
  json.author comment.user.try(:name)
  json.comment comment.body
end