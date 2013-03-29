require_relative 'database_connection'
require_relative 'restaurant_review'

class Restaurant
  def self.find(id)
    query = <<-SQL
    SELECT *
    FROM restaurants
    WHERE id = ?
    SQL

    Restaurant.new(RestaurantsReviewsDB.instance.execute(query, id).first)
  end

  def self.find_by_name(name)
    
  end

  def self.find_by_neighborhood(neighborhood)
    query = <<-SQL
    SELECT *
    FROM restaurants
    WHERE neighborhood = ?
    SQL

    RestaurantsReviewsDB.instance.execute(query, neighborhood).map do |restaurant_hash|
       Restaurant.new(restaurant_hash)
    end
  end

  def self.find_by_cuisine(cuisine)
    
  end

  attr_reader :id
  attr_accessor :name, :neighborhood, :cuisine
  def initialize(options = {})
    @id = options['id']
    @name = options['name']
    @neighborhood = options['neighborhood']
    @cuisine = options['cuisine']
  end

  def reviews
    RestaurantReview.find_by_restaurant(id)
  end

  def average_review_score
    RestaurantReview.avg_by_restaurant(id)
  end 
end