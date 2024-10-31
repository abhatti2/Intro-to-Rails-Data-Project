require 'faker'

# Define possible values for hierarchical attributes
GROUPS = [ 'Sporting', 'Working', 'Hound', 'Toy', 'Non-Sporting', 'Terrier', 'Herding' ]
SIZES = [ 'Small', 'Medium', 'Large' ]
PURPOSES = [ 'Hunting', 'Companion', 'Guarding', 'Working', 'Show' ]

# Create 50 users with random locations using Faker
50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    latitude: Faker::Address.latitude,    # Random latitude
    longitude: Faker::Address.longitude   # Random longitude
  )
end

# Create breeds with hierarchical attributes and comments
Breed.all.each do |breed|
  # Update each breed with random hierarchical attributes
  breed.update(
    group: GROUPS.sample,
    size: SIZES.sample,
    purpose: PURPOSES.sample
  )

  # Create a random number of comments for each breed
  rand(5..10).times do
    Comment.create(
      user: User.order('RANDOM()').first,  # Selects a random user for each comment
      breed: breed,                        # Links the comment to the current breed
      content: Faker::Lorem.sentence(word_count: 15)
    )
  end
end
