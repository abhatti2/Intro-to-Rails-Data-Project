namespace :dog_breeds do
  desc "Fetch and store dog breeds from Dog CEO API"
  task fetch: :environment do
    service = DogApiService.new
    breeds = service.fetch_breeds

    breeds.each do |breed, sub_breeds|
      if sub_breeds.empty?
        Breed.create(name: breed)
      else
        sub_breeds.each do |sub_breed|
          Breed.create(name: breed, sub_breed: sub_breed)
        end
      end
    end

    puts "Breeds successfully fetched and stored!"
  end
end
