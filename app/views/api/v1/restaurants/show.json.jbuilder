json.restaurant do 
  json.extract! @restaurant, :id, :name, :address
json.comments @restaurant.comments do |comment|
 # json.extract! comment, :id, :content
 json.content comment.content
 json.user comment.user.email
end
end