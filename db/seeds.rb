require 'faker'

# Create 50 users with Faker
50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Create comments for random breeds
Breed.all.each do |breed|
  rand(5..10).times do
    Comment.create(
      user: User.order('RANDOM()').first,  # Ensures a random user is selected
      breed: breed,                        # Links the comment to the current breed
      content: Faker::Lorem.sentence(word_count: 15)
    )
  end
end
