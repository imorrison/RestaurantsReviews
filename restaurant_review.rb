require_relative 'database_connection'
require_relative 'restaurant'

class RestaurantReview
  def self.find(id)
    
  end

  def self.find_by_critic(critic_id)
    query = <<-SQL
    SELECT *
    FROM restaurant_reviews
    WHERE critic_id = ?
    SQL
    
    RestaurantsReviewsDB.instance.execute(query, critic_id).map do |review_hash|
       RestaurantReview.new(review_hash)
    end
  end

  def self.find_by_restaurant(restaurant_id)
    query = <<-SQL
    SELECT *
    FROM restaurant_reviews
    WHERE restaurant_id = ?
    SQL
    
    RestaurantsReviewsDB.instance.execute(query, restaurant_id).map do |review_hash|
       RestaurantReview.new(review_hash)
    end
  end

  def self.find_by_chef(chef_id)
    query = <<-SQL
    SELECT r.*
    FROM restaurant_reviews r 
    JOIN chef_tenures c
    ON r.restaurant_id = c.restaurant_id
    WHERE r.review_date BETWEEN c.start_date AND c.end_date 
    AND c.chef_id = ?
    SQL
    
    RestaurantsReviewsDB.instance.execute(query, chef_id).map do |review_hash|
       RestaurantReview.new(review_hash)
    end
  end

  def self.find_by_unreviewed(critic_id)
    query = <<-SQL
    SELECT * 
    FROM restaurants
    WHERE id NOT IN ( 
      SELECT r.id
      FROM restaurants r
      JOIN restaurant_reviews rev 
      ON r.id = rev.restaurant_id
      WHERE rev.critic_id = ? )
    SQL

    RestaurantsReviewsDB.instance.execute(query, critic_id).map do |restaurant_hash|
      Restaurant.new(restaurant_hash)
    end
  end

  def self.avg_by_critic(critic_id)
    query = <<-SQL
    SELECT AVG(score) average
    FROM restaurant_reviews 
    WHERE critic_id = ?
    GROUP BY critic_id
    SQL
    RestaurantsReviewsDB.instance.execute(query, critic_id)
  end

  def self.avg_by_restaurant(restaurant_id)
    query = <<-SQL
    SELECT AVG(score) average
    FROM restaurant_reviews 
    WHERE restaurant_id = ?
    GROUP BY restaurant_id
    SQL
    RestaurantsReviewsDB.instance.execute(query, restaurant_id)
  end

  attr_reader :id
  attr_accessor :critic_id, :restaurant_id, :review, :score, :date_time
  def initialize(options = {})
    @id = options['id']
    @critic_id = options['critic_id'] 
    @restaurant_id = options['restaurant_id'] 
    @review = options['review'] 
    @score = options['score'] 
    @review_date = options['review_date']
  end
  
end