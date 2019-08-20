Comment.destroy_all
Restaurant.destroy_all
User.destroy_all

5.times do
  User.create!(email: Faker::Internet.email, password: "123123")
end


10.times do
  r = Restaurant.create!(name: Faker::Beer.name,
                         address: Faker::Address.city,
                         user: User.all.sample)
  rand(1..3).times do
    Comment.create!(user: User.all.sample,
                    restaurant: r,
                    content: Faker::Company.bs)
  end
end
