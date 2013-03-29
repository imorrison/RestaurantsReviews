require_relative 'database_connection'

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

  def self.find_by_score(score)
    
  end

  def self.find_by_date(date)
    
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
    @date_time = options['date_time']
  end
  
  
end