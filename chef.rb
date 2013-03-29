require_relative 'database_connection'
require_relative 'chef_tenure'
require_relative 'restaurant_review'

class Chef
  def self.find(id)
    query = <<-SQL
    SELECT *
    FROM chefs
    WHERE id = ?
    SQL

    Chef.new(RestaurantsReviewsDB.instance.execute(query, id).first)
  end

  def self.find_by_last_name
    
  end

  def self.find_by_mentor(mentor_id)
    query = <<-SQL
    SELECT *
    FROM chefs
    WHERE mentor = ?
    SQL

    RestaurantsReviewsDB.instance.execute(query, mentor_id).map do |mentee|
      Chef.new(mentee)
    end
  end

  def self.num_proteges(mentor_id)
    query = <<-SQL
    SELECT COUNT(id)
    FROM chefs
    WHERE mentor = ?
    SQL

    RestaurantsReviewsDB.instance.execute(query, mentor_id).first
  end

  attr_reader :id
  attr_accessor :first_name, :last_name, :mentor
  def initialize(options = {})
    @id = options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @mentor = options['mentor']
  end

  def proteges
    Chef.find_by_mentor(id) 
  end

  def num_proteges
    Chef.num_proteges(id).values
  end

  def co_workers
    ChefTenure.find_co_workers(id)
  end

  def reviews
    RestaurantReview.find_by_chef(id)
  end
  
  
end