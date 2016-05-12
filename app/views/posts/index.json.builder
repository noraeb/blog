json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content
  json.url post_url(todo, format: :json)
end
