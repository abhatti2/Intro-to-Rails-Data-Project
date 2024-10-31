require 'faker'

# Create 50 users with random locations using Faker
50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    latitude: Faker::Address.latitude,    # Random latitude
    longitude: Faker::Address.longitude   # Random longitude
  )
end

# Create comments for random breeds
Breed.all.each do |breed|
  rand(5..10).times do
    Comment.create(
      user: User.order('RANDOM()').first,  # Selects a random user for each comment
      breed: breed,                        # Links the comment to the current breed
      content: Faker::Lorem.sentence(word_count: 15)
    )
  end
end
