json.comments (@comment) do |comment|
  json.extract! comment, :id, :user, :text
  json.url comment_url(comment, format: :json)
end
