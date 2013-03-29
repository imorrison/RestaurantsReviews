require_relative 'database_connection'
require_relative 'restaurant_review'

class Critic
  def self.find(id)
    query = <<-SQL
    SELECT *
    FROM critics
    WHERE id = ?
    SQL

    Critic.new(RestaurantsReviewsDB.instance.execute(query, id).first)
  end

  def self.find_by_name(name)
    
  end

  attr_reader :id
  attr_accessor :name

  def initialize(options = {})
    @id = options['id']
    @name = options['name']
  end

  def reviews
    RestaurantReview.find_by_critic(id)
  end

  def average_review_score
    RestaurantReview.avg_by_critic(id).first['average']
  end

  def unreviews_restaurants
    
  end
  
  
end