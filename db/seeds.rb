Comment.destroy_all
Restaurant.destroy_all
User.destroy_all

User.create!(email: "hello@mariacodes.io", password: "123123")


10.times do
  r = Restaurant.create!(name: Faker::Hipster.word,
                         address: Faker::Address.city,
                         user: User.all.sample)

  rand(2..4).times do
    Comment.create!(content:Faker::ChuckNorris.fact,
                    restaurant: r,
                    user: User.all.sample )
  end
end
