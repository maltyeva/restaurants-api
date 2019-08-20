json.array! @restaurants do |restaurant|
	# json.extract! restaurant, :id, :name, :address, :user_id
  json.id restaurant.id
  json.restaurant_name restaurant.name
  json.address restaurant.address
  json.user restaurant.user.email
end