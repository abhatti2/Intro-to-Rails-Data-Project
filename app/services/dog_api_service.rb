require "httparty"

class DogApiService
  include HTTParty
  base_uri "https://dog.ceo/api"

  def fetch_breeds
    response = self.class.get("/breeds/list/all")
    if response.success?
      response["message"]
    else
      {}
    end
  end
end
