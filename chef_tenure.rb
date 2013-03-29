require_relative 'database_connection'
require_relative 'chef'

class ChefTenure
  def self.find(id)
    
  end

  def self.find_co_workers(chef_id)
    query = <<-SQL
    SELECT *
    FROM chefs 
    WHERE id IN
      (SELECT co_workers.chef_id
       FROM (SELECT * FROM chef_tenures WHERE chef_id = ?) AS you
       JOIN chef_tenures AS co_workers
       ON ( you.restaurant_id = co_workers.restaurant_id ) 
       WHERE co_workers.start_date >= you.start_date 
       AND co_workers.end_date  >= you.end_date)
    SQL
    
    RestaurantsReviewsDB.instance.execute(query, chef_id).map do |chef_hash|
       Chef.new(chef_hash)
    end
  end

  def self.find_by_chef(chef_id)
    
  end

  def self.find_by_restaurant(restaurant_id)
    
  end  
end