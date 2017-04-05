include Faker

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'helloworld',
  )
end

3.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'helloworld',
    role: 'premium'
  )
end

2.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'helloworld',
    role: 'admin'
  )
end

10.times do
  Wiki.create!(
    title: Faker::HarryPotter.unique.character,
    body: Faker::HarryPotter.unique.quote,
    user: User.all.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} Wikis created"
