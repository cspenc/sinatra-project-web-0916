class RestaurantAPI

  require 'yelp'

  def self.client
    @client ||= Yelp::Client.new({
      consumer_key: 'b_Cf5dt8sVO8mMg4QrUuKA',
      consumer_secret: '9p-c7UF8tiVVEZFwhTAY5aQgKo8',
      token: 'qFfEzYnzggpSLb5L89PSGJjqcq-Lhhx0',
      token_secret: '0qsNvgRw_N0dLwqzNuMS9tMxYEQ'
      })
  end

  def self.search(location)
    search_params = {
      term: "restaurant",
      limit: 10
    }

    restaurants = client.search(location, search_params).businesses
    restaurants.map do |restaurant|
      restaurant_params = {
        name: restaurant.name,
        rating: restaurant.rating,
        address: restaurant.location.display_address.join("\n")
      }

      Restaurant.create(restaurant_params)
    end

  end

end
