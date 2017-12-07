require 'faker'

20.times do
    User.create!(
      email: Faker::Internet.unique.email,
      password: Faker::Internet.unique.password,
      confirmed_at: Time.now
)
end
users = User.all


100.times do
    Item.create!(
      user: users.sample,
      name: Faker::Lovecraft.sentence
)
end
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Item.count} wikis created"