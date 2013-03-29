require_relative 'database_connection'
require_relative 'chef_tenure'

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

  def co_workers
    ChefTenure.find_co_workers(id)
  end

  def reviews
    # 8
  end
  
  
end